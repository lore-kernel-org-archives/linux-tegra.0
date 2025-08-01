Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C89323A578;
	Fri,  1 Aug 2025 09:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754042334; cv=fail; b=PpeJT8AE2ui2zeLMuVPJepUKjGDhjP8B0Ro2OAtuEg7faCvYHRntrlGZ8Nn0rSIerwQF5F8nViohmM1VyK2LmdgIhgH6yDJMyXRN0OybaRDkN50urV1yp1DEMU9hGxXYh11xL8AmajqAABC90DYkFklVGSeaKMSMyK6S/dxYYzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754042334; c=relaxed/simple;
	bh=YAPPauzERdzcpu5GR8cxzXtWK5VFS78vfEARt1w6xTQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K1w8isFtqRNQJvxMrmw4f0+EDR8JC0A3f0QTH11o1gcm/8Tum/G/mQjjrx057S4ULtdjlb8clWQ0NlgytK+IpS1uQnOmjdF2nxqlN3j2xtvzp8xRgD3GDJbfyNk0GC5jw4RheKqNR4fZRRSY9LN6Hamit1PKBKSxA2lmIHpO4Gs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AhoHWeC/; arc=fail smtp.client-ip=40.107.223.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AhoHWeC/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mnVVlhOVOy6U0Hhnj9WGZLpxr4rSR8O0HF2L2Gmo1MFr0N2gZvW7um076aUlrrhFtmT4XzInk9p4Sk6fJ4khwqynkmybVZlHCXT2JrirOvu2GyJZXNDQZp63XuimeJo6BLx8OMqXdeLV1T08Y7nmFZbsTdSoFnauaofMrU1RDKgzeGql5wuNeJV0wClcGCU3xny5Oe0Dw4AiTDQ/cCZCvjnzOmp5AzYQwQ0W1Kda+xyohgn9dnUN9uWKCFxvv92Df/7KkmA8MMhxJh4a0ol7G3ug7EruUpV6XOIuIEgg/RFAgcaxiYinYre9lFGbgcaP+WpML48fpkGaEd6PNf7wCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdqfaVvWtS2Cg614LdRaUrjILP6o08TeU8my8ftAGs8=;
 b=TXEagHuWryU7Pf4MDTSumjpn/IAnlx4OCd1JOfIp4F/YiPMAfY4yKq+2FFcmlI+QjtfraBOjrngDXwyJBIyYMQWoyZAnPI/hTKK9HGIvjLQFJo14Z6SmgK6mLf/uGMUFe8HSnhAi2fdQ/hYeelvNMSjPNyxZUEBQWhZyDXcRJL3K2xvhXalIVgIRbU5en7vUyaD74yBB/RFiM/Xnvxpu7wjX60f8TeqOtMqFYVuI5hWeyxbyvIoyzRRzUXK6N2piIK8Iu7IqylCphpdchR4ViEn7hGLdFnzfY42AC8rKErpOcJyhkZC8lEnIq60/Vistzq/WwqJV9iF7jY0RLdit9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdqfaVvWtS2Cg614LdRaUrjILP6o08TeU8my8ftAGs8=;
 b=AhoHWeC/sXxaKWeJCydVblyshWOLBXlWj/LGuTrqDLXDRdcPxwNGQwVGETQYt7r7IdR86j46aJv3xODZesEEtgBR9waTsmQZcy1H9r+3PHrZ1tG9BIamd/7wwxOqB29IiJEz/5RB4MoHpvzadw0/U+f2ru8+lS2si8jznaJ9DHmfkgZbj8seuZlLMJhrdpcafMe9sDkem9A0d2mXPn56B/Uklmj9ljd78D3lWDr3xAUYQJNX44uXznduiCUkOQqX+9pCYSug1QyOYfwEdF3fMTGbdziiW0xe23am4UDBMql+ZgjGbe6EmfnvwVnXg4LNQhzJ5eKbi/te4W4aSbRxew==
