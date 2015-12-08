From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 2/2] Determine SPL entry-point automatically
Date: Tue,  8 Dec 2015 10:47:29 -0700
Message-ID: <1449596849-27393-2-git-send-email-swarren@wwwdotorg.org>
References: <1449596849-27393-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449596849-27393-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

tegra-uboot-flasher currently hard-codes the U-Boot SPL entry point. The
chosen value works fine for upstream/mainline U-Boot. However, L4T U-Boot
uses a different value for compatibility with L4T's flashing tools. This
causes tegra-uboot-flasher to fail when using with and L4T U-Boot. Fix
this by having tegra-uboot-flasher's build process introspect the U-Boot
binaries to determine the actual load-/entry-address.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 build               |  9 +++++++-
 elf-get-entry       | 65 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 tegra-uboot-flasher | 11 ++++++---
 3 files changed, 81 insertions(+), 4 deletions(-)
 create mode 100755 elf-get-entry

diff --git a/build b/build
index b58112e12be2..56c0254ab0da 100755
--- a/build
+++ b/build
@@ -1,6 +1,6 @@
 #!/usr/bin/env python2
 
-# Copyright (c) 2013, NVIDIA CORPORATION. All rights reserved.
+# Copyright (c) 2013-2015 NVIDIA CORPORATION. All rights reserved.
 #
 # Permission is hereby granted, free of charge, to any person obtaining a
 # copy of this software and associated documentation files (the "Software"),
@@ -156,6 +156,13 @@ def import_uboot_one_board(boardname, build_uboot_dir):
     f.write(bss_size)
     f.close()
 
+    get_entry = os.path.join(scripts_dir, 'elf-get-entry')
+    uboot_spl = os.path.join(build_uboot_dir, 'spl', 'u-boot-spl')
+    dst = os.path.join(out_board_dir, 'u-boot-spl-entry')
+    with open(dst, "wt") as dst_f:
+        cmd = [get_entry, uboot_spl]
+        subprocess.check_call(cmd, stdout=dst_f)
+
     src = os.path.join(build_uboot_dir, 'u-boot-nodtb-tegra.bin')
     dst = os.path.join(out_board_dir, 'u-boot-nodtb-tegra.bin')
     cp(src, dst)
diff --git a/elf-get-entry b/elf-get-entry
new file mode 100755
index 000000000000..98556ed36d84
--- /dev/null
+++ b/elf-get-entry
@@ -0,0 +1,65 @@
+#!/usr/bin/env python2
+
+# Copyright (c) 2015, NVIDIA CORPORATION. All rights reserved.
+#
+# Permission is hereby granted, free of charge, to any person obtaining a
+# copy of this software and associated documentation files (the "Software"),
+# to deal in the Software without restriction, including without limitation
+# the rights to use, copy, modify, merge, publish, distribute, sublicense,
+# and/or sell copies of the Software, and to permit persons to whom the
+# Software is furnished to do so, subject to the following conditions:
+#
+# The above copyright notice and this permission notice shall be included in
+# all copies or substantial portions of the Software.
+#
+# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+# DEALINGS IN THE SOFTWARE.
+
+import sys
+import struct
+
+if len(sys.argv) != 2:
+    print >>sys.stderr, "usage: %s filename.elf" % sys.argv[0]
+    sys.exit(-1)
+
+f = file(sys.argv[1], 'rb')
+data = f.read(0x20)
+f.close()
+
+if data[0:4] != '\x7fELF':
+    print >>sys.stderr, "ELF magic mismatch"
+    sys.exit(-1)
+
+ei_class = ord(data[4])
+if ei_class == 1:
+    elf_bytes = 4
+    struct_type = 'I'
+elif ei_class == 2:
+    elf_bytes = 8
+    struct_type = 'Q'
+else:
+    print >>sys.stderr, "Bad EI_CLASS value"
+    sys.exit(-1)
+
+ei_data = ord(data[5])
+if ei_data == 1:
+    struct_endian = '<'
+elif ei_data == 2:
+    struct_endian = '>'
+else:
+    print >>sys.stderr, "Bad EI_DATA value"
+    sys.exit(-1)
+
+ei_version = ord(data[6])
+if ei_version != 1:
+    print >>sys.stderr, "Bad EI_VERSION value"
+    sys.exit(-1)
+
+e_entry = data[0x18:0x18 + elf_bytes]
+ep = struct.unpack(struct_endian + struct_type, e_entry)
+print '0x%x' % ep
diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
index 3a77a8be9e6b..0fefe21dc211 100755
--- a/tegra-uboot-flasher
+++ b/tegra-uboot-flasher
@@ -1,6 +1,6 @@
 #!/usr/bin/env python2
 
-# Copyright (c) 2013, NVIDIA CORPORATION. All rights reserved.
+# Copyright (c) 2013-2015 NVIDIA CORPORATION. All rights reserved.
 #
 # Permission is hereby granted, free of charge, to any person obtaining a
 # copy of this software and associated documentation files (the "Software"),
@@ -87,8 +87,13 @@ gen_flashcmds = {
 }
 
 def get_loadaddr():
-    # 0x00108000 is CONFIG_SPL_TEXT_BASE in U-Boot, minus RAM base
-    return soc['ram-base'] + 0x00108000
+    spl_entry_fn = os.path.join(out_board_dir, 'u-boot-spl-entry')
+    with open(spl_entry_fn, 'rt') as spl_entry_f:
+        spl_entry_s = spl_entry_f.read().strip()
+    spl_entry = int(spl_entry_s, 0)
+    if args.debug:
+        print 'spl_entry %d 0x%x' % (spl_entry, spl_entry)
+    return spl_entry
 
 def gen_tegrarcm_cmd(bootloader, loadaddr):
     if type(loadaddr) != str:
-- 
2.6.3
