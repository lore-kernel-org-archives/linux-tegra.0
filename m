From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] staging/nvec: Remove double const qualifier
Date: Mon, 21 Jul 2014 13:54:41 +0200
Message-ID: <1405943681-2932-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Marc Dietrich <marvin24@gmx.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The SIMPLE_DEV_PM_OPS macro already uses the const qualifier, so there's
no need to repeat it.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/staging/nvec/nvec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 11f9e1c3447c..aef52306620a 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -959,7 +959,7 @@ static int nvec_resume(struct device *dev)
 }
 #endif
 
-static const SIMPLE_DEV_PM_OPS(nvec_pm_ops, nvec_suspend, nvec_resume);
+static SIMPLE_DEV_PM_OPS(nvec_pm_ops, nvec_suspend, nvec_resume);
 
 /* Match table for of_platform binding */
 static const struct of_device_id nvidia_nvec_of_match[] = {
-- 
2.0.1
