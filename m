Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010004.outbound.protection.outlook.com [52.101.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3A53E3C69;
	Thu, 19 Mar 2026 17:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773940206; cv=fail; b=Ml1bRy2nr7oPiTLlUk743e9Xerh52fm3wp/6d1FKIZ/PHjVO8gEv+ZfZNuHlzW9qpQr3sCHNJMk9L12s8ARFzgf9cSlLTc6YAmOAveFiB5Lw+UY4Djoyu/j9yx2GcgZW3avlpIuQCLsQ9FX3nOfOCZHYS7PiQRZ4kBY+dkl69U0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773940206; c=relaxed/simple;
	bh=kUFJEwI77rD7xt5KFcS86a+XmIy+FjxtnJ7Wo2O158U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X5tyyvhIHVrrUXw2RjLhP3FQjoZAL8APeYUu/QE+8DiiPp5mCZ+eG7XYdQhjfFcOau8GUqohvYfcarybYtgLZiLupjX1jvXlwtmDwH+khJWm9WacU686dGuDIcsDT/MtzeW5QPMUoLjmzYH7GX819+SJZYcMkFm/7lSbAu8xPvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=R2inxnc3; arc=fail smtp.client-ip=52.101.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="R2inxnc3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X4hQHZbluaqv5oMY00KXAe3dquYW87pdc9sW0yeY2FTQDbmoq33HnHtJlZQ4Z6wuLneSD+Y9ss/zQFKNyl0fMG5V6Zejy2eLSyz6lf0Jwdx8MVPbOZrHxs7IsVllRMGKj5WVB9pyR2gHRT5vKIPno3V/ThSegjyJ0rO+HBB0SpnQx31pLrhAtOFY+uvXiXq8XhZ7HqUvN0ztaLMyfFmEb1nOWJTgJi0AuVnipH+cnx50r/J/RQr3Rx2CTm3qE3JuPjw9cdAjQvsrmHmhAjefbClCsXE93mB9RGQs9dJwGV+q4xHU+s7h5v448pxmb6w2D31ApNtQ0d209F/UJ5lsTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BaQNuY7IkHJPE4pBKoU9PnUShsOQC9QfXE9WJBr+7EU=;
 b=FooTMruht9Mdma2+DHUqhoe2JJL0JxXzuLkSPFYrExfJw0/iupT+ZQho8xKFWgUC6Q9g0AwTuJ0dBx0Z3sJTLIRDS/jp9Tpa5fnUt4F4b14Drbn0hVLRE3DvzdUz4xq0lecxeh7GYGTLhYZLdGE9bnCzqCvDMVdB503uJvJfCdJhGggjgFd/+CbRah6vFuaU9tRKjJHJU9r0WzpCH8r9q1BBe2edthDvvqSruEVFzfyJnlN1EUx3U3UmssB9Ex53Kg8wPNHjTfsIEf/Wq0NGzMLn52MCpTnRNdqbcf1ihk9MT0rpVB1WT+c+ZEhq60Lnba+taVvylL3pm+/m31hBiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BaQNuY7IkHJPE4pBKoU9PnUShsOQC9QfXE9WJBr+7EU=;
 b=R2inxnc3TdZR4EDOcPDLoWV9H2mq4EAWjrOYaBQg1xK4JIu1oaTNzYSDHBwlc5hKXoR5EGg6FLdo6SUUBnodX6WNXetLqXz8n8sVudFJWBF3Zh2LOo94KlufUFHKpM4KXTTo6oMhgLdXKQiBjOmO6C79XvUg5d1qvX85FK2FJL3cP4pgAVYjLzM+Zu2efjRLLcf9bdgTZHw/TG0/f6RT7A8RUMQ5rrIyyGqu6+hAiXn1uHpI2pQPC7uWFqUIMhoAu+PPfkx4p8XKq8F7uSJWXSXvH00Lvtcl98jambuxz7wLWV16cdWHdkyxlP+4gawrzs0LwohDqej8cuH6XPCU1w==
Received: from BYAPR08CA0022.namprd08.prod.outlook.com (2603:10b6:a03:100::35)
 by MN2PR12MB4176.namprd12.prod.outlook.com (2603:10b6:208:1d5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 17:09:58 +0000
Received: from SJ1PEPF000023D3.namprd21.prod.outlook.com
 (2603:10b6:a03:100:cafe::31) by BYAPR08CA0022.outlook.office365.com
 (2603:10b6:a03:100::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 17:09:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF000023D3.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.0 via Frontend Transport; Thu, 19 Mar 2026 17:09:58 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 10:09:37 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 19 Mar 2026 10:09:36 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 10:09:30 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <krzk@kernel.org>
CC: <Frank.Li@nxp.com>, <acpica-devel@lists.linux.dev>,
	<akhilrajeev@nvidia.com>, <alexandre.belloni@bootlin.com>,
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <ebiggers@kernel.org>,
	<fredrik.markstrom@est.tech>, <jonathanh@nvidia.com>, <krzk+dt@kernel.org>,
	<lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux@roeck-us.net>, <miquel.raynal@bootlin.com>, <p.zabel@pengutronix.de>,
	<rafael@kernel.org>, <robert.moore@intel.com>, <robh@kernel.org>,
	<smangipudi@nvidia.com>, <thierry.reding@kernel.org>
Subject: Re: [PATCH 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
Date: Thu, 19 Mar 2026 22:39:29 +0530
Message-ID: <20260319170929.14543-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260319-nano-manatee-of-vastness-fbafa1@quoll>
References: <20260319-nano-manatee-of-vastness-fbafa1@quoll>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D3:EE_|MN2PR12MB4176:EE_
X-MS-Office365-Filtering-Correlation-Id: 191e28c2-8346-4376-9226-08de85da59a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|7416014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	pTCjEFMICPNfeIxZgwLQCkUPCteivtGZVoTD6Qe5NcBE5uCfN2nrg1pLr8YIn85ZgbI2LW5kedbUdMbhYQntMDs3DLCDlpSAqHUv1yBl4iJFpZLpBMJipYGwVbUsnju/wDk6txljXvlqHNy2Mlmd1tzvHObCPPoybqwsf6cgD6rzThDPVS4e7IgEudL7XtFi5CCkUDFfaPacmxD3nMOkfaA4SsAA87C0XO2yrBmeJSyDFE+o9hMnKa/aX+dKkYRpYo0E6mzuKvZiFDlRztUHycedJFvrikBqPlmAgChHjecw/lxEyGri3QivbJ6z/zrOZ1cKkokfZqb0zllr4dEEmEXdsGAMLOzH9y9esLiV6nmPkF1WPOWrk1pNfhJWqW4V+/irAaounQ1aTUkqmHiUoGy4t9eN9GIk8lRHzx8RkyZTjbuSmHPXVGOLdOLXm+niLOV2daIhsqzjbZ2QLiDKb/rGOTckAiZokNTG6JBxTb4chKlbupnraeeUzjrLcY3GPz0JUEaOPkTr+ImWH67KeeZbQfBAI3uomoBREEPxfMdFVfY2nSLrIxBKGXT63sYXGeO5ANEWjcv9tvyfMZrCiP0jRKeAWi0Wp733VP57xnF39AOAidHGU022XERoED4pLrKwEs2klpb+WFNUrcrvWnbDqzUD9TvQRdaUI58EE+OhQsFwuxOPDL6azWz/FKc+4xiI+1vZeVE7o4Wwh/ahYatzpYyuW/30csFuzgiZ32MzYM43j36fvDa4KqdItt/yIRQGqDzq1BmUuyY//VKFeA==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(7416014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/8ox9nUMLOfmMZrMRC8YSFGkLnbmaXy3L40PqWb1g8usApshy43afNkte0OMRi35nVmbATarDYoqDRroFofKZdVO8fs5nRurvDX8mt7NPDmwHu/0GxuCyIrHpdQX+SKq8bP+LDCxI8zcEPOVDR63K55VOdzXfDR7qpqcdA/CPsguAnrASxVJt8v9dlJ5yyesJVjdQJn0djmwJGVwqgO6SW4DPmf4UYkLUiTl4h+HTARo+nnSeC0SMb75kXYrN4jf3AdGATQnxGbVDfDEEvhEdoPaPdyQWjYi/sNqGCHrVQ5EtwFIh5Dn3KLLpwQ10MjS6HWsMSRRKKECeqRN6gbv/DCCLI42gCRYKjxVWDzcCC36SydKkvZH1UThVSdykl0bi2/jbVCcjS9VmVul79+e900fi0azi7fGkNlmDQsK1Is1bCHW+gfwXk2z2067thbj
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 17:09:58.5812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 191e28c2-8346-4376-9226-08de85da59a1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D3.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4176

On Thu, 19 Mar 2026 10:40:34 +0100, Krzysztof Kozlowski wrote:
> On Wed, Mar 18, 2026 at 10:57:25PM +0530, Akhil R wrote:
>> Add I3C subsystem support, DesignWare I3C master controller, and
>> SPD5118 hwmon sensor as modules to the defconfig.
> 
> Why? If there is no user of that, why would we want it? Your commit msg
> should explain that.

Ack. This is for Tegra410 which has a DesignWare I3C host controller.
I will add this in the commit message.

Best Regards,
Akhil
