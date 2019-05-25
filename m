From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
Subject: [PATCH] drivers/pci/controller: fix warning PTR_ERR_OR_ZERO can be
 used
Date: Sat, 25 May 2019 14:27:48 +0530
Message-ID: <20190525085748.GA10926@hari-Inspiron-1545>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: ingoo Han <jingoohan1@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Yue Wang <yue.wang@Amlogic.com>, Kevin Hilman <khilman@baylibre.com>, Xiaowei Song <songxiaowei@hisilicon.com>, Binghui Wang <wangbinghui@hisilicon.com>, Stanimir Varbanov <svarbanov@mm-sol.com>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

fix below warnings reported by coccichek

/drivers/pci/controller/pci-tegra.c:1132:1-3: WARNING: PTR_ERR_OR_ZERO
can be used
./drivers/pci/controller/dwc/pcie-qcom.c:703:1-3: WARNING:
PTR_ERR_OR_ZERO can be used
./drivers/pci/controller/dwc/pci-meson.c:185:1-3: WARNING:
PTR_ERR_OR_ZERO can be used
./drivers/pci/controller/dwc/pci-meson.c:262:1-3: WARNING:
PTR_ERR_OR_ZERO can be used
./drivers/pci/controller/dwc/pcie-kirin.c:141:1-3: WARNING:
PTR_ERR_OR_ZERO can be used
./drivers/pci/controller/dwc/pcie-kirin.c:177:1-3: WARNING:
PTR_ERR_OR_ZERO can be used
./drivers/pci/controller/dwc/pci-exynos.c:95:1-3: WARNING:
PTR_ERR_OR_ZERO can be used

Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
---
 drivers/pci/controller/dwc/pci-exynos.c | 4 +---
 drivers/pci/controller/dwc/pci-meson.c  | 8 ++------
 drivers/pci/controller/dwc/pcie-kirin.c | 8 ++------
 drivers/pci/controller/dwc/pcie-qcom.c  | 4 +---
 drivers/pci/controller/pci-tegra.c      | 4 +---
 5 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index cee5f2f..b0b4849 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -92,10 +92,8 @@ static int exynos5440_pcie_get_mem_resources(struct platform_device *pdev,
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	ep->mem_res->elbi_base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(ep->mem_res->elbi_base))
-		return PTR_ERR(ep->mem_res->elbi_base);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(ep->mem_res->elbi_base);
 }
 
 static int exynos5440_pcie_get_clk_resources(struct exynos_pcie *ep)
diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index e35e9ea..1ca78c2 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -182,10 +182,8 @@ static int meson_pcie_get_mems(struct platform_device *pdev,
 
 	/* Meson SoC has two PCI controllers use same phy register*/
 	mp->mem_res.phy_base = meson_pcie_get_mem_shared(pdev, mp, "phy");
-	if (IS_ERR(mp->mem_res.phy_base))
-		return PTR_ERR(mp->mem_res.phy_base);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(mp->mem_res.phy_base);
 }
 
 static void meson_pcie_power_on(struct meson_pcie *mp)
@@ -259,10 +257,8 @@ static int meson_pcie_probe_clocks(struct meson_pcie *mp)
 		return PTR_ERR(res->general_clk);
 
 	res->clk = meson_pcie_probe_clock(dev, "pcie", 0);
-	if (IS_ERR(res->clk))
-		return PTR_ERR(res->clk);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(res->clk);
 }
 
 static inline void meson_elb_writel(struct meson_pcie *mp, u32 val, u32 reg)
diff --git a/drivers/pci/controller/dwc/pcie-kirin.c b/drivers/pci/controller/dwc/pcie-kirin.c
index 9b59929..87cfdb4 100644
--- a/drivers/pci/controller/dwc/pcie-kirin.c
+++ b/drivers/pci/controller/dwc/pcie-kirin.c
@@ -138,10 +138,8 @@ static long kirin_pcie_get_clk(struct kirin_pcie *kirin_pcie,
 		return PTR_ERR(kirin_pcie->apb_sys_clk);
 
 	kirin_pcie->pcie_aclk = devm_clk_get(dev, "pcie_aclk");
-	if (IS_ERR(kirin_pcie->pcie_aclk))
-		return PTR_ERR(kirin_pcie->pcie_aclk);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(kirin_pcie->pcie_aclk);
 }
 
 static long kirin_pcie_get_resource(struct kirin_pcie *kirin_pcie,
@@ -174,10 +172,8 @@ static long kirin_pcie_get_resource(struct kirin_pcie *kirin_pcie,
 
 	kirin_pcie->sysctrl =
 		syscon_regmap_lookup_by_compatible("hisilicon,hi3660-sctrl");
-	if (IS_ERR(kirin_pcie->sysctrl))
-		return PTR_ERR(kirin_pcie->sysctrl);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(kirin_pcie->sysctrl);
 }
 
 static int kirin_pcie_phy_init(struct kirin_pcie *kirin_pcie)
diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 0ed235d..6c421e6 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -700,10 +700,8 @@ static int qcom_pcie_get_resources_2_4_0(struct qcom_pcie *pcie)
 		return PTR_ERR(res->ahb_reset);
 
 	res->phy_ahb_reset = devm_reset_control_get_exclusive(dev, "phy_ahb");
-	if (IS_ERR(res->phy_ahb_reset))
-		return PTR_ERR(res->phy_ahb_reset);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(res->phy_ahb_reset);
 }
 
 static void qcom_pcie_deinit_2_4_0(struct qcom_pcie *pcie)
diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 464ba25..3cd5069 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -1129,10 +1129,8 @@ static int tegra_pcie_resets_get(struct tegra_pcie *pcie)
 		return PTR_ERR(pcie->afi_rst);
 
 	pcie->pcie_xrst = devm_reset_control_get_exclusive(dev, "pcie_x");
-	if (IS_ERR(pcie->pcie_xrst))
-		return PTR_ERR(pcie->pcie_xrst);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(pcie->pcie_xrst);
 }
 
 static int tegra_pcie_phys_get_legacy(struct tegra_pcie *pcie)
-- 
2.7.4
