From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [tegrarcm PATCH 3/3] Implement --usb-port-path cmdline option
Date: Thu,  8 Oct 2015 12:38:30 -0600
Message-ID: <1444329510-23848-3-git-send-email-swarren@wwwdotorg.org>
References: <1444329510-23848-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444329510-23848-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This allows the user to specify which USB device to control, and in a
manner that is most immune to the set of attached USB devices varying.
See the manpage edit in this commit for a full description of how to
use this option.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/main.c        | 50 +++++++++++++++++++++++++++++++++++++
 src/tegrarcm.1.in | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 124 insertions(+)

diff --git a/src/main.c b/src/main.c
index 4936d02e0cd9..3db0ed8be506 100644
--- a/src/main.c
+++ b/src/main.c
@@ -81,6 +81,9 @@ enum cmdline_opts {
 	OPT_VERSION,
 	OPT_MINILOADER,
 	OPT_MINIENTRY,
+#ifdef HAVE_USB_PORT_MATCH
+	OPT_USBPORTPATH,
+#endif
 	OPT_END,
 };
 
@@ -102,6 +105,12 @@ static void usage(char *progname)
 	fprintf(stderr, "\tbootloader to device and start execution of bootloader\n");
 	fprintf(stderr, "\n");
 	fprintf(stderr, "Options:\n");
+#ifdef HAVE_USB_PORT_MATCH
+	fprintf(stderr, "\t--usb-port-path=<path>\n");
+	fprintf(stderr, "\t\tSpecify the USB device to program, e.g. 3-10.4\n");
+	fprintf(stderr, "\t\tSee `udevadm info /dev/bus/usb/003/042` DEVPATH\n");
+	fprintf(stderr, "\t\tSee /sys/bus/usb/devices/* with matching busnum/devnum files\n");
+#endif
 	fprintf(stderr, "\t--entryaddr=<entryaddr>\n");
 	fprintf(stderr, "\t\tSpecify the entry point for the bootloader, if this option is\n");
 	fprintf(stderr, "\t\tnot provided, it is assumed to be loadaddr\n");
@@ -117,6 +126,36 @@ static void usage(char *progname)
 	fprintf(stderr, "\n");
 }
 
+#ifdef HAVE_USB_PORT_MATCH
+static void parse_usb_port_path(char *argv0, char *path, uint8_t *match_bus,
+	uint8_t *match_ports, int *match_ports_len)
+{
+	*match_bus = strtoul(path, &path, 10);
+	if (*path != '-') {
+		usage(argv0);
+		exit(EXIT_FAILURE);
+	}
+	path++;
+
+	*match_ports_len = 0;
+	for (;;) {
+		match_ports[*match_ports_len] = strtoul(path, &path, 10);
+		(*match_ports_len)++;
+		if (!*path)
+			break;
+		if (*match_ports_len >= PORT_MATCH_MAX_PORTS) {
+			usage(argv0);
+			exit(EXIT_FAILURE);
+		}
+		if (*path != '.') {
+			usage(argv0);
+			exit(EXIT_FAILURE);
+		}
+		path++;
+	}
+}
+#endif
+
 int main(int argc, char **argv)
 {
 	// discover devices
@@ -152,6 +191,9 @@ int main(int argc, char **argv)
 		[OPT_VERSION]    = {"version", 0, 0, 0},
 		[OPT_MINILOADER] = {"miniloader", 1, 0, 0},
 		[OPT_MINIENTRY]  = {"miniloader_entry", 1, 0, 0},
+#ifdef HAVE_USB_PORT_MATCH
+		[OPT_USBPORTPATH]  = {"usb-port-path", 1, 0, 0},
+#endif
 		[OPT_END]        = {0, 0, 0, 0}
 	};
 
@@ -187,6 +229,14 @@ int main(int argc, char **argv)
 			case OPT_MINIENTRY:
 				mlentry = strtoul(optarg, NULL, 0);
 				break;
+#ifdef HAVE_USB_PORT_MATCH
+			case OPT_USBPORTPATH:
+				parse_usb_port_path(argv[0], optarg,
+					&match_bus, match_ports,
+					&match_ports_len);
+				match_port = true;
+				break;
+#endif
 			case OPT_HELP:
 			default:
 				usage(argv[0]);
diff --git a/src/tegrarcm.1.in b/src/tegrarcm.1.in
index f747fd8557f7..f8009b952176 100644
--- a/src/tegrarcm.1.in
+++ b/src/tegrarcm.1.in
@@ -79,6 +79,80 @@ built-in one.
 .TP
 .B \-\-miniloader_entry \fImlentry\fP
 Specify the entry address of the miniloader.
+.TP
+.B \-\-usb\-port\-path \fIpath\fP
+Specify the physical USB port path of the Tegra device to control.
+
+.SH USB PORT PATH
+
+By default, tegrarcm operates on the first USB applicable device it finds.
+In a system that contains multiple Tegra devices, the user may wish to
+specify which device tegrarcm should operate upon. The \-\-usb\-port\-path
+option allows this, and in a manner that is most immune to the set of attached
+USB devices varying.
+
+Note that the USB port path is associated with a physical USB port on a
+particular hub. This value will vary if you physically re-organize your USB
+connections. This feature is still useful even if your USB topology changes,
+providing you have some other mechanism to differentiate attached devices. For
+example, you could use a wrapper script around tegrarcm that identifies the
+appropriate device by other means, then automatically calculates the USB port
+path using the procedures below, and passes the value to tegrarcm.
+
+To determine the USB port path of a device, you must plug it in and find the
+current USB bus and USB device number of the device, then map that to the USB
+port path. Simply run lsusb to find the current USB bus and device number. If
+you have multiple NVIDIA devices attached, you may need to unplug and replug
+the Tegra device to ensure you know which is which (all while not changing the
+state of any other USB devices so you don't confuse yourself).
+
+.nf
+$ lsusb
+...
+Bus 003 Device 039: ID 0955:7721 NVidia Corp.
+Bus 003 Device 045: ID 0955:7140 NVidia Corp.
+...
+fi
+
+Then, to determine the USB port path, do one of:
+
+.IP 1.
+
+Execute udevmadm on the USB device, and look for the DEVPATH entry. The
+final component in the path is the USB port path:
+
+.nf
+$ udevadm info /dev/bus/usb/003/045
+P: /devices/pci0000:00/0000:00:14.0/usb3/3-10/3-10.4
+N: bus/usb/003/045
+E: BUSNUM=003
+E: DEVNUM=045
+E: DEVPATH=/devices/pci0000:00/0000:00:14.0/usb3/3-10/3-10.4
+.fi
+
+.IP 2.
+
+Look at all the sub-directories of /sys/bus/usb/devices/* that do not
+contain either ":" or "usb". Each of these will contain a busnum and
+devnum file. Find the directory which matches the lsusb output, and use
+its name:
+
+.nf
+$ cat /sys/bus/usb/devices/3-10.4/busnum
+3
+$ cat /sys/bus/usb/devices/3-10.4/devnum
+45
+.fi
+
+Alternatively, you may already have udev rules that create a device node
+symlink for the device (after some specific identification algorithm). In
+that case, you can search the udev output for MAJOR/MINOR values, or
+/sys/bus/usb/devices/* directories for "dev" files, that match the device
+node the symlink points to.
+
+Once the port path is known, this value will not vary unless your USB
+connections are physically changed, so you can use it over and over
+without repeating the steps above.
 
 .SH EXAMPLES
 To download u-boot firmware to a Tegra20 seaboard:
-- 
1.9.1
