#include <iostream>
#include <vector>
#include <cmath>
#include <algorithm>

using namespace std;

// Function to select the maximum magnitude value from a set of columns in each row
vector<int> group_and_combine_columns(const vector<vector<int>> &F)
{
    vector<int> combined_column(F.size(), 0); // Resultant combined column initialized to 0

    // For each row, select the largest magnitude from all columns
    for (int i = 0; i < F.size(); ++i)
    {
        int max_val = 0;
        for (int j = 0; j < F[i].size(); ++j)
        {
            if (abs(F[i][j]) > abs(max_val))
            {
                max_val = F[i][j]; // Keep the value with the largest magnitude
            }
        }
        combined_column[i] = max_val; // Assign max magnitude value to the combined column
    }

    return combined_column;
}

// Function to group columns by packing sparse columns efficiently into a single dense column
vector<vector<int>> group_columns(const vector<vector<int>> &F)
{
    vector<vector<int>> groups;
    vector<bool> grouped(F[0].size(), false);

    // Greedy algorithm to group columns with the goal of maximizing non-zero packing
    for (int c = 0; c < F[0].size(); ++c)
    {
        if (grouped[c])
            continue;

        vector<int> current_group(F.size(), 0);
        for (int i = 0; i < F.size(); ++i)
        {
            if (F[i][c] != 0)
            {
                current_group[i] = F[i][c]; // Copy the column into the group if it has non-zero values
            }
        }

        groups.push_back(current_group);
        grouped[c] = true; // Mark column as grouped
    }

    return groups;
}

// Main function to perform grouping and column-combining
vector<int> combine_and_prune(const vector<vector<int>> &F)
{
    vector<vector<int>> groups = group_columns(F); // First group the sparse columns
    return group_and_combine_columns(F);           // Then combine them into a single dense column
}

int main()
{
    // Example sparse matrix (rows represent weights, columns represent sparse columns)
    vector<vector<int>> sparse_matrix = {
        {2, 0, -3, 0},
        {0, 7, 0, 5},
        {-1, 0, 0, 6},
        {0, 4, 0, 0}};

    // Perform grouping and combining of columns
    vector<int> combined_column = combine_and_prune(sparse_matrix);

    // Output the combined column
    cout << "Combined column after grouping and pruning: \n";
    for (auto val : combined_column)
    {
        cout << val << " ";
    }
    cout << endl;

    return 0;
}