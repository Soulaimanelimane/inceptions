#include <iostream>
#include <vector>
#include <cctype>
#include <cmath>
#include <algorithm>


void get_pos(int &x, int &y, char c,  std::vector<std::string> &arr)
{
    for (size_t i = 0; i < arr.size(); i++)
    {
        size_t j = 0;
        for (j ; j < arr[i].size(); j++)
        {
            if (arr[i][j] == tolower(c))
                break;
        }
        if ( j !=  arr[i].size())
        {
            x = j+1  , y = i;
            break;
        }
    }
    
}

long long get_min_dist_sq(int x, int y, std::vector<std::pair<int, int>>& pos)
{
    // If no shift keys exist, return a special value
    if (pos.empty()) return -1;

    long long min_dist_sq = -1;

    for (size_t i = 0; i < pos.size(); i++)
    {
        // Using long long to prevent overflow during multiplication
        long long dx = (long long)x - pos[i].first;
        long long dy = (long long)y - pos[i].second;
        long long current_dist_sq = dx * dx + dy * dy;

        if (min_dist_sq == -1 || current_dist_sq < min_dist_sq)
        {
            min_dist_sq = current_dist_sq;
        }
    }

    return min_dist_sq;
}

int main()
{
    int n,m , lim;
    std::cin >> n >> m >> lim ;

    std::vector<std::string> arr;
    arr.resize(n);
    for (size_t i = 0; i < n; i++)
        std::cin >> arr[i];

    std::string str;
    size_t q;
    std::cin >> q >> str;
    int x = -1, y = -1;
    std::vector<std::pair<int , int> > pos;
    for (size_t i = 0; i < n; i++)
    {
        size_t loc = arr[i].find('S');

        if (loc != std::string::npos)
        {
            pos.push_back({loc, i});
        }
    }
    long long count = 0 ;
    long long lim_sq = (long long)lim * lim;
    for (size_t i = 0; i < q; i++)
    {
        if (isupper(str[i]))
        {
            get_pos(x, y, str[i], arr);
            x--; 
            
            long long min_sq = get_min_dist_sq(x, y, pos);
            
            if (min_sq == -1)
            {
                std::cout << -1 << std::endl;
                return 0;
            }
            
            if (min_sq > lim_sq) {
                count++;
            }
        }
    }
    if (count == 0)
        std::cout << -1 << std::endl;
    else
        std::cout << count << std::endl;
}
/*



*/