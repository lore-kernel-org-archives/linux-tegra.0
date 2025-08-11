Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244052DAFC2;
	Mon, 11 Aug 2025 07:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754898465; cv=fail; b=hk2vfKm59dw6f31xzXUjLUg0yMB6VbdH2YhvKLqzwc29cmUL9f3nWa3hIB9+DPmSmLbQWO7XCb8cdSLdoRQk806XARddr0biJDrcDkVCcPPJDKnKgk4pmWM/dyq7ArCPs3hq/qaz5jPaAKyzQPCl7YzLglWMpqkxOMZCVSuJrO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754898465; c=relaxed/simple;
	bh=4CdQuTqsVBtx4745UnkOFZFuBY0XX92rYEzJFa5PCqY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ar5fq8WJwEmEyxVlH13y1QRpyylfLg7zXb8McsmT+qX1GlCx4yGy5lQ6TVUV6ZzVgUgBZFlNc6oyYQzdPHVGGSGLpNfoiIiHzTUgL8R+xRq7ViF8VN5pPyNzygiBmVoWrgaU9FWH0XjpCI37pKKzft891kOSq9jrOEWbiyaKtxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Zs5xUg1F; arc=fail smtp.client-ip=40.107.94.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zs5xUg1F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SngOQTWd/h33Y15bC68wAlqW2AbsUrFsbAOMe8mfH5AbvP+UbotfPcpA+ZFWV7ni9NP8e1Hjz/ntQ4xHQL5OaHu5AFBEiZ9QfC+ZFaXO7pqf7gO4vF2f6CvTQKq5nZB56nu5WyJ8PoihvJaoDLxKLhjmLQvW09PFEt7b/twZQjyKardGc6KLxk8wo8L/uaQmwgUUmaFmB5IoGb0zvImU/VIbINPnGUGclB7H9cAzwq+PUc2p/JONIwHUuhqVXJRrof0E73DeBKgk3GsRtVX5XRmiz5Jr7VxelOrYqX8q2Bj12aTbtxy42Y7RjxONeRUq4CujbtgM1MVTBgttFpAttA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=77NV8T61jyenSu0hqLaYARZQb33PSS1XgE4nh/1Humw=;
 b=mdrJD9y6ng+y6rrmZQTqkqDn97cHgXUZsiXpXcPgNe6+6WOgMcIYovDM2YrsNGqmX5t+Cw38BT11RaKT+7F/Kj8rofyiPo4I7Li35IPPcqITwjyXfsr+MekroRh1BOIPCRFZ71Q7QxKvDXcusx5VAlAmXHzaVjw33EFiHomHLNQzjYrltU2hFIjUPbYa5Vv79BMB7z2jkTh3HG9fnCmvBexuZP3MJZoeDSP4YtdbgU93KknGfKy+3tFv4+vsQnwKfD51UlNWn/VEMDU5xAgu//3EJK8nh5bNOHSdQ+zmGZS4BfblhQ6LM1syW2rsYmDD9U1iNguxcLNiv2Ejvik6ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77NV8T61jyenSu0hqLaYARZQb33PSS1XgE4nh/1Humw=;
 b=Zs5xUg1F322GL0G1IvJYnobNrx9ifGQnS0FHiLsZv3OZLyaAzi9jGDK2/hasZYImg+jkWKqDqiHIlz8IYIcPW+6bL+G3+WaIaEvstlTPejWpXFI5AYsMEmaeSXARPiYDvOkrF9jZDID3BQpSIcsSMGB/ZE3ocCaxm8zKYT5rbVlC770eQDIAo0cFVMJd3eubxoCwXs4c0+lXtJmvOezT0+ly73B3RdglX0Qmr9X9MvPjsUMJI8pV/A0kasoBfqL7ALb1Z1GIEx11Tz8iGSKgrc68B+EubF6shpy65KJsVZ152se9uyfnVkZq4yN0Dnbxq/IwCM2iVWaYZGoS/lY6JA==
