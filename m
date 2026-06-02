Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012011.outbound.protection.outlook.com [40.107.209.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C914E2882D6;
	Tue,  2 Jun 2026 08:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780389850; cv=fail; b=cGIXCM084AVuLUCmkbBbT6TCznnK9wDzZ8Y+NnEDepJ0a5cvPIZ/4/Zp2sJ16iFejc/li0OeyCHILW8I8d1tUo6RNh9gDCKVBXCO92oFW75YMUxVKk2CLLsbT+lUAOTKcltyZvYbplF8TuHmDa01iCbz/QmXVnizdA1PNebO64U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780389850; c=relaxed/simple;
	bh=XVvKQPbkAPS2vbtLefdDEJkS992/4w0cV6QWltJ/wBA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Osh0n9lw8+OYyUsciy0LRfOMZa0CvRB8WKvDvit8FpYke/RaG8gGY1ad0T4JYIVt1qfFu/t7/ccEfU3kdaBEBMYDxmzhsbsBp1H2FGAx6MaydGtMwlB97PnQtcxMO01xOuEpCl8tdVgINisXKxG/sA53/ZwJrLdxX80yh9UQhNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dV9MdKNI; arc=fail smtp.client-ip=40.107.209.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dV9MdKNI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lbz7qIqGP6drHfQBMbzjL7k3qV8NG8vg2Zx8FmWOSAtgDaPENXl0byxUUHYuSlOcAF/GSbmxZQ9ev68QHNrEiOyx+8xcmKN+pKboLFVQCdi6Dj3lrGVqBhK6qAlzFkOYpT+AFedNbYCbVD/Vn5im0ndM7CFX14LWH4/VxttuIVZOSotRnXGvInwTOwnnt6Dldfpkj4qfEtxQ8a9Y+qdOpKCVFKbHEyXys90aNU+ldiuu5I2fAKyJHEu1PCtpGr8kc9+eeT0sxZdBiVYi1UrA2XnbunPrvt2nsngli20zEihVHeDPToDzxPLiYjXSos6EpCKz6Sq7GjrPiJDVov0WbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hpNaOuZxjLlwFFCQAY3w5b2y9ktJYO2aeAm3p9cQz0=;
 b=qG/1FWfdW06od3weaaYRrcLReyCZl3SW26EmM4HbX7fIlYkXq+ZTRQGl42cFhdPD28QMU1ltTKUqMVlS5xT/rT7hVi+rYlYk0SLNEFGfAx2Gv/ypJ9ECyJBb+Ve2+LQBadX7j8Q2W2pTQa+8HvZ5Lm4HvuY/VVesV8pVaEY9OxX5usDdP/hWbRmMilxO9Yd/Yg70NSMIOR6QwdryrXry0trDSZxlVkUtdPi5WfHUjTdGtYwPkDqfkg3/PjCtOUkrAL5K6zzfv1jRANXFuTrIpnNhJpuP3yJBCxuCGQi1lUr07VdMHbm40hC3yoo6NihihzHABRL+mTleKAxZmVrwoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=baylibre.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hpNaOuZxjLlwFFCQAY3w5b2y9ktJYO2aeAm3p9cQz0=;
 b=dV9MdKNIJG8w5gbZ2TmmzuhsAVnXbCy8e0XoHBVhy1RQDjVyXdAePf/N+qRLBlNUsGIaJRYijBYzAg7gnEFP53bL1HaKDW69TggJaD1O+c9fJsrLj8gCttROTGElfRTwQKZcaSfcHjPhdK4WWfqiGzpgGgBBXb6lhSFnVWs429tSBYkWL4Fv67vbToVGmVkdWN6HwYofGvCIeydyrVOOI1vFvTCRRR4W0ZxUpQnZLeeXReIMY0c5/UJdiGASHX8l+Y5ySd9/KYO56IznHGH4ml9yO56UrPhkwaUtmuHVXGKqvxcAFbubrTtLsinDCzR7cW0dSIg21r3GYvIqs59doA==
Received: from CY5P221CA0147.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:6a::20)
 by BY5PR12MB4257.namprd12.prod.outlook.com (2603:10b6:a03:20f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 2 Jun 2026
 08:44:02 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2603:10b6:930:6a:cafe::30) by CY5P221CA0147.outlook.office365.com
 (2603:10b6:930:6a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 08:44:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 08:44:01 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Jun
 2026 01:43:45 -0700
Received: from moonraker.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Jun
 2026 01:43:43 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Thierry Reding <thierry.reding@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>, Timo Alho <talho@nvidia.com>
Subject: [PATCH V2] clk: tegra: Support unique names for multi-socket platforms
Date: Tue, 2 Jun 2026 09:43:34 +0100
Message-ID: <20260602084334.350895-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|BY5PR12MB4257:EE_
X-MS-Office365-Filtering-Correlation-Id: a5c4e890-9f50-430a-f1d6-08dec0831880
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|11063799006|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	tFYV010SsEjHsrRfscmVas7S6eavPRghdqyocBl+aOlpdaOYnslw8EL66GDtQb+2r/b8qZdNbu9rFVoecQMq9oCI0MHLZCMrMdq5z0IiU/NgWltG75OR1IH1KekegrPiiVnK6cS6lHrn3GzZGnB3LVngVkq1wTP7hdkshN1kwYMNZGXM0Hoc1DvbT1jx2UMEb1YOAqogs1JEECp2eDtJepjToMmW+cVolUaDlYRCWgSy3D1OCBW0dS/broct27m/qeMVJL11aZoK5e15QlIpDo1MGM2SGlPC6fFQtgUgJ2DcWBsiqqi+FWJIIKVnvxlx3dtrIga9vLWuNJfc3SsFkmOlS+fRd5T72NXv/tVQnGaNCdtVGcoh5t2SW89rQ7dDlCGvu2C4c+7l6ovcAAzd+Cs1AoGIl2BiXoLPESuX5yZuBCPgA1uZd+Vg0knKdQL2ZoBGirFOowKOzcazmxL5d8ftiulSQCX0eZAFOZyqMGsrb6ohfn+0fb+9kwxpLgiEQ3Hzm7/BFpllqkB8HEmtIgSugt5RONh9SLuOucPIwqmPpBAgM6w2p2ZYxmx+l25o0UCGAUeM1PMUq0SY3RMM6UNHTS5W8oiQn5udOnHfd6PgNkQyVkhU16wSlnSGSFTDCNb334JxNgp0muqISFOHkJNXHzTXz6vfGoJJz5s+B8MRiK5xvl/ycb93L3gU1QsFzgwHffVd7f9MWY3uqgrEbuyAPEHPQDNnvHyjE9Y2V3s=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(11063799006)(18002099003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xdKdaEjMT0jiFuicfZf0rGafNqQkm1yEFP3X84hwFgYsfTc4uZOH7L5cclE8miGxa+TE3iw7/nhfVP0bNIuAqt9smTCpUhGrVdfD5/HgqG1rQm51nVI/QgP6igOvXHTXQNKqh1AWBhMlNTgNuNqvKJaD4hil+B6QA2uwCunUyUYB738Pq+o/hlrswie5WQP4hmiECR4+58cjWlBtZ/3l6uJ3AcS+IDcm0qrP+NJ2zVHWEHaaKzOlqPV2GRrPl8PXq4g+F8hgYMtE1WjTwWyvCKjd9EPeVJIxHHMpLZihOJA4B2qFN6ZNOTGOGjREhhc3nRZF/0WmItxDS8HcCdWCgla2lslJuewGbxVxCbeqZ+kRqQj7mmrEcsiFn1lANzEiip7dwHodGGkE5QZHWwpNJmWovChRDKVMA4MMe4cKBXIGQR37lqThXE0yjs9N7SOI
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 08:44:01.6438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c4e890-9f50-430a-f1d6-08dec0831880
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4257

On multi-socket platforms each socket has its own BPMP which exposes the
same clock names. Fix this by using the NUMA ID as a prefix for the
clock names on multi-socket platforms.

Use 'sizeof(info->name)' in the strscpy() and snprintf() functions to
future proof against anyone changing the size of the 'name' array.

Co-developed-by: Timo Alho <talho@nvidia.com>
Signed-off-by: Timo Alho <talho@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes since V1:
- Use NUMA ID as a prefix and not a suffix for the clock name.

 drivers/clk/tegra/clk-bpmp.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
index f6d2b934228b..067a8555c4e7 100644
--- a/drivers/clk/tegra/clk-bpmp.c
+++ b/drivers/clk/tegra/clk-bpmp.c
@@ -367,7 +367,15 @@ static int tegra_bpmp_clk_get_info(struct tegra_bpmp *bpmp, unsigned int id,
 	if (err < 0)
 		return err;
 
-	strscpy(info->name, response.name, MRQ_CLK_NAME_MAXLEN);
+	if (dev_to_node(bpmp->dev) == NUMA_NO_NODE) {
+		strscpy(info->name, response.name, sizeof(info->name));
+	} else {
+		err = snprintf(info->name, sizeof(info->name), "%d-%s",
+			       dev_to_node(bpmp->dev), response.name);
+		if (WARN_ON(err >= sizeof(info->name)))
+			return -E2BIG;
+	}
+
 	info->num_parents = response.num_parents;
 
 	for (i = 0; i < info->num_parents; i++)
-- 
2.43.0

