Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010020.outbound.protection.outlook.com [52.101.46.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF96476CDA;
	Mon,  7 Sep 2026 11:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780742; cv=fail; b=B2JyG3pjAgZogTCEDIfA15ke6XLedo0/RVZ/zKsMmCgEg2y6sfk6mA2Q6maRjk0W50xIIQ4d4O8Z5nl1hrXplhcYKLqNbjHMehR5uup2i+ismPc5FldDPSOYTOilhmA5JPSNwJ09qApmqkvwz/TFRUs23oVkgFhMNC8+TRZKzaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780742; c=relaxed/simple;
	bh=L/BzYZvD1fn2ADKYjmtxV5IHTcopwbDkh5UEDrfMUyM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FRjsPpzPyubw40wUlXHphkfZULj+lQdS0aqlF2dKZDgoo1rHperi7lpNhM3QLFk7QpD7lZl3WYYwqYD4Db0QVvqWVKXhrfF4Wi/5dF49vEZPAbYi/heyoPUY5p/FBkfaun14+xBYPUl05erIXMxi1Rd+Qz3prh0U5LWMVqF76Xw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pWio6bMn; arc=fail smtp.client-ip=52.101.46.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pWio6bMn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WWYu3eg71mJOy5PpqxUhuavfq6vg6I2cbR6A8g3Ix8a9XhGv7GOdRXUnnPl7qVW6inlRijdC/z87zgj6p3wUbdO7cqtSL89k/sEGaaewBTPAmGkGBWSycqLrFhho42b05+w8+JVIRdZ/JtPXVBq+zfidXlU7MsgEBeHuo8WnsXuM2FbC3WCtEb13zwpZ3c+gw+0g2GLA9+nZEFOnL4T4LDwr5dhdoRi9fKSnjEyNZ9Kkh+INlINfOotuSurIiC5C6FyprSpPN3yhf2qno1T5m2nIZgz6LX1TZqQRIzM9sUkDUm6+PfdmkmG4XrU/4+Wd/OiME5QU1qGajIkWfiDHhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7cRGmWEyRKg4j4RpfXJR79UmFL3FWgLTjBWHu6g9JKU=;
 b=Fc+Ggs3E2FRn3yy/tjNG8Ez5vMla8MvfgNklrzOaQq4g/qH6OG9mfdpNRLnTQWWn4iWQC/My6DldZ7VcD6yInukKIMSCDgm9DIU8pfwxLWJgaonlnKKWWXkEwmPVHihO5EmBnNvPnSbP0s41j2FKwZpSQ3fJJMp/2gpI5TuCGFFfwktV3g1aLZU1O5lzTL5lkonuv4jj19gEINbXL91AVIw1BM/wpAJaNzbdfYLowjNf53nTGBIf9aOAjeOdkAvo+gxVnNuZtKwNCGFP+0kQSba4z0D+vpIy6bZNjCT7YZd57KsFVqyiryBR6E3diC/BKgUm13/g2nP32JsOcDi2bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7cRGmWEyRKg4j4RpfXJR79UmFL3FWgLTjBWHu6g9JKU=;
 b=pWio6bMnNwyWTVH/S9oHu6j7V4kXEIpcAHt8ljeIKu/b89EmwsPRodJj8Faa7FN12bwj7sosLHBcN3K9X+ILNXWPvOK7cUa+Fg4+sVW4vmLnvTLKS+OBWce3ODNIczwYBS5yTgMTU0EOxJnXRJGqfrUEn+VHebnnKY0OUfoTeYsL40kzmr8mN/skTG/H0ZrPo6aHuJgiaQ7ByDp7dnurenb/+pLmtEfumBNb6rWayCB5xCGyhmP48qgLf3jZz3qNkBSXuiFikm7ffmYlwBoLZF4FAnxx9b53sWE+5hjKzLzZb/0tlsOYq7LmQxaZyjxWLB27OpO3J22bBPFMI/fIrg==
Received: from MW4PR04CA0113.namprd04.prod.outlook.com (2603:10b6:303:83::28)
 by LV2PR12MB5824.namprd12.prod.outlook.com (2603:10b6:408:176::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 11:32:16 +0000
Received: from SJ1PEPF000037B9.namprd05.prod.outlook.com
 (2603:10b6:303:83:cafe::a5) by MW4PR04CA0113.outlook.office365.com
 (2603:10b6:303:83::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 11:32:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000037B9.mail.protection.outlook.com (10.167.244.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 11:32:15 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 7 Sep
 2026 04:31:58 -0700
Received: from mmaddireddy-ubuntu.nvidia.com (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 04:31:54 -0700
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>, Prathamesh Shete <pshete@nvidia.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Manikanta
 Maddireddy" <mmaddireddy@nvidia.com>
Subject: [PATCH v1 1/2] soc/tegra: pmc: Add PCIe wake event for Tegra234
Date: Mon, 7 Sep 2026 17:01:33 +0530
Message-ID: <20260907113134.2543273-2-mmaddireddy@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260907113134.2543273-1-mmaddireddy@nvidia.com>
References: <20260907113134.2543273-1-mmaddireddy@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B9:EE_|LV2PR12MB5824:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dd49752-15d9-48a7-c490-08df0cd3aaba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	cqL2h9Jd4ziEJOJ1F6W/XE/rSrHoh6BFtezrjyXEqKGEYpsKnJ9/bfpfpJg9C+dWZJizCE3TPHSPo6b+skDFsyE92BN4Ny7RYgiN7YkfAl215JsMtvSFxGfPWjyiAnp39NbMvViNsF5NMfUYdbT4wX9GOXtcG8zn1HC2yHdwNh2LJhUJFN6s3s0L4ebRWwlD24FlgzPdQIwe7W679E1HX/FdHUMOH9Dn2gOgOQxsIB69hJp9t/6q+ePBpNM0anWxA7jSOPDOEJ3BohBItWboAKdLLc/r12oZjIw2U3OTSjJtYViWOniYAPMUie2FVv10+S3Z0ZjbHbRzKOZi0zBpt4CJ9/rRWWFRBGzX7on1fp1jEMaYJ6II2lm6TpTThjpwXmNkdQbZhUtpYBsM1uTnbPNCnluV9VC5Rvb1eyAY04JHJ6d56cKDrtHmi0Am3mCkgfqesRHOMr7q2h2kZ5c5+rhPVKbKH+kMBDZjbp4Sk86WUayBNDZx4ir2cwwydsdkECa8dMyLfNtU2pXDL6zTPEzaCgQaVleZidL6ACF2XKZGO7TagmDIxVkO5Wa0qsAdtiL4+RGviQEKgVjiN7W9h6SJA1/00DCBl+7TOqH+SDvHr+gj6XJ/iuiN5xu2JAx+PBzfpfRktHq1vHrUlhqf2Rx/i3lO3uy0OfB//fL78ODnw6OhYLmLWvJjgeqUAYH+zUkAEkP65glKGm6jIUfu/g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YRq8/uCnV9Imvyu+yqZCwOhQv6FrmBGV4LPcBGi+R6zAaQlpQt+ed9DmLiBr0Me3O9Mps3SEsvqeDBGqFBh+49b/86ngqen08bZklTTVd/6C7yyAIFcsKwvwopj/F1gwFcdtY+oUEhyWp/TgqBn3JxPZWtmkycCIcv5tM5VpdgAekFu/2Fbf1eVQbVFxbbklTQTdqAKcf3LOBorOu51NUQWZ8qh5h7FDj+dUfZoh2L9Rko4YaugPWeasnqFKOKZXFSwy3uZkrqFBI9fPD1+RofowY4zjDng/UWRgkEd8moRWk2ayyiqaI2pohyXk3bmf8gQ3ox43eAJ/EMbffvxzd/uM1Fui6nX5wYgdSpFwlUjIU8UQyVpSGSS3Qom0QI0Rv1/4ZQTk4qxWMQh6CEehh3+k/Y9fZeEO7nfg5nq9IqvBnONY1Q5kKuRh6gbaeHtq
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 11:32:15.1621
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dd49752-15d9-48a7-c490-08df0cd3aaba
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037B9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5824

GPIO L.2 is used as the PCIe WAKE# signal on Tegra234 platforms.

Add the PMC wake event mapping so the GPIO interrupt can be armed
as a system wake source.

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 41ed716d5857..0ed0a928a7b2 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -4421,6 +4421,7 @@ static const char * const tegra234_reset_sources[] = {
 };
 
 static const struct tegra_wake_event tegra234_wake_events[] = {
+	TEGRA_WAKE_GPIO("pcie-wake", 1, 0, TEGRA234_MAIN_GPIO(L, 2)),
 	TEGRA_WAKE_GPIO("sd-wake", 8, 0, TEGRA234_MAIN_GPIO(G, 7)),
 	TEGRA_WAKE_GPIO("eqos", 20, 0, TEGRA234_MAIN_GPIO(G, 4)),
 	TEGRA_WAKE_IRQ("pmu", 24, 209),
-- 
2.34.1

