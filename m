Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C8727F756
	for <linux-tegra@vger.kernel.org>; Mon, 15 Dec 2025 14:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765808200; cv=none; b=O6nK2qjcsVm1n8VEpPWg68fhY1Qn2kXHqbHJIRofqB0qh01j+xBgb+LWJLP+N+6tfmNu7jywmMcP355+W9vwAyW1PP5SS6XfXHAJG21KXCWuY4ld5NY9YSv+cOL9NKWfTVcI33JgUQCaRzUktqZ4420mINEPNdoBhAq5F0BUoaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765808200; c=relaxed/simple;
	bh=1uO+nnPPREJUUKC5hSVSc3rX/qZpkYokG3Lk3g5cw94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FAvGW4AdEjY2CIAnA3apx8yklMM44m3wMruDwFccehYcKTwy6FoJxwxTYh96VZ1eqzXOwg0kFD1JDN68cQR9/WzTg/lkS//1pO58CgbxskkurpVKYj1+jmzXPzEAKsh5OqUWC/bMjKDer9y5YUb33ukxHOAtEOMxrLkc27V5YDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULXP/dfd; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULXP/dfd"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7f651586be1so1512758b3a.1
        for <linux-tegra@vger.kernel.org>; Mon, 15 Dec 2025 06:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765808192; x=1766412992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w99/Ohc75L+EGVS5NYxFAkGyXELEg4yQM9LLGIxTGg4=;
        b=ULXP/dfdKGaUeJnz7S9zwTbKvXp4IyAayKRI4ue20eWmY58YplhF9eVBLTifLvZBYc
         aZ+riOc5O4DajT9IQWvxL3Yd13EOVTiqrk9FM+0QP20S4IypzbCz4q59lSsXFTVzY2wz
         cPO5ZvmTOVfokBFCeX8Qf+tOjyxBzFS/nau3pmTGfHuKq36fahPjES1+FirVXu8Zd0R1
         DFDCGQPPXXaOkTF3LiOfHR1twQCNXpp+iaF1B26KnXPP1laC62iYqHu4Eeuz5dU8z49B
         UaaWx+tHrcAhSldPNF2sn7eXOjivk/BZ83ovlcn5jF17pwlRlgkd02H3cWila1asU/C6
         EtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765808192; x=1766412992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w99/Ohc75L+EGVS5NYxFAkGyXELEg4yQM9LLGIxTGg4=;
        b=GyWqqACb3sMataNayiGRrIMPmBLJ+l7ZA6YIaf+g56+mfmd+7a72556OgXc4yIUSX/
         Hxbef+p+tQIeihXpqyI1kgdopigWFtKh+/xg9++lZQrhzSHf0hLjXQx8cxg5tRqoidO+
         UHccm6Rw0ZfR1Hnp7o5DeaCQ+LEwuPJAo5th5ELSYfqSnu36UAFhKR83ikn5FeXtPrlV
         21TROFeRu7TvCK8uoQxdYdWjWBI4opfdS35oBXMoNevihzmqEPbIFSevmeLHhZ3xZVyx
         pSEv48lvIodjutHCGX7X6eHzaUTGW6cOKebferM6tKCtVNhltF30WVDXS57CTWpFpmr8
         eNig==
X-Forwarded-Encrypted: i=1; AJvYcCVTfpRWAOqJDfBZRPB5fpz53Ip742GFSD5akPakwHEcDXTBCF55nX6+nDJh6Xsr9dwA2QGNqjil/XAsYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxN+lG82hYC9NRYqvU2UYtyjHZJXPf6yWmO0elnAil/Y90Rxq/z
	aBm1WMLm4XRruTCCk1XlCqh56aHSwjzBFo+LmJOte+vjgtLyaEj+kR07
X-Gm-Gg: AY/fxX6yNj5qPLlxg98hFwbBs/tqQQ0Jg5YueT4p2DhZlyTfBqvydN+rJR+lFp4wNlL
	v8N2Qw8BkEbw4IcCAhwAP2NAyHvh0LGrbfDkxyjZ+96IsvaXw4d9McplUl0r4p/Rl++BEPhRukt
	PNGSg7wHq3e1RMzdvxjOCLtV0XO+K02oOsTtfyvCmu2o7mTDhLoNN8AM63d7GiC96dl/8E4J2ry
	IdCCCklWfK9JEqnGIVjhDX+9aF393M003ihLYD/v1gWbrz6y1xTAu6cGvzfGQv+LG1nXR1sysvH
	uybaUEYdZpxexkHchUAFlohjHXI1MY795gXb1PWbRRGVi97z0ayidokzaqwiSuVMWqMqhwozUyi
	gKYUEW2bHZAYGuj+Er15ppl5Dw0vGwNqV495zR9YFhFJqP+Dj+Dbw0TRoCo5p5ekFV6m0WwIGo0
	ipjl9IVA==
