From: Pawel Lebioda <pawel.lebioda89@gmail.com>
Subject: [PATCH] staging: nvec: insert blank lines after declarations
Date: Thu, 3 Jul 2014 21:15:57 +0200
Message-ID: <20140703191554.GA12029@ThinkPad>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devel@driverdev.osuosl.org, Julian Andres Klode <jak@jak-linux.org>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org

Hi,

This patch fixes coding style warnings reported by checkpatch.pl:
"Missing a blank line after declarations".

Regards
Pawel Lebioda

Signed-off-by: Pawel Lebioda <pawel.lebioda89@gmail.com>
 drivers/staging/nvec/nvec_paz00.c | 1 +
 drivers/staging/nvec/nvec_power.c | 1 +
 drivers/staging/nvec/nvec_ps2.c   | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/drivers/staging/nvec/nvec_paz00.c b/drivers/staging/nvec/nvec_paz00.c
index 934b796..e2e675a 100644
--- a/drivers/staging/nvec/nvec_paz00.c
+++ b/drivers/staging/nvec/nvec_paz00.c
@@ -35,6 +35,7 @@ static void nvec_led_brightness_set(struct led_classdev *led_cdev,
 {
 	struct nvec_led *led = to_nvec_led(led_cdev);
 	unsigned char buf[] = NVEC_LED_REQ;
+
 	buf[4] = value;
 
 	nvec_write_async(led->nvec, buf, sizeof(buf));
diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nvec_power.c
index aacfcd6..6446e15 100644
--- a/drivers/staging/nvec/nvec_power.c
+++ b/drivers/staging/nvec/nvec_power.c
@@ -226,6 +226,7 @@ static int nvec_power_get_property(struct power_supply *psy,
 				   union power_supply_propval *val)
 {
 	struct nvec_power *power = dev_get_drvdata(psy->dev->parent);
+
 	switch (psp) {
 	case POWER_SUPPLY_PROP_ONLINE:
 		val->intval = power->on;
diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nvec_ps2.c
index 45b2f13..f56f1db 100644
--- a/drivers/staging/nvec/nvec_ps2.c
+++ b/drivers/staging/nvec/nvec_ps2.c
@@ -53,12 +53,14 @@ static struct nvec_ps2 ps2_dev;
 static int ps2_startstreaming(struct serio *ser_dev)
 {
 	unsigned char buf[] = { NVEC_PS2, AUTO_RECEIVE_N, PACKET_SIZE };
+
 	return nvec_write_async(ps2_dev.nvec, buf, sizeof(buf));
 }
 
 static void ps2_stopstreaming(struct serio *ser_dev)
 {
 	unsigned char buf[] = { NVEC_PS2, CANCEL_AUTO_RECEIVE };
+
 	nvec_write_async(ps2_dev.nvec, buf, sizeof(buf));
 }
