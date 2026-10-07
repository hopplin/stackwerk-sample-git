# Deliberately broken: stackwerk reports a file it cannot read and still shows the rest of the stack.
resource "vsphere_folder" "vergessen" {
  path = "vergessen"
  type = "vm"