Received: from CH0PR03CA0095.namprd03.prod.outlook.com (2603:10b6:610:cd::10)
 by IA0PPF12042BF6F.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bc8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Mon, 11 Aug
 2025 07:47:40 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::7f) by CH0PR03CA0095.outlook.office365.com
 (2603:10b6:610:cd::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.21 via Frontend Transport; Mon,
 11 Aug 2025 07:47:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Mon, 11 Aug 2025 07:47:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 11 Aug
 2025 00:47:21 -0700
Received: from 553356c-lcelt.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 11 Aug 2025 00:47:17 -0700
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
Subject: [PATCH v3 3/4] soc/tegra: pmc: Add USB wake events for Tegra234
Date: Mon, 11 Aug 2025 15:45:57 +0800
Message-ID: <20250811074558.1062048-4-haotienh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250811074558.1062048-1-haotienh@nvidia.com>
References: <20250811074558.1062048-1-haotienh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|IA0PPF12042BF6F:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b2b1a77-9095-4b90-ebce-08ddd8ab5902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XMKmcy/sNmXJljAjyBKDvi08cL3ThCEEK/5wFJjR6vaRucudJQM3/fn0vZVv?=
 =?us-ascii?Q?o0q9JeDXZsnUcDPaLqhvUIpa6CrByLjV5TCVuYKyliptYR7t+cvvG35stYzW?=
 =?us-ascii?Q?tCrTy3fdRU2/qumyrKFgaERBS3Kwyzpy/yoAEIckeWVy+OR/t+kPfERq7NpQ?=
 =?us-ascii?Q?gH2SG93bcmSWUlNME4yoZMS5iv2Rb14BOlb82fQo9UcEDAMon09KiEjyJopX?=
 =?us-ascii?Q?jLO9uQx0mQ0ZNQ7KuD0f5iWMOYzQWQuz+jU6b0MWNTHiHGIJRG2J32ckrsgp?=
 =?us-ascii?Q?IL2jvHJkOqPKVWHA+jhW+Os5ZczFqu9DWghaAPz6OaSUAMCZaO3ss2T9I3XO?=
 =?us-ascii?Q?Az3hZhtsMPZwZ1h5MjdPQ8FxzR8cSe1IOAXt5cFATW+swtl880YRKoCr2ioQ?=
 =?us-ascii?Q?be9Vz1KOXKthjtg2DyQTIIeH4KbhW7qPWbxbOQfjmhcQOVcU6BnAl0FMaG9c?=
 =?us-ascii?Q?7E3yQe9ETvtfXwaQYwWI4UNVo4d/J3kMlw+t03tf+b5gR0VrXn4r2IsQyNWC?=
 =?us-ascii?Q?HjzAPiXsMavy6jSUCp7ZddB5+y6ukdteIm8so8Lja0eQDOOO1uFDU53vEN5j?=
 =?us-ascii?Q?9Trqrc4k/Jb6eCsoRirQWQz9WSOm4SB8oBOgIk/1TwQNcV9KTxGxFqBh5Vc/?=
 =?us-ascii?Q?krnV0SN6a9f54gJj64YxU9KX9uw+DREXwU1C/BXZoXhpJnRKi3yawvZ8+QTn?=
 =?us-ascii?Q?fKlfnH6Ty6FlizIfiRx58jbr/C2DxU+2jMScX7yQNKA6oCPjVSz8BKjuDDm0?=
 =?us-ascii?Q?IkQVc3UWjM9If/pHaKS7RZKqF2j7TPtxsX5yRcwHExZwcCP9r/WTTNHfz2xe?=
 =?us-ascii?Q?fO7D0VEVCdWE/oMa05qnbphAbfjiGmdjseyAMJ8LIExHNswWNi071hRJ7i0U?=
 =?us-ascii?Q?64dHZVi3CMSYbIGYjvn2qGYci4/PYHTW6n96MrJmiX5tzH+oCu4TlvZGVDf3?=
 =?us-ascii?Q?UJljlqkThfhbFFVslqudPv2t0Ka1dgXkWW4wXVj/UW1Brdl+wvY8jBqDKsWD?=
 =?us-ascii?Q?GMIu6mTVoPVJJl1MTwoxuSaq9V1b0lpckwZQm0lyIea23LAvzR2rFQFcyO0K?=
 =?us-ascii?Q?NCpmlb4Z8JEKG8tF89nLJ2jU7yZ4wN4j0HQ5MTPLYRLi6YDBVEWRQjjN0cXD?=
 =?us-ascii?Q?BlqieaDr0K8l+GwYbXm4GdgiQX9vSBfy/+P6C9ossKCF+/0EGVJGEsiIST7H?=
 =?us-ascii?Q?+SrHnFVHTbXdste8o//F1HnqbCNnH5I0fh09imwCJEsV2bF4aPjutStBhsoY?=
 =?us-ascii?Q?+SGwAkfpkaswO3sCqWAZRLfuyH+qSszN/aR5w+Jr8g7fv+2ZBbY4hcw1sc3+?=
 =?us-ascii?Q?WAnGnDdGecjXYnMIyS+nXZiuLmwpaQF+g6lJEMHpUWDQvRu0iaJtlesOifSr?=
 =?us-ascii?Q?o48YWk7oZ2tT8eFKi3exxTPvX8XpC6KLw0X/e5Cic1wlnsKnJKXaATELFO0v?=
 =?us-ascii?Q?rnkXaAQi0k8ayeNuaP31fl+XPE7+133VNxASglRY4zEa2ej9gRI7i4XRKBfH?=
 =?us-ascii?Q?eI60zICsW1/Cj/0TtI5vpKxcaueI9r3jqVoHlpYFH+OaLj1KpKIn4gi/Zw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 07:47:39.9256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b2b1a77-9095-4b90-ebce-08ddd8ab5902
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF12042BF6F

Add USB wake events for Tegra234 so that system can be woken up from
suspend when USB devices hot-plug/unplug event is detected.

Signed-off-by: Haotien Hsu <haotienh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 51b9d852bb6a..bf3a46e24aa3 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -4209,6 +4209,13 @@ static const struct tegra_wake_event tegra234_wake_events[] = {
 	TEGRA_WAKE_GPIO("power", 29, 1, TEGRA234_AON_GPIO(EE, 4)),
 	TEGRA_WAKE_GPIO("mgbe", 56, 0, TEGRA234_MAIN_GPIO(Y, 3)),
 	TEGRA_WAKE_IRQ("rtc", 73, 10),
+	TEGRA_WAKE_IRQ("usb3-port-0", 76, 167),
+	TEGRA_WAKE_IRQ("usb3-port-1", 77, 167),
+	TEGRA_WAKE_IRQ("usb3-port-2-3", 78, 167),
+	TEGRA_WAKE_IRQ("usb2-port-0", 79, 167),
+	TEGRA_WAKE_IRQ("usb2-port-1", 80, 167),
+	TEGRA_WAKE_IRQ("usb2-port-2", 81, 167),
+	TEGRA_WAKE_IRQ("usb2-port-3", 82, 167),
 	TEGRA_WAKE_IRQ("sw-wake", SW_WAKE_ID, 179),
 };
 
-- 
2.34.1

