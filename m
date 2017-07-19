From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 081/102] staging: nvec: explicitly request exclusive reset
 control
Date: Wed, 19 Jul 2017 17:26:25 +0200
Message-ID: <20170719152646.25903-82-p.zabel@pengutronix.de>
References: <20170719152646.25903-1-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170719152646.25903-1-p.zabel@pengutronix.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: linux-kernel@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, Philipp Zabel <p.zabel@pengutronix.de>
List-Id: linux-tegra@vger.kernel.org

Commit a53e35db70d1 ("reset: Ensure drivers are explicit when requesting
reset lines") started to transition the reset control request API calls
to explicitly state whether the driver needs exclusive or shared reset
control behavior. Convert all drivers requesting exclusive resets to the
explicit API call so the temporary transition helpers can be removed.

No functional changes.

Cc: Marc Dietrich <marvin24@gmx.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-tegra@vger.kernel.org
Cc: devel@driverdev.osuosl.org
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/staging/nvec/nvec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index c1feccf8d94af..4ff8f47385dae 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -831,7 +831,7 @@ static int tegra_nvec_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	nvec->rst = devm_reset_control_get(&pdev->dev, "i2c");
+	nvec->rst = devm_reset_control_get_exclusive(&pdev->dev, "i2c");
 	if (IS_ERR(nvec->rst)) {
 		dev_err(nvec->dev, "failed to get controller reset\n");
 		return PTR_ERR(nvec->rst);
-- 
2.11.0
