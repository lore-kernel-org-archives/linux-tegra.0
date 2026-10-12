Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010069.outbound.protection.outlook.com [52.101.85.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B8939CCFF;
	Mon, 12 Oct 2026 11:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791803833; cv=fail; b=Np1qW4Jt0VV64PhKdbVxnd2eARIRT0a/bkboZfV0QANhtsyQ3Bjrf1N0uNBczhwfzGxkmVTFfsBDlIRxHDvKkUjNahMhCp0Zb/5qr+Y5WJoHdjhmOiiy4vEssFT3+HDK8ZSgAPCV5kxjXJ34sLksfbbhSz6iNe8KWsC4B6Ao2TM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791803833; c=relaxed/simple;
	bh=KEADCCVFEqaPj2InjNJHWN3We2iRnptQ6F0fnAZX3aI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=A2koCB6xSaQUGtqJrQwHt47T+DQr8XGvqXYK0YiAhfdVW27lRpJBEO5L2X2IMeEjh9FRu8r1ms4wgIsgzUvzTegC1x3smIY2hP9FQa3zyRVLjUgQP2MZCFocDSOwAcUEu9zXk0Dp3/wqVpZiqrfZK4H5du1/3aqMYCW08mALds8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HnEkydDF; arc=fail smtp.client-ip=52.101.85.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HnEkydDF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VD7qdApwUy/oMMUJLYr4qe1KiuVDkFf9CNh1DzeilaRGxejCHEyxqc90leMg3CDKlRlzDIhTiaStKYFXQjwW4LjCxlhAy/gn/mdh7HDxJoD2rPT2YWdh1mdNf3rP9ckX0J2cX25FyCpj+qurZ1lGP9STb3dCqbVJ7MLLYSQxlJwFMyB9tnLQ3DB7bgT6LLdtN4St130SwCbpr0tr3DXIVV0Xaase0/C5P4t8IxRc2GMRZpCTT1ig8WFCRJykTNC56i5fNMZKq22LFCC6YFLWQ8AL02f8HHagFqGrN1jiW1itV0cQsw1BiaMTPi+67KeOrRwY3SDy38/1ByudWK/VhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJnOtqcMgvHApOR7UlStnggz4BHehBllnbzohQ7RD5k=;
 b=moVrqJ/5zbFZHV2GP4hY/RjUIGgG8JUgvSF83HerEnq+vhd/3U3JYCKJYb7MvARUxDJYaxxZY4Sy96NjjzfAZ+CVaiI5DhcY1Kyd0HR5PP4wB0DJnar5wxbQnKdikB5j7bl7Nd40gQKpQLHI2zTJ6olEATusuWzM+juIybP8/N2og3C9fY6Dks0oszJYdPNADPWxiL2rYWJ59K5ing1KlZQKoU7K5y9ijMsuPQ1zDrUEiSVZDTOe+60Rw7UfZ/AzLVH2p04bvKOkn3QO3FXKOR+VZ4J8R4DrNLrvWiDd+PECWrLuHuvTgM8AvAWfoxAFz11qCdQQu4uXYAYno8igQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJnOtqcMgvHApOR7UlStnggz4BHehBllnbzohQ7RD5k=;
 b=HnEkydDF8DeqfllJCApo6Nk+VnEJuCZQW5Ny+0wKXAdLk6UOt+9MNY1aT+x5uaTviRz0/l+/51aXr1cn4I8TyxN8u+9ghYog1zj7Q5KAl0mA9KtUBszHzzbIdkVWlbhFdDiNJ/zMSez2pf6PtPapBPQRujy1FQLpPMJgu96frssp+HSdr6XOFRW9olM2XfxjXllKb7doLXQzdeEcDhH7+AqWhoJpD4hkB6E97/yV15POEZeSG/7Rjr3MrQiPSKbqwaol9O4F16n3hLfUEolnDwspry+6spVyQj8gcpeZsJlUCNWYurHCpqu4/T+Z+EHxxi1JAPgGBkWej2V5TQJuMA==
Received: from CH0PR03CA0025.namprd03.prod.outlook.com (2603:10b6:610:b0::30)
 by SJ0PR12MB6928.namprd12.prod.outlook.com (2603:10b6:a03:47a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 11:17:07 +0000
Received: from CH1PEPF0000AD78.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::a4) by CH0PR03CA0025.outlook.office365.com
 (2603:10b6:610:b0::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon,
 12 Oct 2026 11:17:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000AD78.mail.protection.outlook.com (10.167.244.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 11:17:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 12 Oct
 2026 04:16:40 -0700
Received: from [127.0.1.1] (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 12 Oct
 2026 04:16:38 -0700
From: Jon Hunter <jonathanh@nvidia.com>
Date: Mon, 12 Oct 2026 12:16:31 +0100
Subject: [PATCH] phy: tegra: Clean-up Makefile for Tegra186
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261012-tegra-phy-v1-1-3241bf3c86e9@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAI7BzGoC/yXMwQpAQBRG4VfRXZtyR4hXkQXjx7VAM4jk3Q2WX
 53ORQ5W4KgILrLYxck8eXAYkBnqqYeS1pt0pFOOWKsVva3VMpwKecKGGVkcG/L9YtHJ8b3K6rf
 bmhFmfQd03w984ZBCbQAAAA==
X-Change-ID: 20261012-tegra-phy-e951c11e733c
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>, JC Kuo <jckuo@nvidia.com>
CC: <linux-phy@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
X-Mailer: b4 0.16.1-dev
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD78:EE_|SJ0PR12MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: 325632c5-9fb9-4325-c576-08df28525a03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|56012099006|11063799006|261009223027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8gOl9VWnenBBdMbvHhBgTvuNskPAhPBQEozdcAQphaS/JBjUw1AlJBc+gF0exdDzCxsLqJW/DrXQNYmgKRpGsJmx9zHk+2Y1dqmEOU7P3tF8b+WJ4wNYKndPWi7il9Qnr/vheKLZeJ9JImmsKoFQewGRgmn/rt5OjbYszZ3hbqnmNcdXEfoWfq7eg803x2Xe4eWn89ztEdsqZbAXmU3fKJ6eBnheZRMekSMJN8z/7YznAbYmJaEokE+JStEMl3QYMJBNy/OGo0/ZVZmDDwDLwJb3Pzc9nRsVAaSwul9Kt2LaILTz1sb5AvL+8QL8eh4tw88fmt6sbOh0QcPEzXhbXu1K7E5ZwXkD1LRsZg9IgTj/8bi+/d6Yvxu82rZNl2V571M1HPtcXfRP81llM0kgyWPwVMdIBAX7TkFnD6ABmYV+qJJ6JVNNf23JVPRDZ7a3MYTg7ONaqL9efHOqTuTsAWncjSwHP7Spf7K+aVF+Vv4gb523Jog9nAI1NxUMQ3wmvFu+nWQ2kcbfXu8OMogOW0JeTAVfVriMyrQQVUC5iWv3+VJrX0Vl2r/se/q4GmdlPefMPdxxuMhXiKmHDWU4J7/3/foL8Rd8aQEnLtRWiqgQJtLeEK1LtYkF79NcZlVunLbiinstQN2LQMx2tGqOltZi3Rihd5tqRG+kiVkWRS1u3ZhohUH2NXFT7JECgas3vXL6q8XXnpLWXanu9hoOow==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mnT2cGK7Vdulxm0p/cB2Y3AYp6fxVrMojxsJnxnvK4LxASx+Nyl7wVFhLm0ZDKJyzL21tiG8zFPJlsL1mcKjBz25bvi8e2/5jfvB5yU4Ljjz7JadGAjUa5bI+5G33LDgTI8wH/WLzN1jWQquhbu+7X9Ikp4rvbA4fAWcd3GAi94UYrlDcCKoxF+kLy6nO6+LUsxnxvZEqoeVKjFMqd2jDsH/ukr8tkcpUkaxgC4iykbhmyZw2neeVeKFfi24ilqrYbiZkTL1rUHs5GVBwIqly8uqCWKe4SDBfHB5BHUBplmXfVaxvjNx6MTkkMvbI7fjcqDwpxL/6CCI4sbli7I7rJV+/CQEU/x16mMyjEhE/un9epg1Q9c+faq+Djfl7I5UI/LFxCQw+49kVucZTWhYvnmatwCOLKpcU8lfVcvLoK51amOTxzgke+wcR7kOL8S7
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 11:17:07.1020
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 325632c5-9fb9-4325-c576-08df28525a03
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD78.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6928

The Makefile for the Tegra XUSB PHY driver has an entry for every Tegra
SoC that compiles the xusb-tegra186.c file. Clean this up by adding a
new Kconfig option called PHY_TEGRA186_XUSB that when defined compiles
the xusb-tegra186.c file.

Finally, update the xusb.[ch] files to use this new config option as
well instead of using the individual SoC Kconfig options.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/phy/tegra/Kconfig  |  6 ++++++
 drivers/phy/tegra/Makefile |  6 +-----
 drivers/phy/tegra/xusb.c   | 10 +---------
 drivers/phy/tegra/xusb.h   | 10 +---------
 4 files changed, 9 insertions(+), 23 deletions(-)

diff --git a/drivers/phy/tegra/Kconfig b/drivers/phy/tegra/Kconfig
index b5ed5bc0c8ef..bc14c1c443b1 100644
--- a/drivers/phy/tegra/Kconfig
+++ b/drivers/phy/tegra/Kconfig
@@ -11,6 +11,12 @@ config PHY_TEGRA_XUSB
 	  To compile this driver as a module, choose M here: the module will
 	  be called phy-tegra-xusb.
 
+config PHY_TEGRA186_XUSB
+	bool
+	default y if ARCH_TEGRA_186_SOC || ARCH_TEGRA_194_SOC || \
+		     ARCH_TEGRA_234_SOC || ARCH_TEGRA_238_SOC || \
+		     ARCH_TEGRA_264_SOC
+
 config PHY_TEGRA194_P2U
 	tristate "NVIDIA Tegra194 PIPE2UPHY PHY driver"
 	depends on ARCH_TEGRA || COMPILE_TEST
diff --git a/drivers/phy/tegra/Makefile b/drivers/phy/tegra/Makefile
index 018a4cab2b40..7d9c05149d6b 100644
--- a/drivers/phy/tegra/Makefile
+++ b/drivers/phy/tegra/Makefile
@@ -5,10 +5,6 @@ phy-tegra-xusb-y += xusb.o
 phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_124_SOC) += xusb-tegra124.o
 phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_132_SOC) += xusb-tegra124.o
 phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_210_SOC) += xusb-tegra210.o
-phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_186_SOC) += xusb-tegra186.o
-phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_194_SOC) += xusb-tegra186.o
-phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_234_SOC) += xusb-tegra186.o
-phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_238_SOC) += xusb-tegra186.o
-phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_264_SOC) += xusb-tegra186.o
+phy-tegra-xusb-$(CONFIG_PHY_TEGRA186_XUSB) += xusb-tegra186.o
 obj-$(CONFIG_PHY_TEGRA194_P2U) += phy-tegra194-p2u.o
 obj-$(CONFIG_PHY_TEGRA_MPHY) += phy-tegra-mphy.o
diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 89ce9ac87300..79a3624faa10 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -60,31 +60,23 @@ static const struct of_device_id tegra_xusb_padctl_of_match[] = {
 		.data = &tegra210_xusb_padctl_soc,
 	},
 #endif
-#if defined(CONFIG_ARCH_TEGRA_186_SOC)
+#if defined(CONFIG_PHY_TEGRA186_XUSB)
 	{
 		.compatible = "nvidia,tegra186-xusb-padctl",
 		.data = &tegra186_xusb_padctl_soc,
 	},
-#endif
-#if defined(CONFIG_ARCH_TEGRA_194_SOC)
 	{
 		.compatible = "nvidia,tegra194-xusb-padctl",
 		.data = &tegra194_xusb_padctl_soc,
 	},
-#endif
-#if defined(CONFIG_ARCH_TEGRA_234_SOC)
 	{
 		.compatible = "nvidia,tegra234-xusb-padctl",
 		.data = &tegra234_xusb_padctl_soc,
 	},
-#endif
-#if defined(CONFIG_ARCH_TEGRA_238_SOC)
 	{
 		.compatible = "nvidia,tegra238-xusb-padctl",
 		.data = &tegra238_xusb_padctl_soc,
 	},
-#endif
-#if defined(CONFIG_ARCH_TEGRA_264_SOC)
 	{
 		.compatible = "nvidia,tegra264-xusb-padctl",
 		.data = &tegra264_xusb_padctl_soc,
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index b9de4f3b5781..086bb2d09bda 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -505,19 +505,11 @@ extern const struct tegra_xusb_padctl_soc tegra124_xusb_padctl_soc;
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 extern const struct tegra_xusb_padctl_soc tegra210_xusb_padctl_soc;
 #endif
-#if defined(CONFIG_ARCH_TEGRA_186_SOC)
+#if defined(CONFIG_PHY_TEGRA186_XUSB)
 extern const struct tegra_xusb_padctl_soc tegra186_xusb_padctl_soc;
-#endif
-#if defined(CONFIG_ARCH_TEGRA_194_SOC)
 extern const struct tegra_xusb_padctl_soc tegra194_xusb_padctl_soc;
-#endif
-#if defined(CONFIG_ARCH_TEGRA_234_SOC)
 extern const struct tegra_xusb_padctl_soc tegra234_xusb_padctl_soc;
-#endif
-#if defined(CONFIG_ARCH_TEGRA_238_SOC)
 extern const struct tegra_xusb_padctl_soc tegra238_xusb_padctl_soc;
-#endif
-#if defined(CONFIG_ARCH_TEGRA_264_SOC)
 extern const struct tegra_xusb_padctl_soc tegra264_xusb_padctl_soc;
 #endif
 

---
base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
change-id: 20261012-tegra-phy-e951c11e733c

Best regards,
--  
Jon Hunter <jonathanh@nvidia.com>