X-Google-Smtp-Source: AGHT+IH2XvOmM84iP5PH1cN7pYZyjS4/ODnJrdgRe0bLLbrttJg8LUdesyLYddzvgycPF2CyeJbpzQ==
X-Received: by 2002:a05:6a00:4407:b0:7e8:3fcb:bc48 with SMTP id d2e1a72fcca58-7f66988e456mr9356639b3a.29.1765808191831;
        Mon, 15 Dec 2025 06:16:31 -0800 (PST)
Received: from rockpi-5b ([45.112.0.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c2772a51sm12938189b3a.17.2025.12.15.06.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 06:16:31 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-pci@vger.kernel.org (open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v2 2/4] PCI: tegra: Simplify clock handling by using clk_bulk*() functions
Date: Mon, 15 Dec 2025 19:45:35 +0530
Message-ID: <20251215141603.6749-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251215141603.6749-1-linux.amoon@gmail.com>
References: <20251215141603.6749-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the driver acquires clocks and prepare/enable/disable/unprepare
the clocks individually thereby making the driver complex to read.

The driver can be simplified by using the clk_bulk*() APIs.

Use:
  - devm_clk_bulk_get_all() API to acquire all the clocks
  - clk_bulk_prepare_enable() to prepare/enable clocks
  - clk_bulk_disable_unprepare() APIs to disable/unprepare them in bulk

As part of this cleanup:
  - Remove the legacy has_cml_clk flag
  - Drop explicit handling of individual clocks (pex, afi, pll_e, cml)
  - Rely on device tree ordering for clock sequencing, eliminating
    hardcoded logic and improving readability and maintainability

This improves clarity, and makes future changes easier for maintainers.

Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v2: Switch back to devm_clk_bulk_get_all from devm_clk_bulk_get()

Mani - But you are converting it to .yaml, so you can safely
use devm_clk_bulk_get_all()

v1: Switch from devm_clk_bulk_get_all() -> devm_clk_bulk_get() with
	fix clks array.

nvidia,tegra20-pcie and nvidia,tegra186-pcie uses three clocks
        pex, afi, pll_e
where as nvidia,tegra30-pcie, nvidia,tegra124-pcie, nvidia,tegra210-pcie
uses four clks
        pex, afi, pll_e, cml
---
 drivers/pci/controller/pci-tegra.c | 71 +++++-------------------------
 1 file changed, 12 insertions(+), 59 deletions(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 942ddfca3bf6..275d9295789a 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -298,7 +298,6 @@ struct tegra_pcie_soc {
 	bool has_pex_clkreq_en;
 	bool has_pex_bias_ctrl;
 	bool has_intr_prsnt_sense;
-	bool has_cml_clk;
 	bool has_gen2;
 	bool force_pca_enable;
 	bool program_uphy;
@@ -331,10 +330,8 @@ struct tegra_pcie {
 
 	struct resource cs;
 
-	struct clk *pex_clk;
-	struct clk *afi_clk;
-	struct clk *pll_e;
-	struct clk *cml_clk;
+	struct clk_bulk_data *clks;
+	int    num_clks;
 
 	struct reset_control *pex_rst;
 	struct reset_control *afi_rst;
@@ -1154,15 +1151,11 @@ static void tegra_pcie_enable_controller(struct tegra_pcie *pcie)
 static void tegra_pcie_power_off(struct tegra_pcie *pcie)
 {
 	struct device *dev = pcie->dev;
-	const struct tegra_pcie_soc *soc = pcie->soc;
 	int err;
 
 	reset_control_assert(pcie->afi_rst);
 
-	clk_disable_unprepare(pcie->pll_e);
-	if (soc->has_cml_clk)
-		clk_disable_unprepare(pcie->cml_clk);
-	clk_disable_unprepare(pcie->afi_clk);
+	clk_bulk_disable_unprepare(pcie->num_clks, pcie->clks);
 
 	if (!dev->pm_domain)
 		tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
@@ -1175,7 +1168,6 @@ static void tegra_pcie_power_off(struct tegra_pcie *pcie)
 static int tegra_pcie_power_on(struct tegra_pcie *pcie)
 {
 	struct device *dev = pcie->dev;
-	const struct tegra_pcie_soc *soc = pcie->soc;
 	int err;
 
 	reset_control_assert(pcie->pcie_xrst);
@@ -1203,35 +1195,16 @@ static int tegra_pcie_power_on(struct tegra_pcie *pcie)
 		}
 	}
 
-	err = clk_prepare_enable(pcie->afi_clk);
+	err = clk_bulk_prepare_enable(pcie->num_clks, pcie->clks);
 	if (err < 0) {
-		dev_err(dev, "failed to enable AFI clock: %d\n", err);
+		dev_err(dev, "filed to enable clocks: %d\n", err);
 		goto powergate;
 	}
 
-	if (soc->has_cml_clk) {
-		err = clk_prepare_enable(pcie->cml_clk);
-		if (err < 0) {
-			dev_err(dev, "failed to enable CML clock: %d\n", err);
-			goto disable_afi_clk;
-		}
-	}
-
-	err = clk_prepare_enable(pcie->pll_e);
-	if (err < 0) {
-		dev_err(dev, "failed to enable PLLE clock: %d\n", err);
-		goto disable_cml_clk;
-	}
-
 	reset_control_deassert(pcie->afi_rst);
 
 	return 0;
 
-disable_cml_clk:
-	if (soc->has_cml_clk)
-		clk_disable_unprepare(pcie->cml_clk);
-disable_afi_clk:
-	clk_disable_unprepare(pcie->afi_clk);
 powergate:
 	if (!dev->pm_domain)
 		tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
@@ -1255,25 +1228,11 @@ static void tegra_pcie_apply_pad_settings(struct tegra_pcie *pcie)
 static int tegra_pcie_clocks_get(struct tegra_pcie *pcie)
 {
 	struct device *dev = pcie->dev;
-	const struct tegra_pcie_soc *soc = pcie->soc;
-
-	pcie->pex_clk = devm_clk_get(dev, "pex");
-	if (IS_ERR(pcie->pex_clk))
-		return PTR_ERR(pcie->pex_clk);
 
-	pcie->afi_clk = devm_clk_get(dev, "afi");
-	if (IS_ERR(pcie->afi_clk))
-		return PTR_ERR(pcie->afi_clk);
-
-	pcie->pll_e = devm_clk_get(dev, "pll_e");
-	if (IS_ERR(pcie->pll_e))
-		return PTR_ERR(pcie->pll_e);
-
-	if (soc->has_cml_clk) {
-		pcie->cml_clk = devm_clk_get(dev, "cml");
-		if (IS_ERR(pcie->cml_clk))
-			return PTR_ERR(pcie->cml_clk);
-	}
+	pcie->num_clks = devm_clk_bulk_get_all(dev, &pcie->clks);
+	if (pcie->num_clks < 0)
+		return dev_err_probe(dev, pcie->num_clks,
+				     "failed to get clocks\n");
 
 	return 0;
 }
@@ -2344,7 +2303,6 @@ static const struct tegra_pcie_soc tegra20_pcie = {
 	.has_pex_clkreq_en = false,
 	.has_pex_bias_ctrl = false,
 	.has_intr_prsnt_sense = false,
-	.has_cml_clk = false,
 	.has_gen2 = false,
 	.force_pca_enable = false,
 	.program_uphy = true,
@@ -2373,7 +2331,6 @@ static const struct tegra_pcie_soc tegra30_pcie = {
 	.has_pex_clkreq_en = true,
 	.has_pex_bias_ctrl = true,
 	.has_intr_prsnt_sense = true,
-	.has_cml_clk = true,
 	.has_gen2 = false,
 	.force_pca_enable = false,
 	.program_uphy = true,
@@ -2394,7 +2351,6 @@ static const struct tegra_pcie_soc tegra124_pcie = {
 	.has_pex_clkreq_en = true,
 	.has_pex_bias_ctrl = true,
 	.has_intr_prsnt_sense = true,
-	.has_cml_clk = true,
 	.has_gen2 = true,
 	.force_pca_enable = false,
 	.program_uphy = true,
@@ -2417,7 +2373,6 @@ static const struct tegra_pcie_soc tegra210_pcie = {
 	.has_pex_clkreq_en = true,
 	.has_pex_bias_ctrl = true,
 	.has_intr_prsnt_sense = true,
-	.has_cml_clk = true,
 	.has_gen2 = true,
 	.force_pca_enable = true,
 	.program_uphy = true,
@@ -2458,7 +2413,6 @@ static const struct tegra_pcie_soc tegra186_pcie = {
 	.has_pex_clkreq_en = true,
 	.has_pex_bias_ctrl = true,
 	.has_intr_prsnt_sense = true,
-	.has_cml_clk = false,
 	.has_gen2 = true,
 	.force_pca_enable = false,
 	.program_uphy = false,
@@ -2671,7 +2625,7 @@ static int tegra_pcie_pm_suspend(struct device *dev)
 	}
 
 	reset_control_assert(pcie->pex_rst);
-	clk_disable_unprepare(pcie->pex_clk);
+	clk_bulk_disable_unprepare(pcie->num_clks, pcie->clks);
 
 	if (IS_ENABLED(CONFIG_PCI_MSI))
 		tegra_pcie_disable_msi(pcie);
@@ -2705,9 +2659,9 @@ static int tegra_pcie_pm_resume(struct device *dev)
 	if (IS_ENABLED(CONFIG_PCI_MSI))
 		tegra_pcie_enable_msi(pcie);
 
-	err = clk_prepare_enable(pcie->pex_clk);
+	err = clk_bulk_prepare_enable(pcie->num_clks, pcie->clks);
 	if (err) {
-		dev_err(dev, "failed to enable PEX clock: %d\n", err);
+		dev_err(dev, "failed to enable clock: %d\n", err);
 		goto pex_dpd_enable;
 	}
 
@@ -2728,7 +2682,6 @@ static int tegra_pcie_pm_resume(struct device *dev)
 
 disable_pex_clk:
 	reset_control_assert(pcie->pex_rst);
-	clk_disable_unprepare(pcie->pex_clk);
 pex_dpd_enable:
 	pinctrl_pm_select_idle_state(dev);
 poweroff:
-- 
2.50.1

