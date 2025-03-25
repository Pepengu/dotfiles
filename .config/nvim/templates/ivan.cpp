#define _CRT_SECURE_NO_WARNINGS
#include <bits/stdc++.h>
// #pragma GCC optimize("Ofast,no-stack-protector,unroll-loops,fast-math")
// #pragma GCC target("sse,sse2,sse3,ssse3,sse4.1,sse4.2,popcnt,abm,mmx,avx,tune=native")
// #pragma GCC target("avx,avx2")
// #pragma GCC optimize("O3")
using namespace std;
// #define int long long
typedef long long ll;
typedef long double ld;
typedef unsigned long long ull;
#define forn(from, to, i) for (int i = from; i < to; ++i)
#define revn(from, to, i) for (int i = from; i >= to; --i)
#define odd(x) (x & 1)
#define m_p make_pair
#define all(x) x.begin(), x.end()
#define pii pair <int, int>
#define YES cout << "YES\n"
#define NO cout << "NO\n"
#define vec vector
#define vi vec<int>
#define vpii vec<pii>
#define vvpii vec<vec<pii> >
#define vvi vec<vec<int> >
#define mii map<int, int>
#define fi first
#define se second
struct custom_hash 
{
    static uint64_t splitmix64(uint64_t x) {
        x += 0x9e3779b97f4a7c15;
        x = (x ^ (x >> 30)) * 0xbf58476d1ce4e5b9;
        x = (x ^ (x >> 27)) * 0x94d049bb133111eb;
        return x ^ (x >> 31);
    }

    size_t operator()(uint64_t x) const {
        static const uint64_t FIXED_RANDOM = chrono::steady_clock::now().time_since_epoch().count();
        return splitmix64(x + FIXED_RANDOM);
    }
};
template <typename T>
istream& operator>>(istream& in, vector<T>& v) 
{
    for (auto & el : v) in >> el;
    return in;
}
template <typename T>
ostream& operator<<(ostream& out, vector<T>& v) 
{
    for (auto & el : v) out << el << ' ';
    return out;
}
const int INF = 1000000007;
const ll INF2 = 100000000000000007;
const int MOD1 = 998244353;
const int MOD = 1000000007;
const int SIZE = 300010;
const int base = 53;
const long double eps = 1e-6;
const long double pi = acosl(-1.0);
int popcnt(int x) { return __builtin_popcount(x); }
int popcnt(ll x) { return __builtin_popcountll(x); }
int lowbit(int x) { return (x == 0 ? -1 : __builtin_ctz(x)); }
int lowbit(ll x) { return (x == 0 ? -1 : __builtin_ctzll(x)); }
int topbit(int x) { return (x == 0 ? -1 : 31 - __builtin_clz(x)); }
int topbit(ll x) { return (x == 0 ? -1 : 63 - __builtin_clzll(x)); }
string bin(ll x) {
    bitset<64> bs(x);
    return bs.to_string().substr(63 - topbit(x), topbit(x) + 1);
}
string bin(int x) {
    bitset<32> bs(x);
    return bs.to_string().substr(31 - topbit(x), topbit(x) + 1);
}
mt19937 rng(chrono::steady_clock::now().time_since_epoch().count());
ll add(ll a, ll b, ll mod = MOD) {
    return ((a + b) % mod + mod) % mod;
}
ll mult(ll a, ll b, ll mod = MOD) {
    return (((a % mod) * (b % mod)) % mod + mod) % mod;
}
ll binpowmod(ll a, ll n, ll mod = MOD) {
    if (n < 0) return 1;
    ll res = 1;
    while (n) {
        if (n & 1) res = mult(res, a, mod);
        a = mult(a, a, mod);
        n >>= 1;
    }
    return res;
}
ll binpow(ll a, ll n) {
    ll res = 1;
    while (n) {
        if (n & 1) {
            res *= a;
        }
        a *= a;
        n >>= 1;
    }
    return res;
}
ll inv(ll a) {
    return binpowmod(a, MOD - 2);
}
ll del(ll a, ll b) {
    return mult(a, inv(b));
}
ll gcd(ll a, ll b) {
    return (b == 0 ? a : gcd(b, a % b));
}
ll lcm(ll a, ll b) {
    return a / gcd(a, b) * b;
}
  
void precount() {
}



void solve() {
    {{_cursor_}}
}



signed main() {
    precount();
    int test = 1;
    // cin >> test; 
    while (test--) {
        solve();
    }


#ifdef DEBUG
    cout << "\n\n" << fixed << (clock() - cl) / CLOCKS_PER_SEC << " s.\n";
#endif
    return 0;
}
