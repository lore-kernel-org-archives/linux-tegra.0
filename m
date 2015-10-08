From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH v2] Add man pages
Date: Thu, 8 Oct 2015 15:07:24 -0700
Message-ID: <1444342044-4777-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add man pages for cbootimge(1) and bct_dump(1)

Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .gitignore          |  5 ++++
 src/Makefile.am     | 17 +++++++++++
 src/bct_dump.1.in   | 53 +++++++++++++++++++++++++++++++++
 src/cbootimage.1.in | 84 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 159 insertions(+)
 create mode 100644 src/bct_dump.1.in
 create mode 100644 src/cbootimage.1.in

diff --git a/.gitignore b/.gitignore
index b879c34bd28c..91c964c69654 100644
--- a/.gitignore
+++ b/.gitignore
@@ -20,3 +20,8 @@ Makefile.in
 /install-sh
 /missing
 /stamp-h1
+
+src/bct_dump.1
+src/bct_dump.man
+src/cbootimage.1
+src/cbootimage.man
diff --git a/src/Makefile.am b/src/Makefile.am
index 64c4ea52b8e2..285f9dbd629c 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -84,3 +84,20 @@ bct_dump_SOURCES = \
 	t132/nvboot_sdram_param_t132.h \
 	t210/nvboot_bct_t210.h \
 	t210/nvboot_sdram_param_t210.h
+
+man_MANS = cbootimage.1 bct_dump.1
+
+EXTRA_DIST = cbootimage.1.in bct_dump.1.in
+DISTCLEANFILES = cbootimage.1 cbootimage.man bct_dump.1 bct_dump.man
+
+cbootimage.1: $(srcdir)/cbootimage.1.in
+	sed 's|VERSION|$(VERSION)|g' $< >$@
+
+cbootimage.man: $(srcdir)/cbootimage.1
+	nroff -man $< >$@
+
+bct_dump.1: $(srcdir)/bct_dump.1.in
+	sed 's|VERSION|$(VERSION)|g' $< >$@
+
+bct_dump.man: $(srcdir)/bct_dump.1
+	nroff -man $< >$@
diff --git a/src/bct_dump.1.in b/src/bct_dump.1.in
new file mode 100644
index 000000000000..0a6ca27aa6e1
--- /dev/null
+++ b/src/bct_dump.1.in
@@ -0,0 +1,53 @@
+.TH bct_dump 1 "6 October 2015" "bct_dump-VERSION" "NVIDIA Tegra BCT Disassembly Tool"
+.IX bct_dump
+.SH NAME
+bct_dump \- tegra BCT disassembly tool
+.SH SYNOPSIS
+.B bct_dump
+.I bctfile
+.SH DESCRIPTION
+This program is used to take a binary Tegra Boot Configuration Table (BCT) and
+disassemble it into a text format suitable to be compiled with cbootimage(1).
+
+.SS Platforms supported
+.IP \(bu
+.B Tegra20
+.IP \(bu
+.B Tegra30
+.IP \(bu
+.B Tegra114
+.IP \(bu
+.B Tegra124
+.IP \(bu
+.B Tegra132
+.IP \(bu
+.B Tegra210
+
+.SH OPTIONS
+.TP
+.B \fIbctfile\fP
+Specify the BCT file to disassemble
+
+.SH EXAMPLES
+To disassemble the BCT file for a Tegra124 Jetson-TK1:
+
+.nf
+$ bct_dump PM375_Hynix_2GB_H5TC4G63AFR_RDA_924MHz.bct
+Version       = 0x00400001;
+BlockSize     = 0x00004000;
+PageSize      = 0x00000200;
+PartitionSize = 0x01000000;
+OdmData       = 0x800d8000;
+JtagCtrl      = 0x00000000;
+ChipUid       = 0x00000000000000000000000000000000;
+# Bootloader used       = 0;
+# Bootloaders max       = 4;
+# BCT size              = 8192;
+ ...
+.fi
+
+.SH RETURN VALUE
+If any error occurs a non zero exit status is returned.
+
+.SH SEE ALSO
+.BR tegrarcm(1), cbootimage(1)
diff --git a/src/cbootimage.1.in b/src/cbootimage.1.in
new file mode 100644
index 000000000000..89606339bb0e
--- /dev/null
+++ b/src/cbootimage.1.in
@@ -0,0 +1,84 @@
+.TH cbootimage 1 "6 October 2015" "cbootimage-VERSION" "NVIDIA Tegra Firmware Signing Tool"
+.IX cbootimage
+.SH NAME
+cbootimage \- tegra BCT compiler
+.SH SYNOPSIS
+.B cbootimage
+[
+.I options
+] configfile [
+.I inputimage
+]
+.I outputimage
+.SH DESCRIPTION
+This program is used to create images suitable to place into the boot flash of a
+device using a Tegra SoC.  There are two primary modes of operation of
+cbootimage:
+
+.nr step 1 1
+.IP \n[step] 3
+Compile a textual representation of a BCT into a binary image.
+.IP \n+[step]
+Generate an entire boot image from a previously compiled BCT and a bootloader
+binary.
+
+.SS Platforms supported
+.IP \(bu
+.B Tegra20
+.IP \(bu
+.B Tegra30
+.IP \(bu
+.B Tegra114
+.IP \(bu
+.B Tegra124
+.IP \(bu
+.B Tegra132
+.IP \(bu
+.B Tegra210
+
+.SH COMMANDS
+.TP
+.B \-gbct
+Generate the new bct file from the given config file.
+.TP
+.B \-h, \-\-help, \-?
+Print help text and exit.
+
+.SH OPTIONS
+.TP
+.B \-d, \-\-debug
+Output debugging information.
+.TP
+.B \-o\fIodm_data\fP
+Specify the odm_data value (in hex).
+.TP
+.B \-t, \-\-tegra \fINN\fP
+Select target device.  Must be one of: 20, 30, 114, 124, 132, 210.
+.TP
+.B \-s, \-\-ssoc \fItegraNN\fP
+Select target device.  Must be one of: tegra20, tegra30, tegra114, tegra124,
+tegra32, tegra210.
+.TP
+.B \-u \-\-update
+Copy input image data and update bct configs into new image file
+
+.SH EXAMPLES
+To generate a bct file from a text description obtained either through
+bct_dump(1) or cbootimage-configs:
+
+.nf
+$ cbootimage -gbct -t124 PM375_Hynix_2GB_H5TC4G63AFR_RDA_924MHz.bct.cfg PM375_Hynix_2GB_H5TC4G63AFR_RDA_924MHz.bct
+New BCT file PM375_Hynix_2GB_H5TC4G63AFR_RDA_924MHz.bct has been successfully generated!
+.fi
+
+To generate a boot image file including the newly generated bct:
+.nf
+cbootimage -t124 jetson-tk1-emmc.img.cfg jetson-tk1-emmc.img
+Image file jetson-tk1-emmc.img has been successfully generated!
+.fi
+
+.SH RETURN VALUE
+If any error occurs a non zero exit status is returned.
+
+.SH SEE ALSO
+.BR tegrarcm(1), bct_dump(1)
-- 
1.9.1
