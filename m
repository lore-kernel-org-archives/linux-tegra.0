Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7202900A8
	for <linux-tegra@vger.kernel.org>; Fri, 26 Sep 2025 07:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758871791; cv=none; b=lAIDHNhhcUXFUmDxwV4cwhqsuFvnOebloTeMg+N6iv1eI4RCCAmoziiLRdLJWgpJHaqWYcc94hJVebPOswCu5pAorXz1H9xzmj7EtBjx8QwuyF3rQ9+/hhb6T8gDOQLZsK21EE++++8Z4TwZT+/pioIYB6SybJZsQ+Zm1C3ooAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758871791; c=relaxed/simple;
	bh=SUfSFcTNcyD9vkRuMVq2tPz63h1C/PplyW9x3dJXNuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W6buNRmpdgkCwUU5rCZA728OFqQGQaG/R4f6IWkdL6DX4UgADHoAqTReG4inW8UQF6VJAYdErG75SZn6bBlPDXJf/ueWajd8zYDkT/FSi5OZgFvvC9OUuJRvyxn6j7dbRqzc6A0mEV0smy6ipgbuKsBvHuxj7JrXRzDZbY40pYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CdDZ7JAO; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdDZ7JAO"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-271067d66fbso20123195ad.3
        for <linux-tegra@vger.kernel.org>; Fri, 26 Sep 2025 00:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758871788; x=1759476588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICTYkCYYFPtxNJLJS+JZOXCHBjXbU5bh94R9hnAgEF8=;
        b=CdDZ7JAOj1fEXA/MMcyu9zoSeYxiwzWRNx8sukDcoEaPxN9nLpX3jOWCI/eeH+gfnU
         ySKVmHNznDwzeeQGJ037GV//95UZZAJgwoscY9AqZKUlRWdSThi8KCyZKE464fwEIiEA
         Rg+3CuF7qeduXISdTXERy9QspGu7vMlX+jP5Kg06k9oyKD5sX6jMXz1rMAtemMOqQq3k
         yrUUa1pGVs0/sDdWseOBwzN5/abeoAxMpqRZnVNJITYfESWS2ktI8Jy5jG7Fb4RSuEw1
         OLBwYqMDQ+HSqDZxur69wjBjPoSFFu+WWGV8fiJxEiijlRBpK43MrX6ct6CZdPrY+5kI
         PS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758871788; x=1759476588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICTYkCYYFPtxNJLJS+JZOXCHBjXbU5bh94R9hnAgEF8=;
        b=usEQRY6UuGIpmPTXLB/sewgpZhrryODuBlQ70yNuV1gUi0qGOD40rftFAuP4SYmDFp
         Jyi4zezRSLcMz2A6kRVL55XYe6f85YKX5MVHAgnmhX7R+TtgVXcto/Bb3W5/AeMy1dHj
         4fubLNLbbirRpWbliSXsWbBHRu9G+PvkCV5tCumLpCsLGhA7CxV+NFa1PguQZamAOXZW
         jwqdhms1yFcTDdnzEES1ljR5DLXpcat8V39BLT0nNAWQ7Z3qVj0evd7PRTnjht5fbarJ
         dbjvfsGxY6QS0TnzVlNtsRis9Rpow/zwC5j9tnbVskkqSA6NpH05Mz2yhfnGK3u0tll+
         pO7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUMwm8cQxrNR57MUhDqAln7xArsPSOE8WjOGmXOHyyCzBrUl+QBppvAAXPV55m15TmBw+mi3/h6TsZ12Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6u3wDG0C/NCEFhVLEwxkxeVGhDkS1UD/Ie7mc5g9UkPIvBqtP
	1+Ty7UtJ3bDmqIBqrAeVL32JywsGHvmkS85dHVorl2TQI2nisMCrIQF8
X-Gm-Gg: ASbGncs2B3bAeiDdnDMpCEbgHiHR75iehbrOMZR27AOiG6pfC7PiTnZ9sZIeq9l3vNr
	ZxcOzJg5iyU/m0n2sUNwVO8vwfGa5y7jvy8FGjUix3g2auBiQMJdHQ+pUD6U8UeS52r9ts5f3i8
	qS9/L3QsEzs/NSEgYF+1oTA7Y1aD1zSUZnB7yhg3sH6NtLGR7PTS9jHgOGg/8vumVUuAjHeM2zp
	JJu8V7S1dIcePGbEIM15yipDadF2rqdX6bTWfaatTe9SdD76nHB/czx17fh+wMvWSh3yQOOZp7y
	LWMVg/Givlx3+poucqa/SEvImgQCy4Et/qVNdb4LbLZjdL3I1C0aKDe5y6FGB76DSljDzAH8nxT
	sR/nbKdNrBuRCMJ4Ofh0M
