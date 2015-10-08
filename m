From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [tegrarcm PATCH 2/3] Match USB port ID on re-enumeration
Date: Thu,  8 Oct 2015 12:38:29 -0600
Message-ID: <1444329510-23848-2-git-send-email-swarren@wwwdotorg.org>
References: <1444329510-23848-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444329510-23848-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

When executing the RCM process, the Tegra device will be re-enumerated
on the USB bus once the miniloader is booted. This requires tegrarcm to
search for it again. In a system with multiple attached Tegra boards, all
being booted/shutdown in parallel, it is possible that the second call to
usb_open() will find a different Tegra device. Solve this issue by having
usb_open() record the exact physical USB port path of the device, and
match only that path on subsequent searches. This will be robust except in
the case where the device being operated on is physically unplugged and
replaced (not simply power-cycled) while tegrarcm is executing. This is
much less likely that the previous failure modes.

This feature also enables the next patch in this series.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/main.c | 18 +++++++++++++--
 src/usb.c  | 76 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---
 src/usb.h  | 14 +++++++++++-
 3 files changed, 102 insertions(+), 6 deletions(-)

diff --git a/src/main.c b/src/main.c
index 50adc14f0b06..4936d02e0cd9 100644
--- a/src/main.c
+++ b/src/main.c
@@ -136,6 +136,12 @@ int main(int argc, char **argv)
 	int do_read = 0;
 	char *mlfile = NULL;
 	uint32_t mlentry = 0;
+#ifdef HAVE_USB_PORT_MATCH
+	bool match_port = false;
+	uint8_t match_bus;
+	uint8_t match_ports[PORT_MATCH_MAX_PORTS];
+	int match_ports_len;
+#endif
 
 	static struct option long_options[] = {
 		[OPT_BCT]        = {"bct", 1, 0, 0},
@@ -232,7 +238,11 @@ int main(int argc, char **argv)
 		printf("entry addr 0x%x\n", entryaddr);
 	}
 
-	usb = usb_open(USB_VENID_NVIDIA, &devid);
+	usb = usb_open(USB_VENID_NVIDIA, &devid
+#ifdef HAVE_USB_PORT_MATCH
+		, &match_port, &match_bus, match_ports, &match_ports_len
+#endif
+	);
 	if (!usb)
 		error(1, errno, "could not open USB device");
 	printf("device id: 0x%x\n", devid);
@@ -259,7 +269,11 @@ int main(int argc, char **argv)
 
 		// device may have re-enumerated, so reopen USB
 		usb_close(usb);
-		usb = usb_open(USB_VENID_NVIDIA, &devid);
+		usb = usb_open(USB_VENID_NVIDIA, &devid
+#ifdef HAVE_USB_PORT_MATCH
+		, &match_port, &match_bus, match_ports, &match_ports_len
+#endif
+		);
 		if (!usb)
 			error(1, errno, "could not open USB device");
 	}
diff --git a/src/usb.c b/src/usb.c
index 71234d77d7b1..8a367426b29c 100644
--- a/src/usb.c
+++ b/src/usb.c
@@ -42,9 +42,27 @@
 //
 // returns 1 if the specified usb device matches the vendor id
 //
-static int usb_match(libusb_device *dev, uint16_t venid, uint16_t *devid)
+static int usb_match(libusb_device *dev, uint16_t venid, uint16_t *devid
+#ifdef HAVE_USB_PORT_MATCH
+	,
+	bool *match_port, uint8_t *match_bus, uint8_t *match_ports,
+	int *match_ports_len
+#endif
+)
 {
 	struct libusb_device_descriptor desc;
+#ifdef HAVE_USB_PORT_MATCH
+	uint8_t dev_bus;
+	uint8_t dev_ports[PORT_MATCH_MAX_PORTS];
+	int dev_ports_len;
+#ifdef DEBUG
+	int i;
+	char portstr[(PORT_MATCH_MAX_PORTS * 4)];
+	char *portstrp;
+	size_t portstr_lenleft;
+	int printed;
+#endif
+#endif
 
 	if (libusb_get_device_descriptor(dev, &desc)) {
 		dprintf("libusb_get_device_descriptor\n");
@@ -66,6 +84,47 @@ static int usb_match(libusb_device *dev, uint16_t venid, uint16_t *devid)
 			desc.idVendor, desc.idProduct);
 		return 0;
 	}
