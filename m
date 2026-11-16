Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794842695;
	b=Q1sL94vytkbzVr/RO0rjJeUJlHnRhs17Zio4uHxZa9ouhSTPxnM2cSwJ7FCUTuDHJ8ue
	 Dypc8On44aF3RdPXuMD1ScfTTu/3+kdB6LUXseiyk/zvRhPbPyvuL78A7NeeD3IbctiP0
	 HPZW9hmB66M/M4GZxkg6noUz5V1tDdBfWEo017moBO0XB8gFNYqfulo/a7H/1s40xQq23
	 ZimnPRr4jiOa+vG1FBZV7W1An+v5E5KXHvwPDEKAXXV40ec3A3o3o0ozyhTNItHtaTW0A
	 ClGjZfC/QHon9CuXyQ6Zzj7sR1tici4Nj7O+v/YlUMMeTEetwgpDuhTvzXvWSRtGLqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842695;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=AL0el5IsbnRlWz/NHzuGXWyG4Q9DR2QdYGLI1MOWW6E=;
	b=Bxf1JyD6UGsuhF6mcoEfFc+AE5lWYbwfYIc7idqn3MlG6lRNPAmQ4QjJpzxFXUro/rXX
	 GJeJkIA2f0PHaNLVWPA2UhJYhP4631fbyOrJrKT51RQP7jGnVntiUzm6nO+WJHrgHrOEz
	 T96rRRY+pC+D4Il/xqB2/z3zeIpURC2BBwtkLC8M9ixwKSW3xeVXNVa17GLLdUkctWy93
	 RctjKQ0Vbyc2LeA33FzOPRanSp2vh1VgczdzSzqnovZN0WWZvDv9fQgtYaxgwMVmCaSLH
	 xs/nMrSYR3Zu/UuLeCeix56+CD98NrIxrxcEjaXyXGfsL6B2nm4MpAVbtToGbjDoYzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PyaQKghD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.69
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010069.outbound.protection.outlook.com [52.101.56.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B6A606A881;
	Mon, 16 Nov 2026 15:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95B6A606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PyaQKghD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qmu9DrLMtgaCvEGXpLsR9I8LQ8UPFrszkPsj8rnPz2jQCxM6rHBa2VtgbOeahu0cg01vUuyrvVPYfoYKW8neKkz9Ms2fkFZUJDvjhElCYBQ+qxm4oPvTHzPCSkx/+z6Ue8lf6IXEq1cTLWVdvJo606bwT9QV2149Vuc3k0an7VHum+pNIuCk5PyLftqXvVQdTjfoJozHp/qdEi8iYnyMSUkEu7t0XZxu7yENRA7Q4V3iysqaU4Lc9OBGIan18JW2BWJ9Tns41WWg1wGlwl4X0zWPqGYEoK31lsLXVCJAlu4bXtwZGD+AVZyy4GSFJ7H8FMcJOlxcD5+mXVxm157+WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AL0el5IsbnRlWz/NHzuGXWyG4Q9DR2QdYGLI1MOWW6E=;
 b=LI7IwBlW806AmHm9AMZ+dTtD+4YsvG+gbKmpYgvJuAUCf9cHU9FBrz40B9Y5z7N4xiMGWjN4YZVow25h80qg6RFGib4cUv502xnPffEH2Bazb9ce7Xf1wuyojgjRIyEeEfuPBgxIiZI4uTKRUuKbdrZuf80eVIAxfyzV/yF/pIgNNxXoPBlHayGrrgj2F0Kj0Dth7MIt22IabDrHMS2PzZwS+upqbKfMB75MRUCV2szNPtM4rnfi+B/2k4McFML8JpkwN7GWgk9LHaArpZ3JUO/nKWYSqMmGYljEjJs6OYUvEcvK/plxWh1UiB0yPzvStUWTbfu9gXmwdKJdj7LGmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AL0el5IsbnRlWz/NHzuGXWyG4Q9DR2QdYGLI1MOWW6E=;
 b=PyaQKghDOei/RL0mPc3bbLAa3llUNy5XfGn/DtlNXg7GsGr6kFFKjSDyKPx6DuioEszAgJ87obHAFD3cVL0SMdlPYdW+cB+p/ivFkQeaOeIi9jZdtg4UT+nfomWot9z+lJrQBhita+ONkHQ88WgrtDbxLGZ52dVyQS9TU4BuTDX2pRI2Ai6LpMk6dbqm9HjbnNW+eVMCiST6kCKUTuXhkBiaTjiQ8ywTjihUBXj9XsMl18Aa4CpyvaYIbKUUl0/wbjXSCyEyEnXg1UccO8DgoEG2SmF2btLf7bfvFNQ90gQQHRWNnjEfDeMvPNokizwU7RtEucLdplMArH9e1IeS2w==
Received: from SJ0PR05CA0057.namprd05.prod.outlook.com (2603:10b6:a03:33f::32)
 by DS1PR12MB999188.namprd12.prod.outlook.com (2603:10b6:8:495::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 15:24:48 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::56) by SJ0PR05CA0057.outlook.office365.com
 (2603:10b6:a03:33f::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Mon, 16
 Nov 2026 15:24:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 15:24:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 07:24:24 -0800
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 07:24:20 -0800
From: Jon Hunter <jonathanh@nvidia.com>
Date: Mon, 16 Nov 2026 15:24:02 +0000
Subject: [PATCH v2 05/12] usb: xhci: tegra: Fix missing semi-colon
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261116-tegra-usb-v2-5-42efc03a9700@nvidia.com>
References: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
In-Reply-To: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, "Nagarjuna
 Kristam" <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>, Mathias Nyman
	<mathias.nyman@intel.com>
CC: Thierry Reding <thierry.reding@gmail.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Thierry Reding
	<treding@nvidia.com>, Wayne Chang <waynec@nvidia.com>, Jon Hunter
	<jonathanh@nvidia.com>
X-Mailer: b4 0.16.1-dev
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|DS1PR12MB999188:EE_
X-MS-Office365-Filtering-Correlation-Id: 3285fe2c-2e53-49b9-6cdb-08df43f5c05c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|7416014|376014|18002099003|22082099003|261009223027099003|11063799006|56012099006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	07ZqZoWQ595VhXrkKoBzi67oq2+Yg5/HuB8Ztm1T02ODSntx0FsITlEtwSmAf1T0VO4qO7SD6OorAZhg8dCC1zUL0qs9CBwHV7n7Wytxrlip0xuaKFSXEp1fx7HJIa7aY/JEccQH0S4SLzTx2+VG56HV8Xv0N24EnSEXsX4kv90paBzhUFCqHl0qZWzgIhGOibxmFKJVba0eL/L38Y6SclKNjeo3KEuY2PQWy1uQIksXlCHgNjBLhB6KJMf4KtmnDO3cKZDdvV38fI645ZjC07QC/luWNRU+X3oPSbKiuIY1hknowVF0L61ANCzlUYUnPB7oUpueaufwGQ04pMMKhMAaiGImvacN3e9U4pdTQc+nxHzDroKo5+/LrW0IRJwn9wPnTAl/q7QLJn1Vrf+l6rErifMKGP8stll+a1dWWQPBoPgshoVdn0TXsxDDOZgUuz0l4MNccjUCOJZ/4W1JieYMUQBZQkuURpH2Sk5BKPumtc2vxZHbAkE0iLmNp8tv5fEO3bCBR/adVTkfxxVh+YT0vJQAfcOh68O+G9FpsmuBBSvUvwmvWRk8QODEMpHPM8d5w9H8HRLn5+vraez2CqNKVqtKODf1u7UM1uymXvC9Z063HyiKwDeQ+6H7OlwPrjmqIbyX2GYAoDT6NEH4GPhJNGIVHNM5NXULzYLdq0SqywQ3N4PTNg8GNA2a5It1eDmG7xIE1JQcu3lAOG3TYg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(7416014)(376014)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IR9pPy9+SlSDwQwPNdJwA/wTYsLhLnmJ+9k3wseCdc1ajX2CCqDOsPiKRTElUfSbVfgf+LnvGElCuI1Y50t0DrcU+xz0JSEflV3qOPPijUVEdrlLmhWMrA4HvMsCP36T8ZMfNGpcHp0bgLOm3/ofX9X4VT1EtHJWU3qnv0z9Seqf8AQnrjMnmNU5ZGPR1oM7AEf4MtN2X2yYKj1Nrum67p7S1GYc2PpKOhddryCOu0K3115WN+NIIIKDa/1HzckJdXliCGahZuvQXCB5FytKax2BanIAVvY4W/CeOkvM+q105RQh6A77OdNmmFZAvhgaz1JG/ZiFj7lBffKhZGHNmeRKWokJ//5icfvQekBwHbycUMBk9BQJfMXgBNINUCkunEhAT+7tKFgIwYAjNpbc+zE8qAE3gx9bDMjzofYbSfci6E5HaypKBdq7apb39wp9
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 15:24:48.2854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3285fe2c-2e53-49b9-6cdb-08df43f5c05c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR12MB999188

Commit 6d45e9556d4a ("usb: xhci: standardize multi bit-field macros")
updated the Tegra XHCI driver replacing the HC_LENGTH() macro with the
FIELD_GET() macro, but in doing so dropped the trailing semi-colon. This
still compiled because the comma operator joined the assignment with the
following polling expression. Replace the comma with a semicolon to make
them separate statements.

Fixes: 6d45e9556d4a ("usb: xhci: standardize multi bit-field macros")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 1a14aea58b0b..5fbb09d2a1ae 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -995,7 +995,7 @@ static int tegra_xusb_wait_for_falcon(struct tegra_xusb *tegra)
 	u32 value;
 
 	cap_regs = tegra->regs;
-	op_regs = tegra->regs + FIELD_GET(HC_LENGTH, readl(&cap_regs->hc_capbase)),
+	op_regs = tegra->regs + FIELD_GET(HC_LENGTH, readl(&cap_regs->hc_capbase));
 
 	ret = readl_poll_timeout(&op_regs->status, value, !(value & STS_CNR), 1000, 200000);
 

-- 
2.43.0

