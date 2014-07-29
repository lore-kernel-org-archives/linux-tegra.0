From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/2] staging/nvec: Do not pass resource to mfd_add_devices()
Date: Tue, 29 Jul 2014 13:16:14 +0200
Message-ID: <1406632575-26075-1-git-send-email-thierry.reding@gmail.com>
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
To: Julian Andres Klode <jak@jak-linux.org>, Marc Dietrich <marvin24@gmx.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The mfd_add_devices() function takes a struct resource * as fifth
argument, but the nvec driver passes in a void __iomem *. The driver
gets away with it because none of the subdevices ever directly access
the registers.

Since subdevices never need to access the registers we can simply pass
NULL instead.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/staging/nvec/nvec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 0a5c84ad3f41..815065837ce7 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -893,7 +893,7 @@ static int tegra_nvec_probe(struct platform_device *pdev)
 	}
 
 	ret = mfd_add_devices(nvec->dev, -1, nvec_devices,
-			      ARRAY_SIZE(nvec_devices), base, 0, NULL);
+			      ARRAY_SIZE(nvec_devices), NULL, 0, NULL);
 	if (ret)
 		dev_err(nvec->dev, "error adding subdevices\n");
 
-- 
2.0.2
