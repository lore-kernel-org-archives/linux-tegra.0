Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2059.outbound.protection.outlook.com [40.107.102.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FA31E487;
	Wed, 18 Dec 2024 00:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734480511; cv=fail; b=cPMTyK5C4toeMc26JhwnnUncxhKYYGK8hx5J5ybPeMr8h0mDIdSlv1ouSAtRWfcVm2zv5FAmEwdeHUrm2UHTbhoTnX/3O4uoPH/DSbtXbNu/pmb9SuBpOGFUucXKkIr3/lUa2gpFC4k4tN8ZMb5M3dhQcXqr/X8zyw0ubJMoLXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734480511; c=relaxed/simple;
	bh=LgQmEWLXgt2dKWQDyk2aE6CbuYfFmeTtlwZpd2NC5lE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h5tVA95TD7FPVwCHl7Ly1je3gXjnCtUTJC/DMxTpYuvrCHcd2SQgsUcnME9yKKbnWaTh+4ytdv72fFy+CaPYTVDN0tnyrfFJd2riN3wFFAvpihbxe93+/XF2G3IrGeXmwqqmKH3ZGkR1olfbiw7ZEA4ZOfdWsItZc1tNFJuqOWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Bvd3y9uv; arc=fail smtp.client-ip=40.107.102.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Bvd3y9uv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bticq0bUYHtcUMJbbiQ21kyRWqdz6mMPaOUzmBtrWi3SUGuixlP7uWv51HsF2JYVVCG+VG09hMRM5EK1pqq5K3je8rZbziF37SKuViw4g7ew7bwWOWMcUawIQWZM5PpfcrTcNdtqzs4IyejhfTBDBEghTLWw0mx9z3LnvGNHC/XGh9vNxPv6Sshneqyvk8NGFdX4gNnSGjUCotNPYUUmr7OxMomDHK2pJ5zK7QBRzUtFtRkaJpyY9g5o5IpRagMHSe3X0NvvGkiNwQdQ61YRkROwyiJvk7S+v2w/2bS+Vyl8CHqzd1d/1J7hH63msBETvDydD1TZzNh71HgTTKE7Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3d6sseI4WuFfiMWga7X0IjwvY3ZO2WSCBrlzhjPwTuU=;
 b=YGo12T6MjP674COX3V6deZgQpsykSt42l3UjC9PvGdsTc3I57gKvzMaCBo4s5PepAbFF4O/F3qzEweqjSCOu7oL1CKImmbwHomhbAWrLlvZeb0RTjiPfVHzvphz4tsztKPgecgak2tx9YLZRbjnw/tlWModOuswFecsdTYiXcqBUZMc8NjHSHlktdd3rCz8rCWCyzsTEKPSRgHniDExhG4tgHvQ47qeBrUy5oo4anb/LnavU5JWtJoPOzTCNY4Q5lf6UCeciHVsS3FNuL6Yr9jrEOl95AGkFexMuCXJ2N5rZPQsYO4IY4UsrONErvSJ9jZEMgzzVlNkKBLTKwbl87Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3d6sseI4WuFfiMWga7X0IjwvY3ZO2WSCBrlzhjPwTuU=;
 b=Bvd3y9uv400z5wzf4blMd0tisdySkM1pXNyKnP9ze23tnVujT5a1SU1GBcnj7OeroPC9E18qvkj9PkJ1nwyqQZ+KZ+bepVNuJ0sjvrdLMS3W89UGHZ3c+hDpaq+fXvRlUSTs3lsFvUDV8zFl229izIOQe5acbZ1h8BxjvJTlphlVbFc+5linONwrz52PnqqnYd40nFCq11+x5kDQjEElcWuKvY9GWK54PS0rgmXdnTbTrtfcmhXl4JyyANvARTVcLqXo3tE6u++fz3YsT7yV73lQe4bkg9RuHlrh+/BkF5dzEw7uiWInz+dacMs6LsbW0yn+iGBzzOVv2Sz6UZ6oAQ==
Received: from DS7PR03CA0179.namprd03.prod.outlook.com (2603:10b6:5:3b2::34)
 by DM6PR12MB4185.namprd12.prod.outlook.com (2603:10b6:5:216::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Wed, 18 Dec
 2024 00:08:26 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:5:3b2:cafe::5b) by DS7PR03CA0179.outlook.office365.com
 (2603:10b6:5:3b2::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.22 via Frontend Transport; Wed,
 18 Dec 2024 00:08:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.15 via Frontend Transport; Wed, 18 Dec 2024 00:08:26 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 17 Dec
 2024 16:08:17 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 17 Dec 2024 16:08:17 -0800
Received: from build-yijuh-20240916T020458116.internal (10.127.8.10) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4
 via Frontend Transport; Tue, 17 Dec 2024 16:08:17 -0800
From: Ivy Huang <yijuh@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Brad Griffis
	<bgriffis@nvidia.com>
CC: Yi Ju Huang <yijuh@nvidia.com>
Subject: [PATCH v2 0/2] Tegra234 fabric fixes
Date: Wed, 18 Dec 2024 00:07:35 +0000
Message-ID: <20241218000737.1789569-1-yijuh@nvidia.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|DM6PR12MB4185:EE_
X-MS-Office365-Filtering-Correlation-Id: db52fe13-6045-43de-fcc6-08dd1ef8181c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4zvmS4oKjV0CO+53zAx+WB3ZNGAqDz01kP+D4TCUAUJto4GGIFVwleEQFpLH?=
 =?us-ascii?Q?90k6im5qt5K6UmU8BSW9LWMlfIx+g7X6NMFbeHMNJ8Ihp1lzxfbKy5lJRI+3?=
 =?us-ascii?Q?wWY/gGchDF7BbY0H4K1QBZPCRMFEaQr//YSJIGR1jOxRQzoGVRoPifBVsnCW?=
 =?us-ascii?Q?fcteW7rGXIAu/Hy8J6hR/qmabnZ+fAyuiUQ4Ey6Q6vz7jGtUZ2kVifi6z2UB?=
 =?us-ascii?Q?Oaxdr3QCJQwANQLD+DuOzRPVLrwMsEpAr+WcoLc8NCRTC003CP4lnVAcbFhj?=
 =?us-ascii?Q?Zpp+u7evvp5cs/Q29jwO2748mnRC2ifeQXmx6ZiDxM6LrhSW6KTDXf/OhaxO?=
 =?us-ascii?Q?DxV3oyQDg/oQWttJADqf72TrtFEFB+ELrtCtzCKKSH8eyVr0hR1HxWlu/Bp6?=
 =?us-ascii?Q?rg3wIwNownX9+4YzxoH2/8g9ogS8TZC1IDhkri/YtV2zvWkWfYUrIOtBumYG?=
 =?us-ascii?Q?WTT9+F7INbe2aQ7ZMBG2n5MtOJ1WJhdO8Fgg6N58N24FR0sAnBFYPZwLaZO8?=
 =?us-ascii?Q?VAQKplDrkLvCs0hPaDn2kQGYex+ANyb7pffFd2om3wOiWRxpmdlEgSwTMH7g?=
 =?us-ascii?Q?fjzGufpN/FVSfq5VEUspTZXf3gTUq7DcXBKBy23gPEX2+o/cB6AdtUQO7mb7?=
 =?us-ascii?Q?6mkY8tYCvNvjy/S8+F4RkcFDDY/yPxLiPqKWhiEOtACIDgNVcfJPIGa0L61F?=
 =?us-ascii?Q?P5NukRTw7tOUc47S4tOVTZkxcaDDLBS9B8UioRJs447mkJp+4BDTyD0I0MzD?=
 =?us-ascii?Q?iWWFR/u/ZysHLQotE7WW0NFt56WBaygs2cdjwkiG+9BCmQBNaq49XnBd9Iag?=
 =?us-ascii?Q?hmhs83iiBu75jJW105ARtgQSKtHMJz5pwkkFFxUf/vKIyvi6AbvbjH7pLVhq?=
 =?us-ascii?Q?TVwBj4ssGevsstDgUD/CV51xtG3IM9I7ThDsFGm2inS9KuxC5ISw2I9NL5/4?=
 =?us-ascii?Q?n5T19m2p1n3PLJ+FfoZXg4m6iJ2QIAtglvR8tdHPYAvlo/SMVXeEOTeiEdmI?=
 =?us-ascii?Q?TmAi/Y3Rhm3YnlvHqJlGP6bE5ApUuvgFy9CMhuaUW3LGa/33e2TdF+5Zur86?=
 =?us-ascii?Q?C+/5j/kvhKuCpNaGmKh2xGPoXJycmoAqBKbeO9Co4DYv7bPZZJj0P4+d9QNh?=
 =?us-ascii?Q?JL16tAG9UKuTUeb63L+dAdozu/nQx3fHdZ81t+1FZNTuf3AmbwuwfHzyfhTd?=
 =?us-ascii?Q?p30YdfJzHq/CAcDxdDshFDcD9KFlmTr/ot9vuhkQLIszv5BCbk9KrJyGeZWU?=
 =?us-ascii?Q?pTffswBnqFbQ1TIpl/zf0ALEmyObRj1ncfLsJZKOaxZr1VV70vl+NmT5/KnQ?=
 =?us-ascii?Q?8ib2trkrxIrrz9UrsqzZcAEz0bvA2pgKQlMBTCYZdb/iAJy02+j75LUInubn?=
 =?us-ascii?Q?0G2MXbPjUYb+/E83gXuxVhsXGsLvYe6q80X3A+5Gv4VEukGyQzc1GoXgBTvt?=
 =?us-ascii?Q?MFOdbEPIFx75UWyslsFxQLLsjWponkkJTESG4G6Da/IQwTfCB3YauZYv521t?=
 =?us-ascii?Q?IajkwWT94tXNLT4=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 00:08:26.0347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db52fe13-6045-43de-fcc6-08dd1ef8181c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4185

From: Yi Ju Huang <yijuh@nvidia.com>

These patches fix issues related to sce-fabric and dce-fabric nodes of Tegra234.

v2:
- Add explanation why typo fix is needed
- Add fixes and CC stable

Sumit Gupta (2):
  arm64: tegra: fix typo in Tegra234 dce-fabric compatible
  arm64: tegra: disable Tegra234 sce-fabric node

 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.25.1

