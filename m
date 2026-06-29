Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013035.outbound.protection.outlook.com [40.107.201.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58033F9F44;
	Mon, 29 Jun 2026 09:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782725679; cv=fail; b=Xz+MNILBuDJdtdAdLwz4SlA6JKfeEuCgP6Xjt5Uv/eH+DF9bCSa6nWbWIWA1jrhE4saLV9TWuhgSavmBlJFFY1RZEq0p7E3trAHD18pB6ZuqFSP9bKYACqlWYbYM0Ry1mp/rckv7bcnAy1s9b1ahYrU/FSP/pwfDuAfWwcr+4a8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782725679; c=relaxed/simple;
	bh=nZtn/XN7x1RRmg7r0/F/YX6q+Ttq0ZRA6ewebhYeRTk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mTdRUwH4gxemNXZO5oDe7l6tRNJAGaeYkUiBRazWhx+RLuQrD+smSq1SjoXddtpX/eoA/6Ucb51AcQyd6oUVjIrpr54UiMRVWRGU1iKxaK0tfMTfQhn3vzy3V9B0zKYfRAmauPot7nIDMs/k0RJvyJMaEVmGjK0DJ5Y+HG/prMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=G/O1BpCg; arc=fail smtp.client-ip=40.107.201.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="G/O1BpCg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eqWmb7AnP1U5nY4SHSTOMftuQe5WbdCX9jafxwj9JXw9UTGkhmANvWivU/q02SBDlbv3/1xK0it0fEYeTFM5KX+3RMOohgVf0BTTcCgI16SWJ7BI8hDW+wvoGNO6ne+E+4/lNbs+Wce4xatwZyuvwodYNbXFnMKPnUZ/2sbXiglwkT8nNZSEE9a2sdNTTX5t4ytCyajiLhNU8KBiCoWAmjDfPHV+k+te3vsqef/AMwtPoID/21JgD/0s60OT4VxhwADHd8Ds0qqKnAGAz+Bp+WG1i6tOqvnkzFnlYcnUEO9g9QohvSv3FvJUZtTmiposr/NrBrGI1xaYjt9lSM9rHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22qwX8Z8yrRz7VNGiixRJRGbsyMq3bJPbYMSk6ZI4Jg=;
 b=duqn5F/VgNr2XEbwoQ2Wm8+OEeTdycjXL9Ux7UMccKyAWGT0oX4fUvdxeMCqsfoKl78mju/fIW81PIib1cgPVLMv/jstkvfHfyihffxWV5SONKTFMB+EkoHngFdP9D31lBFz6s90h2UQXmba3JzCKi4cMb39TZDoU8XO4MVAI6TDKV2PLAInNS1F7FVZSJa0U2BlwKC9otyWwk+n2sff37294ANXyDrATsMbr0WCj7lx+jQUEeTZcI795/K1qQ+cFtZ6x0tTBuZWVq2kWHcbVYW+wxUSz0SN33/pAMcNnw3IGjHpa+1aEUto2sJtTXkwFVvENS9Ap4ACH+oohgQWGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22qwX8Z8yrRz7VNGiixRJRGbsyMq3bJPbYMSk6ZI4Jg=;
 b=G/O1BpCgk6oTrEizi8agfl5qnFLFHlXE6X+Vhkym68v0IXUhYVolFgE/smnDqQeVz7z1bfipUnrvgUGnqMY0KH14aEcgUPZfF0IuMcEuuRolIl3maLmeLLLZkYpbX3HPjm91kVyuxZGZc5uv9cv65jWXrmKStEHKZPM55RpmSTl/NvnVQBMVyBEiP9ZFVaFSBpCxfUj0BnmwsuAOGbydRGDyuUm1ppYoqQks0x8Y2nWl0osrqDciiSf8PqEdrg7MpvuYnETbaVwzWzsUWTWlgWjBcZDeQKqXaHhx4QJ07qfRfwS3lFWV2kEF1Ir6rdJOpgI1HwsQZVntwACBKVziHA==
Received: from MN2PR07CA0005.namprd07.prod.outlook.com (2603:10b6:208:1a0::15)
 by SA1PR12MB8144.namprd12.prod.outlook.com (2603:10b6:806:337::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Mon, 29 Jun
 2026 09:34:33 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:208:1a0:cafe::5a) by MN2PR07CA0005.outlook.office365.com
 (2603:10b6:208:1a0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 09:34:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 09:34:33 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 29 Jun
 2026 02:34:23 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 29 Jun 2026 02:34:22 -0700
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 29 Jun 2026 02:34:20 -0700
From: Wayne Chang <waynec@nvidia.com>
To: <mathias.nyman@intel.com>, <vkoul@kernel.org>,
	<neil.armstrong@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <gregkh@linuxfoundation.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <waynec@nvidia.com>, <linux-usb@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 1/8] dt-bindings: phy: tegra-xusb: Add support for Tegra264
Date: Mon, 29 Jun 2026 17:33:59 +0800
Message-ID: <20260629093406.1118594-2-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260629093406.1118594-1-waynec@nvidia.com>
References: <20260629093406.1118594-1-waynec@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|SA1PR12MB8144:EE_
X-MS-Office365-Filtering-Correlation-Id: d365cff9-e9d3-40ea-7758-08ded5c1a0a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|7416014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Hvqj8UePmk13+QdwqhfjLpQXh5nSz6WiEa4L6oaluqj09U0i8fywk3ooZyKKOThxigVW6Wfm2l/I1Sz2jSaDvfH7TrA/wkyS2EmGdFmSci+Vtl7YaVtrDMPH4IC5oZBLZGGbDv6/dYmygZPfSS3qv+xiYTkYPcw54mDV6J+x95LR/g5B/v8UkY3L+d9idFXUXOhbieFxrXUub4mnxEN9ZAoqG/4V+x7c+jo/4yzVLECeMx4uMD5JW5iCgiihspWBKQxqr6n2529J+pYdsD+4L8NFfMGqPTwUDjK88KhIU2N5QhDQedwJyDW8NHFX3VoztHJNs4C0bB3YxQytOwRN3xPSIEpaxCCiEBU8mzrFXfQShvgJb1eutYvvAgOuAa9q+Y2wkV5WYY7lqxwsqlFMumEk/fePldA1jHpe3nCzdmBNQQ3ZQtzgJ2TbHG9QCjXQArG+U33eU8cBU824cGCp1vh4o2RSdYbP2sMwEjFT7QdTe+BD1XCkbinKTCuUZn7wmYLMkRNKjn/vmLysQmkD1DHLxvRby2g7Ny+mymBG2tVnebCsm1qSIWrL0N7kKQ5z+erZGxW/jdQk/wnLEgCUhfcDv79amomCmQBqNADwosVFftgvRxSdjpFOwcTkuHZ4fpsJnwEWjyD5AdjQKtBOPUevWUned9hifjYmHraA0ldY+gxI1pdF2lleYgX9LNcyd2gpur2RXqDZVA75yG/Iew==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(7416014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+G7QPmcDNqSNkD7Ot7Lq6yyCEFe9zkc+mGqF4RN0jfLvRcn0lGxv7u2722iMGB+vflHPFH+Epx1sZBCOWkjN4snQIO2EVaRBhGkRR0JZDFxaSfKJf5JFHlY16T4kzRVnlo6uJF4YxxRstiKpqrORUI22i6fpZ2T1a6HYX/D3JgqjFEO9J0aHYNlV145Kr+Pi3ZAbNnZn2HAs6urU/8xMkEvScUdWAwHxNip1c/ZcNOiPMuH6FVec3+MgcSYpyJrUwSQRDJ9IDhW+cdKKSbrV+OLNYMjRAE/UkoCnb6iiDaPPJVVw0vACwdHaU2RJ3e1tWom/hTvfAedDJELiSZozo3eDdck2htDPOrJd5r4djNoK6uIWeNEkhMVtNa+NGNjqLkTL0VNf0VtoUB/gUxvQQfYtkh5XxuP0bdY5APNNDWv11keygWNWSajwFV7BWP3k
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 09:34:33.1621
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d365cff9-e9d3-40ea-7758-08ded5c1a0a0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8144

Add the compatible string for the Tegra264 XUSB PHY.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
 .../devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml b/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
index d8de900a4fce..f6fe3c90b5b0 100644
--- a/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
@@ -45,6 +45,7 @@ properties:
     enum:
       - nvidia,tegra194-xusb-padctl
       - nvidia,tegra234-xusb-padctl
+      - nvidia,tegra264-xusb-padctl
 
   reg:
     items:
-- 
2.25.1

