Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3168714885D;
	Fri,  8 Aug 2025 06:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754636349; cv=fail; b=EV69aU81qBKcsuGTyUDile1QXjoRsax06qio35tgwy31WTiAgw1WvC13AqvsNTwWbw30YnP4rrIm3SYz/tdRyqRcnik0qTfsxjAQmoUj8T5uf8CQUImg/k6/VwbX9NPGb1ATM73uI19IVcLjcBQDMhtG5d3X4t/xM2WsDZKnryM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754636349; c=relaxed/simple;
	bh=2VOMkkYWE2j25PlXuU+dYFWzyxqz8pUUR0pXD4/f9Ng=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rta0psBksrLa6c8JW9moVRBvPDaVTeEugHuqGguMpxSRHn2b8KOzP73f3AHzIg5cuSeMNco9rsA/J91y7pib01slbxy3E2zpnwcJlloNibyJYNuQcA6a6ilEwV0+xIAJCPpy1YEvCVevXu3ytPcPscD9NSR5F1HTH86Wvv8xS/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=h4b2RxH1; arc=fail smtp.client-ip=40.107.237.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="h4b2RxH1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L37F0HPQMonYiN6XpO8z203ILDjZypZyjuhfIxPBnfFhyKQfhoEJsdNKHN4MkVbjvv5RiSlmLojGtDKduDKoRSi8oiWdm2NFAGojYXZE0ItbVVv0atJFIqdZU7+vxp5mxFzEvD/Js3xXf+tvTDb1yRVOaur2Plgw69cHkQfE6e9WpZWu9IdhFI2tpCBgLk0lLwwEBhElVNkELELCVDG74uBmQXqvTFTfBSn+7/7dOoWff6UoEqkcPHLFn+xoLMTeSmI6DHlwhjcQCh3BG/DsAgiWGiJwYfh24FBg2RjLamKcVctHImiLh1ksqW4/l2ufw5IUFiUehCDzP6EWdl3mYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yp8X0Dtnkf2iKtF3I1vh2m8o8+tPKH0Y8VpkqaZXpnI=;
 b=nDEIae10YEmOedTzUQqhvgSjxIul28Hc6OdlMUD8DUJzUKlV5sBm1fnNZFkmug2/IcsPTqWW56grXds4zFUSEEs5jfaBR5F1XIGbYnJTX9BQormmsK6L9hzvjTx0SsijuDdndt1uBDg/FO3CLyQLnR2oAg1pMHjCB3Z6k7R5kK+fwAmf3YEP+1BhJbbNq4oV89XgigDbups6HVzCr3BA5aJjHAsH+S1h6nViPRmw5Q40kixeUFQaGnz6j91Gg5cUBFYeil/sE/yLI6Vgkum1EroFiapZJcrFnlWBcuAtZHTTjedQye615nR1sjvz8SLVsszpU3qGvyv11GkIZ+zYbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yp8X0Dtnkf2iKtF3I1vh2m8o8+tPKH0Y8VpkqaZXpnI=;
 b=h4b2RxH1nOc8/flob2KggLrKZxxF9Set75wL6ag6vH6L1H4xAS5zpg+Cbu3IOtvomA6WGoTUTR3F5Br/VMukFtiTclqcGiBncObzeVpGylQBHHaRMbs3+9gLFZk4yPhhe9EOMLNRY3/9JPOZ/KVEHGR0vrmi12ndKP4CpkAQy0d5Za7KiY4fOOLMuRC1vRmtLk55jAoWqyobzNMWsaiuSGxcuPE8rlq3Ie3P6DRfK/4GR8Zpjdo1uRLlH9+/u50z4yN54H76E0sX1Op43zidJ7a/T4Kij2sRGmY3PSjMt+Yym+DJuAhA7fJxXhP02JfGqyDWxRzFyzhoycv9lUJ/sw==
