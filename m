From: Amir Mahdi Ghorbanian <indigoomega021@gmail.com>
Subject: [PATCH 1/2] Staging: comedi: cb_pcidas: fixed a spelling mistake coding style issue
Date: Sun, 16 Dec 2018 08:57:25 -0800
Message-ID: <1544979445-10079-1-git-send-email-indigoomega021@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: marvin24@gmx.de
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, ac100@lists.launchpad.net, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Fixed a coding style issue.

Signed-off-by: Amir Mahdi Ghorbanian <indigoomega021@gmail.com>
---
 drivers/staging/comedi/drivers/cb_pcidas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/comedi/drivers/cb_pcidas.c b/drivers/staging/comedi/drivers/cb_pcidas.c
index 8429d57..02ae00c 100644
--- a/drivers/staging/comedi/drivers/cb_pcidas.c
+++ b/drivers/staging/comedi/drivers/cb_pcidas.c
@@ -116,7 +116,7 @@
 #define PCIDAS_TRIG_SEL_ANALOG	PCIDAS_TRIG_SEL(3) /* ext. analog trigger */
 #define PCIDAS_TRIG_SEL_MASK	PCIDAS_TRIG_SEL(3) /* start trigger mask */
 #define PCIDAS_TRIG_POL		BIT(2)	/* invert trigger (1602 only) */
-#define PCIDAS_TRIG_MODE	BIT(3)	/* edge/level trigerred (1602 only) */
+#define PCIDAS_TRIG_MODE	BIT(3)	/* edge/level triggered (1602 only) */
 #define PCIDAS_TRIG_EN		BIT(4)	/* enable external start trigger */
 #define PCIDAS_TRIG_BURSTE	BIT(5)	/* burst mode enable */
 #define PCIDAS_TRIG_CLR		BIT(7)	/* clear external trigger */
-- 
2.7.4
