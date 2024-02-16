Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FD982889
	for <linux-tegra@vger.kernel.org>; Fri, 16 Feb 2024 12:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708086684; cv=fail; b=f8rQiaY+h5JFNT3eKCZq8/Px/x2B4H/p8Y06SloB5Gpm5EZw65QUhL2cL20Ots+2MxcYC2Pas4YCqlstseNMLB+wkBOJPvQS6S9XZep6P50ZQEE4xGWSuHL1QT8SyoKawrqrut4EHiu9diBWxPvdV1/S6texTFM/7h4VETVIDaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708086684; c=relaxed/simple;
	bh=ivCSWn0VWCoImlpSK3ZY8YziVnPx0lZN/vPnXXaKmHY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j6jKzDX3j+iPEAyLqsaAwPrs+2jclkiIt7qV9/jfuxGP0vkD6lNq135T6YYVpcA4UXJmjMEKyysfIQEtTRIXS2KJw1g1+JkqGvsjDoMHhnrZLSzgZMbKJwBb0XvOAh6ztH1Cv7lrTRTJqr5+Qr3C1FIi79/R0JIuLE0C7y8up9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bAEt66SN; arc=fail smtp.client-ip=40.107.94.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bAEt66SN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZS9XvnoNWrCwqZGG8LrOgjXePpi8edH6WV2yWUeqEtBxJusxdkplrsqNzglwGS/2Rzdy+nhdtI9Tqsg1fPpBMtvXxRT+faUh1OGfk3nLb3c0Nh4h25t10HU8TMBrSXJI3oqf75U6I54lc2BPcn9y6OnQiJtyf24nHNQSgao8E0zxzTuM97va2NV9TuGhvMvkjBk13qSCNp0uEa6rn4kpayIb3I1osqYg59w7GOvjW6Ko62105RI1pl+3VGR4tseW26ycHoHR0ln3Z3xZQcEsRXyDx4RYMsWQoEv3iM2qJ4dwucf5oSzQbNt5xx1fcOGxx7oT6WmMXAjs//DSkqOjHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PpqKCO6o+p9bEIUK1KrYnNgcmjXLSys34DFavAFOL6Y=;
 b=nRh03qCIJBF+Qcmeq36qQHVzp9Avdwwe3pgyjZnkv9KizOyjHGHi/Tmnzb406ER4dl9CI2C3NJTfZUzJWFPswGfiXG52B+E47vPRJ3a+zG0uIw8cn6FDVQC0CBKGlBqhdDq9xz4zZeD+wlOb+vMTfbXSoy55TRBn3Vddg5cl9zLYkbCYhAX2lNnPu7omGeun5b235zKsiMunIFsTF567NSl21TYvARTsmx5RVYid89agofp+0GZfX651xIK3oyOKIKpiKfGXeS0KdGQ79PN5VNXupsbBYwvetYvffHPSooQSopwy3ht1/Hygtaxlim1gUhxkOTs5uurJohVVF81YUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PpqKCO6o+p9bEIUK1KrYnNgcmjXLSys34DFavAFOL6Y=;
 b=bAEt66SNk3pv8l2sMozR8fdPBPNi31lne46GhvImnjssZ7FFYv0W2LWLz6QqxWniei03TUONvVeJUgBUJt6/ir96nghzWZmBvgsrw0jl3UaPHNtKNuC82GBWFTA+LWMkZuC8zC4eTxMDI1gaOL6R6WYr/d4SklU+3zW6soFewcDPTXxWe1kUTTAehvbN3t39gnUjTz4FKWF2rE2u4ZxH31ZF6BWlxT4jxT0UvVHo/JuecfF47vIxEyK3qDbshtIUk4CqvnjVxINdReEU8bdmzUiA56w4AqBqG5bFaE13vldq2xlImYTroErYnmJtURTc/GO62sI0geOQEiSyCpoeew==
