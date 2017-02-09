From: "Youngdo, Lee" <oss.ydlee@gmail.com>
Subject: [PATCH] staging: nvec: Fix coding style
Date: Fri, 10 Feb 2017 00:16:12 +0900
Message-ID: <1486653372-7514-1-git-send-email-oss.ydlee@gmail.com>
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
To: Marc Dietrich <marvin24@gmx.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, "Youngdo,
 Lee" <oss.ydlee@gmail.com>, linux-kernel@vger.kernel.org, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org

Removed unnecessary white spaces found via checkpatch.pl:
WARNING: Statements should start on a tabstop

Signed-off-by: Youngdo, Lee <oss.ydlee@gmail.com>
---
 drivers/staging/nvec/nvec_power.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nvec_power.c
index fcbb0fa..688b805 100644
--- a/drivers/staging/nvec/nvec_power.c
+++ b/drivers/staging/nvec/nvec_power.c
@@ -441,8 +441,8 @@ static int nvec_power_remove(struct platform_device *pdev)
 	.probe = nvec_power_probe,
 	.remove = nvec_power_remove,
 	.driver = {
-		   .name = "nvec-power",
-		   }
+		.name = "nvec-power",
+	}
 };
 
 module_platform_driver(nvec_power_driver);
-- 
1.9.1
