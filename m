Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27A85B1F9
	for <linux-tegra@vger.kernel.org>; Tue, 20 Feb 2024 12:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708433095; cv=fail; b=R94OjKvb3ZYh6ZyjLyhW6p9g5IfKRE310C0FbQjtlyhPT+1Jbt//6PsDKfAagOUOVoYo8bpFzBwM0bU8r6RiiNCqxEBfziLRDBRXjU7A8fN0/YBHhnIvwzejzHry1FzC+aYwqW3Q5ryBC7230t+Tz6/KvkgOJAOMecJC1etNEcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708433095; c=relaxed/simple;
	bh=kdyS3/vYnHQIovQKMcdec9R8tLOkpG7PrFhDPcWg7fw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jxSKCzEtmUGDQajl/9/kPxdRl5Kfi1KaLhiAEDN+Jg4ouCLah50FdVxYkDNLRnu9t22e8+1xZS9zDA0YUsO/h89V2J4Z7lsU3ppBFw3dag7TcI4yv6IXEmSauX0SGMZM6iwlw1wKxpVYVdLxhyU/sruoJB3NAE/cP5I+NS5g+HQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qA9Ydbbg; arc=fail smtp.client-ip=40.107.223.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qA9Ydbbg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tn20I+H72XRovqptEy1V0x+6IoLtSVZqtjNtC9IN8WUvgIFPWUUYKdNVP0Q8DrXZWgSnzv8jv3k79X+dMEZ72IL+6ihg0o13FyRW88p/fKCdtmoXyYnUHVOGvnZgVTI1tsylxcPCXTYi8zsZERndA6HfF8phI+RtoXH4HnE9klpCo5AUezskwtOfA+7xBpguthMo7g2XTjdjCHpPo3ziWTAYxerJzW7r6C/PyYD7zbd0mzVt1wBc9ZISAKdlQ7CtgZyNQkYYWwG4aDvD5LJKTaXPTKIa3IzyaqQ0KfAoOK/P6XI/cWI/59aFzol7rLmLxt5nU2VyvG3IjWX5hXNPFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1D4W4pELPXou+unHqha6IGCc+JRIG2GZPU61BNMm/yk=;
 b=iWBPjbYBLGvMP5Ch1Pke2P7MNez/p2SLdLI3utjrYyOrQ1qLi050BTDTUzZDY29BZT4L062NK24k7JwE/tHmWiyav2R2rbjbmObX4syjNCTg4+yyUr7Sxl1hJuf0ybZ516PvObe/XuewoN3Q/jnH2uoi+VliWiqS/dOLHLoI5LTX8dpl/Sj6bhoouXigljpANbmqSuI/VKY04oLBz+FYAp1v+06FUxgvlKb+kz2iM4Nj/qEBmkg38e958aX2vk4sZS91ViCPTJ3+E2Gldw68S594Mi0BYeHDWZnG1StJbcZhpUNPCY3hJ2KCgEGm6rPr58aeD+4y1bSF+ZbvWhVg1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1D4W4pELPXou+unHqha6IGCc+JRIG2GZPU61BNMm/yk=;
 b=qA9YdbbgcLExlPoOMMU/ONofT0Y5r23RjYTeBmGSxpBiqXD9XHClM8vvAae+9eajR3HlpDyq4IpNoh1aaEp2DsR0jFXDdm/kpt07yi4A85WAnB5fl2LNJf52sE1LggvFKd65d3Rm9e5jpedDaFFY/9EzcDVFQj4xZ6ZFOghpcUAigo97jUYdFqbf8oq/hhDCddc+N26oonoFllT+eDEJZ9NPQcjBNygik6t6fENbRnK0CSVcZKtippJnuOfAdXEJTYTloD2PP7mtfwfDbnGQ29ux6M94AeoGIbrzNj6lOGnW/zjVxirLatm/3Nx6KUKKRt5xpEOSxn4dZG/qCXD9lQ==
Received: from CYXPR03CA0068.namprd03.prod.outlook.com (2603:10b6:930:d1::17)
 by MN0PR12MB6104.namprd12.prod.outlook.com (2603:10b6:208:3c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.19; Tue, 20 Feb
 2024 12:44:49 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:930:d1:cafe::df) by CYXPR03CA0068.outlook.office365.com
 (2603:10b6:930:d1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.40 via Frontend
 Transport; Tue, 20 Feb 2024 12:44:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Tue, 20 Feb 2024 12:44:49 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 20 Feb
 2024 04:44:35 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 20 Feb
 2024 04:44:34 -0800
Received: from moonraker.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 20 Feb 2024 04:44:33 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Thierry Reding
	<thierry.reding@gmail.com>
CC: <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 2/3] memory: tegra: Add BPMP and ICC info for DLA clients
Date: Tue, 20 Feb 2024 12:44:29 +0000
Message-ID: <20240220124430.19072-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240220124430.19072-1-jonathanh@nvidia.com>
References: <20240220124430.19072-1-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|MN0PR12MB6104:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e3c40eb-0c6d-4e96-5ac0-08dc3211b9f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ce5EjU+XYnpJ1o4c2xt1cwNa1A1CVpIA54smM4Ny53rURwLIuu+sru6evZ724i/d4Y0UeufwKYOtXNQ+mj2EepXPnlKymW8JrrjX25NmXIiOvEeodypgprKf67rQrjQEH138mRyB3o6xcds5ysA1GAaJWJHikbmQkIic08eBLbhIqD4wrDqNZPY1TR+OqNYL7Zasfha5jVAP4+8tZ0eClmfGU3FXvqrAHrsC3yr48OVqQ/X1LnVCJZtqfF8R7on9mYkIWrENePWJX1teKN9QIubbbHm1QT6miH3Te7ryANVJZAaQDfaTV088PSVanEnwfmQ3DlxZ136FkGTYqwXhb3Ae6SViGBHaUBkL1g84Aoj+rWSiUiISg/Vh16zmnGSkWTCY6S+whBDBn54tOXTXwOaUycZkcU0GJ+6Ock2/PT0pMuYfpEy1RTfRmVl+q5EuoijpKwtcR92C/rXWlla9l6ft0yDYNCTjFlNYHqOLObJGu6UwfUaN+ic/5zQ+d/TZjRdYwvNwLur+wPVvh16+rFzhd0th0Lff7WW6FF+G4t3aYbjOSK4S8gWt+/Bwb9EwnVQvJXxOukQvZ5drhtocoqtu4u10ERGaxHdgx9EwZHzpKc+Q1Nx2dEMU2+vKR3d99RctbxlAL7S9RxNP+aRihi6bHbMOk/ZUNWm4IftJUFM=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(36860700004)(40470700004)(46966006);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 12:44:49.3630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e3c40eb-0c6d-4e96-5ac0-08dc3211b9f8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6104

Add the BPMP IDs and ICC type information for the Tegra234 DLA memory
clients.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes since V1:
- None

 drivers/memory/tegra/tegra234.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/memory/tegra/tegra234.c b/drivers/memory/tegra/tegra234.c
index b8a7af2d36c1..d9cfd2eb0d7f 100644
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