Received: from CH0PR04CA0026.namprd04.prod.outlook.com (2603:10b6:610:76::31)
 by DS0PR12MB7900.namprd12.prod.outlook.com (2603:10b6:8:14e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.27; Fri, 16 Feb
 2024 12:31:20 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:610:76:cafe::e8) by CH0PR04CA0026.outlook.office365.com
 (2603:10b6:610:76::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39 via Frontend
 Transport; Fri, 16 Feb 2024 12:31:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 12:31:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 16 Feb
 2024 04:31:06 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 16 Feb
 2024 04:31:06 -0800
Received: from moonraker.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 16 Feb 2024 04:31:05 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Thierry Reding
	<thierry.reding@gmail.com>
CC: <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 3/3] memory: tegra: Add BPMP and ICC info for DLA clients
Date: Fri, 16 Feb 2024 12:30:57 +0000
Message-ID: <20240216123057.33018-3-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240216123057.33018-1-jonathanh@nvidia.com>
References: <20240216123057.33018-1-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|DS0PR12MB7900:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c899dfd-8acc-4e3d-d99c-08dc2eeb2ded
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iboYMGr2Po6cBoueBqud1HNjb07JJuDx5MnGPt1KgpYm6+q6gc4BsZLDHR8ktVL8eLDc5fwuQ6g9tX15pyX6ZqmcHxbsm1N1izldhUBw3PFMnObXyoZrwA1ydgD7zCs0uTFPS1tOOgNla2TLoDOQKgoZwqLyUaIeh3tcrCYvBHjp4ojg+xpdYOlieyFo5hYgnA3D3rfO1UJi/9o4SuFu+RUvzVL7Ohpzd4GY43tnyl2GySCnxcc5rZXw85UPpR9GRBkIFotWxP8j4acVItMhg/i+WiERRFRIUX//rHlizufpvXlUzYXNDWkbYhBSmK2gz+wsQAxkCKoiiiL2pM4+07c4RV3ic47yOru0vhkJRxbQMgn5YM6tVYrrv5cove3gqtTBLrCHdISlZy+2qi5hMNS7W3EYfvw3T9yUj3LzmBjwXieE9iD5nAFY39kMxDzZURtN6g1VAou+KHHGHjapqG5NfkVdxf+JCCpTFbrYOa0B9iMnFTM/UcINSDglhVSazaYOXufMY7sSR5QLwBkt0mYBDlD3HXc4ec4FaNKzoWwld3YsaLKtXdia0oobYqUszBhmFdfjFYQ+q1GLUzaB/9lNDQ1awTsqkjLR5U3JXDMt8IqjHbpG4e5m8olHFh4O/dlevKoRzMZQ0yF8UgEGr0CY1029ltC4VYs1AUkaGrw=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(396003)(136003)(346002)(230922051799003)(186009)(36860700004)(64100799003)(451199024)(1800799012)(82310400011)(46966006)(40470700004)(2906002)(8936002)(8676002)(5660300002)(4326008)(7696005)(336012)(356005)(7636003)(426003)(26005)(36756003)(82740400003)(1076003)(2616005)(54906003)(316002)(86362001)(70586007)(107886003)(110136005)(70206006)(478600001)(6666004)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 12:31:20.0960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c899dfd-8acc-4e3d-d99c-08dc2eeb2ded
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7900

