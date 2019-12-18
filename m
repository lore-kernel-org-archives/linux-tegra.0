From: Xidong Wang <wangxidong_97@163.com>
Subject: [PATCH 1/1] staging: nvec: check return value
Date: Wed, 18 Dec 2019 13:56:38 +0800
Message-ID: <1576648598-12257-1-git-send-email-wangxidong_97@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Xidong Wang <wangxidong_97@163.com>, Marc Dietrich <marvin24@gmx.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org

In nvec_kbd_probe(), the return value of devm_input_allocate_device()
should be checked before it is used.

Signed-off-by: Xidong Wang <wangxidong_97@163.com>
---
 drivers/staging/nvec/nvec_kbd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/nvec/nvec_kbd.c b/drivers/staging/nvec/nvec_kbd.c
index 01dbb66..386d619 100644
--- a/drivers/staging/nvec/nvec_kbd.c
+++ b/drivers/staging/nvec/nvec_kbd.c
@@ -123,6 +123,8 @@ static int nvec_kbd_probe(struct platform_device *pdev)
 		keycodes[j++] = extcode_tab_us102[i];
 
 	idev = devm_input_allocate_device(&pdev->dev);
+	if (!idev)
+		return -ENOMEM;
 	idev->name = "nvec keyboard";
 	idev->phys = "nvec";
 	idev->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_REP) | BIT_MASK(EV_LED);
-- 
2.7.4
