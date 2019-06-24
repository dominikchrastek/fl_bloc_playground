import '../model/terminal.dart';
import './terminal_provider.dart';
import '../storage/storage_provider.dart';

class TerminalRepository {
  TerminalProvider pinProvivder = new TerminalProvider();
  StorageProvider storageProvider = new StorageProvider();

  Future<Terminal> activate(String pin) {
    return pinProvivder.activate(pin);
  }

  Future<bool> storePin(String terminalPin) {
    return storageProvider.setItem('terminalPin', terminalPin);
  }

  Future<String> getPin() {
    return storageProvider.getItem('terminalPin');
  }

  Future<bool> storeToken(String token) {
    return storageProvider.setItem('token', token);
  }

  Future<String> getToken() {
    return storageProvider.getItem('token');
  }
}
