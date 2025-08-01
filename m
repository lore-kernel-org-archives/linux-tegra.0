Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2077.outbound.protection.outlook.com [40.107.101.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23358233736;
	Fri,  1 Aug 2025 09:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754042331; cv=fail; b=iLZ1o1JacQO4gM3IDQpDdHQSdq4Of9CptCNykJuoXSaDmfP8+dRNz4VWQV7Agvj9orUPAG8w4Rt2lmKngmFrdkwAmOMxyTn0OROd+zuK9j3jX8wvfv3SFS7pZVxy3YkfVDj0jkHEDRDa5O1+QoZPNqQoGMpZtmtn82wbkFO7HAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754042331; c=relaxed/simple;
	bh=P6+FrUF0wPMAGZ7lsf93IQGZElF6pz63HjrxsDWTwuY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JpzI/yK+3kF2u7Ro84IEWUZUr+1468L4giKkjwkYs78sfVw5Wq2xj0uJwOJaFWE8ndxNPUpQZmwUUskDbSqUWZj7aKJASetabVOe6YpBnSUZOJ11CihXiQwcwvPL5s9klWSO9J+nsNSnSmOLBQ9NgUfjJA0EutbJYpzotngnSnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ADXERme9; arc=fail smtp.client-ip=40.107.101.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ADXERme9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mmCeME1NgQAWpz/3oGrDxTK/MoQfZ0SAatdaeV0nQMhHvUm297Brb6hkjWMnAy5vxdnVOm13hUkcGvjBAfzB170db5zwaMXFVnmk0hmrWMvD97U31oRkr7volfL66ZrIQPZxWtPMVWmHd6psM58tMGXzTuArJP+cgw+F1I8Vxh/MrwDmXdt79d4N86EnBRGm4NyTJlmp7FuHs68/fXLyScL05fdIGdzl+VZGWpZ42TRhaEgzQvHiuovazodajfeFMeE5c3LTJGYYflKRDRoaeXnAc//tYKqRMwNvgroZI7DttkyMWv4piTIEfX/y7n9TBJv/z6t/f0rsz/j4KjX2uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VlQrHTW9tElMT8Y20EROfc39nq1el5LkWEiOOfgm1lw=;
 b=kfWCKcGOKy7vnVW/SySC9WO/0WVjJZOHKQFQNkBwqdq8+7mxBswT8gWrFP6pp4HZazZYp5yNk8hM+o/nik6H6Dd6YdeNmNfLnaYhlyWdgovF5dnglhG/FOs0wMmY9scxo/bymfm3DenqWqrSMzPYs7LuS1Ef1pZpkqqPmND7FDgYyWUF+Fn5fTt/nSOozrxV8Vw+emDTnQfJOZAAiKomKR0fz9W9f7n5dzWEEKWII9Lu78VbJ2GGFaVh9b5ctIj6SqKg2xrnmLPfyduqNb9RZtkfkomph+gHor7PFmYBGU3aym4LfRcMfwHv+BDg9d+NVO1ZgfwkxykVO0M0QDCmgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VlQrHTW9tElMT8Y20EROfc39nq1el5LkWEiOOfgm1lw=;
 b=ADXERme9GieQfUGWzilfiqw9QEI5GxvJVHkd7pLtks4z/QvCyZgWbRr2iwp0gv/Z2nrAp6LYChH+CWgkeLdd+eMNaITx4+95ENkIHHA7frXB7q7E9NyxrYGLT4W2PS1julH8ZeXfA0dlLvZxSk9QAtRF8lRy0uR+Rps3qQ+gr7XgoWJXs77esYBBaTfMrNg2MERAC1/Ip/skNAM9n9+Iv3MbW65yrqS/U2mahOLaJ/64YGf8nSv1HjIae5Nf+x1h0TLOvEWdEKbrxEqLmuDeXcDkrFmGlHg2yNuWrsF4XgIM0kSD7kihb3gvMyUdFTlz8VAre13j0WDDnDCGvyICfQ==
Received: from SN6PR04CA0095.namprd04.prod.outlook.com (2603:10b6:805:f2::36)
 by DM4PR12MB5915.namprd12.prod.outlook.com (2603:10b6:8:68::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Fri, 1 Aug
 2025 09:58:46 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:805:f2:cafe::fb) by SN6PR04CA0095.outlook.office365.com
 (2603:10b6:805:f2::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.16 via Frontend Transport; Fri,
 1 Aug 2025 09:58:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.8 via Frontend Transport; Fri, 1 Aug 2025 09:58:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 1 Aug
 2025 02:58:20 -0700
Received: from 553356c-lcelt.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 1 Aug 2025 02:58:04 -0700
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
Subject: [PATCH 1/4] dt-bindings: usb: Add wake-up support for Tegra234 XUSB host controller
Date: Fri, 1 Aug 2025 17:57:45 +0800
Message-ID: <20250801095748.385437-2-haotienh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250801095748.385437-1-haotienh@nvidia.com>
References: <20250801095748.385437-1-haotienh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|DM4PR12MB5915:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d0635cd-ad52-49bc-953c-08ddd0e20167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pQMpKMIgu1d6lvgTfR0W4r1xNctpBOsE+ww0oZiTpy/0ZDFz1ijTWqRFmGLV?=
 =?us-ascii?Q?xYpSkfUCQw74S1jMAF8cyg309mVuvWKFeDvI3syO0sdRoTNF+arIjKGpw13i?=
 =?us-ascii?Q?DN00d/VBpSlgPtmljTXPue2VqpDPY2hfZXP65sF2H8t7UuhxlQmtuXV+Vpom?=
 =?us-ascii?Q?Qje82Yq7qp5PfEDg9r9K7g9C000UtNw+s5osVYNoe0ezZ4fbAwPbbfM/Aop5?=
 =?us-ascii?Q?EONC9rh7OQGcksX5WkUH1ajkSTIVKtw4G8j5ZHGs4m+iAPhLpE77/+MgWKmn?=
 =?us-ascii?Q?/Tx3Tqpy8L02jate6muUPG84Lcd3bRKNeawg6XRerNKWPSVzL32/fbnYrSvF?=
 =?us-ascii?Q?cooEBu550l4DcTrLA2tlKD+b3/Offaw2VHiYHZ5GI8s7GVpho6d9H/nNkTKW?=
 =?us-ascii?Q?whe/6jhakyFheK36Z05vL85Q1/MTo8DW6nszyqfQzs+4FGycxS2RFDl9GzI+?=
 =?us-ascii?Q?XFI9FPIVijE1ywjFx3fDCfJsUOsnirAjq7ESg22iUZntUn/1onZCT+U9opVd?=
 =?us-ascii?Q?uuJvy4VJdQUFjUAxqZtxsyXYQgmeNb68WRG8z17sxteTbH63QUiPdMXO4hyR?=
 =?us-ascii?Q?6fXZ2Slmm1ueU1RpdHk36CUdC868xDQ6rBwSvCGDoCH2XnUh+eDxo5nk8Ulj?=
 =?us-ascii?Q?T0tXB5Iv/Q+iSUwiNZwM1ZPaHy8XUinLQCQiCCtdfN8i4mDSisWrOHQ51GWj?=
 =?us-ascii?Q?vfM0TQr7XLk5RvYgSkUBFpJNjBiAX/Esr2qvf+03UQc5WIC1ksrZazF0mwQn?=
 =?us-ascii?Q?ql73ccQUVN4zdEmZ0bz43scpE7NCp2vlMnWvr6ELi+MjD42Kyla8knxLDxnN?=
 =?us-ascii?Q?bTQMviR1P+NWWqZJQXMZ1i8epnyU6kxlhW/2G6IIxgxmL5rffG1mmDclfAow?=
 =?us-ascii?Q?TLvCc8eXEE6eLH2SL2bJAf/fRuJWVD4Qb/GwWMPs42iEvJ7LEvKI3FqFBsSz?=
 =?us-ascii?Q?UhqhlmnhsWfRBjxtyluxSimDYbDsr7Mv7sHWI/LiB9Bh8UwavLVCioT+teXp?=
 =?us-ascii?Q?991bA257dQXr3cn5IDgibWAyPcNRpDy23nFoA2lM3ppMMkus4DdADAORPNkZ?=
 =?us-ascii?Q?51tgEja+lgAcupIGm7m4brzsimK+0hoG9C/IwGBRGcEll3S9UA8dC5AOQozV?=
 =?us-ascii?Q?IfjspnifLr5BhNMjtSexB3H0RL0cvAaXToAX2HeVe9XFYTNFN+SD3fnD3v57?=
 =?us-ascii?Q?7vq2EGwiYpudADci8AbOlFUEusiWOJz4LAoM5bq5TpXIbWOTeJJdCS8pUgtf?=
 =?us-ascii?Q?KseDsCPpG+7pvuo19vqZTOuwbSgtr5p4J7w6N93Cektsz2rs6f/hRwD5CgeI?=
 =?us-ascii?Q?5UneNz6xV8rq6Yr4lnj9vAbxV06TdfnUfxP1w0swooa3FoU4p7o7VaZTXjv/?=
 =?us-ascii?Q?BOzEY84lY0lmvnlt066KM3nfNSPuruKNUEfKcNEgqaDY5ToNf2DzzPfnpv9P?=
 =?us-ascii?Q?5M9xBBpNloIRHxbEqa5Pb90FxyOUD9vAUAC3BUcceOu2ocdu3ySzoz9K8fyR?=
 =?us-ascii?Q?lZBUTgdqrIRhn1aoXoON+KLLOcClCaDq8ubgQDygmerE5t5iRHqZhA6UpA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 09:58:45.8522
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0635cd-ad52-49bc-953c-08ddd0e20167
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5915

Populate USB wake events for Tegra234 XUSB host controller.
These wake-up events are optional to maintain backward compatibility and
because the USB controller does not require them for normal operation.

Signed-off-by: Haotien Hsu <haotienh@nvidia.com>
---
 .../bindings/usb/nvidia,tegra234-xusb.yaml    | 28 +++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
index db761dcbf72a..6365c6647cd7 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
@@ -32,9 +32,32 @@ properties:
       - const: bar2
 
   interrupts:
+    minItems: 2
     items:
       - description: xHCI host interrupt
       - description: mailbox interrupt
+      - description: USB wake event 0
+      - description: USB wake event 1
+      - description: USB wake event 2
+      - description: USB wake event 3
+      - description: USB wake event 4
+      - description: USB wake event 5
+      - description: USB wake event 6
+    description: |
+      The first two interrupts are required for the USB host controller. The remaining USB wake
+      event interrupts are optional. Each USB wake event is independent; it is not necessary to use
+      all of these events on a platform. The USB host controller can function even if no wake-up
+      events are defined. The USB wake event interrupts are handled by the Tegra PMC; hence, the
+      interrupt controller for these is the PMC and the interrupt IDs correspond to the PMC wake
+      event IDs. A complete list of wake event IDs is provided below, and this information is also
+      present in the Tegra TRM document.
+      PMC wake-up 76 for USB3 port 0 wakeup
+      PMC wake-up 77 for USB3 port 1 wakeup
+      PMC wake-up 78 for USB3 port 2 and port 3 wakeup
+      PMC wake-up 79 for USB2 port 0 wakeup
+      PMC wake-up 80 for USB2 port 1 wakeup
+      PMC wake-up 81 for USB2 port 2 wakeup
+      PMC wake-up 82 for USB2 port 3 wakeup
 
   clocks:
     items:
@@ -127,8 +150,9 @@ examples:
               <0x03650000 0x10000>;
         reg-names = "hcd", "fpci", "bar2";
 
-        interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
-                     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+        interrupts-extended = <&gic GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+                              <&gic GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
+                              <&pmc 76 IRQ_TYPE_LEVEL_HIGH>;
 
         clocks = <&bpmp TEGRA234_CLK_XUSB_CORE_HOST>,
                  <&bpmp TEGRA234_CLK_XUSB_FALCON>,
-- 
2.34.1

