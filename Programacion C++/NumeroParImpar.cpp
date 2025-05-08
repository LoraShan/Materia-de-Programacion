#include <iostream>
using namespace std;

int main() {
    int numero;
    cout << "Ingrese un numero: ";
    cin >> numero;
    cout << (numero % 2 == 0 ? "Par" : "Impar") << endl;
    return 0;
}
