From: hariprasad@osuosl.org, Kelam@osuosl.org,
	hariprasad.kelam@gmail.com
Subject: [PATCH] staging: nvec: make use of devm_platform_ioremap_resource
Date: Sun,  8 Sep 2019 15:11:01 +0530
Message-ID: <1567935662-8006-1-git-send-email-hariprasad.kelam@gmail.com>
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
Cc: devel@driverdev.osuosl.org, Hariprasad Kelam <hariprasad.kelam@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org

From: Hariprasad Kelam <hariprasad.kelam@gmail.com>

fix below issue reported by coccicheck
drivers/staging//nvec/nvec.c:794:1-5: WARNING: Use
devm_platform_ioremap_resource for base

Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
---
 drivers/staging/nvec/nvec.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 1cbd7b7..360ec04 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -767,7 +767,6 @@ static int tegra_nvec_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct nvec_chip *nvec;
 	struct nvec_msg *msg;
-	struct resource *res;
 	void __iomem *base;
 	char	get_firmware_version[] = { NVEC_CNTL, GET_FIRMWARE_VERSION },
 		unmute_speakers[] = { NVEC_OEM0, 0x10, 0x59, 0x95 },
@@ -790,8 +789,7 @@ static int tegra_nvec_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-- 
2.7.4