Received: from BL1P221CA0018.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::30)
 by LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 09:58:48 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:208:2c5:cafe::82) by BL1P221CA0018.outlook.office365.com
 (2603:10b6:208:2c5::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.16 via Frontend Transport; Fri,
 1 Aug 2025 09:58:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.8 via Frontend Transport; Fri, 1 Aug 2025 09:58:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 1 Aug
 2025 02:58:06 -0700
Received: from 553356c-lcelt.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 1 Aug 2025 02:58:00 -0700
From: Haotien Hsu <haotienh@nvidia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, "Jonathan
 Hunter" <jonathanh@nvidia.com>, Mathias Nyman <mathias.nyman@intel.com>,
	"Brad Griffis" <bgriffis@nvidia.com>, Sumit Gupta <sumitg@nvidia.com>,
	"Vedant Deshpande" <vedantd@nvidia.com>, Akhil R <akhilrajeev@nvidia.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Haotien Hsu <haotienh@nvidia.com>, Henry Lin <henryl@nvidia.com>, "Jui
 Chang Kuo" <jckuo@nvidia.com>, Wayne Chang <waynec@nvidia.com>, WK Tsai
	<wtsai@nvidia.com>
Subject: [PATCH 0/4] Support USB wakeup function for Tegra234
Date: Fri, 1 Aug 2025 17:57:44 +0800
Message-ID: <20250801095748.385437-1-haotienh@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|LV2PR12MB5968:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ea904b3-8c9f-486f-7e3c-08ddd0e202d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NUoy7PqAJU/WsnanKZZnogb4QLUNr0OceJ0Ko2s1EoV2XvLJPkuWEco/e64W?=
 =?us-ascii?Q?k9CJHrl4cckJKpgJj+Ku0n4ShWUOZ58JO+hC4AZ6LshdhZ7YkBorjo8NLREy?=
 =?us-ascii?Q?ysw0m7nAKgUkLbS8SIZmQKIEbxi4OxyR1B7WApf65JLXmFq/S1EPhu246fyW?=
 =?us-ascii?Q?K07LF6czpUBzheHQRdaiV7GdTHRtP1RNPpcuC19IlWMmRCqUVsWJUn7EyJbT?=
 =?us-ascii?Q?7u41Ski8ZaOqRFNalpP9Ra6aVEo2SAKGlB8fe1DwJ2Kb5ioT9Dic5WO/9KHG?=
 =?us-ascii?Q?0LIwFjjoQy2vwXbGWJR+c5wImUd5u7IGqgwhHqU7ppsXd1HoHPY0/agDBsd0?=
 =?us-ascii?Q?J1ZmCenzferocDW6cKuuKknTJO8Rumb6ft5egtivAwOd++OwvbjICjVo37en?=
 =?us-ascii?Q?ny15dQb6iy9fF/FvP26PLBVo58wXDNpGi9+oC9K0hzfk1m6H/A9LZ8RbZb2i?=
 =?us-ascii?Q?VulJPs3MFvw7rrBBH4MqPTs/xPxxra2n5UoGGKc3BMhv6zsyJCFzLw2DNAcS?=
 =?us-ascii?Q?JhMbwV/GyfsDbbAQxgPfagMkN4V97oLeF5wjN/7yHrOoQ80VLdlFAK+/gtyk?=
 =?us-ascii?Q?8e7xSP6+LOZhQ4sgIOlOZuRpiZDNhue637ak2HxoS2CXUEUzrWt/1OW0ldgB?=
 =?us-ascii?Q?NRbXsrIWpEyf3d8trkw3aYohJjT45Rq6DVE8WgK16G0DFdU+kt3vsFCINCt/?=
 =?us-ascii?Q?Hv5XgtyU1dMUgO1lroKcETL28JW3GHiQe8nqB2OWZuaIjIFAI+ENKglRyOjv?=
 =?us-ascii?Q?3DpRj/qVbPhrzzRNSmba6GtAPrfqGhQ19oifXAzDJXEsNoC+9kL42EKGXQGB?=
 =?us-ascii?Q?fbZgPBF/UTTa5cVsxnCnDCpwaNXBDuaJip/CI+w4aMHv5lN1Xoo2cDSY6PR+?=
 =?us-ascii?Q?buzqyRyVkTsK/c4PACm1OXECGs/9//1fp8a2jWXVjLoEZ1a6qzBYY1Medjl6?=
 =?us-ascii?Q?5M8DpKr8eX2AUeTVzhnZuke/5qkN5DWpzC5NyEwZDQHFpLyqWBw61wLsmSza?=
 =?us-ascii?Q?OwFUZWMSLpD3ATZCUXJ0BHFFmE7lKTlUZVpMVPYCKzJH+2yd6mJi2NleWhwO?=
 =?us-ascii?Q?MJqzfd8gPNLHXnaVDboSoyAOtAwKPO+5abrrQX0K6XIRU1WZFkwMTSDCa4VN?=
 =?us-ascii?Q?IHuCErPkEoejIkf7VqtHCjGYXLGuZYfhDrGxQy9/MVOwpdg6Pprn/GXuNWHs?=
 =?us-ascii?Q?mp1jgEV/4V6rMKu/XDy6zGCiu04H4MBKjmAmo9XIMDEwZWgHAHsUfLB96yht?=
 =?us-ascii?Q?fpwwefBH8oQQ6ypc4NNanzLRYOGn/Ix0DF/qxqsPCPd8NLWRLmyNNKC7KjiT?=
 =?us-ascii?Q?9ZOS/egtthhqBIcWHTGwxuujHYDPtsSB/iMNcsxwwHmSDVfqV6R8xHkYw5XB?=
 =?us-ascii?Q?3hw1mcXaBchifTuFAiUXbRfsH5YPpmK1SdHZT9ZkapXr66xsQbJ3YBsfnTaj?=
 =?us-ascii?Q?teKfpspqlg0ZqP1NqsYxkiWTNAC3+Oclw8oQNUfOKk6HdsGoM1C9f0WAqf7n?=
 =?us-ascii?Q?FkfKst0pfx2PGd3LJOQDSMBb6fy8jKjoKI+1dzkOnfFrorxXc3MAsxWGRA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 09:58:48.2350
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea904b3-8c9f-486f-7e3c-08ddd0e202d8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5968

This patch series enables USB wakeup for Tegra234.

Haotien Hsu (4):
  dt-bindings: usb: Add wake-up support for Tegra234 XUSB host
    controller
  arm64: tegra: Add interrupts for Tegra234 USB wake events
  soc/tegra: pmc: Add USB wake events for Tegra234
  usb: xhci: tegra: Support USB wakeup function for Tegra234

 .../bindings/usb/nvidia,tegra234-xusb.yaml    | 28 ++++++-
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 11 ++-
 drivers/soc/tegra/pmc.c                       |  7 ++
 drivers/usb/host/xhci-tegra.c                 | 83 ++++++++++++++++++-
 4 files changed, 123 insertions(+), 6 deletions(-)

-- 
2.34.1

