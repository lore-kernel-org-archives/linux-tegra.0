Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010053.outbound.protection.outlook.com [52.101.56.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397ED3D890E;
	Fri, 15 May 2026 17:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778865590; cv=fail; b=EYC3tuTP5ck4x9cJDUS9OU3NX+Yf+YlMuG/88UfYOHJJQgIbU/YiW7fECOMOF8nljq3P226SZKqeIYqsUdkFColPYoEdP2BuTLEYONU0AkRRJdzG6LEXnR5k0mS0soo4SUgW6esH1ghgCWQYCosW7DedcwSGauDUp+nK8o3f4Gg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778865590; c=relaxed/simple;
	bh=uLD0QgB/TuHztjJbsxbIp25CCFutWuJfguQFnOPzt8o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iw4nHhSTYu3scuQ7uHj03qR2Wy1sI1koWFsvTz+aqS5VbNFUUFvu7W7FqNJGlRPChyBg7WW/D+mmBAOZWP+vCTY0Somw3TEk6qu+z6Aepuhn+ZkLrTmog6Q0fzJZ7tj87X32fFD9EJYHsLeVoG0dLLmLJ/US8H1uuoJpxyA3Zd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NGoQbm7o; arc=fail smtp.client-ip=52.101.56.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NGoQbm7o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X0lZFml5LQdJBAvj4GI5HrAlUz3FwE6V0Tr/NCBd/ykGUq7NEI4QTVzsduqj2D4gRTLh+2m77k9AI3k6D/msxjsd+kcYa/ndVEKdK+RXajU6x7elXiD+nyHP4aBg64dayRCX6jHrllu9L2GyNplal/6QoBJ/gTgsbnncVx7SoiLuMlN+z9Dr7WILKBR/Q3CKZ6CGkzRf2ybQeLmwyIYH5mrTv8+8l59tA4CyAU4O32r2fvyMC0lBYNhrjvFMbHVSY/SWhfOzPMbvE0o1+IPzrIQiGWGnfCbnF6vJHVpoxpqVkJvs04HZyCdLv4xzVyMmOO48ImmRtTOx68De4M8Oug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wS7WCflK3Ft6Jtrg1EgtN305HImCm/5CI9jF7VAAwmg=;
 b=eybsT67NiysObsAEb1Scew8u0/p9aFrOc2FFTNe7V/+iCgwY1QFWsS+K6KwtftM9ErWeidFNczxjGyeB89QdfvKzXEF8tbs/FAvvxVTN9v5A4X0G/B2nyUsN4sW+BsCX+SZzXeIW/CmVrca+0WUiL5o0kdjXmdGyxjonR5i6h0JclgmBGXmUeb2HtWp+G4yZwXyW21OfBRLUeP7tuN7XEnze0dztJYHM2UjNSv4R/904vCqkWB2o81hdDDIJxayZG9dLIrIXXRTdfL+vA98/YIivMNELUw6YR584iR2SP2lEQUwJnCzQ6VtowDKfc5M7ZRubduveaw8Bd7V+AlBFAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wS7WCflK3Ft6Jtrg1EgtN305HImCm/5CI9jF7VAAwmg=;
 b=NGoQbm7oeajPHcJqfQAl7eGUaifgXe64Qnu8lLc9ygK2dQ67L3qnNPwDWWVS78nrGLyxifVCT5aXpz85yJ1wGTLuEzyo/iHQWH8fBqknLmCfrFtqVPZze6JoijGJClUPAUEif86/P0V9PjQChg+Ucq3cffZ0+1um+AcKJD2CfeSS+LqMFjWnZRV6I0BxED5Zv27QJ11f8V8cIZsbNlL412KoC7FeLc2B6NvWyYW05x+l/UmlEp0AV2lKkvH3vzfxFKtx2J8NkA8fTj/KVoLRxN28CgSdspBzaaeinXFxAeXlBCgZ0XmNtddKYKXKA3CSorOVivhKRPxh5PPUhSL7ow==
Received: from CH0PR07CA0004.namprd07.prod.outlook.com (2603:10b6:610:32::9)
 by CH2PR12MB4199.namprd12.prod.outlook.com (2603:10b6:610:a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Fri, 15 May
 2026 17:19:34 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:610:32:cafe::13) by CH0PR07CA0004.outlook.office365.com
 (2603:10b6:610:32::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.20 via Frontend Transport; Fri, 15
 May 2026 17:19:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS3PEPF000099DE.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Fri, 15 May 2026 17:19:33 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 15 May
 2026 10:19:17 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 15 May
 2026 10:19:16 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 15 May 2026 10:19:13 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <krzk@kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<robh@kernel.org>, <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH] memory: tegra264: Add full set of MC clients
Date: Fri, 15 May 2026 22:49:11 +0530
Message-ID: <20260515171911.1929868-1-sumitg@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|CH2PR12MB4199:EE_
X-MS-Office365-Filtering-Correlation-Id: 70230c60-17e8-4145-2073-08deb2a6222a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|3023799003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	urB/AcsgZH9eR/6ncykOT2E86G23XSlM0pAISiy+PjniPISokbtBJUsnViU3jpUs8ujJrYRTzdnnFiXNNF3gu8VSnhZWDzoa4KTsdvwyMLUO/KCAeqEq7RwvJpMPfubwAQ0cbFq8Nup/7DuFPQrq+es/ePpJt/30XrDNzyq/21n3oFzQrvf4CxHnpQcUmREW9L8O3l17+DjTVYnWBINc7wnv5rZoe6BrXi8gw0W0H3UBj8VWCrLxF6zMLbtvtSXWJgvU4pPFQUBENLieM3hn94Cr5y7YC0uZ/hczwNuxzlabrhq1suoQPuRgVs/h4fvjF2d9etCoUeiakv7Wh38T1NeHwESNxIPt63qdgWq2QLqyaQuOT3F3x6D0n62Z6YiRW1l+2a4hsfWyEzcVGWdHAyXrdWl91X7Yc2B20apnS+aCnsEtT5UEHytp+haHjWn9nl8BmrraPKJo7nZ5oWIkliHY0oVyRbdE1PRbMDKxXqyMLurIVprtCO/OMzpPuw1FO8hEYNK6l9eLpY2AeUC0e/uk53fz0VXYiVTzOHFWe/01kLdEntsD+IFC5xmdgrUS91m8sHYRqaGyN63xRTmy2+GtZIhokwrudaZyRjNexyzehT4BzXuuYYGP8ULomn/0M1w0wgwPr7yQBBcD2f13iFt0nkLB0V45/yvOJzvC76htxFQ0mwnpS74v01sUDbhsyJvdJiq6OSTSDKeJZGTIxhmgXjopVq8+hAAEyf6znzo=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(3023799003)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4Wvf/EkSVaBZidHDXryFJuUkakbML+SIlHEKVeeMbD5ZjEDF8HV9WaCVWPI1Mb7aPw42U8TGIVSvfJAEgLN+phzHdN58MhOgDkx+CHxodt6z5yDmZS/AJ1vmNGZaBfUATJq3vQffn1IvchTaSUrmW62bt6C8wmK0Y9wQNiXbHtcXYcvdMQQs0x5v/E5mrHy2UoLt7Btieo45HROFdoF6h2p1uktg9JL55k+nfOedhAia6/gwCM9y4W5V9iKCZE6OMdHKPnL/LycIg9V71HBtw0Nren8U9F2ska0y1aRoy9zKnOoXYPyNz0wMNmdbasycH34zDRLoJgeS1SBgiUkScML8+6IAbT8/JF2UuHMKpf9EnL4uC8nOvsUVW4fh4S//xUl8Tw3eSVag7T5L0SjiLM1SApzId7CU8ErN/88voit8yBH5pWMy4wPl/h4X3Eip
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 17:19:33.9198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70230c60-17e8-4145-2073-08deb2a6222a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4199

Extend the Tegra264 MC dt-bindings header and tegra264_mc_clients
table to cover the full set of memory clients exposed by the SoC.
Client name is used for MC fault reporting. Clients managed by the
bandwidth manager in BPMP additionally carry their bpmp_id and type.

Entries in tegra264_mc_clients[] are sorted in increasing order of
their client IDs, which matches the order of the override and
security register offsets used in previous SoCs.

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 drivers/memory/tegra/tegra264.c              | 564 +++++++++++++++++--
 include/dt-bindings/memory/nvidia,tegra264.h | 287 ++++++++++
 2 files changed, 819 insertions(+), 32 deletions(-)

diff --git a/drivers/memory/tegra/tegra264.c b/drivers/memory/tegra/tegra264.c
index e43ef14da1ee..4e7c5ef126f4 100644
--- a/drivers/memory/tegra/tegra264.c
+++ b/drivers/memory/tegra/tegra264.c
@@ -21,45 +21,62 @@
  */
 static const struct tegra_mc_client tegra264_mc_clients[] = {
 	{
-		.id = TEGRA264_MEMORY_CLIENT_HDAR,
-		.name = "hdar",
-		.bpmp_id = TEGRA264_BWMGR_HDA,
-		.type = TEGRA_ICC_ISO_AUDIO,
+		.id = TEGRA264_MEMORY_CLIENT_PTCR,
+		.name = "ptcr",
 	}, {
-		.id = TEGRA264_MEMORY_CLIENT_HDAW,
-		.name = "hdaw",
-		.bpmp_id = TEGRA264_BWMGR_HDA,
-		.type = TEGRA_ICC_ISO_AUDIO,
+		.id = TEGRA264_MEMORY_CLIENT_HOST1XR,
+		.name = "host1xr",
 	}, {
-		.id = TEGRA264_MEMORY_CLIENT_MGBE0R,
-		.name = "mgbe0r",
-		.bpmp_id = TEGRA264_BWMGR_EQOS,
-		.type = TEGRA_ICC_NISO,
+		.id = TEGRA264_MEMORY_CLIENT_MPCORER,
+		.name = "mpcorer",
 	}, {
-		.id = TEGRA264_MEMORY_CLIENT_MGBE0W,
-		.name = "mgbe0w",
-		.bpmp_id = TEGRA264_BWMGR_EQOS,
-		.type = TEGRA_ICC_NISO,
+		.id = TEGRA264_MEMORY_CLIENT_PSCR,
+		.name = "pscr",
 	}, {
-		.id = TEGRA264_MEMORY_CLIENT_MGBE1R,
-		.name = "mgbe1r",
-		.bpmp_id = TEGRA264_BWMGR_EQOS,
-		.type = TEGRA_ICC_NISO,
+		.id = TEGRA264_MEMORY_CLIENT_PSCW,
+		.name = "pscw",
 	}, {
-		.id = TEGRA264_MEMORY_CLIENT_MGBE1W,
-		.name = "mgbe1w",
-		.bpmp_id = TEGRA264_BWMGR_EQOS,
-		.type = TEGRA_ICC_NISO,
+		.id = TEGRA264_MEMORY_CLIENT_ISP0R,
+		.name = "isp0r",
 	}, {
-		.id = TEGRA264_MEMORY_CLIENT_SDMMC0R,
-		.name = "sdmmc0r",
-		.bpmp_id = TEGRA264_BWMGR_SDMMC_1,
-		.type = TEGRA_ICC_NISO,
+		.id = TEGRA264_MEMORY_CLIENT_MPCOREW,
+		.name = "mpcorew",
 	}, {
-		.id = TEGRA264_MEMORY_CLIENT_SDMMC0W,
-		.name = "sdmmc0w",
-		.bpmp_id = TEGRA264_BWMGR_SDMMC_1,
-		.type = TEGRA_ICC_NISO,
+		.id = TEGRA264_MEMORY_CLIENT_ISP0W,
+		.name = "isp0w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_ISP1W,
+		.name = "isp1w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_ISPFALCONR,
+		.name = "ispfalconr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_ISPFALCONW,
+		.name = "ispfalconw",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MGBE2R,
+		.name = "mgbe2r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_OFAR2MC,
+		.name = "ofar2mc",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_OFAW2MC,
+		.name = "ofaw2mc",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MGBE2W,
+		.name = "mgbe2w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MGBE3R,
+		.name = "mgbe3r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MGBE3W,
+		.name = "mgbe3w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SEU1RD,
+		.name = "seu1rd",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SEU1WR,
+		.name = "seu1wr",
 	}, {
 		.id = TEGRA264_MEMORY_CLIENT_VICR,
 		.name = "vicr",
@@ -70,6 +87,15 @@ static const struct tegra_mc_client tegra264_mc_clients[] = {
 		.name = "vicw",
 		.bpmp_id = TEGRA264_BWMGR_VIC,
 		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_VIW,
+		.name = "viw",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_XSPI0R,
+		.name = "xspi0r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_XSPI0W,
+		.name = "xspi0w",
 	}, {
 		.id = TEGRA264_MEMORY_CLIENT_APER,
 		.name = "aper",
@@ -80,6 +106,48 @@ static const struct tegra_mc_client tegra264_mc_clients[] = {
 		.name = "apew",
 		.bpmp_id = TEGRA264_BWMGR_APE,
 		.type = TEGRA_ICC_ISO_AUDIO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SER,
+		.name = "ser",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SEW,
+		.name = "sew",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_AXIAPR,
+		.name = "axiapr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_AXIAPW,
+		.name = "axiapw",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_ETRR,
+		.name = "etrr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_ETRW,
+		.name = "etrw",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_TSECR,
+		.name = "tsecr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_TSECW,
+		.name = "tsecw",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_BPMPR,
+		.name = "bpmpr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_BPMPW,
+		.name = "bpmpw",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_AONR,
+		.name = "aonr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_AONW,
+		.name = "aonw",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_GPCDMAR,
+		.name = "gpcdmar",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_GPCDMAW,
+		.name = "gpcdmaw",
 	}, {
 		.id = TEGRA264_MEMORY_CLIENT_APEDMAR,
 		.name = "apedmar",
@@ -90,6 +158,36 @@ static const struct tegra_mc_client tegra264_mc_clients[] = {
 		.name = "apedmaw",
 		.bpmp_id = TEGRA264_BWMGR_APEDMA,
 		.type = TEGRA_ICC_ISO_AUDIO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MIU0R,
+		.name = "miu0r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MIU0W,
+		.name = "miu0w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MIU1R,
+		.name = "miu1r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MIU1W,
+		.name = "miu1w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MIU2R,
+		.name = "miu2r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MIU2W,
+		.name = "miu2w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MIU3R,
+		.name = "miu3r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MIU3W,
+		.name = "miu3w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MIU4R,
+		.name = "miu4r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MIU4W,
+		.name = "miu4w",
 	}, {
 		.id = TEGRA264_MEMORY_CLIENT_VIFALCONR,
 		.name = "vifalconr",
@@ -110,6 +208,12 @@ static const struct tegra_mc_client tegra264_mc_clients[] = {
 		.name = "rcew",
 		.bpmp_id = TEGRA264_BWMGR_RCE,
 		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_NVENC1SRD2MC,
+		.name = "nvenc1srd2mc",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_NVENC1SWR2MC,
+		.name = "nvenc1swr2mc",
 	}, {
 		.id = TEGRA264_MEMORY_CLIENT_PCIE0W,
 		.name = "pcie0w",
@@ -185,6 +289,402 @@ static const struct tegra_mc_client tegra264_mc_clients[] = {
 		.name = "nvdecswr2mc",
 		.bpmp_id = TEGRA264_BWMGR_NVDEC,
 		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MIU5R,
+		.name = "miu5r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MIU5W,
+		.name = "miu5w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MIU6W,
+		.name = "miu6w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_RISTR,
+		.name = "ristr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_RISTW,
+		.name = "ristw",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_OESPR,
+		.name = "oespr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_OESPW,
+		.name = "oespw",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MIU7W,
+		.name = "miu7w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MIU8R,
+		.name = "miu8r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MIU8W,
+		.name = "miu8w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MIU9R,
+		.name = "miu9r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MIU9W,
+		.name = "miu9w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_PMA0AWR,
+		.name = "pma0awr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_NVJPG1SRD2MC,
+		.name = "nvjpg1srd2mc",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_NVJPG1SWR2MC,
+		.name = "nvjpg1swr2mc",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SMMU0CTWR,
+		.name = "smmu0ctwr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SMMU0CMDQVR,
+		.name = "smmu0cmdqvr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SMMU0CMDQVW,
+		.name = "smmu0cmdqvw",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SMMU0EVNTQW,
+		.name = "smmu0evntqw",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SMMU1PTWR,
+		.name = "smmu1ptwr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SMMU1CTWR,
+		.name = "smmu1ctwr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SMMU1CMDQVR,
+		.name = "smmu1cmdqvr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SMMU1CMDQVW,
+		.name = "smmu1cmdqvw",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SMMU1EVNTQW,
+		.name = "smmu1evntqw",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SMMU2PTWR,
+		.name = "smmu2ptwr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SMMU2CTWR,
+		.name = "smmu2ctwr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SMMU2CMDQVR,
+		.name = "smmu2cmdqvr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SMMU2CMDQVW,
+		.name = "smmu2cmdqvw",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SMMU2EVNTQW,
+		.name = "smmu2evntqw",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SMMU0CMDQR,
+		.name = "smmu0cmdqr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SMMU1CMDQR,
+		.name = "smmu1cmdqr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SMMU2CMDQR,
+		.name = "smmu2cmdqr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_APE1R,
+		.name = "ape1r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_APE1W,
+		.name = "ape1w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_UFSR,
+		.name = "ufsr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_UFSW,
+		.name = "ufsw",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_XUSB_DEVR,
+		.name = "xusb_devr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_XUSB_DEVW,
+		.name = "xusb_devw",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_XUSB_DEV1R,
+		.name = "xusb_dev1r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_XUSB_DEV2W,
+		.name = "xusb_dev2w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_XUSB_DEV3R,
+		.name = "xusb_dev3r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_XUSB_DEV3W,
+		.name = "xusb_dev3w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_XUSB_DEV4R,
+		.name = "xusb_dev4r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_XUSB_DEV4W,
+		.name = "xusb_dev4w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_XUSB_DEV5R,
+		.name = "xusb_dev5r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_XUSB_DEV5W,
+		.name = "xusb_dev5w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_DCER,
+		.name = "dcer",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_DCEW,
+		.name = "dcew",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_HDAR,
+		.name = "hdar",
+		.bpmp_id = TEGRA264_BWMGR_HDA,
+		.type = TEGRA_ICC_ISO_AUDIO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_HDAW,
+		.name = "hdaw",
+		.bpmp_id = TEGRA264_BWMGR_HDA,
+		.type = TEGRA_ICC_ISO_AUDIO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_DISPNISOR,
+		.name = "dispnisor",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_DISPNISOW,
+		.name = "dispnisow",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_XUSB_DEV1W,
+		.name = "xusb_dev1w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_XUSB_DEV2R,
+		.name = "xusb_dev2r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_DISPR,
+		.name = "dispr",
+		.bpmp_id = TEGRA264_BWMGR_DISPLAY,
+		.type = TEGRA_ICC_ISO_DISPLAY,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MSSSEQR,
+		.name = "mssseqr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MSSSEQW,
+		.name = "mssseqw",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SMMU3PTWR,
+		.name = "smmu3ptwr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SMMU3CTWR,
+		.name = "smmu3ctwr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SMMU3CMDQVR,
+		.name = "smmu3cmdqvr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SMMU3CMDQVW,
+		.name = "smmu3cmdqvw",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SMMU3EVNTQW,
+		.name = "smmu3evntqw",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SMMU3CMDQR,
+		.name = "smmu3cmdqr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SMMU4PTWR,
+		.name = "smmu4ptwr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SMMU4CTWR,
+		.name = "smmu4ctwr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SMMU4CMDQVR,
+		.name = "smmu4cmdqvr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SMMU4CMDQVW,
+		.name = "smmu4cmdqvw",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SMMU4EVNTQW,
+		.name = "smmu4evntqw",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SMMU4CMDQR,
+		.name = "smmu4cmdqr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MGBE0R,
+		.name = "mgbe0r",
+		.bpmp_id = TEGRA264_BWMGR_EQOS,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MGBE0W,
+		.name = "mgbe0w",
+		.bpmp_id = TEGRA264_BWMGR_EQOS,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MGBE1R,
+		.name = "mgbe1r",
+		.bpmp_id = TEGRA264_BWMGR_EQOS,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MGBE1W,
+		.name = "mgbe1w",
+		.bpmp_id = TEGRA264_BWMGR_EQOS,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_VI1W,
+		.name = "vi1w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_VIFALCON1R,
+		.name = "vifalcon1r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_VIFALCON1W,
+		.name = "vifalcon1w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_ISPFALCON1R,
+		.name = "ispfalcon1r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_ISPFALCON1W,
+		.name = "ispfalcon1w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_RCE1R,
+		.name = "rce1r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_RCE1W,
+		.name = "rce1w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SEU2R,
+		.name = "seu2r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SEU2W,
+		.name = "seu2w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SEU3R,
+		.name = "seu3r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SEU3W,
+		.name = "seu3w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_PVA0R,
+		.name = "pva0r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_PVA0W,
+		.name = "pva0w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_PVA1R,
+		.name = "pva1r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_PVA1W,
+		.name = "pva1w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_PVA2R,
+		.name = "pva2r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_PVA2W,
+		.name = "pva2w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_ISP3W,
+		.name = "isp3w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_ISP2R,
+		.name = "isp2r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_ISP2W,
+		.name = "isp2w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_EQOSR,
+		.name = "eqosr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_EQOSW,
+		.name = "eqosw",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_FSI0R,
+		.name = "fsi0r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_FSI0W,
+		.name = "fsi0w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_FSI1R,
+		.name = "fsi1r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_FSI1W,
+		.name = "fsi1w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SDMMC0R,
+		.name = "sdmmc0r",
+		.bpmp_id = TEGRA264_BWMGR_SDMMC_1,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SDMMC0W,
+		.name = "sdmmc0w",
+		.bpmp_id = TEGRA264_BWMGR_SDMMC_1,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SBR,
+		.name = "sbr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SBW,
+		.name = "sbw",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_HSS_MIU0R,
+		.name = "hss_miu0r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_HSS_MIU0W,
+		.name = "hss_miu0w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_HSS_MIU1R,
+		.name = "hss_miu1r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_HSS_MIU1W,
+		.name = "hss_miu1w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_HSS_MIU2R,
+		.name = "hss_miu2r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_HSS_MIU2W,
+		.name = "hss_miu2w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_HSS_MIU3R,
+		.name = "hss_miu3r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_HSS_MIU3W,
+		.name = "hss_miu3w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_HSS_MIU4R,
+		.name = "hss_miu4r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_HSS_MIU4W,
+		.name = "hss_miu4w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_HSS_MIU5R,
+		.name = "hss_miu5r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_HSS_MIU5W,
+		.name = "hss_miu5w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_HSS_MIU6R,
+		.name = "hss_miu6r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_HSS_MIU6W,
+		.name = "hss_miu6w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_HSS_MIU7R,
+		.name = "hss_miu7r",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_HSS_MIU7W,
+		.name = "hss_miu7w",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_GMMUR2MC,
+		.name = "gmmur2mc",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_UCFELAR,
+		.name = "ucfelar",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_UCFELAW,
+		.name = "ucfelaw",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SLCR,
+		.name = "slcr",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SLCW,
+		.name = "slcw",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_REMOTER,
+		.name = "remoter",
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_REMOTEW,
+		.name = "remotew",
 	},
 };
 
diff --git a/include/dt-bindings/memory/nvidia,tegra264.h b/include/dt-bindings/memory/nvidia,tegra264.h
index 521405c01f84..c65403a76413 100644
--- a/include/dt-bindings/memory/nvidia,tegra264.h
+++ b/include/dt-bindings/memory/nvidia,tegra264.h
@@ -58,24 +58,108 @@
  * memory client IDs
  */
 
+/* PTW read client mapped to SOC SMMU0 */
+#define TEGRA264_MEMORY_CLIENT_PTCR		0x00
 /* HOST1X read client */
 #define TEGRA264_MEMORY_CLIENT_HOST1XR		0x16
+#define TEGRA264_MEMORY_CLIENT_MPCORER		0x27
+/* Platform security (PSC) Read clients */
+#define TEGRA264_MEMORY_CLIENT_PSCR		0x33
+/* PSC Write clients */
+#define TEGRA264_MEMORY_CLIENT_PSCW		0x34
+/* ISP0 Read client */
+#define TEGRA264_MEMORY_CLIENT_ISP0R		0x37
+#define TEGRA264_MEMORY_CLIENT_MPCOREW		0x39
+/* ISP0 Write client */
+#define TEGRA264_MEMORY_CLIENT_ISP0W		0x44
+/* ISP1 Write client */
+#define TEGRA264_MEMORY_CLIENT_ISP1W		0x45
+/* ISP FALCON Read client */
+#define TEGRA264_MEMORY_CLIENT_ISPFALCONR	0x47
+/* ISP FALCON Write client */
+#define TEGRA264_MEMORY_CLIENT_ISPFALCONW	0x4f
+/* MGBE2 Read mccif */
+#define TEGRA264_MEMORY_CLIENT_MGBE2R		0x5c
+#define TEGRA264_MEMORY_CLIENT_OFAR2MC		0x5d
+#define TEGRA264_MEMORY_CLIENT_OFAW2MC		0x5e
+/* MGBE2 Write mccif */
+#define TEGRA264_MEMORY_CLIENT_MGBE2W		0x5f
+/* MGBE3 Read mccif */
+#define TEGRA264_MEMORY_CLIENT_MGBE3R		0x61
+/* MGBE3 Write mccif */
+#define TEGRA264_MEMORY_CLIENT_MGBE3W		0x65
+/* SEU1 Memory Read Client */
+#define TEGRA264_MEMORY_CLIENT_SEU1RD		0x68
+/* SEU1 Memory Write Client */
+#define TEGRA264_MEMORY_CLIENT_SEU1WR		0x69
 /* VIC read client */
 #define TEGRA264_MEMORY_CLIENT_VICR		0x6c
 /* VIC Write client */
 #define TEGRA264_MEMORY_CLIENT_VICW		0x6d
 /* VI R5 Write client */
 #define TEGRA264_MEMORY_CLIENT_VIW		0x72
+/* QSPI Read Client */
+#define TEGRA264_MEMORY_CLIENT_XSPI0R		0x75
+/* QSPI Write Client */
+#define TEGRA264_MEMORY_CLIENT_XSPI0W		0x76
 #define TEGRA264_MEMORY_CLIENT_NVDECSRD2MC	0x78
 #define TEGRA264_MEMORY_CLIENT_NVDECSWR2MC	0x79
 /* Audio processor(APE) Read client */
 #define TEGRA264_MEMORY_CLIENT_APER		0x7a
 /* Audio processor(APE) Write client */
 #define TEGRA264_MEMORY_CLIENT_APEW		0x7b
+/* SEU0 read client */
+#define TEGRA264_MEMORY_CLIENT_SER		0x80
+/* SEU0 write client */
+#define TEGRA264_MEMORY_CLIENT_SEW		0x81
+/* AXI AP and DFD/Coresight1-AUX0/1 Read clients both share the same interface on MSS */
+#define TEGRA264_MEMORY_CLIENT_AXIAPR		0x82
+/* AXI AP and DFD/Coresight1-AUX0/1 Write clients both share the same interface on MSS */
+#define TEGRA264_MEMORY_CLIENT_AXIAPW		0x83
+/* ETR or DFD/Coresight0 Read Client */
+#define TEGRA264_MEMORY_CLIENT_ETRR		0x84
+/* ETR or DFD/Coresight0 Write Client */
+#define TEGRA264_MEMORY_CLIENT_ETRW		0x85
+/* Security(tsec) Read client */
+#define TEGRA264_MEMORY_CLIENT_TSECR		0x86
+/* Security(tsec) Write client */
+#define TEGRA264_MEMORY_CLIENT_TSECW		0x87
+/* BPMP read client */
+#define TEGRA264_MEMORY_CLIENT_BPMPR		0x93
+/* BPMP write client */
+#define TEGRA264_MEMORY_CLIENT_BPMPW		0x94
+/* AON Read Client */
+#define TEGRA264_MEMORY_CLIENT_AONR		0x97
+/* AON write client */
+#define TEGRA264_MEMORY_CLIENT_AONW		0x98
+/* GPCDMA debug Read client */
+#define TEGRA264_MEMORY_CLIENT_GPCDMAR		0x99
+/* GPCDMA debug Write client */
+#define TEGRA264_MEMORY_CLIENT_GPCDMAW		0x9a
 /* Audio DMA Read client */
 #define TEGRA264_MEMORY_CLIENT_APEDMAR		0x9f
 /* Audio DMA Write client */
 #define TEGRA264_MEMORY_CLIENT_APEDMAW		0xa0
+/* mss internal memqual MIU0 reads */
+#define TEGRA264_MEMORY_CLIENT_MIU0R		0xa6
+/* mss internal memqual MIU0 writes */
+#define TEGRA264_MEMORY_CLIENT_MIU0W		0xa7
+/* mss internal memqual MIU1 reads */
+#define TEGRA264_MEMORY_CLIENT_MIU1R		0xa8
+/* mss internal memqual MIU1 writes */
+#define TEGRA264_MEMORY_CLIENT_MIU1W		0xa9
+/* mss internal memqual MIU2 reads */
+#define TEGRA264_MEMORY_CLIENT_MIU2R		0xae
+/* mss internal memqual MIU2 writes */
+#define TEGRA264_MEMORY_CLIENT_MIU2W		0xaf
+/* mss internal memqual MIU3 reads */
+#define TEGRA264_MEMORY_CLIENT_MIU3R		0xb0
+/* mss internal memqual MIU3 writes */
+#define TEGRA264_MEMORY_CLIENT_MIU3W		0xb1
+/* mss internal memqual MIU4 reads */
+#define TEGRA264_MEMORY_CLIENT_MIU4R		0xb2
+/* mss internal memqual MIU4 writes */
+#define TEGRA264_MEMORY_CLIENT_MIU4W		0xb3
 #define TEGRA264_MEMORY_CLIENT_GPUR02MC		0xb6
 #define TEGRA264_MEMORY_CLIENT_GPUW02MC		0xb7
 /* VI Falcon Read client */
@@ -86,6 +170,8 @@
 #define TEGRA264_MEMORY_CLIENT_RCER		0xd2
 /* Write client of RCE */
 #define TEGRA264_MEMORY_CLIENT_RCEW		0xd3
+#define TEGRA264_MEMORY_CLIENT_NVENC1SRD2MC	0xd6
+#define TEGRA264_MEMORY_CLIENT_NVENC1SWR2MC	0xd7
 /* PCIE0/MSI Write clients */
 #define TEGRA264_MEMORY_CLIENT_PCIE0W		0xd9
 /* PCIE1/RPX4 Read clients */
@@ -108,16 +194,140 @@
 #define TEGRA264_MEMORY_CLIENT_PCIE5R		0xe2
 /* PCIE5/DMX4 Write clients */
 #define TEGRA264_MEMORY_CLIENT_PCIE5W		0xe3
+/* mss internal memqual MIU5 reads */
+#define TEGRA264_MEMORY_CLIENT_MIU5R		0xfc
+/* mss internal memqual MIU5 writes */
+#define TEGRA264_MEMORY_CLIENT_MIU5W		0xfd
+/* mss internal memqual MIU6 writes */
+#define TEGRA264_MEMORY_CLIENT_MIU6W		0xff
+#define TEGRA264_MEMORY_CLIENT_RISTR		0x100
+#define TEGRA264_MEMORY_CLIENT_RISTW		0x101
+/* OESP (Pluton) Read client */
+#define TEGRA264_MEMORY_CLIENT_OESPR		0x102
+/* OESP (Pluton) Write client */
+#define TEGRA264_MEMORY_CLIENT_OESPW		0x103
+/* mss internal memqual MIU7 writes */
+#define TEGRA264_MEMORY_CLIENT_MIU7W		0x105
+/* mss internal memqual MIU8 reads */
+#define TEGRA264_MEMORY_CLIENT_MIU8R		0x106
+/* mss internal memqual MIU8 writes */
+#define TEGRA264_MEMORY_CLIENT_MIU8W		0x107
+/* mss internal memqual MIU9 reads */
+#define TEGRA264_MEMORY_CLIENT_MIU9R		0x108
+/* mss internal memqual MIU9 writes */
+#define TEGRA264_MEMORY_CLIENT_MIU9W		0x109
+/* HWPM Write Interface */
+#define TEGRA264_MEMORY_CLIENT_PMA0AWR		0x122
+#define TEGRA264_MEMORY_CLIENT_NVJPG1SRD2MC	0x123
+#define TEGRA264_MEMORY_CLIENT_NVJPG1SWR2MC	0x124
+/* CTW read client mapped to SMMU0 */
+#define TEGRA264_MEMORY_CLIENT_SMMU0CTWR	0x12e
+/* CMDQV read client mapped to SMMU0 */
+#define TEGRA264_MEMORY_CLIENT_SMMU0CMDQVR	0x12f
+/* CMDQV write client mapped to SMMU0 */
+#define TEGRA264_MEMORY_CLIENT_SMMU0CMDQVW	0x130
+/* EVNTQ write client mapped to SMMU0 */
+#define TEGRA264_MEMORY_CLIENT_SMMU0EVNTQW	0x131
+/* PTW read client mapped to SMMU1 */
+#define TEGRA264_MEMORY_CLIENT_SMMU1PTWR	0x132
+/* CTW read client mapped to SMMU1 */
+#define TEGRA264_MEMORY_CLIENT_SMMU1CTWR	0x134
+/* CMDQV read client mapped to SMMU1 */
+#define TEGRA264_MEMORY_CLIENT_SMMU1CMDQVR	0x135
+/* CMDQV write client mapped to SMMU1 */
+#define TEGRA264_MEMORY_CLIENT_SMMU1CMDQVW	0x136
+/* EVNTQ write client mapped to SMMU1 */
+#define TEGRA264_MEMORY_CLIENT_SMMU1EVNTQW	0x137
+/* PTW read client mapped to SMMU2 */
+#define TEGRA264_MEMORY_CLIENT_SMMU2PTWR	0x138
+/* CTW read client mapped to SMMU2 */
+#define TEGRA264_MEMORY_CLIENT_SMMU2CTWR	0x13a
+/* CMDQV read client mapped to SMMU2 */
+#define TEGRA264_MEMORY_CLIENT_SMMU2CMDQVR	0x13b
+/* CMDQV write client mapped to SMMU2 */
+#define TEGRA264_MEMORY_CLIENT_SMMU2CMDQVW	0x13c
+/* EVNTQ write client mapped to SMMU2 */
+#define TEGRA264_MEMORY_CLIENT_SMMU2EVNTQW	0x13d
+/* CMDQ read client mapped to SMMU0 */
+#define TEGRA264_MEMORY_CLIENT_SMMU0CMDQR	0x144
+/* CMDQ read client mapped to SMMU1 */
+#define TEGRA264_MEMORY_CLIENT_SMMU1CMDQR	0x145
+/* CMDQ read client mapped to SMMU2 */
+#define TEGRA264_MEMORY_CLIENT_SMMU2CMDQR	0x146
+/* Audio processor1(APE1) Read client */
+#define TEGRA264_MEMORY_CLIENT_APE1R		0x150
+/* Audio processor1(APE1) Write client */
+#define TEGRA264_MEMORY_CLIENT_APE1W		0x151
 /* UFS Read client */
 #define TEGRA264_MEMORY_CLIENT_UFSR		0x15c
 /* UFS write client */
 #define TEGRA264_MEMORY_CLIENT_UFSW		0x15d
+/* XUSB HOST Read Client */
+#define TEGRA264_MEMORY_CLIENT_XUSB_DEVR	0x166
+/* XUSB HOST Write Client */
+#define TEGRA264_MEMORY_CLIENT_XUSB_DEVW	0x167
+/* XUSB SS0 Read Client */
+#define TEGRA264_MEMORY_CLIENT_XUSB_DEV1R	0x168
+/* XUSB SS1 Write Client */
+#define TEGRA264_MEMORY_CLIENT_XUSB_DEV2W	0x169
+/* XUSB SS2 Read Client */
+#define TEGRA264_MEMORY_CLIENT_XUSB_DEV3R	0x16a
+/* XUSB SS2 Write Client */
+#define TEGRA264_MEMORY_CLIENT_XUSB_DEV3W	0x16b
+/* XUSB SS3 Read Client */
+#define TEGRA264_MEMORY_CLIENT_XUSB_DEV4R	0x16c
+/* XUSB SS3 Write Client */
+#define TEGRA264_MEMORY_CLIENT_XUSB_DEV4W	0x16d
+/* XUSB DEV Read Client */
+#define TEGRA264_MEMORY_CLIENT_XUSB_DEV5R	0x16e
+/* XUSB DEV Write Client */
+#define TEGRA264_MEMORY_CLIENT_XUSB_DEV5W	0x16f
+/* DCE Read client */
+#define TEGRA264_MEMORY_CLIENT_DCER		0x17a
+/* DCE Write client */
+#define TEGRA264_MEMORY_CLIENT_DCEW		0x17b
 /* HDA Read client */
 #define TEGRA264_MEMORY_CLIENT_HDAR		0x17c
 /* HDA Write client */
 #define TEGRA264_MEMORY_CLIENT_HDAW		0x17d
+/* DISPNISO read client */
+#define TEGRA264_MEMORY_CLIENT_DISPNISOR	0x17e
+/* DISPNISO write client */
+#define TEGRA264_MEMORY_CLIENT_DISPNISOW	0x17f
+/* XUSB SS0 Write Client */
+#define TEGRA264_MEMORY_CLIENT_XUSB_DEV1W	0x180
+/* XUSB SS1 Read Client */
+#define TEGRA264_MEMORY_CLIENT_XUSB_DEV2R	0x181
 /* Disp ISO Read Client */
 #define TEGRA264_MEMORY_CLIENT_DISPR		0x182
+/* MSSSEQ Read Client */
+#define TEGRA264_MEMORY_CLIENT_MSSSEQR		0x185
+/* MSSSEQ Write Client */
+#define TEGRA264_MEMORY_CLIENT_MSSSEQW		0x186
+/* PTW read client mapped to SMMU3 */
+#define TEGRA264_MEMORY_CLIENT_SMMU3PTWR	0x18b
+/* CTW read client mapped to SMMU3 */
+#define TEGRA264_MEMORY_CLIENT_SMMU3CTWR	0x18d
+/* CMDQV read client mapped to SMMU3 */
+#define TEGRA264_MEMORY_CLIENT_SMMU3CMDQVR	0x18e
+/* CMDQV write client mapped to SMMU3 */
+#define TEGRA264_MEMORY_CLIENT_SMMU3CMDQVW	0x18f
+/* EVNTQ write client mapped to SMMU3 */
+#define TEGRA264_MEMORY_CLIENT_SMMU3EVNTQW	0x190
+/* CMDQ read client mapped to SMMU3 */
+#define TEGRA264_MEMORY_CLIENT_SMMU3CMDQR	0x191
+/* PTW read client mapped to SMMU4 */
+#define TEGRA264_MEMORY_CLIENT_SMMU4PTWR	0x192
+/* CTW read client mapped to SMMU4 */
+#define TEGRA264_MEMORY_CLIENT_SMMU4CTWR	0x194
+/* CMDQV read client mapped to SMMU4 */
+#define TEGRA264_MEMORY_CLIENT_SMMU4CMDQVR	0x195
+/* CMDQV write client mapped to SMMU4 */
+#define TEGRA264_MEMORY_CLIENT_SMMU4CMDQVW	0x196
+/* EVNTQ write client mapped to SMMU4 */
+#define TEGRA264_MEMORY_CLIENT_SMMU4EVNTQW	0x197
+/* CMDQ read client mapped to SMMU4 */
+#define TEGRA264_MEMORY_CLIENT_SMMU4CMDQR	0x198
 /* MGBE0 Read mccif */
 #define TEGRA264_MEMORY_CLIENT_MGBE0R		0x1a2
 /* MGBE0 Write mccif */
@@ -128,9 +338,86 @@
 #define TEGRA264_MEMORY_CLIENT_MGBE1W		0x1a5
 /* VI1 R5 Write client */
 #define TEGRA264_MEMORY_CLIENT_VI1W		0x1a6
+/* VI Falcon1 Read client */
+#define TEGRA264_MEMORY_CLIENT_VIFALCON1R	0x1a7
+/* VI Falcon1 Write client */
+#define TEGRA264_MEMORY_CLIENT_VIFALCON1W	0x1a8
+/* ISP FALCON1 Read client */
+#define TEGRA264_MEMORY_CLIENT_ISPFALCON1R	0x1a9
+/* ISP FALCON1 Write client */
+#define TEGRA264_MEMORY_CLIENT_ISPFALCON1W	0x1aa
+/* Read Client of RCE1 */
+#define TEGRA264_MEMORY_CLIENT_RCE1R		0x1ab
+/* Write client of RCE1 */
+#define TEGRA264_MEMORY_CLIENT_RCE1W		0x1ac
+/* SEU2 Read client */
+#define TEGRA264_MEMORY_CLIENT_SEU2R		0x1ad
+/* SEU2 Write client */
+#define TEGRA264_MEMORY_CLIENT_SEU2W		0x1ae
+/* SEU3 Read client */
+#define TEGRA264_MEMORY_CLIENT_SEU3R		0x1af
+/* SEU3 Write client */
+#define TEGRA264_MEMORY_CLIENT_SEU3W		0x1b0
+/* PVA0 Falcon Read mccif */
+#define TEGRA264_MEMORY_CLIENT_PVA0R		0x1b1
+/* PVA0 Falcon Write mccif */
+#define TEGRA264_MEMORY_CLIENT_PVA0W		0x1b2
+/* PVA1 Read mccif */
+#define TEGRA264_MEMORY_CLIENT_PVA1R		0x1b3
+/* PVA1 Write mccif */
+#define TEGRA264_MEMORY_CLIENT_PVA1W		0x1b4
+/* PVA2 Read mccif */
+#define TEGRA264_MEMORY_CLIENT_PVA2R		0x1b5
+/* PVA2 Write mccif */
+#define TEGRA264_MEMORY_CLIENT_PVA2W		0x1b6
+/* ISP3 Write client */
+#define TEGRA264_MEMORY_CLIENT_ISP3W		0x1b7
+/* ISP2 Read Client */
+#define TEGRA264_MEMORY_CLIENT_ISP2R		0x1b8
+/* ISP2 Write Client */
+#define TEGRA264_MEMORY_CLIENT_ISP2W		0x1b9
+/* EQOS Read mccif */
+#define TEGRA264_MEMORY_CLIENT_EQOSR		0x1bc
+/* EQOS Write mccif */
+#define TEGRA264_MEMORY_CLIENT_EQOSW		0x1bd
+/* FSI0 Read mccif */
+#define TEGRA264_MEMORY_CLIENT_FSI0R		0x1be
+/* FSI0 Write mccif */
+#define TEGRA264_MEMORY_CLIENT_FSI0W		0x1bf
+/* FSI1 Read mccif */
+#define TEGRA264_MEMORY_CLIENT_FSI1R		0x1c0
+/* FSI1 Write mccif */
+#define TEGRA264_MEMORY_CLIENT_FSI1W		0x1c1
 /* SDMMC0 Read mccif */
 #define TEGRA264_MEMORY_CLIENT_SDMMC0R		0x1c2
 /* SDMMC0 Write mccif */
 #define TEGRA264_MEMORY_CLIENT_SDMMC0W		0x1c3
+/* Strongbox (SB) read client */
+#define TEGRA264_MEMORY_CLIENT_SBR		0x1c6
+/* Strongbox (SB) write client */
+#define TEGRA264_MEMORY_CLIENT_SBW		0x1c7
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU0R	0x1c8
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU0W	0x1c9
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU1R	0x1ca
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU1W	0x1cb
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU2R	0x1cc
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU2W	0x1cd
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU3R	0x1ce
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU3W	0x1cf
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU4R	0x1d0
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU4W	0x1d1
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU5R	0x1d2
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU5W	0x1d3
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU6R	0x1d4
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU6W	0x1d5
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU7R	0x1d6
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU7W	0x1d7
+#define TEGRA264_MEMORY_CLIENT_GMMUR2MC		0x1d8
+#define TEGRA264_MEMORY_CLIENT_UCFELAR		0x1d9
+#define TEGRA264_MEMORY_CLIENT_UCFELAW		0x1da
+#define TEGRA264_MEMORY_CLIENT_SLCR		0x1db
+#define TEGRA264_MEMORY_CLIENT_SLCW		0x1dc
+#define TEGRA264_MEMORY_CLIENT_REMOTER		0x1dd
+#define TEGRA264_MEMORY_CLIENT_REMOTEW		0x1de
 
 #endif /* DT_BINDINGS_MEMORY_NVIDIA_TEGRA264_H */
-- 
2.34.1

