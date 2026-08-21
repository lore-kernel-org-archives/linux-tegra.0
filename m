Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012024.outbound.protection.outlook.com [40.93.195.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1071D48C8AA
	for <linux-tegra@vger.kernel.org>; Fri, 21 Aug 2026 13:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787317334; cv=fail; b=o4iIEyO0jFF5xOKqLtPTJ0rx70ammrOt+Z585VKob2EEjArCtbYOYFgU1LKMTgZ0PCQmQVrhh5qfIgKf0JipV1e3F23F4/n2EvvQNpGiWBgukKmSUoILMLAibTHE02Oj/wrT8WohWBGr9y7/gBBas9/Y73dYo+4ZY9n1nBWUeqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787317334; c=relaxed/simple;
	bh=Q6qeXiOiDX9flp45lRr5pDM/c6ZaFtS36bCKuEaWR58=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h3pPNyVAHd6rKOKeGYdxwRfOAKc3kljJ8PaeOUJxIeCzUJ9y+7jTrl8HXTJcFBOG7e4tPma2HpE3+ounDaIupVseOjsgVmKkcqtoZzc8ULz17+i6EtEX7it2YUYkNGwkB1ioR958QTVaSO3xIAYeLUjUhkgtHBqOMTWLLq8LRHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tSeCj/A/; arc=fail smtp.client-ip=40.93.195.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tSeCj/A/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndxjYYV6Zi+Fkuum0cMG+LtDDwWrN05v23ne9mMKQfgXpWdpozdNY66enZKFQrpH5oCrWzSnLpqkWETg61dS0KdzL0IwFYHg+BlTaQhuv4UICRSY5i3BFLIhb2QroyBvFvo7KJMM+cL5pzKh9U91CafEeg1kaQArFhpkCFSuh3b4fO/utA7z6+Mcx9twgRbHrTI0n5JXPxb2dr/ABJzAdoU88a4D0CfMDYwiDwSSJYgdlDvwR9VVW36btzZRfML3aHlw7bfNqdcziCPb9EbuBbvJpxPHnaSmw2By0fwd6FuDC9d32YKTSLkHSqBCtIIAwpzTKJh9+eHN6NLzgnleVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdS4gP/3DUfVfpSSzlDCbGjbUlc6mmHQHo/bIOf6g1M=;
 b=K73d/mF2XUnnKHGFoHJ5SIzsPwVhUtSE6rWFzdv2OpYvPsecF+LFK+V1qcxw9PvmNBRNfFeXXLN5xxhPgzptxhPWN+srA9A3cs3gyxpYqhcfnjzRAd+q2k/Ixe1i34gMiHSKoxQCYRBjmRRURaMA5mew92GhzrwQ1LjqRqhvlLbZK8azT5KFJP1rOBdzvE/LI+SNAGFY+2MiQCdponvB2Yt/YgYP/PmmmER96jgxuOKUwzU3ukND4n1nDGovHgGBJqzgl784qIk3PUmxySJxMjZvC6LjpDKKlbbFSPkHa4risCvVfnjeUjOcfgaW2AZkeowLAYlKwzr5BoLDKBvt0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdS4gP/3DUfVfpSSzlDCbGjbUlc6mmHQHo/bIOf6g1M=;
 b=tSeCj/A/xb4YrZwFo36XoboRHzwVbLisZwligJBJqz7OA3RCu6DhJqub8s2JuLNXzSVmNvS6GT/GCqGlJydgmodoqMR9xvz92sLNtQFThN7Eb06uoyaPKV3S2113s4e7yML6hjYTjcV4seCoa7uFJAU5m/FJZFoXzXThlYIj+21sFEHb2gyHD3e9ovyqb8pqy7YvODjnYCZ/WpvysxrRVmYEjw4zrItC3xi7L78D3A5emhVNBoWFYgZRSfQBDS7KQTSoE5flxS+cRPrsBHqZomwo5QBkrogRstMqkE+Df5eUCjBxFTpNwRfk7fnsG4il7ue9OtjjuCZCF0Xmil3NOA==
Received: from CH0PR04CA0030.namprd04.prod.outlook.com (2603:10b6:610:76::35)
 by DS0PR12MB7778.namprd12.prod.outlook.com (2603:10b6:8:151::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 13:02:03 +0000
Received: from CH2PEPF0000009C.namprd02.prod.outlook.com
 (2603:10b6:610:76:cafe::a7) by CH0PR04CA0030.outlook.office365.com
 (2603:10b6:610:76::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 13:02:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF0000009C.mail.protection.outlook.com (10.167.244.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Fri, 21 Aug 2026 13:02:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 21 Aug
 2026 06:01:35 -0700
Received: from moonraker.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Aug
 2026 06:01:33 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>
Subject: [PATCH] soc/tegra: pmc: Fix uninitialised clock rate
Date: Fri, 21 Aug 2026 14:01:24 +0100
Message-ID: <20260821130124.58844-1-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009C:EE_|DS0PR12MB7778:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c0c00c9-9fda-4b8f-acd8-08deff846564
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|23010399003|18002099003|56012099006|10067099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	9S/nPudiyT2cy5kGF5JhcDBlyWl3PmSWtepS2rsvoTm0lbMTzcsav23PRMfF39rRuzKDyqOU+Ff1zx61KQJYoJvRYaOPpOKJARc0bEpMcyWZvKSAftHAogSEhi+6RCX08tt4uIzIjAPzrJuv0WwsbBJwlKCPJbabStxnxkO7dsvKpWvXv2V/wJqpb1ahBYLrr85m8X5CsZMas1li5Kx/F8rSrlBKGn6PcD7c0hFjOTWCeS+t7vP9XrIrG8JLOC0Z5prrGWKRA6nFPeONkVVOH/2qFHAjp2JxqEGp3QIf3tw+sEt9lRDb4sf5x/r5VW4cY58NKi8Cnih+noQ3Ng9feUa2n4utcmQ2ynsygMh7uSW5SI18JsCIO1Lx1yVCQqRESxCrJqET4lnt0qB9/l47QghW8TwptAK2TZSHo+GgN3sHnwP+fk6R79DUPiRFSvTMZAOBvxD01FA8lcoORpqecSgun0pPMH/mVl0oHbajC40vl+NRy5llMTDZcpN5HOglbiTTEWSQSRo/00gwcfNkUlgqpN35F8MUtLLgCO6fH4eS+hsVqrRkP9k0gkKi3KBJ/jkq9FKgNWoATp8pbz1EqUXvLkgf8l6gMwmTfwnTmJ59DP9kMKo/Uqg0VlToGQGZXOOBZPS+JOQ6jI/w1vCK4yaXRMh99VLVFPWSA7b33SOJ+evyMDbuDARB/Bi0XmEh843pbm1RJlJQFAvaALC00w==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(23010399003)(18002099003)(56012099006)(10067099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Gk/g0obihjcox8OszgUxL7xsaP6iQ792cgeM9jEF1Lfrvl2GQAydDtdlTH/L8xN3ONyVXndVDQOKpIsPTmYc0rT5pDO7eHbbWsn+OlH9LL61olt01utzJJqwIt/KhrK7wVCn2s725RxiMXZZ5uMwmWJ/hhl+h1N3CfSc6miDwxg5I2dBgc9N7Dk8t4SyRqoAJI3WC3RvHO+dK7EQLIgweyprUVQ7bREjK0l35rwJ39PxMWVKW4zHZMsbvrUIawlHMcmBRgPDVoAnMI+oP+yA9Roupj7pnsm+M010S+OYYBp08Qj9BWw4NivSpUNp2U0Q1EkeuSLUbJagJx73nZm4Qsg19Jk45ks5WEtridHto0oXSbaK3fJcR4dfYAyoKpdqBvFAVlSIXMakQtGBWkcxs4a1+AvkUBg3gc5viWQIx9IUKlmFMnugP+fcrob+xm4v
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 13:02:03.3057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c0c00c9-9fda-4b8f-acd8-08deff846564
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7778

For legacy 32-bit Tegra devices, the warning in the
tegra_pmc_enter_suspend_mode() function is being triggered because the
early_pmc->rate variable is never configured and hence, always 0. This
issue started occurring after updating the PMC driver to create the PMC
context dynamically which causes the 'rate' to be set in the new dynamic
context, but missed updating the rate in the early PMC context.

Fix this by initialising the early_pmc->rate variable for 32-bit Tegra
devices when the rate for the PMC context is initialised.

Fixes: 4d61f0342689 ("soc/tegra: pmc: Create PMC context dynamically")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 41ed716d5857..6d7ac2b8c74e 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3121,6 +3121,9 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 		}
 
 		pmc->rate = clk_get_rate(pmc->clk);
+#if defined(CONFIG_ARM)
+		early_pmc->rate = pmc->rate;
+#endif
 	}
 
 	err = tegra_pmc_init(pmc);
-- 
2.43.0

