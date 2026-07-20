Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BCC38C407;
	Mon, 20 Jul 2026 06:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784529080; cv=none; b=Ob0Wo2YkNlNxYR65GsrjeD0HeXDLd4tpcCSOvmZHPAYs5N6e2+eMjeXpk1SHv8U0RvCf+DBcTNYbL13q6BTdiwsa6irdUzKtemom/QfA6M/xqc8V1osNex5afRue7L9U1qcVa5wm9QRERKPoJWmLXdpAJf0BkQevKIvTx0tfTus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784529080; c=relaxed/simple;
	bh=J8hxdhnFc0sk7XaGYGkjEgWWvWc2qtBEd55lDS0JjW4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O9Da49vF1ILy9XUYMbsz+EnuTejeOgKB2tosJcxJUfxsE9UGjZNATt6K74dg4ItwsLAJ1Uvf4xhlL2gwEcPpiCPS0GffbB0FVAeGEd/T2CJYB7Zcnb3mhiGxXNl1dmd4MWxIM5nPRg71I9miAOZk5GM+wpccpAF/BedswemtGP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bKjPMrc3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bKjPMrc3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37A3CC2BCFC;
	Mon, 20 Jul 2026 06:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784529080;
	bh=J8hxdhnFc0sk7XaGYGkjEgWWvWc2qtBEd55lDS0JjW4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bKjPMrc3zIiDaeqy+lB8xS4bBZl2npx1LOjpbRu9RCXi1mPIcyd+i2A40EtsRA+gU
	 4tkRJVxK9JMI8IW15hQIFAjV5FSdNuZwHWSHG3VmxdXFtdZM2+VthVIY0h8Y1zVNqC
	 Ju3Nfl4NTGnDZ9TEy/CbBs/MDspNBJle4FfiUiVZCwH8VKr1kgBqeFUlfba2GdB71g
	 CjZIxuzdrv+K2IWQ4sM3w6Xg5NJ0jYK03zKLiauhI1s6aeYR8wpJZKMGJwHHSjRIts
	 4xa+5GiSExeyyLpnEBXjPD8/va1JNr+k7ya+Pw4xTaKff6BqEq5O7uOmcvxb/n5waR
	 miYGFWfKGyLjQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B5F8C44524;
	Mon, 20 Jul 2026 06:31:20 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Mon, 20 Jul 2026 01:31:16 -0500
Subject: [PATCH v2 2/2] soc/tegra: pmc: Add Tegra210B01 support
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-t210b01-pmc-v2-2-ca5317f8507b@gmail.com>
References: <20260720-t210b01-pmc-v2-0-ca5317f8507b@gmail.com>
In-Reply-To: <20260720-t210b01-pmc-v2-0-ca5317f8507b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>, Azkali Manad <a.ffcc7@gmail.com>, 
 Thomas Makin <halorocker89@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784529079; l=3863;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=xOoYGaWgQowKYJwxc31J4RLh/H7wPv3thOHHfWFl0Nk=;
 b=mFqT+DisMSq6+VhHKXG7KZzJ/xYTNseQ8XJotUNJhrTbi1egJ9F4fcQVWHjzBB5BQKb0s5A3V
 pZnhloD4qBMD2QDLZ8H/pdrU6/TnRnfPAmP+UDGGLsuAgH7sXSao3nG
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Azkali Manad <a.ffcc7@gmail.com>

The PMC in Tegra210B01 is very similar to the one in the original
Tegra210, but has a few powergate differences. Add support for this soc.

Signed-off-by: Azkali Manad <a.ffcc7@gmail.com>
Co-developed-by: Thomas Makin <halorocker89@gmail.com>
Signed-off-by: Thomas Makin <halorocker89@gmail.com>
Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 drivers/soc/tegra/pmc.c | 62 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index f419a5395545f..48ae4ff3f00db 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3897,6 +3897,67 @@ static const struct tegra_pmc_soc tegra210_pmc_soc = {
 	.has_single_mmio_aperture = true,
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
+	.num_io_pads = ARRAY_SIZE(tegra210_io_pads),
+	.io_pads = tegra210_io_pads,
+	.num_io_pad_vctrls = ARRAY_SIZE(tegra210_io_pad_vctrls),
+	.io_pad_vctrls = tegra210_io_pad_vctrls,
+	.num_pin_descs = ARRAY_SIZE(tegra210_pin_descs),
+	.pin_descs = tegra210_pin_descs,
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
@@ -4824,6 +4885,7 @@ static const struct of_device_id tegra_pmc_match[] = {
 	{ .compatible = "nvidia,tegra194-pmc", .data = &tegra194_pmc_soc },
 	{ .compatible = "nvidia,tegra186-pmc", .data = &tegra186_pmc_soc },
 	{ .compatible = "nvidia,tegra210-pmc", .data = &tegra210_pmc_soc },
+	{ .compatible = "nvidia,tegra210b01-pmc", .data = &tegra210b01_pmc_soc },
 	{ .compatible = "nvidia,tegra132-pmc", .data = &tegra124_pmc_soc },
 	{ .compatible = "nvidia,tegra124-pmc", .data = &tegra124_pmc_soc },
 	{ .compatible = "nvidia,tegra114-pmc", .data = &tegra114_pmc_soc },

-- 
2.54.0


