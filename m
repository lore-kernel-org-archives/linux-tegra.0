Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013068.outbound.protection.outlook.com [40.107.201.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5650E41B371;
	Mon, 18 May 2026 12:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779108357; cv=fail; b=L3tfFhirVdKnv74GtWd2LxsW1pjs6x1QdGzKysywnpFy+ii8sBbK++HYDnmXjPg1+UqRTlILH63qytZ38sdoI0291crMBceahq4dpXBDzgsg4DBrxOKU6IFw7cBVw+GcCsnzk7/3+mJWWZMxtSNbbLwxrDDAMMg8BD58Hbg8D5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779108357; c=relaxed/simple;
	bh=HlINZQjWHVHIGiu4/v7CHPDZ5EV/Og8j+Xex41zBe40=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dX7l5X3ofeeazGkfF9yPXfQv4iwF113o9y40kFyXJFIJVZDUfBvlkWYM4SLRQRR2NIcW6S8nPvcHKPVMPxgkf2hO6lov724d0uOYJwMVOtZrqnh3qvi0d04VYXxkJ2RwBbYSIlZwl1y8qqgTZQet5FdyLFN+4O5DQBmYXq/j/xA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=p0BpV6OA; arc=fail smtp.client-ip=40.107.201.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="p0BpV6OA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W9fcAUHdLqbFUbmRZocTXCk21qPCXRAOYMcl60ax5SKmGqpzI0/GmN2ou2J/3q5dxL901UK94tQmWUoixNwke2dhPLfLUpdvuMnh4DsY38avl8QrUx9wOepr2OUQF1y0B7W5oRpJb+7kcGgOq/6NxhICHCU6Gn6wOUU3WVoIBf6LkTHLHEax+P2tXiim7C0DMsttI6VCyduJfXH6HrMeQD2laZ59Spfg6m51JDEVo1gqSVa1FWGpREr7gI8oScdJ8kKBh2ivgNMTXHAkh7aNl1jIYOIQl37D73R3XxnWZ/QKiOdxc9NdbA2MY/8I5KwQCDwgTfP407GEr15iPT3/WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OFWS1rUcQlX/43VdLTaONjU3Z6eSIk9aS1axWTUPcE=;
 b=Krib6rQ7Q9RoO/E5ERptoXGl567nIem1RChm8jKBEpETflWWatyfY622d2e6h5b/wBLI0yblAq3NPhsncVQGjzyU2L0BNGlbt/PudXTlfdASPQt3MsJxVuT9oyCoOaIOOvMNI1sV351LwZxFEuJ12vLKrw3IyVyICKtUit2Jkhld26FbgTr9wp/Qhc9fK9qkjrn2moS7zTO3/D9OuytbsxSR/DV75Ak5khurm2g1bbYWGy9ZwoJriqAyhpca+8t3pxRe8A87kB84r9AljWtvUdeolBUhXjuWRIcd6FdTNAn2FAb8oGOGu4AcAnTCvVki2cQ1hk+wUW8fbfpQR31SDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OFWS1rUcQlX/43VdLTaONjU3Z6eSIk9aS1axWTUPcE=;
 b=p0BpV6OA8gccuWlfRft411FRUp4Cfc+yUwBCvG1eAym3FJJmuJXQ8bk49e1+2cj9Yu7c7gZd+OaOwGJiVA+QvsZ/9K93tZ1LoRZHspL4+E1p4NP5qY9vYgwDufZEIxknZbDzyXql3vPlfX0R0Zw21xAA3EtWhhw6U6XTHWEeC7DkFaW5fR5SXwkz/8UNEWQrLf1ryaW2pvW7LodpqhiiVBtBf3z/hWl24VC3isXYOkwE3memFxZQHnf6n5O51MRPiUMygvMET7EHZ/7/HEES9HG2DGE5584JmOyGTdywyT24OGXJrrx/zjG5fETgZLyrIz6PgzTSnLwXTig6P1AYdA==
Received: from SJ0PR03CA0112.namprd03.prod.outlook.com (2603:10b6:a03:333::27)
 by PH8PR12MB7111.namprd12.prod.outlook.com (2603:10b6:510:22d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 12:45:32 +0000
Received: from CO1PEPF000066E8.namprd05.prod.outlook.com
 (2603:10b6:a03:333:cafe::da) by SJ0PR03CA0112.outlook.office365.com
 (2603:10b6:a03:333::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Mon, 18
 May 2026 12:45:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000066E8.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 12:45:32 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 18 May
 2026 05:45:10 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 18 May 2026 05:45:10 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 18 May 2026 05:45:07 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <krzk@kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<robh@kernel.org>, <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH v2 3/3] memory: tegra264: Add full set of MC clients
Date: Mon, 18 May 2026 18:13:06 +0530
Message-ID: <20260518124306.2071481-4-sumitg@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518124306.2071481-1-sumitg@nvidia.com>
References: <20260518124306.2071481-1-sumitg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E8:EE_|PH8PR12MB7111:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a1c1c18-4280-4cbd-34a4-08deb4db5976
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|11063799003|56012099003|3023799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tp1wB+NdEMHFsFVpR00UyNqhpsRL2uG1JUMS1r0rEn85mz3VQx9RWqIvr2u8zZ3ln9a49HZJtb5Uc8asaP4fCndsoZ8K67LfEAyVVtEJ+VCEU7oLagGY5i8r53QxIRFwP49tTUY6/ChMyjS+95HhfdTU6CZL04MziELIJr8lH72vez3L85BsXldc+WX1+Mk5lUo2TllrO/qzvL4u/9ZSGYH2ksLg2TFtNY3MxACHjjGdJoalqaRcnFrVJrgYGixLxxXYeGYigSVeSIkoScH+Fp85FjBzrMy6uQ4klVBVemtsmgof99YRZBb/21rEtONBcAqnVxcoNQj2NRNtf64f7n+ZNNJSXqMdUwmbSj+RAywH9GyOcsrB2bhfRulQdan/5xMj2/BPFFf0WjjMLlZKir16LsIlEdZ5uqp/C61XAR1MvdeQNc1uVNnE1S6gQogmj5cPwTB1ozyPIhNa2wJctkijtoF/BIh32Z+Gire+ICvUfmeJiQ9eSzz/SRigbMJI5D6LhApbG3+fB3mQIezKYIN3cfsFaY3pqW+/zlpqYIlkGxvbUB6j+75kCzntsxFxgSIlODC42i4PbM9qLrQufkOnf7iPTSYFQZQH6u62x6uIj5a2oaQMlewn9e+7+ajIazCFQr2iWz2v2B2dAYZswl3Vbt/gRxoYbpRjysgqVBmoJJmDX9nCzNgasXBRq0T/gc3qR+NRw4DFtXFn1YngZX6YPDrPvK9I6/dr3WH1Qoc=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(11063799003)(56012099003)(3023799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yKM7Ro38ldMNJKqExXLrOqaYVtQ1J/wJ95eYAv+LYBMRzGiJMSjcxaxHPJZ5/Di+RLD7Yt2mS7C14B+mEURHorEwmd5u1wKe0aKGSBzth1Eu644E/7coXpoT75FH2WAE4qWmWVl71BecpuUFTkufLL+ddzIXzHjiGbwxenRjLhQkTtTIt96daWKd/b0f27pogNVPaE149/EOw5Rom0rIwSZ3STLlL5DgSOBFLWHlh3Ojy3vyQ8V9mw3ID2xxV5yFaGHRUTZRYEP8da3uzLuyXtviBKk9Tv+uE0FMQyM2eSP1oHP+cUhmyfsjYAs+acmXhpiQcRqMFlGGGO4zzgnXBFon2jo97i8p6ah8MvFS7UQCOaX/Iym847fLNm4VMHEtthyx8jIMebNWAxRkZYVmoD7L3RaGHwB5Fb7bnftujLlBz49fa+Zd6Uo9OfEFT6o0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 12:45:32.3926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a1c1c18-4280-4cbd-34a4-08deb4db5976
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7111

Extend the tegra264_mc_clients table to cover the full set of memory
clients exposed by the SoC. The client name is used for MC fault
reporting. Clients managed by the BPMP bandwidth manager additionally
carry their bpmp_id and type.

Entries in tegra264_mc_clients[] are sorted to match the order of
the override and security register offsets used in previous SoCs.

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 drivers/memory/tegra/tegra264.c | 564 ++++++++++++++++++++++++++++++--
 1 file changed, 532 insertions(+), 32 deletions(-)

diff --git a/drivers/memory/tegra/tegra264.c b/drivers/memory/tegra/tegra264.c
index e62890841725..b8d6c4ce4836 100644
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
 
-- 
2.34.1

