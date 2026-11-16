Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794842705;
	b=06RbI9UGUyqdZpkuXKWAq37ipZLaYrfaVNC2xlB7Tlp3JAo/IDoqI9dcdqHw/nc2+63u
	 K4ArDY2CYn0vpT8Vy/Wg0uIa/rX2hAo7aLFneuum9jjppjob9kTu7uimmi1hhc7dz7x2D
	 KoEtDq+O40srbg2W0bVEtJr7CVtDKeo0TtwrvMQX57oYc9cNEb8Px402yJkBnUWOHjxnl
	 5Nv0+uIMyRruJA0TQG61tKFMoSfvEIsk3FtSliVce/T4TE46zMA42O94LHL/6N/L/c1B6
	 69qnezVHdrOVzfd/d0l2Fn+XyUhsLzqRdQRofOPo3jxab0LwyPxvxHIFsWUuZld7law==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842705;
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
	bh=oqvbwUh9di7BXDf+wgF2SpT7u4XvhvKKwMvoyia9aos=;
	b=IvFavX8KElHr6P/CSIsq/souP+yiAjdg55kxUcqnfEtvfjXTRbPVBV1nubTcGYeSvauh
	 7CFULQRTvcnGgV46qFT6ECaeVEMbCjpuJzXFWlxW136l+7uWgCGTvzlq27pSCRteYdeqO
	 3e+psZAUFnZrDwgOQX3+nsX7eAljHMv63r0Ru31hFJItq+uRUdJFusb1Y2QjpM536MCy0
	 r8dpan4WukLhRo0s3sqIQi8QdD4gwxHZvA7ENHmOieyQjKW1o8xB27JzDskXZjeEmWEsL
	 m4w0nN828fj7l28386rPSrguDgLH8hi0oR6niEEKir7/ZmJFM5cCScUsfEBtIzGej/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Fr+4vO89;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.62
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012062.outbound.protection.outlook.com [52.101.53.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E75B606A33B;
	Mon, 16 Nov 2026 15:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E75B606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Fr+4vO89
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bRe4DGiDU5oreDMNp6L16SGhvDWuIEpdkBUCVWd2JxneD+u+dpoaZ2MMUd+Jcy7cuI/WryqgE3Ya2zIMPmwDKY36BnsTYSeg7JFOmPW9N50+/UoyeHX0iKQfF6k2oizHlq5f4mynktPYxykfYDI7TjDVwi/DS/gXBghkaTkD1EJMMkKIHClnalpl5U+O3N2vPno13r51NXCA7qlTni4H4SSXUT95EJ7KRvgGCBuC53PvMginN1FbLbjZUfd22uxx3kN6+rfOyV2mukKOme0FdVIT0sTx7P/oBvfrDcqzh8eqyQ6yJYhi/S99DG7Y8gvWVu1uT8NkxPkx5vijwpvbFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqvbwUh9di7BXDf+wgF2SpT7u4XvhvKKwMvoyia9aos=;
 b=XisFXXg6tpE8dkKFQYD1Mmi6DZJ2i/Ihyub044fb1JPFVaPzNTCJ/H1R4xX0t8RbPBoouvDWFs4fnihaEQVzKLYNInifP2RODX8w9I6nahREJm2jxDctbTYLLw1Wn0if/9aogJyJjbuzIm36ovC4KRSaxcAaimW0Ek8NG5ENjZySTsBwHwIEEA3BCh0SMTXCVBHtUg2+nfXjq4Gs8JywP4jHIzfFfwOzoVsD2UzQchgOy/NjxghbOzJNWBO9GswLKce4dVZlO+04aLe5/dkOela6o8yVWQDtJcKaFt5ekRC3Q9FNMFkzYVKytrwDxjVQu1zvIqozoZG0nsbWv20wyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqvbwUh9di7BXDf+wgF2SpT7u4XvhvKKwMvoyia9aos=;
 b=Fr+4vO89skQaPwKsw1157KLjc+byXKx1sWx9XVPN8Nuam+p2wsGc6mcD4gQhxj9TSrrD5IGTttlx5Y9OhqcSAufiXRykHri2z8HFAhcRzoO/Dajh2f5yBxAoZ8Ffx/SnlhZ2qtXVl8Kx/3Y8cAA6IZ07NSsQHYkw7vItav0xrc4DwBJnLrx6lBCcxDH4D4azIB7xS6InP0cCW5DpYLjDdDiDH+4pjgWmR7kh2HGY69ZHRsnV7T+Xs0Q03w99mdrw/o5+SLJpxszkwjSge6HAqylO5UiS8ksoZMTdYHB2+IaUQto7y6GNQzGmZyXi0CWsfc7zr4DZEkWMdABEKJ/wWg==
Received: from MW4PR03CA0344.namprd03.prod.outlook.com (2603:10b6:303:dc::19)
 by SA1PR12MB8859.namprd12.prod.outlook.com (2603:10b6:806:37c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 15:24:38 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:303:dc:cafe::39) by MW4PR03CA0344.outlook.office365.com
 (2603:10b6:303:dc::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 15:24:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 15:24:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 07:24:13 -0800
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 07:24:10 -0800
From: Jon Hunter <jonathanh@nvidia.com>
Date: Mon, 16 Nov 2026 15:23:59 +0000
Subject: [PATCH v2 02/12] dt-bindings: usb: Add Tegra238 XUSB host
 controller support
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
Message-ID: <20261116-tegra-usb-v2-2-42efc03a9700@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|SA1PR12MB8859:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e025fb9-632f-4498-59db-08df43f5ba03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|23010399003|22082099003|18002099003|261009223027099003|11063799006|56012099006|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261022105027099003|261021123027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	nCztQ10yejUhf6yvY2YsSRTX+F3W82qtI0Zl7gPI5OpoRuUHtFtLTYIzoP8mNNnicgk8lQFE2sluCs85oqaO7N1A3cM/CHAsOcp2+c4BD67HBttdjIQv8k02QczF/ru16ic59IINDwlZKCq+UE/uxtPuG4xOKZiuIpys28BCoeIetshxOq7r0bUJJGDFhHfGHeEcruO+GxNVTDlTXamHG7/xlh+4CmlBfN83VE2uYUNJmtm+5aOtFSqH662zRr61MSWGujV6vwl7MRqnCx1Mfy3AeUk1/lsqG9T2MYNwMf9Gip1TQb92xekxV8pBWvQxPwtv3OB8AC1/XDPZTWPKWR2iMg/sA++/UBw5EEVTooLW/ds6jwf2J4XyXbenZr+1rC/1i9FZqfK1FpLbJbsXZYH+VLLEnEcGObsaWpA6IKPRcT9a2ei1k0WiLe9yZzP8Ss+YxkqAQiSw4kdsrTHuqklc18Dw87ZKLyuczfo+UpjJC9l+zO9gnkdRjppLTwr/2FGd7UaiD9j+abZlqT4HTJT9NDQzZ4fFQtzOL7BDQpTJxqy3CyMnegbBbna5oamHCBEfXkcAwSkeZuAiwpaxF0eLRzI1753JecBpCtQ9FXv/vwnSM4e3bHOcF8aIqqRUsMIWy8VbdF7/iPl11h921+0T8BoDQJxQxiC5M9qILswQ1bYqxR2vi6CtEcmwKICxtVmBdeFmyzhCdX8fZZJKRQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(23010399003)(22082099003)(18002099003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261022105027099003)(261021123027099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hkDKMb49WQz6XhuMrCTbtF+Khx1po7ffFt/vA4CkctGN0oI1XHoHQwFi+F6mCmtp/CA4KBTscRni03P4jVc3GOudothavjmOkMx6G3NqMAQGUHF5rg/x4Y2LCrAssZ2zhc4KRqBGGvHcRl7liWFKgZbAi0xnqg+UUrwvgKaXyZryf9it8PFftozLPe8mnhywqSGT/ni6F14YNggmHsmnc7GOFNUyMPsKf9efbp4vXTkr08ffZKaAVgmBFBQF6YvW0dcBOLZrNj1PGZEx6ZrMZGqZuXwiLxXfEc2L5reVQscA5zi9TDPuqJgPHdXe/prA+u8aVav6j/rcUCxoYCrYcUd7N51mAsFfUYPjocmEqrl5eRx5Rgg2ReW5FgcihFR2oskY0SEG/q3t1q7F8Yb6iG+9GF5oUS6nHtMatzkiUYA/GvtNxQylSwqHusHiEAKW
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 15:24:37.6431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e025fb9-632f-4498-59db-08df43f5ba03
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8859

Add a compatible string for the Tegra238 XUSB host controller. The
Tegra238 XUSB host controller is similar to that found on the Tegra234
device but only supports up to 3 USB2 and 3 USB3 PHYs compared to the 4
USB2 and 4 USB3 PHYs on the Tegra234. Hence, the binding is also updated
to limit the number of PHYs and interrupts that can be specified for the
Tegra238 device. Note that for Tegra238 there are 8 interrupts supported
in total; 2 for the host controller and then 1 for each PHY.

Unlike the other supported SoCs, Tegra238 controls the XHCI resets
directly instead of using power domains. Describe and require the host
and SuperSpeed resets for Tegra238, and keep power domains required for
the other SoCs.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../bindings/usb/nvidia,tegra234-xusb.yaml         | 48 +++++++++++++++++++++-
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
index 4e4d7fc352f1..989cce0bb52c 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
@@ -19,6 +19,7 @@ properties:
   compatible:
     enum:
       - nvidia,tegra234-xusb
+      - nvidia,tegra238-xusb
       - nvidia,tegra264-xusb
 
   reg:
@@ -140,6 +141,16 @@ properties:
         - usb3-2
         - usb3-3
 
+  resets:
+    items:
+      - description: XUSB host controller reset
+      - description: XUSB SuperSpeed reset
+
+  reset-names:
+    items:
+      - const: xusb_host
+      - const: xusb_ss
+
   power-domains:
     items:
       - description: XUSBC power domain (for Host and USB 2.0)
@@ -162,11 +173,44 @@ required:
   - nvidia,xusb-padctl
   - phys
   - phy-names
-  - power-domains
-  - power-domain-names
 
 allOf:
   - $ref: usb-xhci.yaml
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra238-xusb
+    then:
+      properties:
+        interrupts:
+          maxItems: 8
+        iommus:
+          maxItems: 1
+        power-domains: false
+        power-domain-names: false
+        phys:
+          maxItems: 6
+        phy-names:
+          maxItems: 6
+          items:
+            enum:
+              - usb2-0
+              - usb2-1
+              - usb2-2
+              - usb3-0
+              - usb3-1
+              - usb3-2
+      required:
+        - resets
+        - reset-names
+    else:
+      properties:
+        resets: false
+        reset-names: false
+      required:
+        - power-domains
+        - power-domain-names
 
   - if:
       properties:

-- 
2.43.0

