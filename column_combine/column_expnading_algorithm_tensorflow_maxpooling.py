import numpy as np
import tensorflow as tf

# 定義 no-expand kernel 和 combining kernel
no_expand_kernel = np.array([
   [  0,   0,  34,   0],
   [  0,   0, 145,  11],
   [  0,   0, 227,   0],
   [149,   0,   0,   0],
])    # 3x3

combining_kernel = np.array([[34],
                             [145],
                             [127],
                             [149]])          # 3x1

# 生成 50 個隨機 3x3 输入矩阵，每個 element 為 0 到 9 的整數
num_samples = 50
input_matrices = [np.random.randint(0, 256, (4, 4)) for _ in range(num_samples)]

# 計算 target：使用 no-expand kernel 的矩陣乘法結果
Y_target = np.array([np.dot(matrix, no_expand_kernel) for matrix in input_matrices])  # 形狀：(50, 3, 3)

# 計算 Y_combined：使用 combining kernel 的矩陣乘法結果
Y_combined = np.array([np.dot(matrix, combining_kernel) for matrix in input_matrices])  # 形狀：(50, 3, 1)

# 轉換為 TensorFlow 張量
Y_combined_tensor = tf.convert_to_tensor(Y_combined, dtype=tf.float32)  # (50, 3, 1)

# 定義一個2x2 max pooling函數
def max_pool_3x3(matrix):
    # Pad the input to make it 4x4
    padded_matrix = np.pad(matrix, ((0, 1), (0, 1)), mode='constant', constant_values=0)
    
    # Perform 4x4 max pooling (stride of 1) to produce a 3x3 matrix
    return np.array([
        [np.max(padded_matrix[i:i+4, j:j+4]) for j in range(3)]
        for i in range(3)
    ])


# 對 Y_target 進行 2x2 池化，得到池化後的目標矩陣
Y_target_pooled = np.array([max_pool_3x3(y) for y in Y_target])  # (50, 2, 2)
Y_target_pooled_tensor = tf.convert_to_tensor(Y_target_pooled, dtype=tf.float32)  # 轉為 TensorFlow 張量

# 初始化變量 R
R = tf.Variable(tf.random.normal([1, 4], stddev=0.01), dtype=tf.float32)  # (1, 3)

# 定義正則化變數
regularization_lambda = 0.001

# 定義優化器
optimizer = tf.optimizers.Adam(learning_rate=1e-4)

# iteration 次數
iterations = 15000

# 訓練循環
for i in range(iterations):
    with tf.GradientTape() as tape:
        # forward propagation
        Y_expanded = tf.matmul(Y_combined_tensor, R)  # (50, 3, 3)
        
        # 混合損失：前期使用完整矩陣損失，後期轉為池化損失
        if i < iterations * 0.7:  # 初期使用完整矩陣損失
            loss = tf.reduce_sum(tf.square(tf.convert_to_tensor(Y_target, dtype=tf.float32) - Y_expanded))
        else:  # 後期使用2x2池化損失
            # 進行 2x2 max pooling (需要將 Y_expanded 轉為 numpy 再轉回 TensorFlow 張量)
            Y_expanded_np = Y_expanded.numpy()
            Y_expanded_pooled = np.array([max_pool_3x3(y) for y in Y_expanded_np])
            Y_expanded_pooled_tensor = tf.convert_to_tensor(Y_expanded_pooled, dtype=tf.float32)

            # 計算基於池化結果的損失
            loss = tf.reduce_sum(tf.square(Y_target_pooled_tensor - Y_expanded_pooled_tensor))
        
        # 正則化項
        reg_term = regularization_lambda * tf.reduce_sum(tf.square(R))
        total_loss = loss + reg_term

    # Backward propagation，gradient calculation
    gradients = tape.gradient(total_loss, [R])
    # gradient trimming，防止梯度過大
    gradients = [tf.clip_by_value(grad, -1.0, 1.0) for grad in gradients]
    # 更新參數
    optimizer.apply_gradients(zip(gradients, [R]))
    
    # 每隔 1000 次 iteration, print loss
    if i % 1000 == 0:
        print(f"iteration {i}，loss: {total_loss.numpy()}")

# optimized R matrix
# Print optimized R matrix with three decimal places
R_optimized = R.numpy()
R_optimized_rounded = np.round(R_optimized, 3)  # Round to three decimal places
print("Optimized Matrix R (rounded to 3 decimal places):")
print(R_optimized_rounded)

# Utilize R_optimized for further calculations
Y_expanded_optimized = np.matmul(Y_combined, R_optimized)  # (50, 3, 3)
Y_expanded_optimized_pooled = np.array([max_pool_3x3(y) for y in Y_expanded_optimized])

# Check the optimized results against the target pooled results
for i in range(num_samples):
    print(f"Sample {i+1} - Target Y_target (after 2x2 max pooling):\n{Y_target_pooled[i]}")
    print(f"Expansion result after optimization Y_expanded_optimized (after 2x2 max pooling):\n{Y_expanded_optimized_pooled[i]}")
    print(f"Difference:\n{np.round(Y_target_pooled[i] - Y_expanded_optimized_pooled[i], 3)}\n")