Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010025.outbound.protection.outlook.com [52.101.46.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3682B3F99F4;
	Mon, 29 Jun 2026 09:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782725683; cv=fail; b=fOGRcv0FIWmgxY/trMZAT5H/o7F4jZe1lBKLJkV4wqS1gtIDiNxqxxqLltj9vkXIodfzjsWWni1Ejfxs6GVNjIfx9/2qpIoNu6rOU8tdWFG/IApg2zL/7tr28tS1jTm9RutpO+hYsi4OAKQn3aYKZbz+4LamwID/KuR1cevNmq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782725683; c=relaxed/simple;
	bh=RVVO2dr/NuIJ2jTAVYSTST4RvKgi4A9VwK9DZxrByYk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F5SgsJgdFM9CyHcNaJzW9Sc6ba82sXBQH5T9oKbKyLMuE/efbV637brOLb+CjGddyPXbWKiDYNnCBOeFAs9PRMt8nrclVgXHvsgbryjz9Qj+gvzAolii1JZXiJj3+f8nbMJtzSoFEHzQpgCzC1+A0+FJZTXcFyxQ1RA9aumZuK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TQ8h0WbJ; arc=fail smtp.client-ip=52.101.46.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TQ8h0WbJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1JzAwVTAmS6lYHueuYtNz1n1j5XLnZEx+JrmHaP4tMtC700ajmOmeHsb9vwyofFjtLt0BbvCozbABrNuBQx6vCgJifeJk0fsfPf/aVX3UMM+WxsN2F1OqciOQoy0l6OwaQMdwDK6FP2YP9WVvPFX+0ZZn+/Bkucc9RTZ5UHSYeHedj0yoS0IaD+JOpcylHxXeVF7BXLxUaGePYqdPP1eMZWq/NShh6KcT4PaswDBhJ80pnn37kFzdqF8LClBtODI+UwsES1mq9HEeO7aSPUZlDQjXk+Jz1p5NCYjybbaqBdPAe97pxJQw6uNJMWAi6GdLPwlw2enYHmUHzPkgLoKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXJXvUBiahU3ZiKJHWiy7fWGdr43fF0gXJfprMZPz9A=;
 b=dfOosmFl1chExTrocXuqxzYY10lV2fdn93XpmVuA5N7KJSh4JAxPFYjIwifC1my7HYznYI9zq+45IvnMwOke8rNAaHNyIa4pB4RhzYqsKgImKdf7YdA8NJ7WE39WSxlONrjaFf7Bs62MvaqDYvjD5FNKZF9MCLWcV3xoRhil5sYWotOW26UUBEZDLAvgywhAu9cdHiSeEDGMFq0aPFODBT14/c9MeLEYQH11mpVSyIsC5bbczbhj7nczzyoXRvM1DjLq0bxfYdM+XCq5aYHFJ4X31LWUzluPuDVti+7B+t1N55OLKkdxPY8yPC8kQyjI3Rwy4JJL827KaTnfXScEBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXJXvUBiahU3ZiKJHWiy7fWGdr43fF0gXJfprMZPz9A=;
 b=TQ8h0WbJMkqNfYMcJm3852MQojLJIoxET536sAYa5H5c+pHRd3yQLlhF3LQAUqdVUOGkTxfJDZMhmGDEaotsNmZ+kwv3MVIvBKvlZH16jSbqAdnbYRyg/12fJR7oTFaHMBDjoCsuuy9n72DFg6KesLyYE3483RMRJmSGmwvWxMUX/C1cqxnWWtrC4wtIw095MxtX3XSqRY9w2VRMTakgMgso7j8lxsGzwVmBnzxTRtInpzBShqpkh2VdKpuQXaTRy0cx82pst7hlCKcYUPYPZ/bGVjzFLnmvpdPln88NLkIPBWX0WElAzaUXEIrevvZ72bb+sxuZjRjtmsR3IgiK6w==
Received: from MN0PR05CA0007.namprd05.prod.outlook.com (2603:10b6:208:52c::9)
 by CH8PR12MB999204.namprd12.prod.outlook.com (2603:10b6:610:35a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 09:34:37 +0000
Received: from BL6PEPF0001AB57.namprd02.prod.outlook.com
 (2603:10b6:208:52c:cafe::7b) by MN0PR05CA0007.outlook.office365.com
 (2603:10b6:208:52c::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Mon, 29
 Jun 2026 09:34:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL6PEPF0001AB57.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 09:34:37 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 29 Jun
 2026 02:34:29 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 29 Jun 2026 02:34:29 -0700
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 29 Jun 2026 02:34:26 -0700
From: Wayne Chang <waynec@nvidia.com>
To: <mathias.nyman@intel.com>, <vkoul@kernel.org>,
	<neil.armstrong@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <gregkh@linuxfoundation.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <waynec@nvidia.com>, <linux-usb@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 2/8] dt-bindings: usb: Add Tegra264 XUSB host support
Date: Mon, 29 Jun 2026 17:34:00 +0800
Message-ID: <20260629093406.1118594-3-waynec@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB57:EE_|CH8PR12MB999204:EE_
X-MS-Office365-Filtering-Correlation-Id: 82c3c910-f017-43fa-51a9-08ded5c1a31f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|36860700016|82310400026|3023799007|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	+p+F5TJzqiuAz5uQowm/qiEkAtUhSYHtH58EfBovW6uNBJLzm8AeyVXXtwD5SeKgt8JOnyvhJuBv/QRRlN3I7ek/JxhJwXBK21zekkgO29Gf855LUpZcNgmcLC2AKsRzms9O9Vaex/vdEgvTIF5tOBHNTbw9JukwFmLPZxudAM6XZfapxsFnGr1RxtWsqeccTKi5lueglFvaNK2AQX2uAnlb4vglmh4JZky0KYY0qfXygpgs5fWEdbDUan2rlGY8ZHJEcKNqzUPaYU3CSgiDtIe0sUkqb98IeSov1U6c+ZQQkpUavrwb2ypHnVfwRmLwHXPjD6IJH5FPzITDdPsQbPnOJPpwiXrrMxm8XynZSH/gl36NPVuJ2MZbSZ3tJ8l23YVS46IauRMemo/QYTmfnQCRkboTtGGxwsgSl+n8z6NHKwhLs+EbZ2R96sc8EPDXD9rB1NjMhQWw6I9Oa+A5xbcKx5jDuYOvDY1m3lG5dBy+g85xSOyg+5ga5HwrYmIM6OnhZJL3F6fP/7kbqGZCJ0IO+lD0QRKXETw93H6bMaQ+rrGs8MhqmmQ0SFvRGyUQy3hxHg23PDb1zzxVHPd+VIkEdkCaGpMqpUGeJUyKSVd8s9XsdjUpaO3Eh9BUH+nfVcsHnYkAwiENIRnFeUQcagmU4m5yrWkkF/FESoG3wqtf1EfvQkWpKHmbH53SiscmATSC+9iuoz2NmARvjMw9jQ==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(36860700016)(82310400026)(3023799007)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XsOPDb8s8JqvKC9mCFB/suVRJdomr2yElVYu7ZmmqqeMcmQ5qn6hh/bycMKDIqhGo2N4/GgWCZGN25DKXebEWukCGZeS3a/KlxCPOK5qpBBfQeM3ctx9AlU8enbwm8KvjK9eFnl3MpZoIVr6N0/72yT34wN04NFd9Y2U+bVUFIpzRRzh9svvuDx7M74O1TbpNwHSvXmnCdUdPKDsgx0ziUE11/H22nIw7wjfC2KEw3+BHRD8DUgwLAOgrZDHNH/pjL/0vax1F1Qb/iPXRo/nvm13775InxNotbIoEmy6G0u8b3sPO5J/y13tWZDC36mDlmdzkVtBo6eitlqQhrzEAtqqDebApTZsMwXOiff+BrJp8XhTbZTnV6BHttEqLl/DaXSSQKahTQLMPoeOuN5I8ixiRVcQe4V1T64dL0CMzOT1Kd3UZ3Qd5ItVu5Am2SSi
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 09:34:37.3285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c3c910-f017-43fa-51a9-08ded5c1a31f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB57.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB999204

Extend the Tegra234 XUSB host binding to cover Tegra264:

- Add nvidia,tegra264-xusb compatible string
- Document optional USB wake interrupts for Tegra264
- Document Tegra264 PMC wake event to port mapping
- Allow up to five IOMMU specifiers for the additional XUSB host
  stream IDs

Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
 .../bindings/usb/nvidia,tegra234-xusb.yaml    | 115 ++++++++++++------
 1 file changed, 80 insertions(+), 35 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
index ec0993497fbb..94b1dbe2b02f 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
@@ -17,7 +17,9 @@ description: |
 
 properties:
   compatible:
-    const: nvidia,tegra234-xusb
+    enum:
+      - nvidia,tegra234-xusb
+      - nvidia,tegra264-xusb
 
   reg:
     items:
@@ -31,37 +33,6 @@ properties:
       - const: fpci
       - const: bar2
 
-  interrupts:
-    minItems: 2
-    items:
-      - description: xHCI host interrupt
-      - description: mailbox interrupt
-      - description: USB wake event 0
-      - description: USB wake event 1
-      - description: USB wake event 2
-      - description: USB wake event 3
-      - description: USB wake event 4
-      - description: USB wake event 5
-      - description: USB wake event 6
-    description: |
-      The first two interrupts are required for the USB host controller. The
-      remaining USB wake event interrupts are optional. Each USB wake event is
-      independent; it is not necessary to use all of these events on a
-      platform. The USB host controller can function even if no wake-up events
-      are defined. The USB wake event interrupts are handled by the Tegra PMC;
-      hence, the interrupt controller for these is the PMC and the interrupt
-      IDs correspond to the PMC wake event IDs. A complete list of wake event
-      IDs is provided below, and this information is also present in the Tegra
-      TRM document.
-
-        PMC wake-up 76 for USB3 port 0 wakeup
-        PMC wake-up 77 for USB3 port 1 wakeup
-        PMC wake-up 78 for USB3 port 2 and port 3 wakeup
-        PMC wake-up 79 for USB2 port 0 wakeup
-        PMC wake-up 80 for USB2 port 1 wakeup
-        PMC wake-up 81 for USB2 port 2 wakeup
-        PMC wake-up 82 for USB2 port 3 wakeup
-
   clocks:
     items:
       - description: XUSB host clock
@@ -96,9 +67,6 @@ properties:
       - const: dma-mem # read
       - const: write
 
-  iommus:
-    maxItems: 1
-
   nvidia,xusb-padctl:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: phandle to the XUSB pad controller that is used to configure
@@ -137,6 +105,83 @@ properties:
 allOf:
   - $ref: usb-xhci.yaml
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra234-xusb
+    then:
+      properties:
+        interrupts:
+          minItems: 2
+          description: |
+            The first two interrupts are required for the USB host controller.
+            The remaining USB wake event interrupts are optional. Each USB wake
+            event is independent; it is not necessary to use all of these events
+            on a platform. The USB host controller can function even if no
+            wake-up events are defined. The USB wake event interrupts are
+            handled by the Tegra PMC; hence, the interrupt controller for these
+            is the PMC and the interrupt IDs correspond to the PMC wake event
+            IDs.
+
+            PMC wake-up 76 for USB3 port 0 wakeup
+            PMC wake-up 77 for USB3 port 1 wakeup
+            PMC wake-up 78 for USB3 port 2 and port 3 wakeup
+            PMC wake-up 79 for USB2 port 0 wakeup
+            PMC wake-up 80 for USB2 port 1 wakeup
+            PMC wake-up 81 for USB2 port 2 wakeup
+            PMC wake-up 82 for USB2 port 3 wakeup
+          items:
+            - description: xHCI host interrupt
+            - description: mailbox interrupt
+            - description: USB wake event 0
+            - description: USB wake event 1
+            - description: USB wake event 2
+            - description: USB wake event 3
+            - description: USB wake event 4
+            - description: USB wake event 5
+            - description: USB wake event 6
+        iommus:
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra264-xusb
+    then:
+      properties:
+        interrupts:
+          minItems: 2
+          description: |
+            Same as Tegra234, with one additional optional USB wake event
+            interrupt. USB3 port 2 and port 3 each have a dedicated wake event
+            interrupt on Tegra264.
+
+            PMC wake-up 79 for USB3 port 0 wakeup
+            PMC wake-up 80 for USB3 port 1 wakeup
+            PMC wake-up 81 for USB3 port 2 wakeup
+            PMC wake-up 82 for USB3 port 3 wakeup
+            PMC wake-up 83 for USB2 port 0 wakeup
+            PMC wake-up 84 for USB2 port 1 wakeup
+            PMC wake-up 85 for USB2 port 2 wakeup
+            PMC wake-up 86 for USB2 port 3 wakeup
+          items:
+            - description: xHCI host interrupt
+            - description: mailbox interrupt
+            - description: USB wake event 0
+            - description: USB wake event 1
+            - description: USB wake event 2
+            - description: USB wake event 3
+            - description: USB wake event 4
+            - description: USB wake event 5
+            - description: USB wake event 6
+            - description: USB wake event 7
+        iommus:
+          maxItems: 5
+
 unevaluatedProperties: false
 
 examples:
-- 
2.25.1

