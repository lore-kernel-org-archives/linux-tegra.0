Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010036.outbound.protection.outlook.com [40.93.198.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9923594A;
	Mon,  4 May 2026 03:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777865606; cv=fail; b=etMZJfmECJ1lmwrBO9KCyIpLL+AkitkfarNqHzCIekDnno4nBzjN3/8NG5ZHRvSHikaItDZxcn/kIcEnIFa37Tiku9Wc6Drnj95ongxv5K6GzrfTspNJ2wZZL79qxADlVsnQJpiQso/jhOT6aw4beWYkIM++Rc2KeacFK4Tcs10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777865606; c=relaxed/simple;
	bh=KdyQfoLjZMt+CUCNGWoP+AAvdlXX9UGLD+SBgUa5Mew=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DO8fm7VB+ueEMcH3ghE0IJW/TyGaY/bcdzDGp2mMBggGWZN0pxQKV2/HUFHnJf1V/PcNxwYKfh7Lwzvu25Kce9RJAi3zFY71jIPo9ukEQqoDAfVOpAk1yNeYBDqWkhj+mZRsxdY1WgxpO7hYixVTSMf+TS6DZY8gHSvUO/RIWkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GwEM8BFF; arc=fail smtp.client-ip=40.93.198.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GwEM8BFF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eSAtUxrZjZCvLuWoftgNSFpc5quXkJ538ICUG1RHjzDYqma/G4CyX7gIExV6o79enob6zefav1zC6ssMvyOMWmHw8GwteP4H+OK5RVjm/1Nzs60UpPzgIlnfxXtH3eZC6RUCzb5f8KW3PSm62vyrQhBZV/1X9zhcaCndx3QNZX2FlJwdzU2sL9i7IXTPxlWLR1PR2vAht7AVmDGnyUjq3BDd8yNstV5Q6ItPIep6luNSlIHoilMw76Xni/BoyjVjdCnPdJdSxV+s7biIrDu+s9yRtxG20l+GltamuBglaRQHPWioXeK/7wx+8S0M3EKL/UO8JKMsJBv2v+OIZHPXYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g62HCHwFmhveodrjNFbtdfxdftGDv4RY9jwyLaU96ic=;
 b=UzY/7rPnG0n546aP3k/ZP2EFpvIJdJOvF4TAiieUuaIYGDh+dP+uO5Yz7So4/4Yef7qrUsA//+eKuqc5rqO7FZHpgblYlewne/9GV1WE6pPc23XkzeFljigeUs4L3SfEs2NwLT4fJ2qpt9ADSDXE6fRafWza63GRoJHUmjaqGNmb0J5O/DTl9nC9f+297ZVlEBPoYGCTiD1iXrnNcZOfrPHwjcPALiucjDMb4M9hF+Bymn0lvv+RJH588Y5drDhQdOA9Bdx7BrCwqUG2Mbz3iOX4E/AfpBKeEaV3AWOA6LskbqzaRHTu6r5uZyqJI02HR+iMsEeJ9z5oR7FwHYknNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g62HCHwFmhveodrjNFbtdfxdftGDv4RY9jwyLaU96ic=;
 b=GwEM8BFFEvPp0w7WtYmxVo27QBkKNKUnA/iIwzJE6IF9jYIl+18uxYJjRmhHdQ+jUGIf3WA/CyMHCnF2W6T9aJFQT6SACv8EacyOOVk/MzlCXVUWPG0h0ie+PBuEpsgY2PWdmlrgpxXc35rr38OQtIqH2livEA1kJjfneN4YoGRlhiUnUowXUzOXsLGGaf2xREhTpQEUoZKGg0DibDSbz21N0SP9FLrZcfSnRHIMMueeIMKztTmHdu37otSTFzprAirtSV57+wl/cvqXFJWOrb4AcxhE0GU/XTNVE4LwEkJQ5Ecx6xxe8teuzwRXcK92ChVmHxq4enksOdAe9GaZgg==
Received: from MN2PR20CA0004.namprd20.prod.outlook.com (2603:10b6:208:e8::17)
 by CH8PR12MB9789.namprd12.prod.outlook.com (2603:10b6:610:260::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 03:33:19 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:208:e8:cafe::e3) by MN2PR20CA0004.outlook.office365.com
 (2603:10b6:208:e8::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Mon,
 4 May 2026 03:33:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Mon, 4 May 2026 03:33:18 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 3 May
 2026 20:33:08 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 3 May
 2026 20:33:08 -0700
Received: from 5b171f0-lcelt.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 3 May 2026 20:33:06 -0700
From: Wei-Cheng Chen <weichengc@nvidia.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, "JC
 Kuo" <jckuo@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, "Thierry
 Reding" <thierry.reding@kernel.org>
CC: Wayne Chang <waynec@nvidia.com>, WK Tsai <wtsai@nvidia.com>,
	<linux-phy@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2] phy: tegra: xusb: Fix per-pad high-speed termination calibration
Date: Mon, 4 May 2026 11:33:05 +0800
Message-ID: <20260504033305.2283145-1-weichengc@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|CH8PR12MB9789:EE_
X-MS-Office365-Filtering-Correlation-Id: d7a72528-2ef2-4b85-9e34-08dea98de2a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|13003099007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	/2J2kjjWVmhr4eueQhFDitBmxaM37sXwRjJQTDLTkZIHsFWtdRG0LVzeaSn7LCIhBp3ulWdafrzxwFEdlG8TpeN5FXi67zaFJawdbsEamYQqBeLTZ59wuDMUIj89khyiazgWhUSB6Bx7X8W0xgQphJfMjbgXQSf2aIaVPM/rjs+ARypEDbSNySL4kG1KS20v+YSlV5ioDJ2mYI75LxSZN26ukHoTuBARocWIl7mLxG0zB6APo6P8w/qynu1/GDdO+mNDk4MwRpdWgyxDT+ya2dvUn1CDeawP5FHsZZ08ttAwXJxzjCQ1aFFVzp0ZTe09qeAEct5f9nZtInAjR2StwT1B96i+AekPejIsF+cTcsnTAJzOtPXMw9q58+ziQx3HilmyIDW6V5XXeVwHGrIJSgR0CL7VonIIKYUQoJD0KzgBRABsEblWSQGPNveSBJ3YAsbclWxiwj8gFKYjlN1tipHkI5Jljy2o8klzcK8rzWKf06/QNO4tPzIBovMGpwGkVpkPTXVhC2PRBV4eGnqu8tsHEEmfqBLaXMH09K3oFpCMuf00FwlckzAQBWrDqfwhndgVH/KtPXLJX9zdOz6i3EU9M8WkRs4vv0MHdbTVIjn6uxvnVX8b4SalaBH3tfGYXEFy+S7iOM26BST2p7SEXyjjrGy3Qw+AyxiMkhKbBfJDeJFza4/CEvXLfzIkNUIi2oZDvATk+l0uabP04E19J4GmwllYPDWCH/W448sqZxhB+61yqE5QS5mQyplt1DBG
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6/iBOcL3GfoQDk2MtkqCeIbRH1PwqcFc4knz2c8w3+B1VojtvuVrOQ1YcAZJmzXTcbKTsJOFoSIhNN9bS+tmoOMVsEGvvD38Ey1PTThGM+DgCHu3AVrqszDY3Ap7Ab7pFjsaFScI4bNTsjEz0uYzj58+e9aufZ8zETlhLB07r5ZhpUWiscunGCIizwpfXZtgh5C5Mch8wQ1B/WBhECIo9F46vs5CY3S535clam7F8edorfunwIqVtud8Mlou+3tHBPGzkhBNFDF9yEWUlQvUuClb4tfMqzs53E8F0PS62Q2uX26rj68BStYxOU23Yao9HkMsfdB+XUHbp+n8x2R8em4RJp3J5xyHHgXDsDy+KGgbXeNNfzi+816fI/CSWEXML8QABUTQDwe0Q7xxdQtYiMZczr75CVWa/KoJbchbFL1QA/Jga4EcvpMRRhzwurIp
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 03:33:18.9039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a72528-2ef2-4b85-9e34-08dea98de2a2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9789

From: Wayne Chang <waynec@nvidia.com>

The existing code reads a single hs_term_range_adj value from bit field
[10:7] of FUSE_SKU_CALIB_0 and applies it to all USB2 pads uniformly.
However, on SoCs that support per-pad termination, each pad has its own
hs_term_range_adj field: pad 0 in FUSE_SKU_CALIB_0[10:7], and pads 1-3
in FUSE_USB_CALIB_EXT_0 at bit offsets [8:5], [12:9], and [16:13]
respectively.

Fix the calibration by reading per-pad values from the appropriate fuse
registers. For SoCs that do not support per-pad termination, replicate
pad 0's value to all pads to maintain existing behavior.

Add a has_per_pad_term flag to the SoC data to indicate whether per-pad
termination values are available in FUSE_USB_CALIB_EXT_0.

Fixes: 1ef535c6ba8e ("phy: tegra: xusb: Add Tegra194 support")
Cc: stable@vger.kernel.org
Signed-off-by: Wayne Chang <waynec@nvidia.com>
Signed-off-by: Wei-Cheng Chen <weichengc@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes in v2:
- Rebased on v7.1-rc1 per Vinod's request. No functional changes;
  range-diff vs v1 confirms identical payload.
- Carried over Jon's Reviewed-by and Tested-by tags from v1
  (https://lore.kernel.org/all/77285dd6-e240-4944-a034-a4bc3acf4052@nvidia.com/).

 drivers/phy/tegra/xusb-tegra186.c | 33 ++++++++++++++++++++++++-------
 drivers/phy/tegra/xusb.h          |  1 +
 2 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index 1ddf1126597..60156aea270 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -20,8 +20,8 @@
 /* FUSE USB_CALIB registers */
 #define HS_CURR_LEVEL_PADX_SHIFT(x)	((x) ? (11 + (x - 1) * 6) : 0)
 #define HS_CURR_LEVEL_PAD_MASK		0x3f
-#define HS_TERM_RANGE_ADJ_SHIFT		7
-#define HS_TERM_RANGE_ADJ_MASK		0xf
+#define HS_TERM_RANGE_ADJ_PADX_SHIFT(x)	((x) ? (5 + (x - 1) * 4) : 7)
+#define HS_TERM_RANGE_ADJ_PAD_MASK	0xf
 #define HS_SQUELCH_SHIFT		29
 #define HS_SQUELCH_MASK			0x7
 
@@ -253,7 +253,7 @@
 struct tegra_xusb_fuse_calibration {
 	u32 *hs_curr_level;
 	u32 hs_squelch;
-	u32 hs_term_range_adj;
+	u32 *hs_term_range_adj;
 	u32 rpd_ctrl;
 };
 
@@ -930,7 +930,7 @@ static int tegra186_utmi_phy_power_on(struct phy *phy)
 
 	value = padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
 	value &= ~TERM_RANGE_ADJ(~0);
-	value |= TERM_RANGE_ADJ(priv->calib.hs_term_range_adj);
+	value |= TERM_RANGE_ADJ(priv->calib.hs_term_range_adj[index]);
 	value &= ~RPD_CTRL(~0);
 	value |= RPD_CTRL(priv->calib.rpd_ctrl);
 	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
@@ -1464,17 +1464,23 @@ static const char * const tegra186_usb3_functions[] = {
 static int
 tegra186_xusb_read_fuse_calibration(struct tegra186_xusb_padctl *padctl)
 {
+	const struct tegra_xusb_padctl_soc *soc = padctl->base.soc;
 	struct device *dev = padctl->base.dev;
 	unsigned int i, count;
 	u32 value, *level;
+	u32 *hs_term_range_adj;
 	int err;
 
-	count = padctl->base.soc->ports.usb2.count;
+	count = soc->ports.usb2.count;
 
 	level = devm_kcalloc(dev, count, sizeof(u32), GFP_KERNEL);
 	if (!level)
 		return -ENOMEM;
 
+	hs_term_range_adj = devm_kcalloc(dev, count, sizeof(u32), GFP_KERNEL);
+	if (!hs_term_range_adj)
+		return -ENOMEM;
+
 	err = tegra_fuse_readl(TEGRA_FUSE_SKU_CALIB_0, &value);
 	if (err)
 		return dev_err_probe(dev, err,
@@ -1490,8 +1496,8 @@ tegra186_xusb_read_fuse_calibration(struct tegra186_xusb_padctl *padctl)
 
 	padctl->calib.hs_squelch = (value >> HS_SQUELCH_SHIFT) &
 					HS_SQUELCH_MASK;
-	padctl->calib.hs_term_range_adj = (value >> HS_TERM_RANGE_ADJ_SHIFT) &
-						HS_TERM_RANGE_ADJ_MASK;
+	hs_term_range_adj[0] = (value >> HS_TERM_RANGE_ADJ_PADX_SHIFT(0)) &
+				HS_TERM_RANGE_ADJ_PAD_MASK;
 
 	err = tegra_fuse_readl(TEGRA_FUSE_USB_CALIB_EXT_0, &value);
 	if (err) {
@@ -1503,6 +1509,17 @@ tegra186_xusb_read_fuse_calibration(struct tegra186_xusb_padctl *padctl)
 
 	padctl->calib.rpd_ctrl = (value >> RPD_CTRL_SHIFT) & RPD_CTRL_MASK;
 
+	for (i = 1; i < count; i++) {
+		if (soc->has_per_pad_term)
+			hs_term_range_adj[i] =
+				(value >> HS_TERM_RANGE_ADJ_PADX_SHIFT(i)) &
+				HS_TERM_RANGE_ADJ_PAD_MASK;
+		else
+			hs_term_range_adj[i] = hs_term_range_adj[0];
+	}
+
+	padctl->calib.hs_term_range_adj = hs_term_range_adj;
+
 	return 0;
 }
 
@@ -1708,6 +1725,7 @@ const struct tegra_xusb_padctl_soc tegra194_xusb_padctl_soc = {
 	.num_supplies = ARRAY_SIZE(tegra194_xusb_padctl_supply_names),
 	.supports_gen2 = true,
 	.poll_trk_completed = true,
+	.has_per_pad_term = true,
 };
 EXPORT_SYMBOL_GPL(tegra194_xusb_padctl_soc);
 
@@ -1732,6 +1750,7 @@ const struct tegra_xusb_padctl_soc tegra234_xusb_padctl_soc = {
 	.trk_hw_mode = false,
 	.trk_update_on_idle = true,
 	.supports_lp_cfg_en = true,
+	.has_per_pad_term = true,
 };
 EXPORT_SYMBOL_GPL(tegra234_xusb_padctl_soc);
 #endif
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index cd277d0ed9e..77609e54de6 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -435,6 +435,7 @@ struct tegra_xusb_padctl_soc {
 	bool trk_hw_mode;
 	bool trk_update_on_idle;
 	bool supports_lp_cfg_en;
+	bool has_per_pad_term;
 };
 
 struct tegra_xusb_padctl {

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.43.0

