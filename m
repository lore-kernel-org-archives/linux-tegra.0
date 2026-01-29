Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013003.outbound.protection.outlook.com [40.107.201.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B315C3815C5;
	Thu, 29 Jan 2026 10:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769682676; cv=fail; b=Op8qUlUEOcjjycOjpMrSKtzSwcLkHqRrKYC2Ygt800mpJm/CrmutE4AdUqR1m1Vw/bKrJovJfrNCfCfnFstC1j33+uMLGEdoXsaKETcHwtTFXbH7dpn2XdQWfYKXgAu138A+5hbLq75Ee+QU6HtZycjag3p6RIV1ciqi0PycXRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769682676; c=relaxed/simple;
	bh=qTC5Ih9iRZnUSr7dbir9ZRrfeaW+luZp/oLgzlV6pfw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HTX2q6HUa+W6aM84WigZBI3joTYUUqlwfu+pBO2XhVN/V3zoVG9Y4oki27MJvoeC1znccnW9SAbAPbCoTa44grEkQkp/KVO+G4/pX03BkAxus6UO7SCOQrkByeLJvn1zBtzhTZzEqaNWrnjsRE9yyopektgcJShGtkQZVENlRu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=m3yQtrKE; arc=fail smtp.client-ip=40.107.201.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="m3yQtrKE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tZScGW2oEm5a0jseuvbVN2stJ0sHhD9aCswid44MVnkN3SzL/i85Y9DG9giVgAS76zrWCM5z4yo9yL1/FrWQJJCRLvCWdHmfBtxIrTqFuPLBaJHM25PEAv2ZBxnR+9C+i2Cycf+ttaZ+7Cc5n0TVaUYSECxJx5H9Upq5xiVTK5w5WhDF4bExQg0ee2qQDdM59XOQVH/CsWAqZd0lflF0VSgBZRHJme4zkcO3tD66G2TyB18h8mPjPzoxYUOJq5xTL3+WypX3DPqy4DfcteH9cfusQeZvznSIoO1ck1fSr3Msb33KeXfU9onAdZAfL7dJ1X25vQZ4fKVBQGue4jzUwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZZo/hr/hMaPEfpHwkYDuYANtZlWIDfWMax0cmGmmIU=;
 b=A5rhq3EVdBkLoi4JTaDGUTmqi8R/OSLzsZbygbsfykHiJAwdkRZ/IgO6+CtYQ8l+pT9mwsdTFC8/ifBXeLovO1FVxTNwnk23FgGgnxLAoELLHB/Ftm7zhyVZgZSObjMckNiYQouGd4V9FJME5BdXAr84OOTcSdc7VSsT/OYuXhQMwmwLZMYXib3Gb4dxhZQA40yYbBMQ6sxPgMcVkv3vZOq6JKvOJolMMy3T33Ni2EdsSi39IKCqu9bb/KlWrte6iZ0xn1XVcpNS6E5SC7ObINYPU4Y54Jge/GZvL/EcQ8gpQn2+XUMqlNlld7nMB9TV4Bq7fI6UVWyp96m0S8NUtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZZo/hr/hMaPEfpHwkYDuYANtZlWIDfWMax0cmGmmIU=;
 b=m3yQtrKETgvu36GyeHwYrNhA2uTMelFyAhjcWtf9AWCOkhZB0qUBliJrpnVdKQDTwlDhM4kfFTac6xNadapdNyIjxsQnRjUixZXYzwpqw6tQvhaVkzUgQvHPC1JZfvAEgaqEbawKKR8sFf+Cbidp12i7a3TafycecL0291tK4UxMpsYL3VZiF5/sIyIxk8RuZx8hnCKVLkU05SwH0vp2EGbOXUvstVSB5TOwgAU93KztSOz61SPuO76dolfghErfFASGrxmvHrJjfb/yoHyfFxS265ahuYRqjUFlq1bnetB7lapXgN+wRNh7yI6daG8zxulW1Zbhmc09oZManQJOYA==
Received: from BY5PR13CA0012.namprd13.prod.outlook.com (2603:10b6:a03:180::25)
 by LV3PR12MB9355.namprd12.prod.outlook.com (2603:10b6:408:216::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 10:31:10 +0000
Received: from MWH0EPF000989E9.namprd02.prod.outlook.com
 (2603:10b6:a03:180:cafe::a7) by BY5PR13CA0012.outlook.office365.com
 (2603:10b6:a03:180::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.2 via Frontend Transport; Thu,
 29 Jan 2026 10:31:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000989E9.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 10:31:09 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 02:30:50 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 02:30:49 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 29 Jan 2026 02:30:46 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v10 0/3] Add I2C support for Tegra410
Date: Thu, 29 Jan 2026 16:00:40 +0530
Message-ID: <20260129103043.148490-1-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E9:EE_|LV3PR12MB9355:EE_
X-MS-Office365-Filtering-Correlation-Id: 605326ac-f9d6-4c95-a7fc-08de5f2184a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YJCZc3QAqS173/wtDINU1wQTidkS7Pq/SFhbUcbebAaPDQxN3k37BKVtIsTy?=
 =?us-ascii?Q?aOJTVNp46QZLLUPZ1c1DB6ytbt3ur02dvXwtFegu9FkXLcEKw4whKx/oPi5Z?=
 =?us-ascii?Q?IjbFaliywesodNblK/VzM/phOE7SH0xbxfRiogZaVzo7nCeomONNNwS5ZE2C?=
 =?us-ascii?Q?kudv+lV0tw39oUHDehcc8PN4U0d2dRW9a5sle4/mQ6vfT+eyGe01153HpTma?=
 =?us-ascii?Q?ca5aNfPvw6HfYOD5ZvAND6P5HB2boaa7DVP0B4WdmKkB6jDFzo2eT/wthGzK?=
 =?us-ascii?Q?M7soWzZDDs3ttrIBEqQeekQObH1fn79UcJ3zUFGI8Rr81QxOF1Cp9P5p/sZ/?=
 =?us-ascii?Q?6YMQfiD/zajf/p4mEflII6gI2VvE5SlaR14HX1Hsgx8cKQ6QH+B1lA2bURyS?=
 =?us-ascii?Q?mD6Dl5bwemH9cic1JK5Zeo0bX+qzoJyZJk95d0NGoetYmdfeXWYwdEkd2Kru?=
 =?us-ascii?Q?iP3XWvcLzfvAwlXqTW3/tKzbnHYKxkvfWV4eeNOaFLdkUwhBZrtxMQaI2I4t?=
 =?us-ascii?Q?CoJmcnU+D6EADI99E3wratvbl3UBAOMGt/QiytsXrNuVOryE6yqH3kHYtSsg?=
 =?us-ascii?Q?WoATQHiFEnagEmu2Nt+ZteZyrdCHNCfr+ubHl4+8LJDr0gkBsD5D7DzbZVSI?=
 =?us-ascii?Q?GO4h1GIXiHeIQ3TRba/20SJiSWWUkG0lPCrcKS2qvwpEEr8lprr5iBi3Y+nh?=
 =?us-ascii?Q?PZ3rYAkOu9BETdEHTD71assdT388Fg5iFMLQGkCSYQsMEpHU05IwmF1Wlxn3?=
 =?us-ascii?Q?VbmNnYVElXp3NWYAwHrNWNGQ0ApFWHqL/0f2OlrtZvgMsrNfLLNVnkpo/CfB?=
 =?us-ascii?Q?Pfe8IR6m9QjogTSI4L1kBpYSS6pkBZAHzYzhxadTP6DdBubPBNeeWWlJatSU?=
 =?us-ascii?Q?7QCm2J1bdF3bqczE34xILlWeOYuUnramHtr60df0CiYWVaZcJjuCAIdgAF1q?=
 =?us-ascii?Q?8j+u2jY+CmSBFZ9iG8L/cEk51DxVRQE3V48qBAu5gEElfnMCOQuTe9oHQmDK?=
 =?us-ascii?Q?biDqb1zRpPoBl3p9g5qEnk2Xq+Me9+qEpsq2Wl6I8t1T3F1NV+fP/5G4dpXK?=
 =?us-ascii?Q?VVIFSZea4QXnH4NuKOreooYLsrZORHSzKLCyIRHPH9ZsgUBYr7+Fvivk3hxn?=
 =?us-ascii?Q?L281kgRnvmDnX5u1G/2p0NOIXlqhdWyY3uaQJiOAd3/ivi+92XHOKzv1HD5W?=
 =?us-ascii?Q?4CIOq1YYonbLTuD8SFF0b/fSMuIXLiGmnMhDDKFZoUEvgnb7wCDPEaUbS5GF?=
 =?us-ascii?Q?ponaEPbGx2R0b7OKqvy6JtDXBYERRFM2smZxgE/1SsjrcuzVE8AGvo1QUGGh?=
 =?us-ascii?Q?wrbYJVDIgotb5CXvoMCOVOAlJ3VC10qu2x72Si/LzXpq2zd762+quokoC4mx?=
 =?us-ascii?Q?esND2AKTIFseLt99uWfk+7FhZ++RpJMC6sGmrhPC1V4jJUbSFxX68kDgF5dA?=
 =?us-ascii?Q?4xZeo1bSsPJH3cCDOp5QLXxX//LVIz2wgI4yAfeHYKBcNVCwLCXWLxBU+6Qo?=
 =?us-ascii?Q?HdGf7uaL0Wy3I0lYqlw+ZrRwvXyY5m2XrQorfUdye9a1mXZp66v5ZCKrJveS?=
 =?us-ascii?Q?H/YFgm9aTWuylXXNMRfd3dBQq37Oc73vvbHrN2QpVPabKCTqvZJl1lWbxuep?=
 =?us-ascii?Q?mVf6LRhd3AM8u5vdd0RFZzFxwst7ik16frEGg+3UKOq/4kJyONEnJFn8J12C?=
 =?us-ascii?Q?7RiDNpMonSXdoHDZQiGJn3axkn8=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 10:31:09.5550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 605326ac-f9d6-4c95-a7fc-08de5f2184a2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9355

Add support for the Tegra410 SoC, which has 4 I2C controllers. The
controllers are feature-equivalent to Tegra264; only the register
offsets differ.

Kartik Rajput (3):
  i2c: tegra: Introduce tegra_i2c_variant to identify DVC and VI
  i2c: tegra: Add logic to support different register offsets
  i2c: tegra: Add support for Tegra410

 drivers/i2c/busses/i2c-tegra.c | 534 ++++++++++++++++++++++++---------
 1 file changed, 395 insertions(+), 139 deletions(-)

-- 
2.43.0

