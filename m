Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013009.outbound.protection.outlook.com [40.93.201.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9E63563E0;
	Wed, 21 Jan 2026 10:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768990348; cv=fail; b=DucV9mjFOYopEbk94jJtzFGQsScKmOfD5/OOLwmuS5aG0GjFoP8iNl9kirh+m2RBL8hoa7NPFNC5LmTKK6cU/BIBp0FS7nqq/IwWIi8YfjtTK0ud3lfPJGuj1JTLOxX07avM4IJ3NVncqbrA8uXDAYuAyLhu+BsihFeHvz9hAe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768990348; c=relaxed/simple;
	bh=KUHu9AV1VBo2TOLyuAIhMXhQqS1i87M0v+Jc/qjC37A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Mp59K6uUompvBfW0MzFdN8l7JkG3/GsUJyFsQRIcjbEOrMB45YfndQM/29lmgGdMR2Rjc7Tf39FtxShQ5s4nwgl2j9N+f3tCUHmhrGPH93XrfiCI+unNotkQivorZnQFlB6PuX/2ca6yQRVaZ7+459/c4rIY+NmD5mP5p1IBOvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=H9XxlwgS; arc=fail smtp.client-ip=40.93.201.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="H9XxlwgS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JbKwWD07OZE9cBMPedry+G8AleTLijySZ6aydw+5S+4cy5BW4k9tmvyn76+unM4LLTzjV/c7/7gVLCkvlYEhCzR+FaOcmuZ0jfsTGSbgvea3OtL7vDuL7FtOLOpQK2kYqyq7Zv+x97OL7gHWDoY0V3STlEMMKUR6WUvQDUWAQxf+ADtz0iincnY/jwyae3E/4ZzV8gN6zFMxt/BeKNqLgHTrcc3hMnj62oIBXt8cvGnlvCKS0ChfEz8QSw0vQ8x6dgIllqvwDjRYZ3YsYNZbef9HolbeN2XG4AAaTKoLnd1H0aWwYH87UltdpwB1NmIz8HjEYii8cl3GzJMYFMQyNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8G7BmivddUgX+jtJNU+MEJRCrdnG8XBKnANUwlgibM=;
 b=S9i79ogYFYbLkJfWfrmvfL2zuWm4c3use2H9GYjA1+4CojsTJ39zbSJHRX0HFS/n7i+GBXBYTPGN2/TlBiZOJDikSghY+5fUgsBjKIeZuSeHG5E7FTy4GMW3z8bIsR5qqZIv5B2yHmV3wcI7o+Jxldy0ytb8kKLc9HLN037MIAQVs8xZ+OoB1FKDwmKj/llv/VFvQEjc9Z+dr/V7Qla+ENp5J2cSJ4YUabLHfiS2z/s4DAFviX3ppbGw2zirPd5Ykh1SkhoTXdhGg3iNnwSo1p0PJQIw6iQj1n5/EKVLtj3JyXEYPn/r4XvK++3I7hSUwvJrB+sGmT1HYEd1aRsEcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8G7BmivddUgX+jtJNU+MEJRCrdnG8XBKnANUwlgibM=;
 b=H9XxlwgS11hUfZG/ZbyaMC9jehmBRR5YJ+4DLekwwzowsdvCcWrKjtGN/zx1oRbBugnG456JNEmOeXZbwpw2f6yj5lhZkcb/jf5AFRNUJMO+nfWg9fYOpK/pPDO6PSxGmNVpSSoS8duoBZFjK0zyD192rjnQnd15FdUsBPcpNDmtRH6w6nIii2yclRZ85+UJG2MMs/+NSpJXoxLxjRIhO1BgS+fgrmSBOPvXBHiQVfZnZrS1ECt0ET/gX6cm5RyQXS8EJKCPaKCb9SHF57+XuhpNiMrecgffQvNUsyICSzw3rtIbz88/n2iI/fNa28xTSIEKsaDwTwXBh7K79nu6mg==
Received: from SJ0PR13CA0039.namprd13.prod.outlook.com (2603:10b6:a03:2c2::14)
 by CY5PR12MB6432.namprd12.prod.outlook.com (2603:10b6:930:38::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 10:12:22 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::3b) by SJ0PR13CA0039.outlook.office365.com
 (2603:10b6:a03:2c2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 10:12:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 10:12:22 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 02:12:10 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 21 Jan 2026 02:12:10 -0800
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 02:12:08 -0800
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH 0/3] soc/tegra: cbb: Bug fixes for CBB 2.0 driver
Date: Wed, 21 Jan 2026 15:42:02 +0530
Message-ID: <20260121101205.3186310-1-sumitg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|CY5PR12MB6432:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f03810c-0236-47ea-db62-08de58d5913c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QwmgNxgOTF3V5+LzZ4T1X2RxFlAdiDUxPg0qxP5kdsfEn+63a+l/MQqaZmi7?=
 =?us-ascii?Q?+m9N7JdIvM3Cne2jatv48JORszzk+62JJQdF/nYqzzQnvrAXncX6HBBJEdB5?=
 =?us-ascii?Q?cRIICETYXFgobLd8A9NLX8VwjvVJOyPu4r2SfFZ7kLH8BwwCiOGenkK9HSaF?=
 =?us-ascii?Q?TT9vb7NPFFDC2oOWzzhhWgXGjsIOTKFXn2kcOb/qkCRigQPowDpaE/DsH4dm?=
 =?us-ascii?Q?EpNdI/fR5auRhYdzoSicmVWfAbISDShB7cd+o3rRkW6svlmid0mhR5eldROp?=
 =?us-ascii?Q?yQ/0t74xlfgIuI5gSH7jPJVMSPZuhG+MHoLS1Bb3e+5gnIjQY/M4MNPfegIf?=
 =?us-ascii?Q?5c0BFWPlEv0bS3tjquyQTDR1UHzsl9wIWOl5e4JUE4tpgU3+6qMsyXONQU7F?=
 =?us-ascii?Q?d1/gyMyP9cACedmIH3ClwrhRHNChvk+Bb61ON1n1TQ3I9F7msYG4ckDo8u7g?=
 =?us-ascii?Q?sm6D5tJ0RJv/uBzs8R0Ebx2eA3IeNJ2F6GG6pN5wHyTWXmY/FhPXZ8OLBCd4?=
 =?us-ascii?Q?kmxMN0ghoZYloAYV4lM/0EztubnMm4Kzlx6g/9Mhk/ANT5IHvv02mt6kgMs2?=
 =?us-ascii?Q?94mF7+1K9p8a+MUzGGQt4iy6ByxATb6XkEld+H7JA86YoogOgclsF8Rs0WkY?=
 =?us-ascii?Q?1CplcnrnOgn+ii/L+q0BBFLexPP0JKd+lv/xd/ehkyR+ERD9HQDxxaQetTrF?=
 =?us-ascii?Q?MwzPOt+EpAU8plotnWmQ5sjGuKx0b5eSFWo8i0JrGiJP4acajPu3gD2anw2a?=
 =?us-ascii?Q?Er6JLRbyJRmNmj9Qgyhg3KqJu0DHqPf6beiZ4FA6ei06qNmOxoYYbwNi17Po?=
 =?us-ascii?Q?Ud/5sRaryW/6hnmEaVmm/lKjYrj5U5Mx+fakVez74KppBhrdTywVisvPk60N?=
 =?us-ascii?Q?UrRHvRUJFuPIaWG9ffjVFOib63qAZ1EnC46UqOUqznNCT9In1M5yK3Al+mmM?=
 =?us-ascii?Q?Ht9q9EEeb3yPKXfNNeGxOiE/ElALdk0OYk1WHGDPlN97QSNPrV8WO+MuYYyk?=
 =?us-ascii?Q?umUyyTDaAna2ID2j7lHEr2QBab9C7JRhuekpAgWYCMwnZ74FBpkTQKdFD28J?=
 =?us-ascii?Q?k7c61vVzO5DlIPZbFjgzYY/5qXWwx5+zPO4jvhKKyA8RFzW0FXFdC2k+wAUi?=
 =?us-ascii?Q?saBFnDv65VeMYboXhfi3Ngnx4ldcP2c8hEFYayLU8DPj3AlghOVoVcazHfo0?=
 =?us-ascii?Q?ONtNFG9yhYg/3FDvG4kjtkJGzKkTDCwQ8O6k8E+eCDGwAgCKu2SPV9A8Ow1j?=
 =?us-ascii?Q?hvQVo8GYfBfcQJB0id44zxonozYhHlvMlYUEHHpDzQWQjq/kIxX2Ffejv+CX?=
 =?us-ascii?Q?R0Y8s6DEHbmwjgSrO7eZeRDTGG8KtbPxdOiuQO+DuwBprkYESTFjEa6OaKcY?=
 =?us-ascii?Q?cdFEOWff0zHbwG64e9Ii6/7k5s7Tok4pXaUDgnRhWR0qn4g1HBQ9yvCAgFKS?=
 =?us-ascii?Q?0kcuMDWgP7w8ZLqvWWtcyFFTjXuswHC4g1Goi0FOjGLk3t2q0uuKucnC3b66?=
 =?us-ascii?Q?F05jBS3JmvJcpEilGjnV90BcZUZfxppr3k7JMHpsyd0y1vLkFmtqTObIfVqC?=
 =?us-ascii?Q?drmOiAyEdGdl1oAvD/Rx8xssqQ8hBfdZq6FIQ6/3JhsliQtXC3ao73cjDuDw?=
 =?us-ascii?Q?xFkd+QbyfQk9EoxGRNY6is1kCKkUoOGHwy9BxJc+eRWnzSUKPQOOUvrAkNbt?=
 =?us-ascii?Q?6EXQNA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 10:12:22.1005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f03810c-0236-47ea-db62-08de58d5913c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6432

Bug fixes for Tegra CBB 2.0 driver addressing resume handling,
fabric lookup table sizing, and cross-fabric timeout lookup.

Sumit Gupta (3):
  soc/tegra: cbb: set ERD on resume for err interrupt
  soc/tegra: cbb: fix incorrect ARRAY_SIZE in fabric lookup tables
  soc/tegra: cbb: fix cross-fabric target timeout lookup

 drivers/soc/tegra/cbb/tegra234-cbb.c | 35 +++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

-- 
2.34.1

