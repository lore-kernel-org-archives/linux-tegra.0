From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: [RFC 3/9] i2c: add a flag to mark clients as slaves
Date: Fri, 17 Jul 2015 16:08:23 +0200
Message-ID: <1437142109-31975-4-git-send-email-wsa@the-dreams.de>
References: <1437142109-31975-1-git-send-email-wsa@the-dreams.de>
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437142109-31975-1-git-send-email-wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>

And update indentation with one more tab, sigh...

Signed-off-by: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
---
 include/linux/i2c.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index e83a738a3b8741..51ed2e40932f3d 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -550,11 +550,12 @@ void i2c_lock_adapter(struct i2c_adapter *);
 void i2c_unlock_adapter(struct i2c_adapter *);
 
 /*flags for the client struct: */
-#define I2C_CLIENT_PEC	0x04		/* Use Packet Error Checking */
-#define I2C_CLIENT_TEN	0x10		/* we have a ten bit chip address */
+#define I2C_CLIENT_PEC		0x04	/* Use Packet Error Checking */
+#define I2C_CLIENT_TEN		0x10	/* we have a ten bit chip address */
 					/* Must equal I2C_M_TEN below */
-#define I2C_CLIENT_WAKE	0x80		/* for board_info; true iff can wake */
-#define I2C_CLIENT_SCCB	0x9000		/* Use Omnivision SCCB protocol */
+#define I2C_CLIENT_SLAVE	0x20	/* we are the slave */
+#define I2C_CLIENT_WAKE		0x80	/* for board_info; true iff can wake */
+#define I2C_CLIENT_SCCB		0x9000	/* Use Omnivision SCCB protocol */
 					/* Must match I2C_M_STOP|IGNORE_NAK */
 
 /* i2c adapter classes (bitmask) */
-- 
2.1.4
