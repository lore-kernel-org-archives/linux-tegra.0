Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3727DCA5A;
	Sat, 18 Jul 2026 00:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784333828; cv=none; b=mZ2dJR4GKNTdwo6lz9fcw+AekTm/fdHMJeYA/ijWM4QwoDS1WKupeoli5pIiLqBnzJzeTuCcJ7hHdmqH8gY1lzjDTxoL4YCG5IO3tWKwuLuGyOx0BdEsasvGSunBwhbcEj7ki/ab2l6Xt+j/yJK9wO7e1WjUZC8J1KZvcPfYNYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784333828; c=relaxed/simple;
	bh=/vafxQxx1ICs6jDSq1iGlulHcZH0tKwkiYcwuhFdlzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zr6sRBMS+p81jsYMbnT6H4uX+Soa3DWahCrU8L97a5mYO8Fyblwps4c+7J9cjQL21zwf34McmDBwOMc+ooSw9D9dr+wTOJCK1bLBlYdI6+dGxL7EPRKRrXTGcpS6r5dImVeDLZ6XtbsoO6hBTaCl7MUNF8Be0E6sHjE+QZ6DRwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WQK2R4W5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WQK2R4W5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4D3FC2BCF4;
	Sat, 18 Jul 2026 00:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784333827;
	bh=/vafxQxx1ICs6jDSq1iGlulHcZH0tKwkiYcwuhFdlzE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WQK2R4W5bAybkfl4mR+eR5LgyrGV7VUgmg+fwRkz27ImdoLSGkDR4ykT1LgcmQS+A
	 RMNaJAtb8iorOJEP+23PYWtrpgHUgiTbWRhvKKbq4Fdk38K5skYWv3r5CPbJrIQ7hP
	 G0Wy1mjuRPaqC2FSbo4QcVzLJQCUnhZCr+gX5oL/o8CH2gBidBiA6NDHnakPdEhVnp
	 zt6ldGsD2n/DAfLUXataTD81rpcaNgtw5vG74qrgF8spHzPICBfYCIOR73twk3E/Bn
	 LQ+NpfEIsdCqvMmMjE4cxhXWFjdmOyBfe1IxiyARJQpC3H5Frrw8P/BGf3ymrsA4eC
	 VtjbElbl8MHrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5886C44523;
	Sat, 18 Jul 2026 00:17:07 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Fri, 17 Jul 2026 19:17:03 -0500
Subject: [PATCH 2/2] soc/tegra: pmc: Add Tegra210B01 support
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-t210b01-pmc-v1-2-bf776be8b3a7@gmail.com>
References: <20260717-t210b01-pmc-v1-0-bf776be8b3a7@gmail.com>
In-Reply-To: <20260717-t210b01-pmc-v1-0-bf776be8b3a7@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>, Azkali Manad <a.ffcc7@gmail.com>, 
 Thomas Makin <halorocker89@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784333826; l=9501;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=OCQonk6jGTpoZZXZxgWdn6dt1IMUFa28q+B6W0rxEWc=;
 b=zrJSCM70nwdjvdIxOUl62PP0w5YCTLKd/jXQo7oNePjcq69OmsfLPQxoZTsrVWY0+FaXRFp9o
 ljccunzp8wXASUpezwWtoLxIsyjUOCkzbdolB4zFHqXchiAD/f5z2X+
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Azkali Manad <a.ffcc7@gmail.com>

The PMC in Tegra210B01 is very similar to the one in the original
Tegra210, but has a few powergate and pad differences. Add support for
this soc.

Signed-off-by: Azkali Manad <a.ffcc7@gmail.com>
Co-developed-by: Thomas Makin <halorocker89@gmail.com>
Signed-off-by: Thomas Makin <halorocker89@gmail.com>
Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 drivers/soc/tegra/pmc.c | 160 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index f419a5395545f..4d77aa66d690c 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3744,6 +3744,32 @@ static const char * const tegra210_powergates[] = {
 	[TEGRA_POWERGATE_VE2] = "ve2",
 };
 
