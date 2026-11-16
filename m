Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794842688;
	b=2rZ+bY6dK1j7hRaBixkZ58/LNw+15DoIIqMdmYuvw86qvYjHTObAL6AB/2f4XB+M08Gv
	 3s5J2131ze6qZthEIMI4O7NT1cfmAwhBHcq8KU8XPKfkaVs/55kOm+ZGa80dzavYjbmNw
	 3y1l7rEflKVI+JtYXhBJbiRPquUtQ1bNbegmsFasD9qDouIWs9SuyAYtbK7d81x759HJS
	 zgaWZxJcsPzvxhjrUsCLS2LMpXssQzh0s6LK2KHuE+fzYyrFxVe8oE8enC3aRpkqdFXtv
	 siuh9xrcjnDXDYSQmyRqGNYgbeFdliuzDRWNOPHB+tzr19cpy+KqzcQP9ON0EktJmEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842688;
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
	bh=tkg/iriH4VyCjzl3E4XrGDL1O3Oh4nwt4zwd7WSjVUY=;
	b=l4KKWixvkAeM4362i2Qf2NlfT6G++nCfgqOQVcmbB9x8TcuCtMM3qNmutv+4sTlUfxTG
	 IQlbpWJBLFVAbrSjyVWIZv+WOzhH9d9fvHYU/lbBDvKSJbRBpCH6qoLqZ90NK/aoGyd96
	 bREFigbZNHR0gH076UNqB0KIfU8+f0uyJqCiwYgVi64Ny+Yb6g6OmLzyJ7vgKwWzrjZLg
	 VQS9lwJX5hIRNkXqgmJHeA8m8CqxO7UGq8ComdKDhP5O4L3/2AQOnPEML5i1U4mQ30Mem
	 gcHz+h8OSYubfNqUw4yIjCLO8HakAlK9A0dtb6NI66wg5tgoTpCniHXFGAhzs1SG93g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UhJoybuI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.45
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013045.outbound.protection.outlook.com [40.93.201.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B79F606A32C;
	Mon, 16 Nov 2026 15:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B79F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UhJoybuI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ajeP4IstOq74fIdheFpUSEHs4EBgowr6bVFME6eaAVyEIdbl4K/v415pUBXwR3GlFPNgRRxsMyJkUT0s/+v845Y4WLyfIE8nu+EI/Pilrj4+XVDpPbCMk7YpnN7a1fMF/rkW1nIvXh6bfSkioFUw2fIqAY7mBFMXULbvtfOgnSZzMsVOL+Y4lA1RSNNhUsMwsZOYWMI2QNJtbdv4jyjAYcx9KI88Ih4GCdcq1FAWMR+j39/qMb2FjooueUHtbeHqQT9YrSsjbCJ5K+/Ijh05huNSTN7d4K/KmjXfIhDtUB9bpPWejKGEsKz5toJcCqrcz58lMITo4GrTmO+lfte6qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tkg/iriH4VyCjzl3E4XrGDL1O3Oh4nwt4zwd7WSjVUY=;
 b=vOH1TiHDEMla5kA+EawvBLIdVx2B9MhgDRMNDS+WbTrlzaWBFWtz2Ukci+53n/lFoXw/j/j6p4oOnUYXRDZ89h5KO5NkvcqaeVzQRZhk4FgF/Y4i9pCTtTCqvTWr/TDdyHYkUkHLgbNno+qVhMtlOoe+0n4Wm4rDeeG989aK9MpFWMcE4dZ4XtdVluxYQFznmGUoVm4N+R17IDpRt9nSOQOn9MNTcjvyCFnu9Z/xEVY6Lj8Y9vi/k/lWwa/ob6Th5b+vyHn3312aRNdT6HiZ/CcA7JvZS7652SXPVckQQWQjrW4BBBvVk68/YIdFMgZogCLfcVAELH+KFkOvaKtiAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkg/iriH4VyCjzl3E4XrGDL1O3Oh4nwt4zwd7WSjVUY=;
 b=UhJoybuIs0+PWA6MNB9qqI/8WWYaMkViGBto+f0/UBhrxKSyMXZWPWCbbzpgqYQ2cRnkelf208PPAW7O2RmM6u4Mj+JZ0ET/7Bff7rZyRBA8QICHoLc+9plhE29e7zZFng608ofvKy6e6vuh6slCR/EQ3xZjeUTWDwZlveeeHEkvdXPY/OnNP1uSciZP8F1FJkZrNbCGhXMS0NOCVYTQmhsDf+adn71iGj5NO6jrdlihf6mNYBZuOQvsXza58QZxFk7IkFwX7on0jlH+WLcho7nxkf6g6y2QPbblCfu1Wasq64MpzQsyBFQwqEPmFzS6c275nVfhELwUsX2NIOGDAg==
Received: from MW4PR03CA0339.namprd03.prod.outlook.com (2603:10b6:303:dc::14)
 by PH7PR12MB6694.namprd12.prod.outlook.com (2603:10b6:510:1b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 15:24:41 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:303:dc:cafe::a6) by MW4PR03CA0339.outlook.office365.com
 (2603:10b6:303:dc::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 15:24:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 15:24:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 07:24:16 -0800
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 07:24:13 -0800
From: Jon Hunter <jonathanh@nvidia.com>
Date: Mon, 16 Nov 2026 15:24:00 +0000
Subject: [PATCH v2 03/12] dt-bindings: usb: tegra-xudc: Add Tegra238 XUDC
 support
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
Message-ID: <20261116-tegra-usb-v2-3-42efc03a9700@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|PH7PR12MB6694:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d00873c-dc60-43ff-fc8c-08df43f5bbe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|23010399003|18002099003|22082099003|261009223027099003|56012099006|11063799006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	h6Ntbo2aTd6/5KhSDXUj0LFPxiRDLG9DruExZ9rk53NnfMlPqAQxwL24WCOOa1WnlMi3cKG/lzGpvRsqi/QcAa/XucR4fxr0YXL4EHN4EwmnFLAKbSat8IeUZQfvGqhO23A8sbIIwk3t2Ii+ixHti0Stfd7X//YvpAgrX4MWP6M6fVV3dG84WG1g8uEJn6bMIfHz/c8Frg0VAHcUPigxFQPKME8CCBKWKzpJphhbBuT29pkTzd+YVbevxs8Dk5neC0ufN4jYnGrMre+VALhwLWfVerjX7EFD6uX9WC7ESONWS4uf9hFV6kmgS8mG9lOYRN8qEdoYfLoSbqdo8fhtvJrysg802u5swMFMo51Dlqudm7R9XwU2obRx+2xNwK89U4lp3K8RajjA1tkDO+L5/CiWJyGrdPi5k1t9u3z8LiZiGKnWTXnYJSBCeepBFJ3pIos4ZOtXUyThJ4zKiLHjn2oY3md1RY8aKXuKl44IVl/0bUtdGI2eATdWLqG/tBqLjGPYGQQGQkWPXYIX8zyYlicAOilY/KD2Rg7Lg+ZU7OwRBiQmiduVMbsmYQet+zqUQIYuPgl4EMvo5uLRiTa44wUf/6Ys0dMrzYxdx0oXiP2E8nJcL3ZSrJJ+iP428m0gebFl6FpMlRyDO6FLkWkyxdSe3KvyXe3BEl76O/D4ddtLFN3Z5DU8lwZNrPoo+TCvthp4qR/8N1KYaSwYQ1An8g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(23010399003)(18002099003)(22082099003)(261009223027099003)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QZsclcts3fbKSgNifoSFm4JR+bPeeug7qygyrFtihVQDG4fcGGGaiJWzfv44qYlCrlzsF07BUHfY+sr9NtpYsRQZUJq+OL8VEFfh1PUWfc9jB5lA+s6NTtuJYkG+o0HHbQcGY4ck2iWBxN6qJFpS3gIgePfLu56GCuyJtxfdORrcs7hft1wcBKOkh/6v3/sKNVxf5b4vTcPlK2xDYa8NCCqMFt5659tmCoZh+E4HB461Dt6oNtkMFRlG8+D9ksFO2auml/+l8mQhmjKAv/SBnw8pPLvY1gizL7i56noLeGaybglOahldL9SoO7s3Su2XN45Kf8NNAXVgInrTxfqPZbNkS2NYx6H42Hc3kePgIwhPeQC9lqQTrftfkDk4+BzEAeX5V5M/BcsEcdXrl0re7tRAN/k1oYVwdGKhhv5KEDjkQIzOxZshNG5o6qKC62q4
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 15:24:40.8251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d00873c-dc60-43ff-fc8c-08df43f5bbe9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6694

Add a compatible string for the Tegra238 XUDC device. The Tegra238 XUDC
is similar to that found on the Tegra234 device but only supports 3 USB2
and 3 USB3 PHYs compared to the 4 USB2 and 4 USB3 PHYs on the Tegra234.
The XUDC binding only defines which of the available PHYs is used by the
XUDC controller and the Tegra XUSB pad controller binding [0] defines
the PHYs that are available.

Unlike the other supported SoCs, Tegra238 controls the XUDC resets
directly instead of using power domains. Describe and require the
device and SuperSpeed resets for Tegra238, and keep power domains
required for the other SoCs.

[0] Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml | 35 ++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
index c6e661e8915c..99a6322eaceb 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
@@ -23,6 +23,7 @@ properties:
           - nvidia,tegra186-xudc # For Tegra186
           - nvidia,tegra194-xudc # For Tegra194
           - nvidia,tegra234-xudc # For Tegra234
+          - nvidia,tegra238-xudc # For Tegra238
 
   reg:
     minItems: 2
@@ -73,6 +74,16 @@ properties:
   iommus:
     maxItems: 1
 
+  resets:
+    items:
+      - description: XUSB device controller reset
+      - description: XUSB SuperSpeed reset
+
+  reset-names:
+    items:
+      - const: xusb_dev
+      - const: xusb_ss
+
   power-domains:
     items:
       - description: XUSBB(device) power-domain
@@ -117,13 +128,31 @@ required:
   - interrupts
   - clocks
   - clock-names
-  - power-domains
-  - power-domain-names
   - nvidia,xusb-padctl
   - phys
   - phy-names
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra238-xudc
+    then:
+      properties:
+        power-domains: false
+        power-domain-names: false
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
+
   - if:
       properties:
         compatible:
@@ -152,6 +181,7 @@ allOf:
               - nvidia,tegra186-xudc
               - nvidia,tegra194-xudc
               - nvidia,tegra234-xudc
+              - nvidia,tegra238-xudc
     then:
       properties:
         reg:
@@ -170,6 +200,7 @@ allOf:
             enum:
               - nvidia,tegra194-xudc
               - nvidia,tegra234-xudc
+              - nvidia,tegra238-xudc
     then:
       required:
         - dma-coherent

-- 
2.43.0

