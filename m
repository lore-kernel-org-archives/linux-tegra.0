From: Wolfram Sang <wsa@the-dreams.de>
Subject: [RFC 4/9] i2c: apply address offset for slaves, too
Date: Fri, 17 Jul 2015 16:08:24 +0200
Message-ID: <1437142109-31975-5-git-send-email-wsa@the-dreams.de>
References: <1437142109-31975-1-git-send-email-wsa@the-dreams.de>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1437142109-31975-1-git-send-email-wsa@the-dreams.de>
Sender: linux-sh-owner@vger.kernel.org
To: linux-i2c@vger.kernel.org
Cc: linux-sh@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms@verge.net.au>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Wolfram Sang <wsa@the-dreams.de>, Andrey Danin <danindrey@mail.ru>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

We want a separate address range for being an I2C slave. Add an offset
of 0x1000, so it can be combined with ten bit addresses as well. Add a
separate function to create the address value, we will need it later in
other places.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core.c b/drivers/i2c/i2c-core.c
index e6d4935161e490..a807e272e1fc2e 100644
--- a/drivers/i2c/i2c-core.c
+++ b/drivers/i2c/i2c-core.c
@@ -776,6 +776,21 @@ struct i2c_client *i2c_verify_client(struct device *dev)
 EXPORT_SYMBOL(i2c_verify_client);
 
 
+/* Return a unique address which takes the flags of the client into account */
+static unsigned short i2c_encode_flags_to_addr(struct i2c_client *client)
+{
+	unsigned short addr = client->addr;
+
+	/* For some client flags, add an arbitrary offset to avoid collisions */
+	if (client->flags & I2C_CLIENT_TEN)
+		addr |= 0xa000;
+
+	if (client->flags & I2C_CLIENT_SLAVE)
+		addr |= 0x1000;
+
+	return addr;
+}
+
 /* This is a permissive address validity check, I2C address map constraints
  * are purposely not enforced, except for the general call address. */
 static int i2c_check_client_addr_validity(const struct i2c_client *client)
@@ -921,10 +936,8 @@ static void i2c_dev_set_name(struct i2c_adapter *adap,
 		return;
 	}
 
-	/* For 10-bit clients, add an arbitrary offset to avoid collisions */
 	dev_set_name(&client->dev, "%d-%04x", i2c_adapter_id(adap),
-		     client->addr | ((client->flags & I2C_CLIENT_TEN)
-				     ? 0xa000 : 0));
+		     i2c_encode_flags_to_addr(client));
 }
 
 /**
-- 
2.1.4