X-Google-Smtp-Source: AGHT+IGmxYCF/iLE5zlwvwUUkMlnuGHmZUmpo11OazeID/Ner5aJ4a5oohcwVe9vQs2T8Dcb1SM8wQ==
X-Received: by 2002:a17:902:f541:b0:272:2bf1:6a21 with SMTP id d9443c01a7336-27ed49fbd24mr74996495ad.14.1758871788128;
        Fri, 26 Sep 2025 00:29:48 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69a98b9sm44083065ad.111.2025.09.26.00.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 00:29:47 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 2/5] PCI: tegra: Simplify clock handling by using clk_bulk*() functions
Date: Fri, 26 Sep 2025 12:57:43 +0530
Message-ID: <20250926072905.126737-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250926072905.126737-1-linux.amoon@gmail.com>
References: <20250926072905.126737-1-linux.amoon@gmail.com>
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
  - devm_clk_bulk_get() API to acquire all the clocks
  - clk_bulk_prepare_enable() to prepare/enable clocks
  - clk_bulk_disable_unprepare() APIs to disable/unprepare them in bulk

Following change also removes the legacy has_cml_clk flag and its associated
conditional logic. Instead, the driver now relies on the clock definitions from
the device tree to determine the correct clock sequencing.
This reduces hardcoded dependencies and improves the driver's maintainability.

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v1: Switch from devm_clk_bulk_get_all() -> devm_clk_bulk_get() with
	fix clks array.

nvidia,tegra20-pcie and nvidia,tegra186-pcie uses three clocks
        pex, afi, pll_e
where as nvidia,tegra30-pcie, nvidia,tegra124-pcie, nvidia,tegra210-pcie
uses four clks
        pex, afi, pll_e, cml
