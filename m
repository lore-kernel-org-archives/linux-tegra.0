From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: [RFC 6/9] i2c: make address check indpendent from client struct
Date: Fri, 17 Jul 2015 16:08:26 +0200
Message-ID: <1437142109-31975-7-git-send-email-wsa@the-dreams.de>
References: <1437142109-31975-1-git-send-email-wsa@the-dreams.de>
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437142109-31975-1-git-send-email-wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>

We want to use this function with struct boardinfo soon, so let's just
pass the parameters really needed. We also extend the type of addr, so
more types can be input. Remove a superfluous dangling comment while
here.

Signed-off-by: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
---
 drivers/i2c/i2c-core.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/i2c-core.c b/drivers/i2c/i2c-core.c
index b54a0f092d53f6..b5719a2cff97bf 100644
--- a/drivers/i2c/i2c-core.c
+++ b/drivers/i2c/i2c-core.c
@@ -793,15 +793,15 @@ static unsigned short i2c_encode_flags_to_addr(struct i2c_client *client)
 
 /* This is a permissive address validity check, I2C address map constraints
  * are purposely not enforced, except for the general call address. */
-static int i2c_check_addr_validity(const struct i2c_client *client)
+static int i2c_check_addr_validity(unsigned addr, unsigned short flags)
 {
-	if (client->flags & I2C_CLIENT_TEN) {
+	if (flags & I2C_CLIENT_TEN) {
 		/* 10-bit address, all values are valid */
-		if (client->addr > 0x3ff)
+		if (addr > 0x3ff)
 			return -EINVAL;
 	} else {
 		/* 7-bit address, reject the general call address */
-		if (client->addr == 0x00 || client->addr > 0x7f)
+		if (addr == 0x00 || addr > 0x7f)
 			return -EINVAL;
 	}
 	return 0;
@@ -979,8 +979,7 @@ i2c_new_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
 
 	strlcpy(client->name, info->type, sizeof(client->name));
 
-	/* Check for address validity */
-	status = i2c_check_addr_validity(client);
+	status = i2c_check_addr_validity(client->addr, client->flags);
 	if (status) {
 		dev_err(&adap->dev, "Invalid %d-bit I2C address 0x%02hx\n",
 			client->flags & I2C_CLIENT_TEN ? 10 : 7, client->addr);
-- 
2.1.4
