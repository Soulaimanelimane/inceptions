#include <iostream>
#include <vector>
#include <cctype>
#include <cmath>
#include <algorithm>

using namespace std ;


class Solution {
public:
    size_t ft_handel(size_t l , size_t r, vector<int>& hei)
    {
        if (l > hei.size() || r > hei.size())
            exit(0);
        size_t res = 0;
        for (size_t i = l+1 ; i < r ; i++)
            res += hei[i];
        return res;
    }
    int trap(vector<int>& hei) {
       size_t l = 0; 
       size_t r = l + 1;
       size_t vm = 0;
       for (size_t i = 0; i < hei.size(); i++)
       {
            if ((l > hei.size() || r > hei.size()))
                break;
            if (l < hei.size() && hei[l] == 0)
                l++;
            if (l == r)
               r++;
            while (r < hei.size() && hei[r] < hei[l])
                r++;

            
            if ((l < hei.size() && r < hei.size()))
            {
                vm += (((r - l )- 1) *  min(hei[l], hei[r])) ;
                vm -= ft_handel(l , r, hei);
                l = r ;
                r++;
                if (r >= hei.size() || l >= hei.size())
                    return vm;
            }
            else
            {
                l++;
                r = l + 1;
            }

            // cout << l << "  " << r << endl;

       } 
       return vm;
    }
};


int main() {
    Solution sol;

    vector<int> height = {4,2,3};

    cout  << sol.trap(height) << endl;

    return 0;
}