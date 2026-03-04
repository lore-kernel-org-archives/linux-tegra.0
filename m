Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012012.outbound.protection.outlook.com [40.107.209.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9B13A1A56;
	Wed,  4 Mar 2026 10:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772620029; cv=fail; b=lzTqHMD9oOZb70EkuAXxiF0S3wMbRIOTBS+3ymugykNf7RhqFzJZEmnWUDzFzXltzvqNaxvtnfWLpnNk4Pk+vK3goZXVoY2pYhzY9C9p4Wjv0FSsb10uilyhoodWY+t8uZgL6RrL3EPyKxo/N+Ed830/zHQX6zm6MCzBafpsaIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772620029; c=relaxed/simple;
	bh=UqYauFImumheZWVynJFPJmv8wRVHh6JzmqKwXuIE7ew=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PCAK8T5wzX6DtbTsjCPSjtk9CSKkC3MyQ53VNDGXPux9Kjcauc42Ald6geDaCh1dcTQDsAVKG3ymnbBL7UhUBUjydu9nS1/+8YnyqMYeSFPaLwM9kfckD5VcZ9+RuYuqNk7q805uiPYBtbltT0HPpywvjTpcqibbfvB8g7mmers=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GV+rD+sx; arc=fail smtp.client-ip=40.107.209.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GV+rD+sx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LJsjUmz50F3UoOCUPJ5YSYdczKD2Ud4A8DE99krfAMBEoNL1TRKVkxggv+ymf/eqqnaQf4BYhcnjspJ3zd3DSoRt4B978eY9xHYWh1BV9oWzaQWp+tMHS9QISDhdo7DPmtxL7z0eYwtgA+MiDIklm7jMv33AHcrnx14CxhcYjJoEzWquYZPTXtS/lgNF7YOFGRxg8m4PFF4n640ORQI4Lhn74J0auh1rMWpDxMsfJml9r4r2aEBncLPaH2+6+gT4S5vHtjBnYVYuAZWEFJSpJyEq21mC+LIDEm1gX3GrP3GLJk8as9diZlkhqj5fv8HDnzEzC7GuWmI8lNDrMWP2JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vScpLzeCgkRB/AJvaibBwE/DpSCyziQRav85tYqRakw=;
 b=x988GfrWbNKgmioiHu83x43FGbO8VteJVtgNBlMPgYvE3voQC59BhQAsIIu9hS/s11MM5Pm7SJFPDWRG73KXJA/64+6uRmr9msKX1cZVUvz/TTzL/UinSo5mHhLlRzo3OOQExImt5bD7POirO+rSVrtqAxACQ4qfVlDbpkHWhX54wr29Z1g/sE+E7mbKCN2V72QnyCQz6Sf0Is25Oin/XPn/8QdVpm/aCBUAgaQqFpTJOw1XLSw4EMcN9QKX9hF7YE4x9AtZ3t8DE9sIgpi2Ebhri2V+uhGlXwyl1+vMMyoPYjSwXoW2tECwBx9uguKJlwjCVAgo/eBsSVXPmLkpaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vScpLzeCgkRB/AJvaibBwE/DpSCyziQRav85tYqRakw=;
 b=GV+rD+sxozat/UNgGY0LXsDCBhGf0bjAlyTwVoXn9Luu3B3cIbca9KlswOR2jg+niFWdgywhD9NgyaCGlt95bwD5MTuxD5Q5Ss/FWDP2Xf960oSA+crzSNu7LHngkjuPs+Wpi0CaTRCdlbGGepSwXpDJs+b+w6+gt2uVlAFCDwtRLz8ZKCqYNgN6c1lIET1HEEQXajSgLPQ+wsLdIXU5yhwjYsBpXzdihVIwPchdbijoTd9h2mZPJX+38uuJYIKPntJdpXLSI6CWOgcRpVD6il0ZDLhM4a4PnKkyyVqEM4Euj+B4fSgHqBr+lOvN0we3utyPVZAgyaTdsENbXwgwdQ==
Received: from SJ0PR05CA0034.namprd05.prod.outlook.com (2603:10b6:a03:33f::9)
 by CY5PR12MB6575.namprd12.prod.outlook.com (2603:10b6:930:41::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 10:27:04 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:33f:cafe::8) by SJ0PR05CA0034.outlook.office365.com
 (2603:10b6:a03:33f::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.19 via Frontend Transport; Wed,
 4 Mar 2026 10:27:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Wed, 4 Mar 2026 10:27:03 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 02:26:53 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 02:26:52 -0800
Received: from 5b171f0-lcelt.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Mar 2026 02:26:50 -0800
From: Wei-Cheng Chen <weichengc@nvidia.com>
To: <jckuo@nvidia.com>, <vkoul@kernel.org>, <neil.armstrong@linaro.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-phy@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <waynec@nvidia.com>, <wtsai@nvidia.com>,
	Wei-Cheng Chen <weichengc@nvidia.com>
Subject: [PATCH] phy: tegra: xusb: Fix per-pad high-speed termination calibration
Date: Wed, 4 Mar 2026 18:26:49 +0800
Message-ID: <20260304102649.3670783-1-weichengc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|CY5PR12MB6575:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ac05364-757f-442c-91f9-08de79d89448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	QJTOtYUiZKisyg7TOQkfsaKvdf+OZ59vzxHc8J/MtNP3TTbfY8oyhNyzYO6i+X+hPdze1NfHAtv5FhGeTkAlZ4iwmvg/TM9aZ+AaEKRadfBS9GQsGjCq3to7ognwI3LgEgkOFbZZycBcqYyhfvejPQwB+at52d7zRlg4W81HlmB9POZF1LkaWDl6igZ/KyVpxeG3GgkKDS7edKF1aylKOt4HwfUyKV6o/+/q5WYo+BSnrc9B+7jNDkafVvBSMogHZzGFmWd8C8X+BXP6PPKNNsev5GsQo2xv3L58cTBSOoitnfx37baG+6O2ukFnfqNrS5+QerQJdnGbLiv+nhLNKY9wJ355sgngnDqMtclkAKg5V9J0k+XOh20fE8FabgKmddh2v6sU7NqralzRc6WaYznUzDEOP1QYIe/Z9ek7JLb9IPqLH44F2dmK1yGx9xiqjRZ/FvG3+rRHwrcCoBUlQ9QkjU99JYMg3u19bjHNJztyRr14EJ50hlcBO/mBI3KdiTAPo/x2uZWnLUw8beJDnJKiBVdsPzaABTGSgZFl6kPPBmVz9c5QxETe/XZbNVJyNwsG6Skl6SEw63sA7vtnLGBe1ZOSlOwu1ur2pAO7NeCa6F8kX+36z/tD5DZ/yMLIrb8LJXMB4e5GKmYLHraCMgjUO2MZGh2LfjAQ3PquQoyRZo6hWCMz6QnNGRUppl6QAbWvM0cdQv8vs77fbxcbNyz0KxYUYe/XmFWraSQm8S1KT6pQo6za8OWX4mlf+9UKswz8vb2TC033EBQXzuWoBg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uInmFNRPEW9QNYEGxY6dhooAWQ6/G1IykxkOAJaFolm9btSnRkfGwwNgooUjnnYwdJeSmMe9SUmY00JMZpfSvgxQO8dqAGsywK+NHjWEAa3zZgrjyJwc2t6b4Yq3DKbswVk1Awm+3AnHoni970O/lkVpSz83ea6qWQhd1C1qnEmrDbneVWKvCFPoDJL7nPTxP4EpRvj1WRC6GNgRuPFLkmxE5+M+Jz9PpzvwGc9MJXj0H5j/zZt8OcLOJxVwMLH+Nbyq+rr6eZgyQwEr0gmJpJA9ekrhyfEF18Z2DFabXU4LWtCzvPz0spjALVjtEv+bKAIgKXOOEwCUdDLskXDoLCbrljfTBrxPJn1gaKFtVHbGJ5/LL/hGMpbduxLrBhI1c10KU1ACJV9Wp5mGCJPRFAX14rOY0OkHqXvvPPOU0Rmk5SFKDqa74SuGDSkKc+OR
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 10:27:03.9620
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ac05364-757f-442c-91f9-08de79d89448
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6575

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
---
 drivers/phy/tegra/xusb-tegra186.c | 33 ++++++++++++++++++++++++-------
 drivers/phy/tegra/xusb.h          |  1 +
 2 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index bec9616c4a2..4452e73fb82 100644
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
index d2b5f956513..810b410672f 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -436,6 +436,7 @@ struct tegra_xusb_padctl_soc {
 	bool trk_hw_mode;
 	bool trk_update_on_idle;
 	bool supports_lp_cfg_en;
+	bool has_per_pad_term;
 };
 
 struct tegra_xusb_padctl {
-- 
2.43.0

