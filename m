Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794840723;
	b=d8s5yvb3qcaDtdzRELYsKBRUMBOkNeeMEddqAH/NZCwQD/TX2oqWuvOlQpSzL2S8h37S
	 tYRldOPcSqxNNnhVvKd6SgDkyFClTSAh93FxB89Mp0jGnFBiaxhjXb5QQnqZiHyOHGekA
	 BQgxGCLwOag5BVuoPncOGjyuHpClgiw5PBMqIZz7OFlukqogKPofNoyAqN131bv9nFTz0
	 drMOr1Epjg7TgJWoniuV9tnZF5hbKFSa3HPVLeHRanQkvuOUdRV8EZP5Bf4QYC4HkpwMJ
	 9/2Lam3pkWdiRcDr/I8uiBGg1tp/tCCb8vmYtxXtTlXcILFqtSJTqN+6hUzsJHDxwJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840723;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=+hITZa7/Gwisai+LilE1f/5GEPrH3XI/XyAjZq6XOnY=;
	b=FfT6g3JEtLPoJKGPzyEYbVUEGhBZKf08X9KREbO/Tx4XQLg6E+O4iqmJgu6Sbn1tY1jQ
	 A/wU4dBEOR/l4ln0DE3U1kXCGFeCzSH6AySTGiE3R4/Vr++WrHuDUYe7/fVKqiZjc9K75
	 VDes6ru/lDOhERF0DNCIOoGwIUSrYu4j5IiAW6I56hoxtFo07dnPBNsUQZXgr14mAJU5x
	 ypp8fT3uxgjsb6fi6QBedXoPCXCJJOvhUKnxtUtcCCDaZFM3dNAZcvBqokHUvjGPzCKxl
	 70BZybOXb+7HCpDI+y7Wsu6cHUMrwfmK4Hc+bCcL7+Ly79W3k2BnHG0OYtkHk1eJJfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ggJtRRNM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.54
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010054.outbound.protection.outlook.com [40.93.198.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C321606A323
	for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 14:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C321606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ggJtRRNM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Okf7GJrCPs1rfyGnTVyPWHKhaFVr1D/g0acOyBhxyw4QSJO6NmGFsJCypRIe3ECq6GQCxcPc70EpeoyVl4hAnDcWlhf+99qHlEPVenDXdaxyLRcFO+zOReQOsphc7YkHB+XuS6dC+kKWAfvI/ZK3CvQ40Jl2Xcw2szVsc48NuBwqYtB97FW5rn5HqdsAsfBRowWzJHjZHLIlCUkuLsCFfDjrMsvY6tu8dDaEelHYLBu7Y/aN8ib76waLejT6dqPEaPCvC48Mc+zqgpZtyYjnmxA73GlTPcaq0kYFGcv3WcQ4Tc/mzx5dgnxCmaOM0QR6IGdyhy6eLIag1vcAYrWZXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hITZa7/Gwisai+LilE1f/5GEPrH3XI/XyAjZq6XOnY=;
 b=Jog3inCccLeEnphPd493rjdV6Rgzzg3jM3/UzuFnNHTf85ZRARw4gF9/Z80Ohy7C31PIWjS9p8SxJChNeYUbeiWM/L3WIyK9Ik8676hI5xz/cdkq93algzEVx7myJ9iaC48V3VRqYq45cWFBb41SngWMlImB6kgbXuRhVn0RjkCX7ioWYlANrCg8SrTsPyST4qj0OU+qgewOIjjHqMq87n/aTCpRm/LQFV//e0E4Yv3XOGJN1Rf28qrDGje9TXvxotWE1bJIjsfRwzURBH4graz8EX84VZuizP0J0N0MFrbgWuM5a17jeYErl/w1wgGw56NX95z3BgZEqJ4QAEsqUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+hITZa7/Gwisai+LilE1f/5GEPrH3XI/XyAjZq6XOnY=;
 b=ggJtRRNMiSpOrGxchaiYPFk67z+I6EzxtJqBrvuKbspJkE/nH4LzFnwPxIn/zH86pOw4Dc0Z/Kkzg51GXh9EwFHr2nsukgupbaHIsY6t6dZIOTrTyXgfJUE3eMvQ3wVoD7pqlzobnJrcPMEWpIvwCmmAZzdQLsf+XPf/bY5/Djvq277JNhTMVLbtL2RvzmXL/OaK0Vn9xD6SPGGCAqy5kviV9o/y6pRzRiG1kUtB+Nc9KC94sMrALBRSVpU6kCv6/48vsN2Lrk5NsHoSmblmlOsAoSF6FoaYrNnYfPWO/YnJYYVywqWqd8XQpeCjbyUsTQReSo1PozziWtTsSKvsrQ==
Received: from SJ0P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::17)
 by SN7PR12MB8436.namprd12.prod.outlook.com (2603:10b6:806:2e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 14:51:56 +0000
Received: from SJ1PEPF000037A1.namprd04.prod.outlook.com
 (2603:10b6:a03:41b:cafe::55) by SJ0P220CA0008.outlook.office365.com
 (2603:10b6:a03:41b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 14:51:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000037A1.mail.protection.outlook.com (10.167.244.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 14:51:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 06:51:31 -0800
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 06:51:29 -0800
From: Jon Hunter <jonathanh@nvidia.com>
Date: Mon, 16 Nov 2026 14:51:16 +0000
Subject: [PATCH 2/2] phy: tegra: xusb-tegra186: Extend Tegra264 fuse
 calibration
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261116-tegra-phy-tegra264-v1-2-a82b8e10a553@nvidia.com>
References: <20261116-tegra-phy-tegra264-v1-0-a82b8e10a553@nvidia.com>
In-Reply-To: <20261116-tegra-phy-tegra264-v1-0-a82b8e10a553@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>, JC Kuo <jckuo@nvidia.com>,
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
CC: <linux-tegra@vger.kernel.org>, <linux-phy@lists.infradead.org>, Jon Hunter
	<jonathanh@nvidia.com>, Wayne Chang <waynec@nvidia.com>
X-Mailer: b4 0.16.1-dev
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A1:EE_|SN7PR12MB8436:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f0d1b86-fb80-4cee-e642-08df43f128d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|36860700016|1800799024|22082099003|18002099003|261009223027099003|11063799006|56012099006|261102123227099003|261028144727099003|10067099003|261026121527099003|261026140227099003|261022105027099003|261102130727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	B303qRk3B2Z3wgkdD+F/E0TTg7XcQYFJZTN4E66qn95PQlDyMNdJczd1ycw1nS1OsjF0MAmCAUqShWb2QLlN6AGWWJ5FWWT2rTOJfF0pYnaBibm8TB5gpBcbYVE13ZUj3CiVi6R0rY1lGX7hx5A1vi3WNl1gDD9pURX4noMeRD6RoeIvPaPSqDTjGKlMQrfbja9tcmmQeOZp4UGETBQG76VeKatLlFLyBv9OJTDNQaz/DhyccAgLNf7CVxzyFi8AHCuEDGhpit2eHVi+jnlftf+ZlR/GhD7slwJG6RgFr4qMeScPIy5/Bi0N9FNMuhyZnHle/NFVokwHRlHw2y2S1faaAubn6hbngCaQkCxTf5RvnQuiT8DaRIqAZhOWvTB4DGnCwn/SKNdLA7o9h4ZSBVvJFR0UbRnnNqfbcHspFD3DKCF+H+FpIDXf9s4kSR5TZPVKODxmeGJHyYW4FwyexrAFN/pxsi3+hsxALUrMcV9m3XGmBLTYSzytlTlS1g+X9+NEV+vpiBYjpKgt5tmevklrxQTNyt2/at+3BzGYQhopVvNKa/i/TBom3pqzZuVUdFL1AZ4lPxMy25PIE9gdbDMwQAreiPhuWIYUbDUqVRKziw0s3p3kkHkQMwzoNaofJX95GF1UkjvUt/hUrnF7aVaiAADIbm+PpbYc7kQ1IveNMqSOFWJDmU4xRhUuQ/kdXVbPGvXaY7x/KmDqVnHf3g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(36860700016)(1800799024)(22082099003)(18002099003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(10067099003)(261026121527099003)(261026140227099003)(261022105027099003)(261102130727099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HnBvQLfBz+7whaZ/31hCdAHWwLmUAmfMLhrB4QzdOC5zf6x8FVT2y09ucHiGmSyQ24Jho9R3HKTWK4FMywkzg6COD6A9RBeuI4hn4a2JZ2vZoFBVAC5CjDn9tB5r9fvDJGdHPwle3XyWhVUZXQGz8M93s5s5steEXOQXb1qSJsvWcvQlftsWNdqU6FU+dk/DY5o8zznX2q4EkeJlERAPxJkcbjwKFempBJ1m1x5XBWrlk7zTk09ZdayUf2TH05KjFrqqkb1fgN81X8p38IpjRRXhpOEfIrLZobotqAzpqPek9vJl4FEfotAWIa6LITK/GHa2djH362I0WrRI+kkSI1l0rRXXZeNKkGRo6pVr+fDhZ1Iutq1Xfqn9G6TfXVJByYFqSCea6Pqo4xzs4j0Y+Vqu4XWEHlMz/ZIF1iD/Gi7R+pxP5/GuPqoEyy4JNfRk
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 14:51:56.0716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f0d1b86-fb80-4cee-e642-08df43f128d3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8436

From: Wayne Chang <waynec@nvidia.com>

Add support for receiver offset and squelch offset calibration on
Tegra264 to compensate for manufacturing variation in the USB2
receivers. The receiver offset calibrates the receiver differential
offset between D+ and D-, while squelch offset calibrates the squelch
detector differential offset used to distinguish valid high-speed
signaling from low-amplitude noise or idle. Each USB2 port has a 4-bit
REC_OS (receiver offset) value and an 8-bit SQ_OS (squelch offset) value
stored in fuses.

Add a SoC data variable 'has_rec_sq_offsets' to indicate if the USB PHY
supports the REC_OS and SQ_OS register fields. If the USB PHY supports
these fields, then read REC_OS for ports 0-2 from FUSE_USB_CALIB_EXT_0
and for port 3 from FUSE_USB_CALIB_EXT3_0 and read SQ_OS for all four
ports from FUSE_USB_CALIB_EXT2_0. Apply these values to the corresponding
fields in each port's USB2 pad-control register when powering on the PHY.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/phy/tegra/xusb-tegra186.c | 57 +++++++++++++++++++++++++++++++++++++++
 drivers/phy/tegra/xusb.h          |  1 +
 2 files changed, 58 insertions(+)

diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index 82f5c6c8f6a8..8bfc340724e7 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -27,6 +27,10 @@
 
 #define RPD_CTRL_SHIFT			0
 #define RPD_CTRL_MASK			0x1f
+#define REC_OS_PADX_SHIFT(x)		(17 + (x) * 4)
+#define REC_OS_PAD_MASK			0xf
+#define SQ_OS_PADX_SHIFT(x)		((x) * 8)
+#define SQ_OS_PAD_MASK			0xff
 
 /* XUSB PADCTL registers */
 #define XUSB_PADCTL_USB2_PAD_MUX	0x4
@@ -81,6 +85,10 @@
 #define  TERM_RANGE_ADJ(x)			(((x) & 0xf) << 3)
 #define  RPD_CTRL(x)				(((x) & 0x1f) << 26)
 
+#define XUSB_PADCTL_USB2_OTG_PADX_CTL3(x)	(0x94 + (x) * 0x40)
+#define  REC_OS(x)				(((x) & 0xf) << 9)
+#define  SQ_OS(x)				(((x) & 0xff) << 14)
+
 #define XUSB_PADCTL_USB2_BIAS_PAD_CTL0		0x284
 #define  BIAS_PAD_PD				BIT(11)
 #define  HS_SQUELCH_LEVEL(x)			(((x) & 0x7) << 0)
@@ -255,6 +263,8 @@ struct tegra_xusb_fuse_calibration {
 	u32 hs_squelch;
 	u32 *hs_term_range_adj;
 	u32 rpd_ctrl;
+	u32 *sq_os;
+	u32 *rec_os;
 };
 
 struct tegra186_xusb_padctl_context {
@@ -935,6 +945,15 @@ static int tegra186_utmi_phy_power_on(struct phy *phy)
 	value |= RPD_CTRL(priv->calib.rpd_ctrl);
 	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
 
+	if (priv->calib.rec_os && priv->calib.sq_os) {
+		value = padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL3(index));
+		value &= ~REC_OS(~0);
+		value |= REC_OS(priv->calib.rec_os[index]);
+		value &= ~SQ_OS(~0);
+		value |= SQ_OS(priv->calib.sq_os[index]);
+		padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL3(index));
+	}
+
 	tegra186_utmi_pad_power_on(phy);
 
 	return 0;
@@ -1520,6 +1539,43 @@ tegra186_xusb_read_fuse_calibration(struct tegra186_xusb_padctl *padctl)
 
 	padctl->calib.hs_term_range_adj = hs_term_range_adj;
 
+	if (soc->has_rec_sq_offsets) {
+		u32 *sq_os, *rec_os;
+
+		sq_os = devm_kzalloc_objs(dev, u32, count);
+		if (!sq_os)
+			return -ENOMEM;
+
+		rec_os = devm_kzalloc_objs(dev, u32, count);
+		if (!rec_os)
+			return -ENOMEM;
+
+		for (i = 0; i < 3; i++)
+			rec_os[i] = (value >> REC_OS_PADX_SHIFT(i)) & REC_OS_PAD_MASK;
+
+		err = tegra_fuse_readl(TEGRA_FUSE_USB_CALIB_EXT3_0, &value);
+		if (err)
+			return dev_err_probe(dev, err,
+					     "failed to read EXT3 calibration fuse\n");
+
+		dev_dbg(dev, "FUSE_USB_CALIB_EXT3_0 %#x\n", value);
+
+		rec_os[3] = value & REC_OS_PAD_MASK;
+
+		err = tegra_fuse_readl(TEGRA_FUSE_USB_CALIB_EXT2_0, &value);
+		if (err)
+			return dev_err_probe(dev, err,
+					     "failed to read EXT2 calibration fuse\n");
+
+		dev_dbg(dev, "FUSE_USB_CALIB_EXT2_0 %#x\n", value);
+
+		for (i = 0; i < count; i++)
+			sq_os[i] = (value >> SQ_OS_PADX_SHIFT(i)) & SQ_OS_PAD_MASK;
+
+		padctl->calib.rec_os = rec_os;
+		padctl->calib.sq_os = sq_os;
+	}
+
 	return 0;
 }
 
@@ -1794,6 +1850,7 @@ const struct tegra_xusb_padctl_soc tegra264_xusb_padctl_soc = {
 	.trk_hw_mode = true,
 	.supports_lp_cfg_en = true,
 	.has_per_pad_term = true,
+	.has_rec_sq_offsets = true,
 };
 EXPORT_SYMBOL_GPL(tegra264_xusb_padctl_soc);
 
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index 086bb2d09bda..61df37d79ca3 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -436,6 +436,7 @@ struct tegra_xusb_padctl_soc {
 	bool trk_update_on_idle;
 	bool supports_lp_cfg_en;
 	bool has_per_pad_term;
+	bool has_rec_sq_offsets;
 };
 
 struct tegra_xusb_padctl {

-- 
2.43.0

