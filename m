Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010044.outbound.protection.outlook.com [52.101.46.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E64496D5C;
	Mon, 21 Sep 2026 12:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993202; cv=fail; b=u8cadYsUuaL3UIjfXI0NC69xRtGOaED1q5PO7xqgS8z6AMAKSGLQP1jY5SS2J/bYbsCwBq3aq2/oUoI9ZCDsPmDwxqGL1l8w5vppn65n9QMxFlBYXYJ8eUfFVxV3x93IJZIXSOOYSBbvEb8Y6nd4QFkAxv3eeufeqa35cKSNoZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993202; c=relaxed/simple;
	bh=tov5eek49UOCSOpMkiiHb+RwK0RKzoXxUYi8wioOZeM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=au6MFUiullqdAlsD64ZRN1AZi3ztekLpfypViymlqecjqyBlnVKevMXfwqX1vNYKFA6kE1ZggyhbefvHJcW587/dh/EPvEGum5G6Pg/tQ3d8NM58w0bKqXZ7+lbudJOj0ENqkAp3dcvB7fqVMyimbX0B6TXGL8gmrJf9Q8OEH3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GN/tJ11R; arc=fail smtp.client-ip=52.101.46.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GN/tJ11R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9DtBDOr0hGPra7anHFi0Q9kLAyPxk0scOr58W588zIjD7hNDq6bwTLOIbyXKDft6AQ7Qwh4HFsAYJ2eWtG61DUFMinPVI71mDRDWM4hWCs88j88e/jxO9FhNPKLDiEWmeTQprYvgcrQ801PmQMq+9UjiU9WBw5PZ4z7tAtIr2HwWNYLEYLzJRiyBbafXFgdYxiFYSI306VMUuv2J9SXU01c0zVPS8v5dLTI36I+GTa+HslsYLx9l54+QC8uKyfBLPMnkq/EeHvBHJtolyBaK49BE5i5IkuMdapAedkwxY+Iz9HaLOvEE2X/xNHQKzdAxJnYMPrO0HqLVSF9r7eUaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=urSfN5+BFZUMrtIIXL/w22ybpeFBh/tB9/D2Sk7x5mU=;
 b=tSUP04KcrZ3d7+/NOLmnPGizXSt5wOdR8Tm1AV2jA8Payff8Uo+vclwWBR1T5Apc7d+g61Deal70S9oYMSysW0nIE+otBazGIjxqZEeZBRenu7Y0m5MGCeRnUC0/THAq3XD2paLEVhzzrhs6gi6OjNYrTUwIIv4/wURv/vR9GIfJF80Q3GslhPpDxXKMS8jAYUCInTWeXOYCgqAEJeTt9L0PHLMNbGbV8sp15HpWy2J5q2SkoNLa17H+MCXKARsegqJ1SOqLQWA8U25zvcXUvKnAsIdvi0orxWmSdprUxmFY1JEar9fkk76rDud2MbrESsvoMu2FJqlxwWgJit33tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urSfN5+BFZUMrtIIXL/w22ybpeFBh/tB9/D2Sk7x5mU=;
 b=GN/tJ11Rci/19+RnVG7ik8EMIE9AKGhInyC8Mtxe90vy1u06s2ZbGuIxgJ8bIz+9b1AWUU/Gwr1sw4cyd/XzD89rtzRgw4ap3fmz/FaEG1Yo1TctHdx2aRBP3UqxfEDaoAy922vnN6vlnYIcN8jaDNXf5xHq93CT1jnpuu3zPqKwBLsQiL3SHjWZRUU8gDo+I5m59xAvM/QWjbYRRo1QxwS4NKYZGxfPsrSnf5gSfb3yL/DTmt708+zUcsZmrGkPyQKrC1AR/Eb8wOX3tHpR6DXn6FyfIFJL8L0pj3hJRyIW9aOprFi1sz7bYAuW0yYGO0ky9LwkL2Aw58mBY5QSzw==
Received: from PH7P220CA0173.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::6)
 by CH3PR12MB8910.namprd12.prod.outlook.com (2603:10b6:610:179::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 12:19:51 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:510:33b:cafe::6) by PH7P220CA0173.outlook.office365.com
 (2603:10b6:510:33b::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.15 via Frontend Transport; Mon,
 21 Sep 2026 12:19:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 12:19:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 05:19:31 -0700
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 05:19:27 -0700
From: Jon Hunter <jonathanh@nvidia.com>
Date: Mon, 21 Sep 2026 13:19:05 +0100
Subject: [PATCH 5/9] usb: gadget: tegra-xudc: Fix CNT65 configuration
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260921-tegra-usb-v1-5-74a925a35d82@nvidia.com>
References: <20260921-tegra-usb-v1-0-74a925a35d82@nvidia.com>
In-Reply-To: <20260921-tegra-usb-v1-0-74a925a35d82@nvidia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, "Nagarjuna
 Kristam" <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>, Mathias Nyman
	<mathias.nyman@intel.com>
CC: Thierry Reding <thierry.reding@gmail.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Thierry Reding
	<treding@nvidia.com>, Wayne Chang <waynec@nvidia.com>, Jon Hunter
	<jonathanh@nvidia.com>
X-Mailer: b4 0.16.1-dev
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|CH3PR12MB8910:EE_
X-MS-Office365-Filtering-Correlation-Id: 504065f5-8ca9-4ae7-b39b-08df17daa2e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|7416014|23010399003|82310400026|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	m1uIrVQ7DYQrIQ3ityRJI+Xx4mlK/qdnEvapGAzT5g4Jh7k52l0RB5FEDgQEoYW9KuzMj8nKvJKGAKigLWhEXdRC463CKwQapwtuUshEXD/G65tFu5LkXGhlChif+sVnw6XIaQaKHHwoJQnxwIGlNaxqcysG03+G51J/m4ev4qTyB4NpbsioXN2f4Sqt/VUDmeEYi/p79MeRy2rrUyxZEb/JPoQkVWBxy3If68esRgI0mCmCGJ2YqfjQLmcGAgwbCIDnnEs5AYiKKKVqu4jEXPZ/nrBt69gugeHBIeLtyVmNLUlpimiQ1sz/Ase/NxC3U7HUo+2/CWJzJHMgYjZaVxmtf3DoZzMzMXUukmcO5BfuLbe8PrNh9K/SAVCGv0QVvsN/fTf0F5DYw9jfKKsn9A+nKLFSUla0v9hwnOBS/xlSsSMixRr8bx/PPAPlyPegu4bEU/NsF9dd8XljRP/aj0X06+J1jAwXILQTWaxTDvvQ3pOVMhG9RxWwIstgMaleFOVcL7WJE2+hzD+U1iulV10OrYW0sWWzQ4Pot/Cr9mAWG6TiBMTNwOccPK1+esbAnJdS63hesbcMfYc9MWl0ea9rc9R8KCNTLS7IxXp8tzOb+80adclHGIhwvBP5cDPRwHYBeblNTWQDlRltgFgUXNsOZ8AcU2fUw+xax4Lm29Epru+vH4dpmsbtoxyuOBEelQ6fum9hjNvPcfIr65+3Xg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(7416014)(23010399003)(82310400026)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+l6774jFvuA5XkJ2PU7zCefCHpMeV0sdC2DUAB859W/gdocJOzJwZxrJ/avmva/MTSNjpKS6NAJF03KXxhVh8f4TzaxTkDDd13QcwBzBd+y/9fQN+Wi+nj8dkVZ82s4I9qS9kHikk3lNqj6yFYLtpa3dhKGhYEUPmJFI+7EhtrqngwT/9CRAus1Uc/KCLsOLIf3SioRzUEkdR/zBHVFZ5AGftBKsYmzBPTsnUB0bBQflVMFTd96Yo1RH+mQePFl7JaaJxoGkmgnVLFpsG6MQgKfBXk3g1gfi2bgvDtcleZz/hQHYro31g83VZbjJ+IaYTq1V0hUMyY0qc99YkxsZUEaevYZr2tiMx18LFuQJ9Uae/0jfo3L9wAybJeCZanAAPKK9Vztef91XWRWcqkDE5jAKL2L5DN3xK5cA5pMsY1djp954+rCJ6FYP9b8gCQZl
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 12:19:51.2706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 504065f5-8ca9-4ae7-b39b-08df17daa2e3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8910

When configuring the SSPX_CORE_CNT65 register, the value is being
incorrectly written back to the SSPX_CORE_CNT66 register. Fix this by
ensuring the value intended for SSPX_CORE_CNT65 is written to this
register.

Fixes: 88607a821ffc ("usb: gadget: tegra-xudc: add port_speed_quirk")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 5042c13f92be..02002221c1f2 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -642,7 +642,7 @@ static void tegra_xudc_limit_port_speed(struct tegra_xudc *xudc)
 	val = xudc_readl(xudc, SSPX_CORE_CNT65);
 	val &= ~(SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID_MASK);
 	val |= SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID(0x4B0);
-	xudc_writel(xudc, val, SSPX_CORE_CNT66);
+	xudc_writel(xudc, val, SSPX_CORE_CNT65);
 
 	val = xudc_readl(xudc, SSPX_CORE_CNT66);
 	val &= ~(SSPX_CORE_CNT66_TX_SCD_BIT0_TRPT_MID_MASK);

-- 
2.43.0

