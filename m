Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2048.outbound.protection.outlook.com [40.107.236.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837E21CB9E2;
	Thu, 17 Apr 2025 09:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744882309; cv=fail; b=t1OhI7moUenmp/XIoTj/9TeMUxa+8m1Y2LEb23OvT/k4y/+es38nHUU82hizrc9vsGImX6rYX9ZLh5BUo1ajE1+ETNGRWJEG0vmmZXL3Ge6syjLwwKjW1OqN+7hcdb80qCPOKRTHodwSNFKnRhgHmaa44RMzqnol5UD9D+OaPss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744882309; c=relaxed/simple;
	bh=Hg5mX1Mfc8pUKJseHs/DelTWz1M9/Cb8KNc4fH2cWrE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Qh84M6LpaUugen7kfRMglIVN1Ogol1bUVjKsv1UK76NqYdeb+tK1cvJQqZyD76D9d4FQVxxy0CEsgUXh2Cpr1GovcWI+5tyCWdFFf/thl3CSV7Tq9jbMJii1ESz40FlG0/YgSLICkWBnswlu+pJDkmaZikL7QXCk78XT/sl07To=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=c/Mv1PD5; arc=fail smtp.client-ip=40.107.236.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="c/Mv1PD5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L0+sDTYyNece6LNS5XberDHLwSHPSt7vd0bVrNhrvRkyo8IMnyUWoMkOXVNy5YNl/xISI4rk1EvuDXXztG5mA4z7a888HEhWksHq9iC5l1y2tnmwTCyV/3jGX7qRHudgioQLgOm7y6ITbTKuFYhnZFE0pDWKbs+dg1UAAGybHmB1pcx8qwd2ebuKEpMGfn8FLYNzTOcwV/cGdgHQXwn6cU3C0XY0GtuD2dF9yXpLVbSsl/JlFIVApAyRXcowyM+RvIupOQbvFYFu8zTTm8//Gt76jZuH8HOez4VtlX/TLMxmOtlNWilGs8HAr0CL1GL8+HyKKtomj3085l3/3AS/mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bGYIAuYf8cwucunD4WR4QKxbMawn+TBHJUodBy+ABjw=;
 b=PZa892Okf390sDMfiXe738hfrA998iipyTxtxiK3mroDAuztmDU1MAe6nRQjGa4owIcbXl/YOrsjlceaGXysmVtCOvhNHpgcNgZFj3ZiczeRMdKo9AmpOyOjMZkNjGjJTEHQne4mnV2FTHqqIIA/IxhAZRJbh/tVWsOczbsJHm4s4Y2jQ/72pwKw209hffL4Dz/veG2UiL581cZ/EKGNVvTBruXN524nW9L2JEfm+K6GZM72Ifsff7TXH1okrqBGyz4h/4josUaBKzAaTBgE15xUlSy/9Bf+kNmwaJVOTJvW9j2wtU8JvZKkTQIltPIsUCQrNShYnGLHhAmAzHB88A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bGYIAuYf8cwucunD4WR4QKxbMawn+TBHJUodBy+ABjw=;
 b=c/Mv1PD5YQUatCvoig/odJ4GgDlQyc+XMHWp+fWqmeEi+JKTt5+uLl6Q7GfUL+NRbIp/5NMIhp2f0BnI7gQdC1XRv+U450/D31g6Hnvw8RTeHWIvhbZHLaBsLFOUZP1KrBll+g5nP8urA+kDxOJ/ePzZYNlPaV5bobV0KDxdBlR6cRp1TyETr6SnZFoZGiE0ov7MR27UhpQ6hWqrA2UAYo3LsNdnxHzGcO7vQNFhjiRlkrIl7w3UcaW3YSX30cjUJngvtSUrZKNwle5zNRFRcAcoLG0gUFjUZSc5wJx4AnAu0Iku67o90jk53wPugP9Dv/xWTwio0fd3PVpuSxAsrg==
Received: from CH0PR04CA0112.namprd04.prod.outlook.com (2603:10b6:610:75::27)
 by IA0PPF316EEACD8.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bcb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 09:31:44 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:610:75:cafe::bb) by CH0PR04CA0112.outlook.office365.com
 (2603:10b6:610:75::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Thu,
 17 Apr 2025 09:31:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.4 via Frontend Transport; Thu, 17 Apr 2025 09:31:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Apr
 2025 02:31:25 -0700
Received: from robelin-Precision-3660.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 02:31:23 -0700
From: Robert Lin <robelin@nvidia.com>
To: <thierry.reding@gmail.com>, <daniel.lezcano@linaro.org>,
	<jonathanh@nvidia.com>, <tglx@linutronix.de>, <pohsuns@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<sumitg@nvidia.com>, robelin <robelin@nvidia.com>
Subject: [PATCH v4 0/3] clocksource: fix Tegra234 SoC Watchdog Timer.
Date: Thu, 17 Apr 2025 17:31:07 +0800
Message-ID: <20250417093110.2751877-1-robelin@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|IA0PPF316EEACD8:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c17d004-3caa-4f3d-f1a4-08dd7d92aad7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?emJlT8e/6bxw4NEkEF4IzhRPbU0hK5zrHV/h4iBKNjJTGP8vOJTi1u7+SF5k?=
 =?us-ascii?Q?PHbmuBqJ/fJW6sCjNhHp0dFI6g3+2uHBDZ8WpeOblvNiarhMDuIDU20HKLsy?=
 =?us-ascii?Q?fS6qK4kTDG77WYCe880svoyk8Ly30lSprYudc9thn1JZ3XiPFzY7ensORmm5?=
 =?us-ascii?Q?Bph66Vx/F/vtl6Iw3F4CFXhOB3Ph4tWZr8mphKllpRrVqMw2NZ90D1Hjebhh?=
 =?us-ascii?Q?awYNn6Gb+oAJESaSqxArxmPwb34RFPfSfBtCEAUFMtYqKJS3hG8KzXtmKObU?=
 =?us-ascii?Q?Zi9sc4CgiJDBTxNFlrxCIEAfXkSyHloQURY0tDERtr3jRgbH2yfLORVQQpH9?=
 =?us-ascii?Q?nfsm/DdoNinnSIzPgDn3CnqfaqXnPR5/+ujgkzTwYuJtbiG+MSdRIiKcZ98m?=
 =?us-ascii?Q?41TQwK6ttu1Q83ylmR3E0x3cb8/PfZJoz2LN3vNhtg9GYlzyxXSxTtoatIy0?=
 =?us-ascii?Q?PLOITHJnkTJ3zbLnm81Q+LxBpSMuecaOyqzHLhOmjQqDZi9MpUHEaZfAdHYF?=
 =?us-ascii?Q?aFQO9Ky0bheTuAS70g/97NIFyE5XJ0aoPA5zcq/FuV4gCzk94y5G/YH694VM?=
 =?us-ascii?Q?JbizfnCXlTLextbIprR08hzNtLSDxQVrwKZgJ0VOLB5mD0Ia1igtMtfy27Ku?=
 =?us-ascii?Q?U4dnnJEyGMpXb2QGhV59Xb2rgL69qWsggjOm1KYdy1xPaPsGBeQnIB101tog?=
 =?us-ascii?Q?QO+ypxtlXUf/ubIkuhI06AH0ErwdFqhSsdJg0iQpI0emxDuRFD0g9WkuyFD0?=
 =?us-ascii?Q?sTWqgADLGw2Iet8JnUeF1iVhK93l3JnCe7k8noj4kdZtQu1PvG2yIkE5W1SO?=
 =?us-ascii?Q?zzVavtaubwbYOMMSnFjmMwkm0TpYmXJ3fgBGCCVi+ZMn0MOi1HA5WtvVZkQP?=
 =?us-ascii?Q?ilVXMgEQIpwcSXDQF6cnySb2/NcGsbUTxYMOGtUvTM74VKSThXMGNgJPdwK4?=
 =?us-ascii?Q?viSufuYA+yGPMRkOlDjQ93DWbwst7hDnrm0x10O3sH6bts0+iCb2VoLbu38n?=
 =?us-ascii?Q?RDEsThjuju4mSt9M3yLoVk8A2C0v6LswO9KF02GVbYMxX8dJTDazRe7DO7/8?=
 =?us-ascii?Q?a0ZaL61iZsBQBRN+7qrbsmE+nHMTAYkwvSL5XA3z6G7qXnPtcUPTvB2/il0o?=
 =?us-ascii?Q?Rjt6GlAzRn8BG9QTaf6Aunc4cGIYgAa6wZXzSFKEoqnAfqoyDPXWVQPJVjV7?=
 =?us-ascii?Q?lNJCyINkysRfQyEGP5hFnkc3Okwwk0lgvdXap+Hix/K8Ts+CEiseSLwVJ2kA?=
 =?us-ascii?Q?aS/MQ5Mk3mZkA2JJrUUW7UHLuFxDWGiYyJbSuqvpwXKEan68oGQlmx2Cdhz1?=
 =?us-ascii?Q?SmSCSm0ECXh+F/dpaHKDqHaOS3vOBhrARHJsbI1abZRUjAFo57DCk786xlQc?=
 =?us-ascii?Q?9c/sLuBTSBFITMtxd2bOUYHzg2o/3+CiRYOJwreeZ2ujTpImWZ0OaORZTZFc?=
 =?us-ascii?Q?rcms8IQ7rC+5ntkjqPA69i0hnd17vwt2mWvux48/JLPk5kZo0S/wdxMPlCpo?=
 =?us-ascii?Q?RgL2lQRZxi63UWui6YPf0yDBkEAzgkdmFbs/?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 09:31:43.9687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c17d004-3caa-4f3d-f1a4-08dd7d92aad7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF316EEACD8

From: robelin <robelin@nvidia.com>

This set of patches includes a fix for watchdog for it may not bark
due to self-pinging and adds WDIOC_GETTIMELEFT support.

--
V4:
- Improve the precision of timeleft value

V3:
- Improve comment description
- Refactor to fit codeline within 80 columns
- Remove unused if(0) blocks


V2:
- Fix a compilation error, a warning and updates copyright
--

Pohsun Su (2):
  clocksource/drivers/timer-tegra186: add WDIOC_GETTIMELEFT support
  clocksource/drivers/timer-tegra186: fix watchdog self-pinging

robelin (1):
  clocksource/drivers/timer-tegra186: Remove unused bits

 drivers/clocksource/timer-tegra186.c | 92 +++++++++++++++++-----------
 1 file changed, 55 insertions(+), 37 deletions(-)

-- 
2.34.1

