From: Paul Fertser <fercerpav@gmail.com>
Subject: [PATCH v2 1/2] drivers: staging: nvec: remove bogus reset command for
 PS/2 interface
Date: Thu, 27 Oct 2016 17:22:08 +0300
Message-ID: <1477578154-21199-2-git-send-email-fercerpav@gmail.com>
References: <1477578154-21199-1-git-send-email-fercerpav@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1477578154-21199-1-git-send-email-fercerpav@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: devel@driverdev.osuosl.org
Cc: Paul Fertser <fercerpav@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-tegra@vger.kernel.org, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org

This command was sent behind serio's back and the answer to it was
confusing atkbd probe function which lead to the elantech touchpad
getting detected as a keyboard.

To prevent this from happening just let every party do its part of the
job.

Signed-off-by: Paul Fertser <fercerpav@gmail.com>
---
 drivers/staging/nvec/nvec_ps2.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nvec_ps2.c
index a324322..d63c4ef 100644
--- a/drivers/staging/nvec/nvec_ps2.c
+++ b/drivers/staging/nvec/nvec_ps2.c
@@ -106,7 +106,6 @@ static int nvec_mouse_probe(struct platform_device *pdev)
 {
 	struct nvec_chip *nvec = dev_get_drvdata(pdev->dev.parent);
 	struct serio *ser_dev;
-	char mouse_reset[] = { NVEC_PS2, SEND_COMMAND, PSMOUSE_RST, 3 };
 
 	ser_dev = devm_kzalloc(&pdev->dev, sizeof(struct serio), GFP_KERNEL);
 	if (!ser_dev)
@@ -127,9 +126,6 @@ static int nvec_mouse_probe(struct platform_device *pdev)
 
 	serio_register_port(ser_dev);
 
-	/* mouse reset */
-	nvec_write_async(nvec, mouse_reset, sizeof(mouse_reset));
-
 	return 0;
 }
 
-- 
2.7.0