+static const char * const tegra210b01_powergates[] = {
+	[TEGRA_POWERGATE_CPU] = "crail",
+	[TEGRA_POWERGATE_3D] = "3d",
+	[TEGRA_POWERGATE_PCIE] = "pcie",
+	[TEGRA_POWERGATE_MPE] = "mpe",
+	[TEGRA_POWERGATE_SATA] = "sata",
+	[TEGRA_POWERGATE_CPU1] = "cpu1",
+	[TEGRA_POWERGATE_CPU2] = "cpu2",
+	[TEGRA_POWERGATE_CPU3] = "cpu3",
+	[TEGRA_POWERGATE_CPU0] = "cpu0",
+	[TEGRA_POWERGATE_C0NC] = "c0nc",
+	[TEGRA_POWERGATE_SOR] = "sor",
+	[TEGRA_POWERGATE_DIS] = "dis",
+	[TEGRA_POWERGATE_DISB] = "disb",
+	[TEGRA_POWERGATE_XUSBA] = "xusba",
+	[TEGRA_POWERGATE_XUSBB] = "xusbb",
+	[TEGRA_POWERGATE_XUSBC] = "xusbc",
+	[TEGRA_POWERGATE_VIC] = "vic",
+	[TEGRA_POWERGATE_IRAM] = "iram",
+	[TEGRA_POWERGATE_NVDEC] = "nvdec",
+	[TEGRA_POWERGATE_NVJPG] = "nvjpg",
+	[TEGRA_POWERGATE_AUD] = "aud",
+	[TEGRA_POWERGATE_DFD] = "dfd",
+};
+
+
 static const u8 tegra210_cpu_powergates[] = {
 	TEGRA_POWERGATE_CPU0,
 	TEGRA_POWERGATE_CPU1,
@@ -3897,6 +3923,139 @@ static const struct tegra_pmc_soc tegra210_pmc_soc = {
 	.has_single_mmio_aperture = true,
 };
 
+static const struct tegra_io_pad_soc tegra210b01_io_pads[] = {
+	TEGRA_IO_PAD(TEGRA_IO_PAD_AUDIO, 17, 0x1b8, 0x1bc, "audio"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_AUDIO_HV, 29, 0x1c0, 0x1c4, "audio-hv"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CAM, 4, 0x1c0, 0x1c4, "cam"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIA, 0, 0x1b8, 0x1bc, "csia"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIB, 1, 0x1b8, 0x1bc, "csib"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIC, 10, 0x1c0, 0x1c4, "csic"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSID, 11, 0x1c0, 0x1c4, "csid"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIE, 12, 0x1c0, 0x1c4, "csie"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIF, 13, 0x1c0, 0x1c4, "csif"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DBG, 25, 0x1b8, 0x1bc, "dbg"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DEBUG_NONAO, 26, 0x1b8, 0x1bc, "debug-nonao"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DMIC, 18, 0x1c0, 0x1c4, "dmic"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DP, 19, 0x1c0, 0x1c4, "dp"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DSI, 2, 0x1b8, 0x1bc, "dsi"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DSIB, 7, 0x1c0, 0x1c4, "dsib"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DSIC, 8, 0x1c0, 0x1c4, "dsic"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DSID, 9, 0x1c0, 0x1c4, "dsid"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_EMMC, 3, 0x1c0, 0x1c4, "emmc"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_EMMC2, 5, 0x1c0, 0x1c4, "emmc2"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_GPIO, 27, 0x1b8, 0x1bc, "gpio"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_HDMI, 28, 0x1b8, 0x1bc, "hdmi"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_HSIC, 19, 0x1b8, 0x1bc, "hsic"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_LVDS, 25, 0x1c0, 0x1c4, "lvds"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_MIPI_BIAS, 3, 0x1b8, 0x1bc, "mipi-bias"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_BIAS, 4, 0x1b8, 0x1bc, "pex-bias"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK1, 5, 0x1b8, 0x1bc, "pex-clk1"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK2, 6, 0x1b8, 0x1bc, "pex-clk2"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CNTRL, UINT_MAX, UINT_MAX, UINT_MAX, "pex-cntrl"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC1, 1, 0x1c0, 0x1c4, "sdmmc1"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC3, 2, 0x1c0, 0x1c4, "sdmmc3"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SPI, 14, 0x1c0, 0x1c4, "spi"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SPI_HV, 15, 0x1c0, 0x1c4, "spi-hv"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_UART, 14, 0x1b8, 0x1bc, "uart"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_USB0, 9, 0x1b8, 0x1bc, "usb0"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_USB1, 10, 0x1b8, 0x1bc, "usb1"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_USB2, 11, 0x1b8, 0x1bc, "usb2"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_USB3, 18, 0x1b8, 0x1bc, "usb3"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_USB_BIAS, 12, 0x1b8, 0x1bc, "usb-bias"),
+};
+
+static const struct tegra_io_pad_vctrl tegra210b01_io_pad_vctrls[] = {
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_AUDIO, PMC_PWR_DET_VALUE, 5),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_AUDIO_HV, PMC_PWR_DET_VALUE, 18),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_CAM, PMC_PWR_DET_VALUE, 10),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_DBG, PMC_PWR_DET_VALUE, 19),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_DMIC, PMC_PWR_DET_VALUE, 20),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_GPIO, PMC_PWR_DET_VALUE, 21),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_PEX_CNTRL, PMC_PWR_DET_VALUE, 11),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_SDMMC1, PMC_PWR_DET_VALUE, 12),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_SDMMC3, PMC_PWR_DET_VALUE, 13),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_SPI, PMC_PWR_DET_VALUE, 22),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_SPI_HV, PMC_PWR_DET_VALUE, 23),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_UART, PMC_PWR_DET_VALUE, 2),
+};
+
+static const struct pinctrl_pin_desc tegra210b01_pin_descs[] = {
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_AUDIO, "audio"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_AUDIO_HV, "audio-hv"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_CAM, "cam"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_CSIA, "csia"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_CSIB, "csib"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_CSIC, "csic"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_CSID, "csid"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_CSIE, "csie"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_CSIF, "csif"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_DBG, "dbg"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_DEBUG_NONAO, "debug-nonao"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_DMIC, "dmic"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_DP, "dp"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_DSI, "dsi"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_DSIB, "dsib"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_DSIC, "dsic"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_DSID, "dsid"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_EMMC, "emmc"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_EMMC2, "emmc2"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_GPIO, "gpio"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_HDMI, "hdmi"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_HSIC, "hsic"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_LVDS, "lvds"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_MIPI_BIAS, "mipi-bias"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_PEX_BIAS, "pex-bias"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_PEX_CLK1, "pex-clk1"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_PEX_CLK2, "pex-clk2"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_PEX_CNTRL, "pex-cntrl"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_SDMMC1, "sdmmc1"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_SDMMC3, "sdmmc3"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_SPI, "spi"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_SPI_HV, "spi-hv"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_UART, "uart"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_USB0, "usb0"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_USB1, "usb1"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_USB2, "usb2"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_USB3, "usb3"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_USB_BIAS, "usb-bias"),
+};
+
+static const struct tegra_pmc_soc tegra210b01_pmc_soc = {
+	.supports_core_domain = false,
+	.num_powergates = ARRAY_SIZE(tegra210b01_powergates),
+	.powergates = tegra210b01_powergates,
+	.num_cpu_powergates = ARRAY_SIZE(tegra210_cpu_powergates),
+	.cpu_powergates = tegra210_cpu_powergates,
+	.has_tsense_reset = true,
+	.has_gpu_clamps = true,
+	.needs_mbist_war = false,
+	.has_io_pad_wren = false,
+	.maybe_tz_only = true,
+	.num_io_pads = ARRAY_SIZE(tegra210b01_io_pads),
+	.io_pads = tegra210b01_io_pads,
+	.num_io_pad_vctrls = ARRAY_SIZE(tegra210b01_io_pad_vctrls),
+	.io_pad_vctrls = tegra210b01_io_pad_vctrls,
+	.num_pin_descs = ARRAY_SIZE(tegra210b01_pin_descs),
+	.pin_descs = tegra210b01_pin_descs,
+	.regs = &tegra20_pmc_regs,
+	.init = tegra20_pmc_init,
+	.setup_irq_polarity = tegra20_pmc_setup_irq_polarity,
+	.powergate_set = tegra114_powergate_set,
+	.irq_set_wake = tegra210_pmc_irq_set_wake,
+	.irq_set_type = tegra210_pmc_irq_set_type,
+	.reset_sources = tegra210_reset_sources,
+	.num_reset_sources = ARRAY_SIZE(tegra210_reset_sources),
+	.reset_levels = NULL,
+	.num_reset_levels = 0,
+	.num_wake_events = ARRAY_SIZE(tegra210_wake_events),
+	.wake_events = tegra210_wake_events,
+	.pmc_clks_data = tegra_pmc_clks_data,
+	.num_pmc_clks = ARRAY_SIZE(tegra_pmc_clks_data),
+	.has_blink_output = true,
+	.has_usb_sleepwalk = true,
+	.has_single_mmio_aperture = true,
+};
+
 static const struct tegra_io_pad_soc tegra186_io_pads[] = {
 	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIA, 0, 0x74, 0x78, "csia"),
 	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIB, 1, 0x74, 0x78, "csib"),
@@ -4824,6 +4983,7 @@ static const struct of_device_id tegra_pmc_match[] = {
 	{ .compatible = "nvidia,tegra194-pmc", .data = &tegra194_pmc_soc },
 	{ .compatible = "nvidia,tegra186-pmc", .data = &tegra186_pmc_soc },
 	{ .compatible = "nvidia,tegra210-pmc", .data = &tegra210_pmc_soc },
+	{ .compatible = "nvidia,tegra210b01-pmc", .data = &tegra210b01_pmc_soc },
 	{ .compatible = "nvidia,tegra132-pmc", .data = &tegra124_pmc_soc },
 	{ .compatible = "nvidia,tegra124-pmc", .data = &tegra124_pmc_soc },
 	{ .compatible = "nvidia,tegra114-pmc", .data = &tegra114_pmc_soc },

-- 
2.54.0


