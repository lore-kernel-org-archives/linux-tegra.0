Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2049.outbound.protection.outlook.com [40.107.243.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF4B14374C;
	Tue,  9 Jul 2024 21:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720561670; cv=fail; b=Q7wUg+BzpUG1bZ9QW7qlVKPuZaeA84l7EzqZRISTgDoYAfoaeLfXZk5LM+4NQywlubiigwz689bF8+G8W/IkMdbwmv2L/a4SbF3xInbPHeO2RHNShNxud3cG3oXev/TyKomvdchKc7tlxBbBz/8ro4dLCN9yjM/4+rTL4hIfwDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720561670; c=relaxed/simple;
	bh=RT2KFS1TDiZsl5R/m1HisoICnymkzprZUOUet5+PdmU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tQSKVjVyjU0CcwEDgm7XiL7WzHn40LdfR6ddjQm4RIx790Vkw8kSyDexCjKzFu/kxQ7bDssh+Dl699iBYW1NvEHY/Jb6ltKxq44qJb+5Vt2D5dlJ/LPQaRrO1ePUxHbzMp8YgLPY7ggt10AIk59Tpk9F9ix6A5M789BUqt6tcbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IdrmmNOf; arc=fail smtp.client-ip=40.107.243.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IdrmmNOf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHradRu+Pi1EnozcMAsHTvKoDNICVkyBXgPrIuCid8bn75EjQej282M24nGEzWH9amKkwMZfwE0GSPhMOMLbRs9xxIAmquMc+6KzZPHj/sfmHKFlwNCTAAEHFcAnoGzWlBgkUVU5C5HTsTxyn3Zwe5d9uGO+Qtc4/TbkWhVdJ4rGin88V9lkE5cz1pXW/+7vgX7puo98YcH3PmxMFos9/BReW6ykXggK3dUi9bl5PAzjzYwNFWcNMUHYBpNJWKhd0URMREmD1hqezbrDnm9p7/wj15rhSI7I/Odv63QJBEmwwY/9B0w0jNAo/q1BzC8XHJ8hlwQY0oq4jG7rC710MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+iayTMhLi4MgKWrl8aoPyRqSBPrdqO1LUaeh5xAvHE8=;
 b=dAsfG8hrGc57yyLdKlhWJSduQM9gQk1D85snnSonwnqRXzR4UdC/6fkvHYRjES6bYBQoUH56wR+7mux2dUWFcg4sBFB4fgKiHYCw3LiZZnsxJrt3FfPS6GSK6pX2MUsL5NazNP8PQY/2urpjuzcciu4smzdt5Be4vAn3GsKiTafCTxPq/4Brte2RAxhYBGI9GPIZsc9IHNgNL0eRGOBBbKbf8qp+6LKroKiu9dhvCB7ddQkoBDR9ULkcmbbx8Ez6svGHoEzS/1QQkniHwDBqBcp/rSicCHJgarys741PpyHFAIgohk42IEmL2xShmXs/PicHfNdWxH/exssEjGe1nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+iayTMhLi4MgKWrl8aoPyRqSBPrdqO1LUaeh5xAvHE8=;
 b=IdrmmNOfgdIo/2Xa9dVAbu8BQecahpYKiivGVzgSEenq4mkuf15Ull2F5vSCEgUBoPBL3J5ZbOgM71n1UAwGHYW3oz1kJWznmOS1zzbMMKJDQ5hKi6QQ99XfDbyL6l/+6DC9z70f8QemigGX0337SzNGbRFShqjLC3WFe4FI0INgTx0w+Kl5FDZUlkPcNZt5E7Ntg0Pw6L3+MYI7sMPErMT5a+B2B2hUjDYMncQToQTDCUlaX0lykrY7XZaxBzifQ8Iw5a4DknZhnwq9BPiYaeKklyJHMyC0oPdQQQvzTSFQqdjgPKgsbKVE4yu0/1AMBboTMl89onpOB0f1yxrXNg==
Received: from SJ0PR13CA0171.namprd13.prod.outlook.com (2603:10b6:a03:2c7::26)
 by DM4PR12MB6040.namprd12.prod.outlook.com (2603:10b6:8:af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 21:47:45 +0000
Received: from CO1PEPF000044F3.namprd05.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::ef) by SJ0PR13CA0171.outlook.office365.com
 (2603:10b6:a03:2c7::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20 via Frontend
 Transport; Tue, 9 Jul 2024 21:47:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1PEPF000044F3.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 21:47:44 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 9 Jul 2024
 14:47:36 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 9 Jul 2024 14:47:35 -0700
Received: from l4tsclab4-2000.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 9 Jul 2024 14:47:35 -0700
From: Vedant Deshpande <vedantd@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "Brad
 Griffis" <bgriffis@nvidia.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
CC: Vedant Deshpande <vedantd@nvidia.com>
Subject: [PATCH] arm64: tegra: enable same UARTs for Orin NX/Nano
Date: Tue, 9 Jul 2024 21:46:09 +0000
Message-ID: <20240709214609.2472562-1-vedantd@nvidia.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F3:EE_|DM4PR12MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: 90263ed8-968a-439c-7940-08dca060c414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CS0f5EfxnDUrx+Hh64SO2ayGnFIilMuO16XdnKucm6Bp4U22KxaPIECCAA20?=
 =?us-ascii?Q?cUbFP9ziDtv7bwWRaJgP1wVMR/qthUvm36UMujoId+bbi0PZVY0fFjbAOwT/?=
 =?us-ascii?Q?3iFD6KY8SpCdxUB9N43MJxJmW7YdvAsgSzvAam38LKVsP2ZOnlvjxTetKK71?=
 =?us-ascii?Q?mPEU7GxCy//YRqKG90ifk8LSfDz21Wh8yUZP9oV42ZJKmMtHMG9Hhqo6Pqph?=
 =?us-ascii?Q?ZMBmllR8Eqn1yEKLK8qN0I3DTDQqJBM4XA900qGjEc7eTRumofPRmS2jOfId?=
 =?us-ascii?Q?307SHEwWO8w/X02+MFJzv0hyrAkr0kb6gfiUGUNYQiX0WWSUUwDyDDVDtHAi?=
 =?us-ascii?Q?CoXbYzMa0Q4LXCoxyFkx40VYX7jfHinmZScysbXOvF7TpIA7rMgiFHMdl75R?=
 =?us-ascii?Q?Y/9JiiO+JdK1Wva7W9FN0JBbYoF79nx8Fgy30jVKEHIVr4KmRZAlxkIpWsiF?=
 =?us-ascii?Q?JCHm1FCPcZQbU4lbnn51Lzs2TGIweqK/8noQKLUyrr8IFHBvBMyU1ibgTXQ3?=
 =?us-ascii?Q?QeYEQxrRTrzghOoh4NjuyBded6qs3XQJI/FrAtGF/qs8ZLGfORZXrOtDNCpS?=
 =?us-ascii?Q?upMldGcMzxTWtaAYmj7e5UU6kCbcys1fwo2Z39QFcMnFrUxuUTYGMf07vLgv?=
 =?us-ascii?Q?R8PbvqU9v39SYCVy9mKBz5oYRA9/BsCK44hJOMxKo60ADlf9NsFvfUg79erH?=
 =?us-ascii?Q?DiZgcYdZLki0lxpj6hOdQEC8N+Dql36jqf9YQoWwsE2t7ypPADfv5Zx27nh+?=
 =?us-ascii?Q?VHTf20wF/MzzoUT7i58T/Wi7fiFSaXHw6D/ePDPTodh74ZAF5+vYOLmuilha?=
 =?us-ascii?Q?4hw8ZMsiBoxljBSQolS3cWIY7dazjYFqdm6866ELVbhsSt80TUNnjXRNvveN?=
 =?us-ascii?Q?sxiO0pNvbm48BTVaBPKJQItvcZNx3nO56sWwa3OdVpw58T6MfnYAJnCAyQjt?=
 =?us-ascii?Q?0dHKFYoDEgqQ8p99gbNudEijFfEAwdXnh0WQWl7z80FmGaaMgjRq5Ui1sRHy?=
 =?us-ascii?Q?jw98QGIPgQO+sjqoP826bNHW/ateADeuBqVic8PMbxTVWVRlHVdHv8lHYvjU?=
 =?us-ascii?Q?oQQ8pNsymu2KgDljx1U+w6nPyT74VkObNoNc3ZLM3lglo7tLbfIK2Ug5c9vt?=
 =?us-ascii?Q?uhIH6Ii1e0nb1PtFcJiJz/Ba5sUjFXgcyTCqdjfk+t5MylCOFlGePfF5UPp+?=
 =?us-ascii?Q?bYdlGy3MW2YQdIQyPvyI7fhT0Xglpm/KIR7E2oF3mUgM5u/ISZE2pew4hUCz?=
 =?us-ascii?Q?rLLZFWWN9dFpzM8YMF8VIVLt8ftfas+qgA8UVIiDzIREbdhKYMjqmXQnOeC6?=
 =?us-ascii?Q?xp0QYEC5RxAQ6Usc8/6AdLRFz6VSv6scU1gbXyF2UXflkrdNv2TY58cDwP4s?=
 =?us-ascii?Q?SaBVAMd/2RYNd4w56vDqyOT2WFzoc2kNojPQjMw7NJO2XFbMLi7NPNU6SAt0?=
 =?us-ascii?Q?jFqgfLBVeAL4loLMWy01EVebxn5jtSks?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 21:47:44.5967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90263ed8-968a-439c-7940-08dca060c414
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6040

This patch ensures that Orin NX and Orin Nano enable an identical
set of serial ports. UARTA/UARTE will be enabled by adding
respective nodes to the board dtsi file.

Signed-off-by: Vedant Deshpande <vedantd@nvidia.com>
---
 .../nvidia/tegra234-p3768-0000+p3767-0000.dts   | 17 -----------------
 .../dts/nvidia/tegra234-p3768-0000+p3767.dtsi   | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
index 82a59e33c46c..5dc974bb360c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
@@ -7,24 +7,7 @@ / {
 	compatible = "nvidia,p3768-0000+p3767-0000", "nvidia,p3767-0000", "nvidia,tegra234";
 	model = "NVIDIA Jetson Orin NX Engineering Reference Developer Kit";
 
-	aliases {
-		serial1 = &uarta;
-		serial2 = &uarte;
-	};
-
 	bus@0 {
-		serial@3100000 {
-			compatible = "nvidia,tegra194-hsuart";
-			reset-names = "serial";
-			status = "okay";
-		};
-
-		serial@3140000 {
-			compatible = "nvidia,tegra194-hsuart";
-			reset-names = "serial";
-			status = "okay";
-		};
-
 		hda@3510000 {
 			nvidia,model = "NVIDIA Jetson Orin NX HDA";
 		};
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi
index 6d64a24fa251..81d4f4f12ab1 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi
@@ -9,6 +9,8 @@ / {
 
 	aliases {
 		serial0 = &tcu;
+		serial1 = &uarta;
+		serial2 = &uarte;
 	};
 
 	chosen {
@@ -16,6 +18,18 @@ chosen {
 	};
 
 	bus@0 {
+		serial@3100000 {
+			compatible = "nvidia,tegra194-hsuart";
+			reset-names = "serial";
+			status = "okay";
+		};
+
+		serial@3140000 {
+			compatible = "nvidia,tegra194-hsuart";
+			reset-names = "serial";
+			status = "okay";
+		};
+
 		i2c@3160000 {
 			status = "okay";
 
-- 
2.25.1