Add the BPMP IDs and ICC type information for the Tegra234 DLA memory
clients.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/memory/tegra/tegra234.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/memory/tegra/tegra234.c b/drivers/memory/tegra/tegra234.c
index 27383eb08b45..5f57cea48b62 100644
--- a/drivers/memory/tegra/tegra234.c
+++ b/drivers/memory/tegra/tegra234.c
@@ -92,6 +92,8 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 	}, {
 		.id = TEGRA234_MEMORY_CLIENT_DLA0RDB,
 		.name = "dla0rdb",
+		.bpmp_id = TEGRA_ICC_BPMP_DLA_0,
+		.type = TEGRA_ICC_NISO,
 		.sid = TEGRA234_SID_NVDLA0,
 		.regs = {
 			.sid = {
@@ -102,6 +104,8 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 	}, {
 		.id = TEGRA234_MEMORY_CLIENT_DLA0RDB1,
 		.name = "dla0rdb1",
+		.bpmp_id = TEGRA_ICC_BPMP_DLA_0,
+		.type = TEGRA_ICC_NISO,
 		.sid = TEGRA234_SID_NVDLA0,
 		.regs = {
 			.sid = {
@@ -112,6 +116,8 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 	}, {
 		.id = TEGRA234_MEMORY_CLIENT_DLA0WRB,
 		.name = "dla0wrb",
+		.bpmp_id = TEGRA_ICC_BPMP_DLA_0,
+		.type = TEGRA_ICC_NISO,
 		.sid = TEGRA234_SID_NVDLA0,
 		.regs = {
 			.sid = {
@@ -122,6 +128,8 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 	}, {
 		.id = TEGRA234_MEMORY_CLIENT_DLA1RDB,
 		.name = "dla1rdb",
+		.bpmp_id = TEGRA_ICC_BPMP_DLA_1,
+		.type = TEGRA_ICC_NISO,
 		.sid = TEGRA234_SID_NVDLA1,
 		.regs = {
 			.sid = {
@@ -408,6 +416,8 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 	}, {
 		.id = TEGRA234_MEMORY_CLIENT_DLA1RDB1,
 		.name = "dla1rdb1",
+		.bpmp_id = TEGRA_ICC_BPMP_DLA_1,
+		.type = TEGRA_ICC_NISO,
 		.sid = TEGRA234_SID_NVDLA1,
 		.regs = {
 			.sid = {
@@ -418,6 +428,8 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 	}, {
 		.id = TEGRA234_MEMORY_CLIENT_DLA1WRB,
 		.name = "dla1wrb",
+		.bpmp_id = TEGRA_ICC_BPMP_DLA_1,
+		.type = TEGRA_ICC_NISO,
 		.sid = TEGRA234_SID_NVDLA1,
 		.regs = {
 			.sid = {
@@ -660,6 +672,8 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 	}, {
 		.id = TEGRA234_MEMORY_CLIENT_DLA0RDA,
 		.name = "dla0rda",
+		.bpmp_id = TEGRA_ICC_BPMP_DLA_0,
+		.type = TEGRA_ICC_NISO,
 		.sid = TEGRA234_SID_NVDLA0,
 		.regs = {
 			.sid = {
@@ -670,6 +684,8 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 	}, {
 		.id = TEGRA234_MEMORY_CLIENT_DLA0FALRDB,
 		.name = "dla0falrdb",
+		.bpmp_id = TEGRA_ICC_BPMP_DLA_0,
+		.type = TEGRA_ICC_NISO,
 		.sid = TEGRA234_SID_NVDLA0,
 		.regs = {
 			.sid = {
@@ -680,6 +696,8 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 	}, {
 		.id = TEGRA234_MEMORY_CLIENT_DLA0WRA,
 		.name = "dla0wra",
+		.bpmp_id = TEGRA_ICC_BPMP_DLA_0,
+		.type = TEGRA_ICC_NISO,
 		.sid = TEGRA234_SID_NVDLA0,
 		.regs = {
 			.sid = {
@@ -690,6 +708,8 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 	}, {
 		.id = TEGRA234_MEMORY_CLIENT_DLA0FALWRB,
 		.name = "dla0falwrb",
+		.bpmp_id = TEGRA_ICC_BPMP_DLA_0,
+		.type = TEGRA_ICC_NISO,
 		.sid = TEGRA234_SID_NVDLA0,
 		.regs = {
 			.sid = {
@@ -700,6 +720,8 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 	}, {
 		.id = TEGRA234_MEMORY_CLIENT_DLA1RDA,
 		.name = "dla1rda",
+		.bpmp_id = TEGRA_ICC_BPMP_DLA_1,
+		.type = TEGRA_ICC_NISO,
 		.sid = TEGRA234_SID_NVDLA1,
 		.regs = {
 			.sid = {
@@ -710,6 +732,8 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 	}, {
 		.id = TEGRA234_MEMORY_CLIENT_DLA1FALRDB,
 		.name = "dla1falrdb",
+		.bpmp_id = TEGRA_ICC_BPMP_DLA_1,
+		.type = TEGRA_ICC_NISO,
 		.sid = TEGRA234_SID_NVDLA1,
 		.regs = {
 			.sid = {
@@ -720,6 +744,8 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 	}, {
 		.id = TEGRA234_MEMORY_CLIENT_DLA1WRA,
 		.name = "dla1wra",
+		.bpmp_id = TEGRA_ICC_BPMP_DLA_1,
+		.type = TEGRA_ICC_NISO,
 		.sid = TEGRA234_SID_NVDLA1,
 		.regs = {
 			.sid = {
@@ -730,6 +756,8 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 	}, {
 		.id = TEGRA234_MEMORY_CLIENT_DLA1FALWRB,
 		.name = "dla1falwrb",
+		.bpmp_id = TEGRA_ICC_BPMP_DLA_1,
+		.type = TEGRA_ICC_NISO,
 		.sid = TEGRA234_SID_NVDLA1,
 		.regs = {
 			.sid = {
@@ -908,6 +936,8 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 	}, {
 		.id = TEGRA234_MEMORY_CLIENT_DLA0RDA1,
 		.name = "dla0rda1",
+		.bpmp_id = TEGRA_ICC_BPMP_DLA_0,
+		.type = TEGRA_ICC_NISO,
 		.sid = TEGRA234_SID_NVDLA0,
 		.regs = {
 			.sid = {
-- 
2.34.1

