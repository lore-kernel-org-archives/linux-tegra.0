Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793203596;
	b=ja4u3fah6NmJ7EninitY65k+HumeYPqiYOk0e41qrJvfgvsQHUih+A8YMEFs8nZ7Eenh
	 0xvYN8j9VwHSGVuRK+67LrxK0ldIeHxLUtchuM0bRU3w5BYOQNbMdciCkqdfu3z2bRmVB
	 qad5ybrCz0YNRGa5em9/D5HQvbGRIYu8kJfNqCaJtW+9VJ5A25fHlog/P7ZPmk9Gh9hCR
	 mG2KrKO3dzRlVvgQdPJhftLemQFrxfWH5VlIdQHkYZs2GznyFSWUhEw82aZ3o5tI25XKD
	 na1+aV52LnZ7ecWFbHWda/reFFdFMwYlHQ83mfmwwXgErawpe4/8N+pS3+7XOc0WAtw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203596;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
	 Content-Type:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=tGkZ37/zC06Ljml2cROQ5b9F/JqqDikx7jjKmAJ6A6A=;
	b=doCIMZz7nFu/ch4aA1M0AD+NzjF/VVIvsSaU2KmwPHWyytZRFmH+idvmPUPAYbQIt+Iq
	 AaLENyh1LVUPaEDyN+kmDxTDr6lQJp7UOn4bzBzo3teUmmVzTqISbRtdeb6IO1wGKRM2q
	 /bevdk0xdsqSHN8KPfeZemDQY0C9EjDSaUns1Gthk4wGI6CSYnE5Sk9DfxC5ZQyqSUHi8
	 FFUG5dWfS3ghsLGohaAbIBXjrOizbqIqEHN2q2l79SM2gjaVVmEHNHRb8OvD/zde+3icV
	 dH1v3f2mHFwRCMrC2VECFr532nvekKEaKxuM2JtVP447XgYM5qjdbyJoGKrRXelHsdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="YYFcX/Zu";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.57
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011057.outbound.protection.outlook.com [40.93.194.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF4860A5BC0;
	Wed, 28 Oct 2026 16:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DF4860A5BC0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YYFcX/Zu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iFIAj2fe5K2yvCA/i0e76F3wVd8Hvj4M83mImI9NU+DnjgwnDWiYYUw6lefssFL88+H22votjiHjViN1qoP//fO+TMcWpo02MtHACprtB5/iCiQxvYhZxkrysJ3j2SXoObmIxmcpNn7wHo9XHz5l89AMYOFI1NmcI9LylXccvoHs1j4drMdwSr2V/vmfj1OAa/56PlRXEfCCeknLeL8wm/9paj/tukX2jSTsRX+blJ8GnCEjOss/W+SGWlAyXRThYS91JWRu4El9GnWCDTNblj6ghYWazjOZWqFLm4fcwQ7l7XxzNeztZ7IqhTaxY7xmrFjMndcAaCZVUuXNX0ze5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGkZ37/zC06Ljml2cROQ5b9F/JqqDikx7jjKmAJ6A6A=;
 b=t922MaPe44ezCksl9bpR8/qHLQRJhwvY0Nbp3J5S/dNcLN0xi6hbVEAHwgFC7+2V20JkIEcCQ8aJCO1FFHbICnvP/pWb+vK1B9ekZ1Cz/5Zbg6t6BJS6xcO2HQnb9VPEdKXBH8pchsBkzu7fcP3sZ2s2BcaAhErtqNAbtNVT9sqvgUOLDwHHWNTWkak+GxoZ6VywaezYfdme2Af0zlHsBol+eL5X35cu3vuW2Zn8n72Cyk4H0Hziz6bLbGhqzO/MZnNvtErcicp7Tb91Fu+3nQVWlOjkARhWPcz+TPhVo7MJTY5h2k3TrLFvLnl3kAPkd1TlLW7/5zFTkHDWXeUtKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGkZ37/zC06Ljml2cROQ5b9F/JqqDikx7jjKmAJ6A6A=;
 b=YYFcX/Zu+/fAyBGV22c8OItsEEnrzUmzit5pPsoCylqVXtwNM2mpvz3t6RLYaBPqYs8Fd5BqNkCq9gmCgtXG1QhTxa4S5cYBEdCmKPojZVUFoNkAJCjzNxoKn708H5gPu2YsSa0vPrTOUKeiCmDVwYCP99m/T9J2rTiShj8NWGdRFkN3ye7QWXNbwJQANLbEsQKVSwnGyqwzRvhdty7yizLs92yRRqhz+TOWig7TsJLvF/QDi9SN8p8qUjBx3j9naONVX0V5ipS6BvPnc/a2Z8r7CC9y3dMxK7vt+i0/dmcb/OAee//h/MXFIhEiIrJAL6xNpHGgrKQRmeheUtB9kg==
Received: from CH2PR10CA0003.namprd10.prod.outlook.com (2603:10b6:610:4c::13)
 by SJ2PR12MB8883.namprd12.prod.outlook.com (2603:10b6:a03:538::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 16:05:58 +0000
Received: from CH01EPF000BE944.namprd02.prod.outlook.com
 (2603:10b6:610:4c:cafe::57) by CH2PR10CA0003.outlook.office365.com
 (2603:10b6:610:4c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 16:05:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH01EPF000BE944.mail.protection.outlook.com (10.167.244.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Wed, 28 Oct 2026 16:05:57 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 28 Oct
 2026 08:50:28 -0700
Received: from build-johnliu-noble-20261009.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 08:50:27 -0700
From: Johnny Liu <johnliu@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	"Prashant Gaikwad" <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, "Douglas Anderson" <dianders@chromium.org>,
	Aniruddha Rao <anrao@nvidia.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
CC: Johnny Liu <johnliu@nvidia.com>
Subject: [PATCH v2 2/4] firmware: tegra: bpmp: Add Tegra238 support
Date: Wed, 28 Oct 2026 15:49:58 +0000
Message-ID: <20261028155000.1205739-3-johnliu@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028155000.1205739-1-johnliu@nvidia.com>
References: <20261028155000.1205739-1-johnliu@nvidia.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH01EPF000BE944:EE_|SJ2PR12MB8883:EE_
X-MS-Office365-Filtering-Correlation-Id: 9963ff6e-30af-4f16-4a7c-08df350d5a88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|36860700016|1800799024|82310400026|921020|261021123027099003|11063799006|56012099006|261022075727099003|261009223027099003|261021121427099003|22082099003|10067099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	fnDOUuMLs1WT33aqrvkPRV7EoGKHbz4nXTmE9DDtIyDL31KixgDt9l7dtEY2aw8QwNniFrSXf8v3Gc/AFs4s956wXcSV/trUsI4hvfOnnMfPa0jE6/xtYxlqiDOzKcFiOc26VwCB8pegmG/Al61mSnVtRT8LhElImYa3ueXFZLYxmQg8SP6rZaeBudHictTcOfNh/4r7UhzMrhKy13F0BdgbU3MjAI1s4k9rEy0uGxASHMKkvvNKTGE3+5hL9eOQOZ04xu5K88pqlaw5RwVE4sDlpS4YGTTdmnqR8F1XHjBbprS6YGxB8MR/0CbSkXZruOR1jh+2lyeg2EYHPtFitnIVX+9gaItrU2bfpFu1391XZNDijZ3G2TecHmqGhXSSyAzI0gG/jRThX8rwNrxjszvzAOVOYJ7wBEt2bsiUILiVE+Pw+d2gqJQzCggW4c8fJ7EzRa0p+6VZAy/oa83bSObxFuowoYFLP11GN5GboJfA70XSg2rCNpL71qNdpj9nZVnGLW1n6wcSqHWDW1nZ5TCXVwFRL1QUrCgYKrUDWGx4+dWyBWbapRg9yqqitYzRyQCnVHyUH/Jek3Nk8AxcSt8jHSh1ZPMbbI6Ax5qzX/Rf7IftHHX83t+62jnR23NSP9eBgWk7EDc6qVQkgbaDmwyThfTWd8EaCqB3L86wUbUrj0rbyPK8PNKwGfSiahHCKVK275Br9IqRGppsv3SEFoCZXDn1s7pyTtD3wNVw7F0/557+Qxx0ipCtVQR+wLeZ
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(36860700016)(1800799024)(82310400026)(921020)(261021123027099003)(11063799006)(56012099006)(261022075727099003)(261009223027099003)(261021121427099003)(22082099003)(10067099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KdPl9FdGT4gASCBrjmEu0uyHh+PUUeJbzvC5prqS3NEBGByyutbEzQIDEKqYe8Xn6cRwMnAwmzGbnqKKnX/xQQrmNplD4YNWVjV682Zc5ylhNny0yDPUJu5jOo0KCaJlZbsvPbJ3m+ICXM3836qJZIB/H7twJJ/X6tvs5yaYullc+x7YGPmHxXDaHPfIp1fjlzanuz38aEqKvSffgPJoz7S/GNeIJ/kjrINbLatGwP8YUQHY/IPzr9pU3LPVAqQwCChb0zHIprmRsgm2e/F3e/1icT5y2Udq/vITaPo99fg5xJqWkjj+2k36IPcY2lvyeTxuAKAZKQSZM9KEU/H6tz3DSeuNB/3Ew2bDs4O/5QWKtJ7zGZCMvkpTBUAtlH8wdK5ak+XwFiR4lzVNQq3/gWa/naEbApo466LYuMS7tCcHzz10UiRhDdaX8UwECqRK
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 16:05:57.8091
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9963ff6e-30af-4f16-4a7c-08df350d5a88
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH01EPF000BE944.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8883

The "nvidia,tegra186-bpmp" compatible and tegra186_soc data are shared by
Tegra186, Tegra194, Tegra234 and Tegra264. Tegra238 has its own BPMP
compatible, so give Tegra234, Tegra238 and Tegra264 dedicated SoC data
selected through their specific compatibles, built on top of a common
TEGRA186_BPMP_SOC_COMMON initializer. This allows chip specific
properties to be described in the SoC data. Tegra186 and Tegra194 keep
using tegra186_soc.

Also build bpmp-tegra186.o and the shared match table for
CONFIG_ARCH_TEGRA_238_SOC, so that a Tegra238-only configuration binds
the driver.

Signed-off-by: Johnny Liu <johnliu@nvidia.com>
---
 drivers/firmware/tegra/Makefile |  1 +
 drivers/firmware/tegra/bpmp.c   | 54 ++++++++++++++++++++++-----------
 2 files changed, 38 insertions(+), 17 deletions(-)

diff --git a/drivers/firmware/tegra/Makefile b/drivers/firmware/tegra/Makefile
index 97f7a5db9d0a..21e87f3afffe 100644
--- a/drivers/firmware/tegra/Makefile
+++ b/drivers/firmware/tegra/Makefile
@@ -4,6 +4,7 @@ tegra-bpmp-$(CONFIG_ARCH_TEGRA_210_SOC)	+= bpmp-tegra210.o
 tegra-bpmp-$(CONFIG_ARCH_TEGRA_186_SOC)	+= bpmp-tegra186.o
 tegra-bpmp-$(CONFIG_ARCH_TEGRA_194_SOC)	+= bpmp-tegra186.o
 tegra-bpmp-$(CONFIG_ARCH_TEGRA_234_SOC)	+= bpmp-tegra186.o
+tegra-bpmp-$(CONFIG_ARCH_TEGRA_238_SOC)	+= bpmp-tegra186.o
 tegra-bpmp-$(CONFIG_ARCH_TEGRA_264_SOC)	+= bpmp-tegra186.o
 tegra-bpmp-$(CONFIG_DEBUG_FS)	+= bpmp-debugfs.o
 tegra-bpmp-$(CONFIG_SYSFS)	+= bpmp-sysfs.o
diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index d3508e98e338..beeb385870f5 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -1131,25 +1131,41 @@ static const struct dev_pm_ops tegra_bpmp_pm_ops = {
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
     IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
     IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC) || \
+    IS_ENABLED(CONFIG_ARCH_TEGRA_238_SOC) || \
     IS_ENABLED(CONFIG_ARCH_TEGRA_264_SOC)
+#define TEGRA186_BPMP_SOC_COMMON					\
+	.channels = {							\
+		.cpu_tx = {						\
+			.offset = 3,					\
+			.timeout = 60 * USEC_PER_SEC,			\
+		},							\
+		.thread = {						\
+			.offset = 0,					\
+			.count = 3,					\
+			.timeout = 600 * USEC_PER_SEC,			\
+		},							\
+		.cpu_rx = {						\
+			.offset = 13,					\
+			.timeout = 0,					\
+		},							\
+	},								\
+	.ops = &tegra186_bpmp_ops,					\
+	.num_resets = 193
+
 static const struct tegra_bpmp_soc tegra186_soc = {
-	.channels = {
-		.cpu_tx = {
-			.offset = 3,
-			.timeout = 60 * USEC_PER_SEC,
-		},
-		.thread = {
-			.offset = 0,
-			.count = 3,
-			.timeout = 600 * USEC_PER_SEC,
-		},
-		.cpu_rx = {
-			.offset = 13,
-			.timeout = 0,
-		},
-	},
-	.ops = &tegra186_bpmp_ops,
-	.num_resets = 193,
+	TEGRA186_BPMP_SOC_COMMON,
+};
+
+static const struct tegra_bpmp_soc tegra234_soc = {
+	TEGRA186_BPMP_SOC_COMMON,
+};
+
+static const struct tegra_bpmp_soc tegra238_soc = {
+	TEGRA186_BPMP_SOC_COMMON,
+};
+
+static const struct tegra_bpmp_soc tegra264_soc = {
+	TEGRA186_BPMP_SOC_COMMON,
 };
 #endif
 
@@ -1180,8 +1196,12 @@ static const struct of_device_id tegra_bpmp_match[] = {
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
     IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
     IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC) || \
+    IS_ENABLED(CONFIG_ARCH_TEGRA_238_SOC) || \
     IS_ENABLED(CONFIG_ARCH_TEGRA_264_SOC)
 	{ .compatible = "nvidia,tegra186-bpmp", .data = &tegra186_soc },
+	{ .compatible = "nvidia,tegra234-bpmp", .data = &tegra234_soc },
+	{ .compatible = "nvidia,tegra238-bpmp", .data = &tegra238_soc },
+	{ .compatible = "nvidia,tegra264-bpmp", .data = &tegra264_soc },
 #endif
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-bpmp", .data = &tegra210_soc },
-- 
2.43.0

