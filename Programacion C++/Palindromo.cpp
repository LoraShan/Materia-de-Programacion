#include <iostream>
#include <string>
using namespace std;

int main() {
    string texto, invertido;
    cout << "Ingrese una palabra: ";
    getline(cin, texto);
    for (int i = texto.length() - 1; i >= 0; i--)
        invertido += texto[i];
    cout << (texto == invertido ? "Es palindromo" : "No es palindromo") << endl;
    return 0;
}
