From: Wolfram Sang <wsa@the-dreams.de>
Subject: [RFC 5/9] i2c: rename address check functions
Date: Fri, 17 Jul 2015 16:08:25 +0200
Message-ID: <1437142109-31975-6-git-send-email-wsa@the-dreams.de>
References: <1437142109-31975-1-git-send-email-wsa@the-dreams.de>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1437142109-31975-1-git-send-email-wsa@the-dreams.de>
Sender: linux-sh-owner@vger.kernel.org
To: linux-i2c@vger.kernel.org
Cc: linux-sh@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms@verge.net.au>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Wolfram Sang <wsa@the-dreams.de>, Andrey Danin <danindrey@mail.ru>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

The current naming is based on the arguments of the functions and not on
what they do. Even I as the maintainer find this confusing, so let's
rename them to something more descriptive.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/i2c-core.c b/drivers/i2c/i2c-core.c
index a807e272e1fc2e..b54a0f092d53f6 100644
--- a/drivers/i2c/i2c-core.c
+++ b/drivers/i2c/i2c-core.c
@@ -793,7 +793,7 @@ static unsigned short i2c_encode_flags_to_addr(struct i2c_client *client)
 
 /* This is a permissive address validity check, I2C address map constraints
  * are purposely not enforced, except for the general call address. */
-static int i2c_check_client_addr_validity(const struct i2c_client *client)
+static int i2c_check_addr_validity(const struct i2c_client *client)
 {
 	if (client->flags & I2C_CLIENT_TEN) {
 		/* 10-bit address, all values are valid */
@@ -811,7 +811,7 @@ static int i2c_check_client_addr_validity(const struct i2c_client *client)
  * device uses a reserved address, then it shouldn't be probed. 7-bit
  * addressing is assumed, 10-bit address devices are rare and should be
  * explicitly enumerated. */
-static int i2c_check_addr_validity(unsigned short addr)
+static int i2c_check_7bit_addr_validity_strict(unsigned short addr)
 {
 	/*
 	 * Reserved addresses per I2C specification:
@@ -980,7 +980,7 @@ i2c_new_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
 	strlcpy(client->name, info->type, sizeof(client->name));
 
 	/* Check for address validity */
-	status = i2c_check_client_addr_validity(client);
+	status = i2c_check_addr_validity(client);
 	if (status) {
 		dev_err(&adap->dev, "Invalid %d-bit I2C address 0x%02hx\n",
 			client->flags & I2C_CLIENT_TEN ? 10 : 7, client->addr);
@@ -2265,7 +2265,7 @@ static int i2c_detect_address(struct i2c_client *temp_client,
 	int err;
 
 	/* Make sure the address is valid */
-	err = i2c_check_addr_validity(addr);
+	err = i2c_check_7bit_addr_validity_strict(addr);
 	if (err) {
 		dev_warn(&adapter->dev, "Invalid probe address 0x%02x\n",
 			 addr);
@@ -2382,7 +2382,7 @@ i2c_new_probed_device(struct i2c_adapter *adap,
 
 	for (i = 0; addr_list[i] != I2C_CLIENT_END; i++) {
 		/* Check address validity */
-		if (i2c_check_addr_validity(addr_list[i]) < 0) {
+		if (i2c_check_7bit_addr_validity_strict(addr_list[i]) < 0) {
 			dev_warn(&adap->dev, "Invalid 7-bit address "
 				 "0x%02x\n", addr_list[i]);
 			continue;
@@ -2957,7 +2957,7 @@ int i2c_slave_register(struct i2c_client *client, i2c_slave_cb_t slave_cb)
 
 	if (!(client->flags & I2C_CLIENT_TEN)) {
 		/* Enforce stricter address checking */
-		ret = i2c_check_addr_validity(client->addr);
+		ret = i2c_check_7bit_addr_validity_strict(client->addr);
 		if (ret) {
 			dev_err(&client->dev, "%s: invalid address\n", __func__);
 			return ret;
-- 
2.1.4