+#ifdef HAVE_USB_PORT_MATCH
+	dev_bus = libusb_get_bus_number(dev);
+	dev_ports_len = libusb_get_port_numbers(dev, dev_ports,
+			PORT_MATCH_MAX_PORTS);
+	if (dev_ports_len < 0) {
+		dprintf("libusb_get_port_numbers failed: %d\n", dev_ports_len);
+		return 0;
+	}
+	if (*match_port) {
+		if (dev_bus != *match_bus) {
+			dprintf("bus mismatch dev:%d match:%d\n", dev_bus,
+				*match_bus);
+			return 0;
+		}
+		if (memcmp(dev_ports, match_ports, dev_ports_len)) {
+			dprintf("ports mismatch\n");
+			return 0;
+		}
+	}
+	if (!*match_port) {
+		*match_port = true;
+		*match_bus = dev_bus;
+		memcpy(match_ports, dev_ports, dev_ports_len);
+		*match_ports_len = dev_ports_len;
+#ifdef DEBUG
+		portstrp = portstr;
+		portstr_lenleft = sizeof(portstr);
+		printed = snprintf(portstrp, portstr_lenleft, "%d-%d",
+			dev_bus, dev_ports[0]);
+		portstrp += printed;
+		portstr_lenleft -= printed;
+		for (i = 1; i < dev_ports_len; i++) {
+			printed = snprintf(portstrp, portstr_lenleft, ".%d",
+				(int)dev_ports[i]);
+			portstrp += printed;
+			portstr_lenleft -= printed;
+		}
+		dprintf("Enabling future match %s\n", portstr);
+#endif
+	}
+#endif
 
 	dprintf("device matches\n");
 	*devid = desc.idProduct;
@@ -151,7 +210,13 @@ static int usb_get_interface(libusb_device_handle *handle,
 	return 0;
 }
 
-usb_device_t *usb_open(uint16_t venid, uint16_t *devid)
+usb_device_t *usb_open(uint16_t venid, uint16_t *devid
+#ifdef HAVE_USB_PORT_MATCH
+	,
+	bool *match_port, uint8_t *match_bus, uint8_t *match_ports,
+	int *match_ports_len
+#endif
+)
 {
 	libusb_device **list = NULL;
 	libusb_device *found = NULL;
@@ -172,7 +237,12 @@ usb_device_t *usb_open(uint16_t venid, uint16_t *devid)
 	for (i = 0; i < cnt; i++) {
 		libusb_device *device = list[i];
 
-		if (usb_match(device, venid, devid)) {
+		if (usb_match(device, venid, devid
+#ifdef HAVE_USB_PORT_MATCH
+				, match_port, match_bus, match_ports,
+				match_ports_len
+#endif
+		)) {
 			found = device;
 			break;
 		}
diff --git a/src/usb.h b/src/usb.h
index a7b36af020d7..e8fcd67cf6cc 100644
--- a/src/usb.h
+++ b/src/usb.h
@@ -29,8 +29,14 @@
 #ifndef USB_H
 #define USB_H
 
+#include <stdbool.h>
 #include <libusb.h>
 
+#if defined(LIBUSBX_API_VERSION) && (LIBUSBX_API_VERSION >= 0x01000102)
+#define HAVE_USB_PORT_MATCH
+#define PORT_MATCH_MAX_PORTS 7
+#endif
+
 #define USB_VENID_NVIDIA 0x955
 #define USB_DEVID_NVIDIA_TEGRA20 0x20
 #define USB_DEVID_NVIDIA_TEGRA30 0x30
@@ -45,7 +51,13 @@ typedef struct {
 	int initialized;
 } usb_device_t;
 
-usb_device_t *usb_open(uint16_t venid, uint16_t *devid);
+usb_device_t *usb_open(uint16_t venid, uint16_t *devid
+#ifdef HAVE_USB_PORT_MATCH
+	,
+	bool *match_port, uint8_t *match_bus, uint8_t *match_ports,
+	int *match_ports_len
+#endif
+);
 void usb_close(usb_device_t *usb);
 int usb_write(usb_device_t *usb, uint8_t *buf, int len);
 int usb_read(usb_device_t *usb, uint8_t *buf, int len, int *actual_len);
-- 
1.9.1
