Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793621814;
	b=2VYbXPTnuQEDXhFMyx64VWgo0Zh+reBnZvi5Z7f1ecN6mtK/2Grx2Sb10Po7HzKVRerc
	 PD3bqsRS7Oj543xJLle06IlwYxPXVGBHrsD17+pCv/NXEC/SvDk6AUN9UV+0vI2K1YgA6
	 k6uUUHRxR9hU5nOkCjzKaCvf67RYEOOFZdtxIA2VB5LwkK8BEy42F75jlgw0DFVJpRY2v
	 ximMq5BPAdmipkEEBLYlRM+BFPcVgROOxJH8jKqqAentf8rTevx8sDeeim6aOV2qtKatb
	 5aDx9qLqUkIuKr7PkwrHuAda9Mi64QltwvZjDn0TBqOuNkNVvqJUUFxIpHWbQjgoySQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621814;
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
	bh=WdbxVt6sBbh3ZVVu3wKkZjSItfhtmF4+pE1+g+q0DeE=;
	b=tVsjcPFMDqX45FJjnVm2EBbWwQeWe1/BroGFk9z6GIdJeTgssqAYw4bwnFHPfo2Q+80r
	 pnwtwpGjb6iTPIRn5NPgj7feYOOla3+P1JGDvLchJMosIL1pZFL3cSybcVextvqZc23SQ
	 G3kbTrkcj0NairCfE8PkOf1yjNHBXkt1Hdxe57HWAay03I1PQhS4DSBLQiHtCrxtwqAI+
	 bX4jxCmCXg6Ni9xsddKuXDRWpjIisP2HsI8FVxAU88RYOXLnLmXSGM9XZLAPW+dCd2sWP
	 kQBR/Fn+HSoUph35JDzY1DYVE3yvI4b32Z0pHrjg4cgxbtKaNu7GQNcdvkyDt46eVkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZZGvQlWJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.37
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011037.outbound.protection.outlook.com [52.101.52.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9401606A32C;
	Mon,  2 Nov 2026 12:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9401606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZZGvQlWJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h/qTTW/3uplgdZIcmPYltVOni6Pq+bvkq3SBu5tqmIrhA0OHkNyC89xxgUS6O8Hcfd2JMdGpKo0tZ1z5Qx3teSVqq4bEif09eRLjVgSl0qycbftKRjDFZEDYiPZXAWM5GoCtCI+JW4+NjdunA6aMOVvoNCLVQK+PcChhJoW9nwdHfP45N4W+DhqRxNFwuzNzpeELDW5Gd1fQ5Zw/wTBwqNx60gMOQZ8TFFNzCALWC4qLYry2utS3X1GcvWIqlmGcmQaQyQaybuqQZIBjjIJ2jq/icpO28xo2GldI8NRGFyHJH9SOyL4/T1fjwgvB3/a6uuHaqZGaXmEvt4LG7DQqgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdbxVt6sBbh3ZVVu3wKkZjSItfhtmF4+pE1+g+q0DeE=;
 b=nYhoKu+n7y5qCrRL5fFLL4x6FEpFnuoxecvHCM90VVUK+ejr2KLFVEYO+rLNASDMgDprQq4pnivB64I+CBh2g+KtxB0MY1RFgH3sFkqaJrwWQHX6UPYUnu3eIa48ZGljlvc5Qy2vf/ZCvUKi+zBLkRTiRp1YzHU5lJf0AJ/JKBGYMGXc3Aq3KdqVmnmAxdByYhIoi4GjjyF2Ok5N6MsBkEAYtymDdZgRzvZ58O7sSHXtaEe7sjLuZctbPQ8pgZF++B1svVVY8QHRbETDydWkwQlgpeCmgNApzh6bT8dOUQlwrIb/Fy+DeU9S/s2TjPNQKae+R/q+nC3NwfvNaKoNOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdbxVt6sBbh3ZVVu3wKkZjSItfhtmF4+pE1+g+q0DeE=;
 b=ZZGvQlWJ6RHpU+Irr/lMYEf2cNyXivV/ApHeKDh2X+/ja2kyUKnDw8JDToVncziCnfqp/RsyEjsiFgDiz3prvb6y3CB6w1b9hZOWt2ipJxA9cZsluNAwp7oi86HxvotU7YNXF/8DpZmpw1AsivcgL1eEVviKm7dxaXyR5svhYvCds+ZtU0t1tF0OV+3SElYXHYpsj4fsx3DsbvBUfHM0xf86cljliv8oyLmj+mm8+Tkm1/VboqF7GGxxZWEjruF8gVVEnNzfJQPjIT56uK8evGg7s4XTVV8VHN9UE2jFmLV2o7gwGVr5QRBCYT3CphchsVqRbcscfrr/egq6AhR49w==
Received: from CH0PR03CA0271.namprd03.prod.outlook.com (2603:10b6:610:e6::6)
 by SA1PR12MB6918.namprd12.prod.outlook.com (2603:10b6:806:24d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 12:12:44 +0000
Received: from DM3PEPF000265C1.namprd03.prod.outlook.com
 (2603:10b6:610:e6:cafe::34) by CH0PR03CA0271.outlook.office365.com
 (2603:10b6:610:e6::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 12:12:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM3PEPF000265C1.mail.protection.outlook.com (10.167.23.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 12:12:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 2 Nov
 2026 04:12:25 -0800
Received: from build-johnliu-noble-20261009.internal (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 04:12:24 -0800
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
Subject: [PATCH v3 3/4] firmware: tegra: bpmp: Add Tegra238 support
Date: Mon, 2 Nov 2026 12:12:01 +0000
Message-ID: <20261102121202.2431928-4-johnliu@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102121202.2431928-1-johnliu@nvidia.com>
References: <20261102121202.2431928-1-johnliu@nvidia.com>
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
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265C1:EE_|SA1PR12MB6918:EE_
X-MS-Office365-Filtering-Correlation-Id: b0277265-7393-42e9-c3a0-08df38da99eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|7416014|376014|261021121427099003|261022075727099003|261009223027099003|921020|11063799006|10067099003|56012099006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ItLohWvK0oaw5O0ZRgssQaA/xswGH1xwoJiKpMKMRWdClDl4Fhag5QzAv8iLNL7zsgM8d1axfv+g8DkxEdYXNcxKGd7Xb+m3naMI8OBVVEJ17Pbu6KSsQSv1fFszneLlfyDKckRjGgyPjnWwu5UKwYOJD9c/terq4/h7dY7YzwDRNzBEZS4r6eM5Di6jAoivrPXZe0NGr4X/O+Ku0VNjPCgODFIVrOiPQ8L20S9M6ccA4cFivtZn9GDU2OWtTwZzQ4pzh2iK6zEdSLzoTcDDK9uoWFlFlvTx5zTjSQ3KToMEK8zz9IF+FMLNb62SY1L7E43lkPPbBEtjwJN5LGxhdBcMit86VZlvzA3VplxZBjXG7pwG19fdHG7oqwsgjYNv5JElXJzMUQSBSKT/aJ71krU+KrUP9vFlGaSjqxH7CPtxyTBc8tZgi4H+vDR3n5EbkMjuaevSe4fyiCaCc8DIwvMn3r1FKrUIcFAYNiWqn0Iog7YSd1Exu8WzMMUxAPu4nCS8/W/WICEtdd0G5ieZJR/v4opLsEs7P817fQ+baoo9KqJ0tBidjp8yfb76kG3fLwv2hHCsbB+u4yAk/tHbY03RqW+/6MBiceweaTLLXonAp0Kz7uxd/ZBki8jeO4ADJ5aqP4cebhLvzfDDAXg5B+EAUNvnMrNw73UzD1zqro1VtTLAfg22wUYwhIhoPMXZ9WrZBw4sOpxVbtqkOnRq+2FfLPO5VR8JJLaHF+riyYv6e+ND8QHWiKTwENF+MAZv
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(7416014)(376014)(261021121427099003)(261022075727099003)(261009223027099003)(921020)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NoM305JRoM7wJqwL/UvAiT+mMlgX2Hk/Kfdk+z0z+E5Vjd5RSvcrSFhNAonqmoRUkvnBRvY7wh7VSXONYnCacAXAm0lsG3qdBYd4EloyFP63sBFZ7CSyOPVrdiH2B3f5yR0q1GZwU5M5vS2cgE/Y7Qozqa3T/qYOG6DcFv7cKyrjaBZmwnPop6VzaTVHeyQQ2W1sPkY7HvY2+HsJ++Ypl57Tn/QHj8wyMtmf+Mmcko9XDINpI/+6MkehvMeqNSNtPqINLs0gythjAhOb0BCCesIyUTdiU8t4IKRLaJDIIXQizCxQ/wdyiP1jPrcuZTBOyVBkryqEDKJe2eXNyklQka8w5IBDXDTKfMU7pzfoiiYvzxkzQX0QwdbSVV5QaR9jN6b+KyjDIYhrRQgfRoM5gsdaFPwpHOAc0a0RJYZALhBJDEruj+1jTxme9ymHtVdk
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 12:12:44.4959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0277265-7393-42e9-c3a0-08df38da99eb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265C1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6918

Tegra238 has its own BPMP compatible, "nvidia,tegra238-bpmp". Add
dedicated tegra238_soc data for it, including its EMC clock ID
(TEGRA238_CLK_EMC=43), and select it through the new compatible.

Also build bpmp-tegra186.o and the shared match table for
CONFIG_ARCH_TEGRA_238_SOC, so that a Tegra238-only configuration binds
the driver.

Signed-off-by: Johnny Liu <johnliu@nvidia.com>
---
 drivers/firmware/tegra/Makefile | 1 +
 drivers/firmware/tegra/bpmp.c   | 9 +++++++++
 2 files changed, 10 insertions(+)

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
index 5d97a8600fd1..06da888535dc 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -21,6 +21,7 @@
 #include <soc/tegra/bpmp-abi.h>
 #include <soc/tegra/ivc.h>
 
+#include <dt-bindings/clock/nvidia,tegra238.h>
 #include <dt-bindings/clock/nvidia,tegra264.h>
 #include <dt-bindings/clock/tegra234-clock.h>
 
@@ -1134,6 +1135,7 @@ static const struct dev_pm_ops tegra_bpmp_pm_ops = {
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
     IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
     IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC) || \
+    IS_ENABLED(CONFIG_ARCH_TEGRA_238_SOC) || \
     IS_ENABLED(CONFIG_ARCH_TEGRA_264_SOC)
 #define TEGRA186_BPMP_SOC_COMMON					\
 	.channels = {							\
@@ -1163,6 +1165,11 @@ static const struct tegra_bpmp_soc tegra234_soc = {
 	.emc_clk_id = TEGRA234_CLK_EMC,
 };
 
+static const struct tegra_bpmp_soc tegra238_soc = {
+	TEGRA186_BPMP_SOC_COMMON,
+	.emc_clk_id = TEGRA238_CLK_EMC,
+};
+
 static const struct tegra_bpmp_soc tegra264_soc = {
 	TEGRA186_BPMP_SOC_COMMON,
 	.emc_clk_id = TEGRA264_CLK_EMC,
@@ -1196,9 +1203,11 @@ static const struct of_device_id tegra_bpmp_match[] = {
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
     IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
     IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC) || \
+    IS_ENABLED(CONFIG_ARCH_TEGRA_238_SOC) || \
     IS_ENABLED(CONFIG_ARCH_TEGRA_264_SOC)
 	{ .compatible = "nvidia,tegra186-bpmp", .data = &tegra186_soc },
 	{ .compatible = "nvidia,tegra234-bpmp", .data = &tegra234_soc },
+	{ .compatible = "nvidia,tegra238-bpmp", .data = &tegra238_soc },
 	{ .compatible = "nvidia,tegra264-bpmp", .data = &tegra264_soc },
 #endif
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
-- 
2.43.0

