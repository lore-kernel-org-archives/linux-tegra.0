Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2067.outbound.protection.outlook.com [40.107.96.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A393615ADB4;
	Tue, 12 Aug 2025 23:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755041884; cv=fail; b=prltSnZ0KUx4D5RkSNMynsNkodBxEEiLcH+Su2E2oCHjg9Pu0RyIvnZCX0hWcdEK/wrxgh+lllbQlnj50nC5KjzzS2VnE73iEYlV8ifiYX4jczuZFOg0b/uMzhI3QzJNvPcxz9DWSX8D5CfbNBtvX7S39ocuDCM4lRuLLzaQpqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755041884; c=relaxed/simple;
	bh=G0JbBZZLWw5gogZp5qjEMveiX5J9stG7KDKS31ysxio=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pD3yPlGFJ6LtbLRNYvCxCXaU98D0HpZ7JqlxaD3KSNOppg0LmxtBL7RfweoZwopAn4N5aa8xoHT76RNLjgrJzoSYX4gZaEo4r0ORfbSjQe9g6NMKidauKatQXIWw/UrrApjSdAmKajmWDeliBlKZh9tXVYeIefAgicuelcMxBt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KjSPDbZo; arc=fail smtp.client-ip=40.107.96.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KjSPDbZo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ds8kEQf3CKwjNrJqZZOX0XYQ3fte1ouM9KNAWwTSFb3BEcPNdx4181eL6h7PC5kFRt94AqaKM7/WfiPdPmiJjc78+4zSvDy8mNnTELGffgO8i+9fRPHRIVKPwYZ/tYdZM/vg7HMxn2Ay+1I/Cv8DDwVL8bD/cRDadRBQRdMrgpJE0dxZYGBQXs6fFWMRh/uQqWri/VwQH962o/DrQI164T/LeS3x4sEKnhClo56/Udr5+rbWrMxBMKvF0XcHSUStQxf2u/Hy50oWnYepgkW3twWUzSYfDE3zcR9jxsMgdoVxQvilcfQ1ZYcgMuC+2fB9lTnSxSkBShRNfukrOIiUmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6J9rAP/6p42WwLAAwyUNpNR80qyDNIFmJwcLmI5xvok=;
 b=JC3sf3+ZTXNQSCgzr/T6pYs/d/tHEnjzWm/VYZm5SIHdUl6nN8LZ2gYTqstKURcVhspJbCcAkpI07tnOLGQBI2X9g8gFS3TdfsENUCIhzxA0u/qZGPvyLmK40MAnqduOytFNmHdpcy5GYjGf92+iMWs6YzusIGL/ujfzUwF5o8bxBlzJ10Sa9X+zx6038M4sOf3lizlaNt4J4L4vgS4OkTLNfaMj/D2AihQLg8925VNOHE/2T49yDzhlggcbTBFEz+erm9JAAKpBL2JTmd5KmgY4x830AqQZEBrqI4ShS/8E8dYVzF1YY+Rf3mzmQskWRaUezmPREsM7eWhVeZ5TFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6J9rAP/6p42WwLAAwyUNpNR80qyDNIFmJwcLmI5xvok=;
 b=KjSPDbZo66DkChDnDBu1OlHoModL+pl0mSI9Iba0CXujjfHUyM/KvvGXvdFypTimLxAPKOWbRExtaXqbKqd0Eii+dZpy7bJBmGydJgFPSOr4dy2kBoKEKjNW0PINKuKWqO1TtuT4T3gulgbtgWofTOTlaDhJRNmLxAhVPsCyquSMbObIVwYw73O3Gjx7tII5j5iWhqy2/YVrnhnBZizlcFg/1hGDnXXDmh3KRNxoQ66o59Gg8gz4tTT8/KUMqGwi/9dK1iIWabUqfgI7IbXPChJ9JPXKpIo5FX6RZE9EqAATZr71sAbvp6xouu6n8ZKIndn3nXCK7QH73lhkaJYE1A==
Received: from BY1P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::14)
 by PH7PR12MB7842.namprd12.prod.outlook.com (2603:10b6:510:27a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Tue, 12 Aug
 2025 23:37:57 +0000
Received: from MWH0EPF000971E5.namprd02.prod.outlook.com
 (2603:10b6:a03:59d:cafe::89) by BY1P220CA0001.outlook.office365.com
 (2603:10b6:a03:59d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.14 via Frontend Transport; Tue,
 12 Aug 2025 23:37:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 MWH0EPF000971E5.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Tue, 12 Aug 2025 23:37:57 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 12 Aug
 2025 16:37:53 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 12 Aug 2025 16:37:53 -0700
Received: from build-bwicaksono-focal-20241114.internal (10.127.8.12) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Tue, 12 Aug 2025 16:37:53 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <suzuki.poulose@arm.com>,
	<robin.murphy@arm.com>, <ilkka@os.amperecomputing.com>,
	<mark.rutland@arm.com>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <sdonthineni@nvidia.com>, "Besar
 Wicaksono" <bwicaksono@nvidia.com>
Subject: [PATCH 0/5] perf/arm_cspmu: Preparatory patches for NVIDIA T410 PMU
Date: Tue, 12 Aug 2025 23:34:06 +0000
Message-ID: <20250812233411.1694012-1-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.50.1
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E5:EE_|PH7PR12MB7842:EE_
X-MS-Office365-Filtering-Correlation-Id: eca51d41-2dfa-4b3c-d2af-08ddd9f9446d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kk04w3yEI9/iko2M/sDMEeGQGjCkcDLmy4TkaBk1CJltZ8zLv81tSRiGp79q?=
 =?us-ascii?Q?Aiy5zWKehderDZ4SM6U6oSklqfHic8Ck2AdzMIy/ChvukADRKTLTY6YM2aDu?=
 =?us-ascii?Q?xLizYYnCK3INNNDpm8zqEnWAuO99f0M2SHlAWkb2OpIK+sm9WFjdX7gYv51q?=
 =?us-ascii?Q?MtYC4Pb7DDl/T6p0VkgYTvpbOXyjIAXdWmGmKUaWfZ6bBTCwa+TwQMZOvzSg?=
 =?us-ascii?Q?lQdvMVwz0Z7QCPwpc17/VFJ/QRYbXqwYUn4uzMyxfi34wayXacFZ2dQksuKa?=
 =?us-ascii?Q?ByAo1/k2AyswcYWPeKjbswaLHBVhvV68PLFgD7s4BX/FcLU/cyK7siyWqSb0?=
 =?us-ascii?Q?roit5XLPSO56atoWiU+bVOEnwauLOgSRcaoVwpxYqlIVzP4UKAc8iNgEGvBZ?=
 =?us-ascii?Q?MH0dZua78DDd7xBrLF9qZX5azfT0yQlSon1eh6FOQLPWK59z9A4+pPin7CaT?=
 =?us-ascii?Q?L5Pk7wQfzQj0LLy48WuxpZjXFsjh9DXALKpdO97NXIVNyqeR1DUlussbNJhG?=
 =?us-ascii?Q?CGrTr2IUzMlBInIgo12X0qhr3t+TOuTbeexf5G5SndxLNHckv0vim6WTdlA6?=
 =?us-ascii?Q?imsiaZSW1LafEuKDOSH3TDihKym6tX4X0OrC7Y5y7xdNiSVbANJkxfPquTzo?=
 =?us-ascii?Q?0Ty9ZCuIHd/mKm9hDowBPffaZz4CBQUHm80s5TZmkjfX6IqO+BJcP++N95nc?=
 =?us-ascii?Q?bFF9v89XQAz1UsRJufFSMSCIcjwzx6bluofBbNEaE8bVN3ip1YCa8g5GgrFw?=
 =?us-ascii?Q?ySnidPC6VzR1NLy0rC75I0lu07ZeqBLwb3zOewhhgNDI3UWm8eHRMGjm+Qug?=
 =?us-ascii?Q?O4Gu3P1x9Lf5rDsCmoPJc9lpPEUnrBi9rZFVcd2y3eYs+qcurbu68YS2ylkf?=
 =?us-ascii?Q?zSbRL9UhTtv9PqNDmTeBwC9nlAM2jGMW98pbz/geU5GBHIGL9FTw4je2p8Um?=
 =?us-ascii?Q?Yzv88jUmUKJ8f8Yu3giM7GCx7zu+7TqxNl4vnllWlO5r2SayC6/ZNDuvOmgI?=
 =?us-ascii?Q?DGk4Xel+O3g30R7xLW1/DVaGo9RGEMvGVJNaLgi5Z2cVL0FevP1Nb7VxePmi?=
 =?us-ascii?Q?PIbxc94A3R8We+CRLIj283J4dRcQoPaQ7comWQJp3noH1XMBk/uNLiZ+BwSp?=
 =?us-ascii?Q?3J/aAqNbzs1sw2pexh94GoplWMDV8VcIAp5Km2EV6xKI7uA7j2SBd9Gdca8Q?=
 =?us-ascii?Q?scRPTY35aYXHji843nY6wBwXBCHZVquk6+33BpCiR2uNg9EYSiFhAG9QNR29?=
 =?us-ascii?Q?VtD3C/4Xt1gCvdvlUVIH0SzOZMLQRW7TcnrsaP3KFYdd6+i1O+AnK+yQ1+sv?=
 =?us-ascii?Q?gdpgjGHYFk6eeZXaAazvlG8c/F/7O6v9N+EPyIKd23NNJ/udPmOpaQnRkDFt?=
 =?us-ascii?Q?5QRfzycMurAzxw2O1/s7rPF9DxdauGcWsUOS3l8s2RHCQ0hChBkP1grSFZhQ?=
 =?us-ascii?Q?vEj2V9zB8DR7Gb0+UVsCIebCKuHb6xhcFzYP2F8BB3C5rwWE9LE9Nx8jIPrv?=
 =?us-ascii?Q?+sgpJslJZI+Qn4dOyB7FJzgF2hcS3bqAV/P/?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 23:37:57.3666
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eca51d41-2dfa-4b3c-d2af-08ddd9f9446d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7842

This series contains initial patches before adding support for upcoming
NVIDIA T410 PMUs.

Thanks,
Besar

Besar Wicaksono (5):
  perf/arm_cspmu: Export arm_cspmu_apmt_node
  perf/arm_cspmu: Add callback to reset filter config
  perf/arm_cspmu: Add pmpidr support
  perf/arm_cspmu: nvidia: Add revision id matching
  perf/arm_cspmu: nvidia: Add pmevfiltr2 support

 drivers/perf/arm_cspmu/arm_cspmu.c    |  51 ++++++-
 drivers/perf/arm_cspmu/arm_cspmu.h    |  43 +++++-
 drivers/perf/arm_cspmu/nvidia_cspmu.c | 194 +++++++++++++++++++-------
 3 files changed, 228 insertions(+), 60 deletions(-)

-- 
2.47.0

