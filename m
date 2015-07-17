From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: [RFC 8/9] i2c: take address space into account when checking for used addresses
Date: Fri, 17 Jul 2015 16:08:28 +0200
Message-ID: <1437142109-31975-9-git-send-email-wsa@the-dreams.de>
References: <1437142109-31975-1-git-send-email-wsa@the-dreams.de>
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437142109-31975-1-git-send-email-wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>

It is not enough to compare the plain address value, we also need to
check the flags enabling a different address space. E.g. it is valid to
have address 0x50 as a 7-bit address and 0x050 as 10-bit address on the
same bus. Same for addresses when we are the slave.

Signed-off-by: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
---
 drivers/i2c/i2c-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-core.c b/drivers/i2c/i2c-core.c
index 4a92eded4ece9c..021ff232beaae3 100644
--- a/drivers/i2c/i2c-core.c
+++ b/drivers/i2c/i2c-core.c
@@ -834,7 +834,7 @@ static int __i2c_check_addr_busy(struct device *dev, void *addrp)
 	struct i2c_client	*client = i2c_verify_client(dev);
 	int			addr = *(int *)addrp;
 
-	if (client && client->addr == addr)
+	if (client && i2c_encode_flags_to_addr(client) == addr)
 		return -EBUSY;
 	return 0;
 }
@@ -988,7 +988,7 @@ i2c_new_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
 	}
 
 	/* Check for address business */
-	status = i2c_check_addr_busy(adap, client->addr);
+	status = i2c_check_addr_busy(adap, i2c_encode_flags_to_addr(client));
 	if (status)
 		goto out_err;
 
@@ -2284,7 +2284,7 @@ static int i2c_detect_address(struct i2c_client *temp_client,
 		return err;
 	}
 
-	/* Skip if already in use */
+	/* Skip if already in use (7 bit, no need to encode flags) */
 	if (i2c_check_addr_busy(adapter, addr))
 		return 0;
 
@@ -2400,7 +2400,7 @@ i2c_new_probed_device(struct i2c_adapter *adap,
 			continue;
 		}
 
-		/* Check address availability */
+		/* Check address availability (7 bit, no need to encode flags) */
 		if (i2c_check_addr_busy(adap, addr_list[i])) {
 			dev_dbg(&adap->dev, "Address 0x%02x already in "
 				"use, not probing\n", addr_list[i]);
-- 
2.1.4
