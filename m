Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013067.outbound.protection.outlook.com [40.93.201.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742DC3537D2
	for <linux-tegra@vger.kernel.org>; Wed, 25 Mar 2026 19:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466808; cv=fail; b=bNTtldx8DXG3/hq4+TLOsgHfuyImozRF051INJmOmqSuVCM2jhPWugxp6Vq6jfMPglbGP+WqW0HNvoERVWp4NFZiYCmjUGnuHSIe55rd7DxwNx/llpvOsbyW7w4nRu6wimhRFTfK+Hu5KjtFQTt4UFacAN9aI6ju2cqL40GZ8yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466808; c=relaxed/simple;
	bh=Bl4kjDTZtifxkgpJZ5gUxdNoOcqnkvrKLIvxgDB5i2w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r0gEUKcQWquhTsxkP0BYsjQWkIafsRPSvDXuJBja1VOwmnuvGycTTBV6wnE2gtUiiCZEg09dGQojncB0Do/neVhyeMqp+6Jb4SkamognBH06y9ZC8UxTsk1Cu9kpk+XedBcyUqwGPVtHjfS2qFOJXf9iAgB2EEws3suDBMVIXZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mFB6A1ge; arc=fail smtp.client-ip=40.93.201.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mFB6A1ge"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ws31fntR2iL1JoZk8VE199/uc+veAQ3aSCJlVP320Pb7qTXiq63ZfKKjlYA5rxfgLr2nRfYPENm8ljYyBmikoW3nJjXjx5N5oU6D8NP8U07a7aDESX3UQIb+wvMACqMb1c6dHa9vfG22HP0brko2eoMqw+bvmT9J7iJI3YpTdbiRcTpaVVfYw/IFcM5WcKAST1O9aCo1wNpXaN2Cg/lWRhhljUTOtMA1Prs6hD2H+ZCkAJkwotDwHEfSOm78LOWS2ZoxWdSYk85q3xO14ukaOM440+xqVsjfP9h4QcS2x4wux9zHlMMR6itiZWA6fk0H1dAGuqQG7plTnBh7IH3GIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yxb+rFrzZoIDqEQtFOu5A2MrfaH88LxJy/d2vPgcLaQ=;
 b=fWpp1R28dedgu/v+27hTbS/rvQU0y7HU/mgqgPMiV4w/fHY2KG7LmvKJ6bRsxaDIT/lcoYYgR67qw+813MCFHDAhbRE+gPPt06cQcjEsZ18QA6j6bPt5qsWt4j77SLVprvRjv3BtrLVQS0oI/fA0/pLAQFDa+MzjZdbSPJF6NNRtzXDoQEr5+DzOUMWIv0RDCwC185uiK90n4ob809PewDba8ZoeWRrldLkmZ3WqIpXHAKK2E+wE2DSJ4MoAPq+jbKhLLX947mbyhRdyVQfV+4icT2w9XqFhz7v4AsLMV5GPQyLVaMBYvO0gESp+hoWkjpRgmuWYyut7WMw/ZLMnRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yxb+rFrzZoIDqEQtFOu5A2MrfaH88LxJy/d2vPgcLaQ=;
 b=mFB6A1geI/iR7XF7OoTqRb27ogR9Q+3lxtSYv6Y4Ax4MvB/VdUd8IxwQ9PoCQl/qxzOiHb/RqLqHkkw4ELc1SUCf7Oifn3s7/+HMIAIVup/uKJgdLDOlb7vl72xzPUaXWVARnAsFCzIU/4EvQDDVezWQ8uep8v4Qz1pJRwKpFQ98qJRjCYlJbCIOzuVgxVs/hYMHaoSy6PsPGLUEfEkciFPAYfWlKDKOaUilVWW8qnwGIJYEMNU8WSn2LXPHFFZxch0enLpgJkKrgHaxcDGpxZevCZuL57kqFQtxtZwBvPTxEwztoVU7DRQsQxlVH0FpLNjq3/M4ZhS/ZnIiGT8/kQ==
Received: from SJ0PR13CA0047.namprd13.prod.outlook.com (2603:10b6:a03:2c2::22)
 by DS0PR12MB6390.namprd12.prod.outlook.com (2603:10b6:8:ce::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.15; Wed, 25 Mar 2026 19:26:43 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::d0) by SJ0PR13CA0047.outlook.office365.com
 (2603:10b6:a03:2c2::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.25 via Frontend Transport; Wed,
 25 Mar 2026 19:26:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 19:26:43 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 12:26:25 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Mar 2026 12:26:24 -0700
Received: from moonraker.home (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Mar 2026 12:26:23 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>
CC: <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 03/10] soc/tegra: pmc: Add kerneldoc for wake-up variables
Date: Wed, 25 Mar 2026 19:25:53 +0000
Message-ID: <20260325192601.239554-4-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325192601.239554-1-jonathanh@nvidia.com>
References: <20260325192601.239554-1-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|DS0PR12MB6390:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cf7d8c1-9de8-431a-26a9-08de8aa4727d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	xPJp0hMzFK6I4UYH7OX59dZ97V8BYE4dShGJ5cclkXCblhl4FHluETjqs0HO3BE1ERdcnUuYxI++RMdXKCG5DALSnuEn74MX8M7U6njoFiHC2J7tidmuMRLbAPokFzuWRTT3eTP29lqhkFAdC9fwc0cIEMgvm5CaS60SV+1+Zq4dHos80ji7+u3JD2epumYBVWVyrQvwQ5YmXMLiIJ4dSe+2bH7k9IliRk09tpARP/vWB+e471gdnIH7XsPmRwRiXPKjFMyxT+aqJiLdzIucWmT/RuX1I8pT1rgL+VFRDWdG35X4wH+0Tp8yBt1G293puf02Xc3nqdBBU9Bq08dRb23G8t5ryP5wPAi8P4JoGPK1Ql2yyhthUgYJRvbOrxtJShJWDza2dLlnWMotoF+U0PeVQrsskrjN1uu0ia6VGWUg47UY3Y5jOnkehxDWMxL+EtvOXFtn1ZJLMNGgDO/fcrmB0o+UUWHwefLkrETUKwEn0PGVwKGqjlNV3q8e4s23mt+VA82fySCXrxSoLcJ0TAJ4Vq9ts9b+BCVHoaxwunv6xKXeVk9s04GrNCT3Ra7ymZ3NEyV0eyuCxDSrMZpAbSDhulvRsK9R+ywb1b0jzrEOTV/DIRtkNBzhTlaYi0LAbJPRYe5cP8AbfAucb6AdN0znzHgl1jcT3Q6dWzE8W4QzT/GuVHhPxzufn+ZQDUMWXrvtLkMij18TzIdQ3amH1WAn42U485WFwJSVri4gbhIV0iqsE3a2c2VMQv+Mo6TXUpAq7pxr14qEMKEOAsjWGA==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8xk58Tuh3wlnBjIT8XtigJB8NjLI/mGAuHeviR8PYgiBLWf5i/woQ8izx9tt21ZwIwcz7iCIuSirKHS/ProoTkqXCvn+lAY/XdiPQvounhdh+gRKggpUqd90wiugcgBnJZMuMwWXO1HLfiGUPi3+E9fl2ytJJ+t27UiwzBTjRALfCxQmPFQNuUKqwvgCAV1SZSbW68EJQqDNOkcwSbxhpw2cqx2lJrb9GqMTRn3RGJXjxKHmmS8Yavy/q7+12Gzgo0jJo78RgKWx97uNW79LXmlrvYdo0P7kP/HQu0h57eLbDy2OsCQnUHXAT3W9fT9j7jXgaH6wDF/cqkHdT7++mjFTrd3IkHp+CPP1UU8b2l2SPy6POvpEsGDezAXlw2zfWGiygqWll6xtzeEKj2JSoeMK9d+57Bibr0PHwORX6nq/5VlcYDWU6BbATgZkhPhG
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 19:26:43.2962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf7d8c1-9de8-431a-26a9-08de8aa4727d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6390

Commit e6d96073af68 ("soc/tegra: pmc: Fix unsafe generic_handle_irq()
call") added the variables 'wake_work' and 'wake_status' to the
'tegra_pmc' structure but did not add the associated kerneldoc for these
new variables. Add the kerneldoc for these variables.

Fixes: e6d96073af68 ("soc/tegra: pmc: Fix unsafe generic_handle_irq() call")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index b889c44f8fdd..6debaabdaa36 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -439,6 +439,8 @@ struct tegra_pmc_soc {
  *     cntrl register associated with each wake during system suspend.
  * @reboot_notifier: PMC reboot notifier handler
  * @syscore: syscore suspend/resume callbacks
+ * @wake_work: IRQ work handler for processing wake-up events.
+ * @wake_status: Status of wake-up events.
  */
 struct tegra_pmc {
 	struct device *dev;
-- 
2.43.0

