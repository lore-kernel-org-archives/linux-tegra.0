From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH net/next] r8152: Use MAC address from device tree if available
Date: Thu, 14 May 2020 14:38:48 +0200
Message-ID: <20200514123848.933199-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Cc: Hayes Wang <hayeswang-Rasf1IRRPZFBDgjK7y7TUQ@public.gmane.org>, Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

If a MAC address was passed via the device tree node for the r8152
device, use it and fall back to reading from EEPROM otherwise. This is
useful for devices where the r8152 EEPROM was not programmed with a
valid MAC address, or if users want to explicitly set a MAC address in
the bootloader and pass that to the kernel.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/net/usb/r8152.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 8f8d9883d363..1af72ec284ca 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -1504,15 +1504,19 @@ static int determine_ethernet_addr(struct r8152 *tp, struct sockaddr *sa)
 
 	sa->sa_family = dev->type;
 
-	if (tp->version == RTL_VER_01) {
-		ret = pla_ocp_read(tp, PLA_IDR, 8, sa->sa_data);
-	} else {
-		/* if device doesn't support MAC pass through this will
-		 * be expected to be non-zero
-		 */
-		ret = vendor_mac_passthru_addr_read(tp, sa);
-		if (ret < 0)
-			ret = pla_ocp_read(tp, PLA_BACKUP, 8, sa->sa_data);
+	ret = eth_platform_get_mac_address(&dev->dev, sa->sa_data);
+	if (ret < 0) {
+		if (tp->version == RTL_VER_01) {
+			ret = pla_ocp_read(tp, PLA_IDR, 8, sa->sa_data);
+		} else {
+			/* if device doesn't support MAC pass through this will
+			 * be expected to be non-zero
+			 */
+			ret = vendor_mac_passthru_addr_read(tp, sa);
+			if (ret < 0)
+				ret = pla_ocp_read(tp, PLA_BACKUP, 8,
+						   sa->sa_data);
+		}
 	}
 
 	if (ret < 0) {
-- 
2.24.1