Received: from CH2PR14CA0012.namprd14.prod.outlook.com (2603:10b6:610:60::22)
 by IA1PR12MB6483.namprd12.prod.outlook.com (2603:10b6:208:3a8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Fri, 8 Aug
 2025 06:59:03 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::2e) by CH2PR14CA0012.outlook.office365.com
 (2603:10b6:610:60::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.16 via Frontend Transport; Fri,
 8 Aug 2025 06:59:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.8 via Frontend Transport; Fri, 8 Aug 2025 06:59:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 7 Aug
 2025 23:58:49 -0700
Received: from 553356c-lcelt.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 7 Aug 2025 23:58:45 -0700
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
Subject: [PATCH v2 1/4] dt-bindings: usb: Add wake-up support for Tegra234 XUSB host controller
Date: Fri, 8 Aug 2025 14:57:30 +0800
Message-ID: <20250808065733.347264-2-haotienh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250808065733.347264-1-haotienh@nvidia.com>
References: <20250808065733.347264-1-haotienh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|IA1PR12MB6483:EE_
X-MS-Office365-Filtering-Correlation-Id: ca1896d6-c714-4bae-fabe-08ddd6490f29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X1pJAst41ksaCFdCjs7fyi1yz28EEhutigncKrErvsf9ej88zD4q+Dps6k7t?=
 =?us-ascii?Q?NGRTp3PuQaZLLg+1Mz2W2Lb2D+/sh2As3/aPWYlgtPOgVI/YUWKSL35OcXbf?=
 =?us-ascii?Q?jisnbTruojWhmOYr6O9j3fUXVJXzv6jU+p0A7GhpzfwFib/0hLkL4TUHaNeq?=
 =?us-ascii?Q?UoGuq2fhYKYlpHREt0AIXTv0OfaVT5orEDNEbu/OaPODxOqlHRzmYvFX0XUq?=
 =?us-ascii?Q?kHxCK5jWVEf0a3tcJ6SkgW2CCoPDHAi6/h/3g8Jv5nVIoGFQu9zgC7lG4LzU?=
 =?us-ascii?Q?b5SDRZgl9AdTppyEZJCd3K3E6DLDSTCimHNMn1vinokULJaCXtybcMl5j7Vc?=
 =?us-ascii?Q?vvHTm0J0DJfHSsbJ12Orq5ow9S5oZKVIN3S5XZhkcpVoNaDw8kAwgN9xOk1+?=
 =?us-ascii?Q?0JTml/RdgqCRmQigqgWjGJDYTqD37G86Th8IxaQTzcOvlKSeP4G/uBLlYgxT?=
 =?us-ascii?Q?eF53lDY8oxgnOztLNiPAq52q2H3EXEl58VhAg+j0rLrWFdw3hH0yIzrEfAyC?=
 =?us-ascii?Q?gd3ZbVP2Oui07YqtfwB5pr0Umqg7j/kDGzQABqrIBvgfx14nxaAT0HJ4Lo/5?=
 =?us-ascii?Q?aP0KTLLvrTDPDKDux2y5S3HpVoxjktHLJU/WK47n3xvxaC8NHIpqyNuzxyxP?=
 =?us-ascii?Q?Cn/tZ5U0oRNhjQJ9wFgcGJBBp1Iz2hRMuQYWvFb9E3NvsCSAUClhQt6vGfFd?=
 =?us-ascii?Q?PajPXOj0D637uyisUjD46j5AWxVQqS4K1x3HpJKYPllN1p0DuEA7XurXB7Uy?=
 =?us-ascii?Q?u9zUyRULsomKDOUqyKX1t7++S/n2gyCq+GG+yydrawpXWxDxcZoO1YQ35X0O?=
 =?us-ascii?Q?kRT8lVhKwUqaO43zMnBZwKh9g2GXQjPaZ8rqk95AZ4wTiOAWeJkSGeZC693k?=
 =?us-ascii?Q?y6L6pYfOwJ0brxQExOCN1SCglOIQOPyv9efdARCP4yGkxh4P2fsAEtSCiDse?=
 =?us-ascii?Q?66iVnODzOgQneAwk0v6V0HHESZCNFmQKpuyxKCrohitLMNmAJ/Qhbj5PzxFG?=
 =?us-ascii?Q?IAWOwfbVYETeuEgMJbyUPEz6QnzQbmLBahIniazWre6sSlJ+ji9SJK8EMvjC?=
 =?us-ascii?Q?T8oRun8wHIZvK/+ajgYQW2WIN5CergEKDhyR/5id3zzaT5OF7/Ng4rOnFWxl?=
 =?us-ascii?Q?XzwOowv1NRewy3g/IWEmk6Lq1+TPqdBisDpSrmTwwk0jXx55XlTRazTIsNw8?=
 =?us-ascii?Q?AdPGownqVudl95waRm4HhCWXyWjBKYP5fKDqURnE+fEN2/PUTIt/oNt+N5f5?=
 =?us-ascii?Q?MJVYabM4W0V/IvUHPLGxgG0qQGe//2Js85w7kuz4fyPmWkwt6BEKLaxK6Zuo?=
 =?us-ascii?Q?Y6lfeQ0tzlsNaSDrAnPUfAZ7VEV7feuvMH3ZCAvc30anaA0Hnk1ToPwC4ZQb?=
 =?us-ascii?Q?pTXVDBEPwN8KMrgNWMzxYCodedYcjMF/c0H3es67h56LSt3Eo0+CQ9J4c4p4?=
 =?us-ascii?Q?byYGjYLQo7Mj6gwCVWmRU17Tx2ZdduzQd7IAV39BAm01KdC59A69rr404YTq?=
 =?us-ascii?Q?uhrqDhlJwdqFYzOiDeoH0IIu10Qd3fbrBb/3i5yFfAwPEJ5UT4TviXxNZA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 06:59:03.0476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca1896d6-c714-4bae-fabe-08ddd6490f29
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6483

Populate USB wake events for Tegra234 XUSB host controller.
These wake-up events are optional to maintain backward compatibility and
because the USB controller does not require them for normal operation.

Signed-off-by: Haotien Hsu <haotienh@nvidia.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
V1->V2
- Add the Acked-by tag to the commit message.
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