---
---
 drivers/pci/controller/pci-tegra.c | 100 +++++++++++++----------------
 1 file changed, 45 insertions(+), 55 deletions(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 467ddc701adc..07a61d902eae 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -287,6 +287,8 @@ struct tegra_pcie_port_soc {
 struct tegra_pcie_soc {
 	unsigned int num_ports;
 	const struct tegra_pcie_port_soc *ports;
+	const char * const *clk_names;
+	unsigned int num_clks;
 	unsigned int msi_base_shift;
 	unsigned long afi_pex2_ctrl;
 	u32 pads_pll_ctl;
@@ -297,7 +299,6 @@ struct tegra_pcie_soc {
 	bool has_pex_clkreq_en;
 	bool has_pex_bias_ctrl;
 	bool has_intr_prsnt_sense;
-	bool has_cml_clk;
 	bool has_gen2;
 	bool force_pca_enable;
 	bool program_uphy;
@@ -330,10 +331,7 @@ struct tegra_pcie {
 
 	struct resource cs;
 
-	struct clk *pex_clk;
-	struct clk *afi_clk;
-	struct clk *pll_e;
-	struct clk *cml_clk;
+	struct clk_bulk_data *clks;
 
 	struct reset_control *pex_rst;
 	struct reset_control *afi_rst;
@@ -1158,10 +1156,7 @@ static void tegra_pcie_power_off(struct tegra_pcie *pcie)
 
 	reset_control_assert(pcie->afi_rst);
 
-	clk_disable_unprepare(pcie->pll_e);
-	if (soc->has_cml_clk)
-		clk_disable_unprepare(pcie->cml_clk);
-	clk_disable_unprepare(pcie->afi_clk);
+	clk_bulk_disable_unprepare(soc->num_clks, pcie->clks);
 
 	if (!dev->pm_domain)
 		tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
@@ -1202,35 +1197,16 @@ static int tegra_pcie_power_on(struct tegra_pcie *pcie)
 		}
 	}
 
-	err = clk_prepare_enable(pcie->afi_clk);
+	err = clk_bulk_prepare_enable(soc->num_clks, pcie->clks);
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
@@ -1255,26 +1231,21 @@ static int tegra_pcie_clocks_get(struct tegra_pcie *pcie)
 {
 	struct device *dev = pcie->dev;
 	const struct tegra_pcie_soc *soc = pcie->soc;
+	int ret, i;
 
-	pcie->pex_clk = devm_clk_get(dev, "pex");
-	if (IS_ERR(pcie->pex_clk))
-		return PTR_ERR(pcie->pex_clk);
-
-	pcie->afi_clk = devm_clk_get(dev, "afi");
-	if (IS_ERR(pcie->afi_clk))
-		return PTR_ERR(pcie->afi_clk);
+	pcie->clks = devm_kcalloc(dev, soc->num_clks, sizeof(*pcie->clks),
+				  GFP_KERNEL);
+	if (!pcie->clks)
+		return -ENOMEM;
 
-	pcie->pll_e = devm_clk_get(dev, "pll_e");
-	if (IS_ERR(pcie->pll_e))
-		return PTR_ERR(pcie->pll_e);
+	for (i = 0; i < soc->num_clks; i++)
+		pcie->clks[i].id = soc->clk_names[i];
 
-	if (soc->has_cml_clk) {
-		pcie->cml_clk = devm_clk_get(dev, "cml");
-		if (IS_ERR(pcie->cml_clk))
-			return PTR_ERR(pcie->cml_clk);
-	}
+	ret = devm_clk_bulk_get(dev, soc->num_clks, pcie->clks);
+	if (ret)
+		dev_err(dev, "failed to get PCIe clocks: %d\n", ret);
 
-	return 0;
+	return ret;
 }
 
 static int tegra_pcie_resets_get(struct tegra_pcie *pcie)
@@ -2335,9 +2306,17 @@ static const struct tegra_pcie_port_soc tegra20_pcie_ports[] = {
 	{ .pme.turnoff_bit = 8, .pme.ack_bit = 10 },
 };
 
+static const char * const tegra20_pcie_clks[] = {
+	"pex",
+	"afi",
+	"pll_e",
+};
+
 static const struct tegra_pcie_soc tegra20_pcie = {
 	.num_ports = 2,
 	.ports = tegra20_pcie_ports,
+	.clk_names = tegra20_pcie_clks,
+	.num_clks = ARRAY_SIZE(tegra20_pcie_clks),
 	.msi_base_shift = 0,
 	.pads_pll_ctl = PADS_PLL_CTL_TEGRA20,
 	.tx_ref_sel = PADS_PLL_CTL_TXCLKREF_DIV10,
@@ -2345,7 +2324,6 @@ static const struct tegra_pcie_soc tegra20_pcie = {
 	.has_pex_clkreq_en = false,
 	.has_pex_bias_ctrl = false,
 	.has_intr_prsnt_sense = false,
-	.has_cml_clk = false,
 	.has_gen2 = false,
 	.force_pca_enable = false,
 	.program_uphy = true,
@@ -2356,6 +2334,13 @@ static const struct tegra_pcie_soc tegra20_pcie = {
 	.ectl.enable = false,
 };
 
+static const char * const tegra30_pcie_clks[] = {
+	"pex",
+	"afi",
+	"pll_e",
+	"cml",
+};
+
 static const struct tegra_pcie_port_soc tegra30_pcie_ports[] = {
 	{ .pme.turnoff_bit =  0, .pme.ack_bit =  5 },
 	{ .pme.turnoff_bit =  8, .pme.ack_bit = 10 },
@@ -2365,6 +2350,8 @@ static const struct tegra_pcie_port_soc tegra30_pcie_ports[] = {
 static const struct tegra_pcie_soc tegra30_pcie = {
 	.num_ports = 3,
 	.ports = tegra30_pcie_ports,
+	.clk_names = tegra30_pcie_clks,
+	.num_clks = ARRAY_SIZE(tegra30_pcie_clks),
 	.msi_base_shift = 8,
 	.afi_pex2_ctrl = 0x128,
 	.pads_pll_ctl = PADS_PLL_CTL_TEGRA30,
@@ -2374,7 +2361,6 @@ static const struct tegra_pcie_soc tegra30_pcie = {
 	.has_pex_clkreq_en = true,
 	.has_pex_bias_ctrl = true,
 	.has_intr_prsnt_sense = true,
-	.has_cml_clk = true,
 	.has_gen2 = false,
 	.force_pca_enable = false,
 	.program_uphy = true,
@@ -2388,6 +2374,8 @@ static const struct tegra_pcie_soc tegra30_pcie = {
 static const struct tegra_pcie_soc tegra124_pcie = {
 	.num_ports = 2,
 	.ports = tegra20_pcie_ports,
+	.clk_names = tegra30_pcie_clks,
+	.num_clks = ARRAY_SIZE(tegra30_pcie_clks),
 	.msi_base_shift = 8,
 	.pads_pll_ctl = PADS_PLL_CTL_TEGRA30,
 	.tx_ref_sel = PADS_PLL_CTL_TXCLKREF_BUF_EN,
@@ -2395,7 +2383,6 @@ static const struct tegra_pcie_soc tegra124_pcie = {
 	.has_pex_clkreq_en = true,
 	.has_pex_bias_ctrl = true,
 	.has_intr_prsnt_sense = true,
-	.has_cml_clk = true,
 	.has_gen2 = true,
 	.force_pca_enable = false,
 	.program_uphy = true,
@@ -2409,6 +2396,8 @@ static const struct tegra_pcie_soc tegra124_pcie = {
 static const struct tegra_pcie_soc tegra210_pcie = {
 	.num_ports = 2,
 	.ports = tegra20_pcie_ports,
+	.clk_names = tegra30_pcie_clks,
+	.num_clks = ARRAY_SIZE(tegra30_pcie_clks),
 	.msi_base_shift = 8,
 	.pads_pll_ctl = PADS_PLL_CTL_TEGRA30,
 	.tx_ref_sel = PADS_PLL_CTL_TXCLKREF_BUF_EN,
@@ -2418,7 +2407,6 @@ static const struct tegra_pcie_soc tegra210_pcie = {
 	.has_pex_clkreq_en = true,
 	.has_pex_bias_ctrl = true,
 	.has_intr_prsnt_sense = true,
-	.has_cml_clk = true,
 	.has_gen2 = true,
 	.force_pca_enable = true,
 	.program_uphy = true,
@@ -2450,6 +2438,8 @@ static const struct tegra_pcie_port_soc tegra186_pcie_ports[] = {
 static const struct tegra_pcie_soc tegra186_pcie = {
 	.num_ports = 3,
 	.ports = tegra186_pcie_ports,
+	.clk_names = tegra20_pcie_clks,
+	.num_clks = ARRAY_SIZE(tegra20_pcie_clks),
 	.msi_base_shift = 8,
 	.afi_pex2_ctrl = 0x19c,
 	.pads_pll_ctl = PADS_PLL_CTL_TEGRA30,
@@ -2459,7 +2449,6 @@ static const struct tegra_pcie_soc tegra186_pcie = {
 	.has_pex_clkreq_en = true,
 	.has_pex_bias_ctrl = true,
 	.has_intr_prsnt_sense = true,
-	.has_cml_clk = false,
 	.has_gen2 = true,
 	.force_pca_enable = false,
 	.program_uphy = false,
@@ -2651,6 +2640,7 @@ static void tegra_pcie_remove(struct platform_device *pdev)
 static int tegra_pcie_pm_suspend(struct device *dev)
 {
 	struct tegra_pcie *pcie = dev_get_drvdata(dev);
+	const struct tegra_pcie_soc *soc = pcie->soc;
 	struct tegra_pcie_port *port;
 	int err;
 
@@ -2672,7 +2662,7 @@ static int tegra_pcie_pm_suspend(struct device *dev)
 	}
 
 	reset_control_assert(pcie->pex_rst);
-	clk_disable_unprepare(pcie->pex_clk);
+	clk_bulk_disable_unprepare(soc->num_clks, pcie->clks);
 
 	if (IS_ENABLED(CONFIG_PCI_MSI))
 		tegra_pcie_disable_msi(pcie);
@@ -2686,6 +2676,7 @@ static int tegra_pcie_pm_suspend(struct device *dev)
 static int tegra_pcie_pm_resume(struct device *dev)
 {
 	struct tegra_pcie *pcie = dev_get_drvdata(dev);
+	const struct tegra_pcie_soc *soc = pcie->soc;
 	int err;
 
 	err = tegra_pcie_power_on(pcie);
@@ -2706,9 +2697,9 @@ static int tegra_pcie_pm_resume(struct device *dev)
 	if (IS_ENABLED(CONFIG_PCI_MSI))
 		tegra_pcie_enable_msi(pcie);
 
-	err = clk_prepare_enable(pcie->pex_clk);
+	err = clk_bulk_prepare_enable(soc->num_clks, pcie->clks);
 	if (err) {
-		dev_err(dev, "failed to enable PEX clock: %d\n", err);
+		dev_err(dev, "failed to enable clock: %d\n", err);
 		goto pex_dpd_enable;
 	}
 
@@ -2729,7 +2720,6 @@ static int tegra_pcie_pm_resume(struct device *dev)
 
 disable_pex_clk:
 	reset_control_assert(pcie->pex_rst);
-	clk_disable_unprepare(pcie->pex_clk);
 pex_dpd_enable:
 	pinctrl_pm_select_idle_state(dev);
 poweroff:
-- 
2.50.1

