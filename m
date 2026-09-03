Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011066.outbound.protection.outlook.com [52.101.52.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA993DF001;
	Thu,  3 Sep 2026 07:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421575; cv=fail; b=YhHrDxLaZ2fF/mjHQ5HG03rx3wFOenCa6vOAc3J76v9PwwJ04uVIDVoFSWpLEtpnsShG5YVJWtdiEY0ofchoguIHvX7H/bZXAx49G1iCobfOrXYMKqUYijaTMEK6Y7RPRg4kSMzBUt4Z+QhUb7CwZbVQrN1eTldGLUzPsUw7ohM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421575; c=relaxed/simple;
	bh=AEgKviVNss4jej0L8RXsi5M17Bq1acRuDbnC3Idg/v8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pSqQLgU7wxf2g9YLTbCCg0ORCecfdsTSnwVExr4mNCCuas38KypalwPkz3ZqhBSGH2pr6CsrNV+PewtXwv6BbLgqqE7Jg2zwLzDA/3O8qe0uhUMxvkN9+m+0l550lmBSV2OsenMOvLguI9xyYgIVML0Me/UwDwFXWSzuW6lWbzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LU+Cx6Kj; arc=fail smtp.client-ip=52.101.52.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LU+Cx6Kj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IGdG/H64gmg7uz7+oJFrHpb1ssQTquKoHR4mQ11DUvklvLYuWXs0ZagXVhxs082YjxzvVPzUg2adPHK+n3s2TBdzC1u6lKdlvw4Qe2iZs44IYxjs+GcGFcF0hR4BbvJ3e3QL8Q0XWOUifyPaKNC/grldXDg4T85+JL32FcD6Y2FB8BBS2EOuLsJqMbWFJlRVuVzPt1eEHs9BF+2tq54XaQ6k9rKuNhreJzTCXSDeySdDcUhoIT1p5IuV6rTgetFyBZrjitphVnf/04cN0IUc0qon8PrznNh+zAHVd5qQ2sQcjaqwIlQJTMllar+kqJb54wPFpU0waW6vESnv9mcv+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwZ9/5/7JsyBCb0Y5L2vyRQ4MABtX7VsdTxn8qAT3BE=;
 b=lohgYELckNQdYCyj4FaPWWyz8AprKUFJBV8VUJhA3IX0WNNxUVKt7bV1fdG1B0aAhdpAJ245LDX4eOXIMoew8TKQeAlrLk0nF+tcB0rfwf5bOtzNB5sqYRyHQY4c1zE0zwqU8OwyeMKazsHaGBUBePfbJhLyK0COj/Ee+XfYCr/M8NyrpTZvHcygk3RwCipFWQh4z9FVcgtLYSNuFhSGyMQIZTegyvxIbA123GTiVjxBNZgJU7qzyeA/yMZpTza/+1ncb22GBVjhhmI2ER3eXhhUmJoCF23k3CeiJAuJP212j4sflJdtBGbI+8UoUpedFvQ2clPlSmADu5nb4OHDfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwZ9/5/7JsyBCb0Y5L2vyRQ4MABtX7VsdTxn8qAT3BE=;
 b=LU+Cx6Kj18FZ7zq3C2WKL57WKcEL7OrGeCssQH39R3XnADEoxw5iA44syTvsXjVhbYt3JpPp7TTc/aiVjSelh7Hy93xqQo5yChNZx1IF7QnonfNaNVGAm0OZiVNh55HphaSc9anrJY4JFNx5t96zKeD199aZJe5P2DCpvsCiAaZavEq57wtNu7ddauqBzP5iRQSnOzJj11eIhG4D+RvzGdtRZLco52sBlPUgWL3jTAMm2tac6taSPrg2mnB7mZKixOvItMyN0hpv36xO4Y/BjMSPkbVlRkU+JvLHMiTF05DM8qPF8THZKY5Xl+71nidcDKxaTrxY55xpEbcKRvUHWQ==
Received: from CH0PR13CA0037.namprd13.prod.outlook.com (2603:10b6:610:b2::12)
 by MN0PR12MB5955.namprd12.prod.outlook.com (2603:10b6:208:37e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 07:46:07 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::a1) by CH0PR13CA0037.outlook.office365.com
 (2603:10b6:610:b2::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 07:46:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 07:46:07 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 00:45:49 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 00:45:48 -0700
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.46 via
 Frontend Transport; Thu, 3 Sep 2026 00:45:46 -0700
From: Wayne Chang <waynec@nvidia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman
	<mathias.nyman@intel.com>, Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Wayne Chang
	<waynec@nvidia.com>
Subject: [PATCH V3 1/3] dt-bindings: usb: Add Tegra264 XUSB host support
Date: Thu, 3 Sep 2026 15:45:37 +0800
Message-ID: <20260903074539.613220-2-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260903074539.613220-1-waynec@nvidia.com>
References: <20260903074539.613220-1-waynec@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|MN0PR12MB5955:EE_
X-MS-Office365-Filtering-Correlation-Id: c6c50a38-2b5a-4db5-f8ec-08df098f69f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|82310400026|36860700016|6133799003|56012099006|10067099003|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7tuesdUAC4rLeIpMrJHYEEemCr9YqGJultLoa7DySBl+2R96QNGj0tfwvIOyxz112tCDZ50NaszkLp1yhGjVNIjm93lMGy7QE2NVU8WRgruKL5ww86IAKoDuY9THTlB9YvDJRvaKXRMp75lkovOo8IcfjQsfY396Hs/5WmPfuk5BOXCxDmjdt2dDgq0l3v+zKvrXzi16hqcR8M9eWhgOWJJqFX4R1/3ZUFRa6fUdhHSSxmAL+0GNgfy4/vEenZTDKb57gkptzTyIV+tAAtTnVv897+AQskBTYbCG7k4T8JOLGzt+MDLSKN7q86WF5c9EzEcbzPEBiAqq0a9ANZnP/ffH1mh4bg55W9hMuYfhdymz5AbExFqftI+5hl9/2Yg1xusuKSwX9pA77Pin88dA+kusycMYkuVHvjIGbllLXU0BZmmcLRdQw584tPCESBglL7xNgnpR8L27rFEMfN6GAzB9CB4pBxmfWtYN38UlPtxt2I1AX6Fx35/FC2v5YJ6IpJ6ReC5nfoXsW6knL9B20LKeUeDwBntUkTRcpQGHnqKT0NZHSvM9oGBLIbEqZcLG41cNJWGKoq3DvV6JoB/mkgzEL20C9Ldk3yrS6usJ3HBCXJ3leVudVx0JAoMXJvpk6NgC9O/L5F//2bKG7W3SRaBZzIiTYFj5n9WCRhOHkMdcOFk+rUrH6BNFl6gMVPxabHqe87WVNMvsy999jAmy4A==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(82310400026)(36860700016)(6133799003)(56012099006)(10067099003)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NYIqsJF9Rb6TgbLn0g9yhpkaL88eAqbheI81I0u5tKzLuxCWiMyw3eCjdOwGa8dILKy2yTLWr3QZ8Saa3KTQJy44sf0dpcC2BrmB4X1PAN3PFlekjhfQVZjmZ7U3auygUKiXsWYCWMdTcMUwt9VkTu2HzrEvN9CiOf8a+gYtrfW6xiGss+4llR5IQjsM3kVHkqNxC1bVAwX4KCOcFHOtAEZobKJt1O9PyyELEAkgyRIpPfryFd74+W2odoaATo8qkEQP8O8Y5FgFk7pxDofQ8Y2Z/Ckqg0Nc495pLqSlsHpWngfpRyMYt+ulCZD0dSX+L6sLVy6Lem1YPY/r/8l0+NCxgeIbMFqSI6aJ0pimSuZSKTxfNE7HBPkRqonrsxTscF3tB1b6kh6dcu8iKGYxSGZQz4Tipj/BYcNTyMlYyH3GrDErscjyd9TFr+gv3Rf8
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 07:46:07.1225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c50a38-2b5a-4db5-f8ec-08df098f69f7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5955

Extend the Tegra234 XUSB host binding to cover Tegra264:

- Add nvidia,tegra264-xusb compatible string
- Document optional USB wake interrupts for Tegra264
- Document Tegra264 PMC wake event to port mapping
- List the up to five IOMMU specifiers for the additional XUSB host
  stream IDs, since their order is now significant
- Constrain interrupts and iommus counts for both Tegra234 and
  Tegra264 via allOf conditionals, since each SoC wires up a fixed
  number of wake interrupts and stream IDs

Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
V2 -> V3: List the iommus entries instead of just bounding minItems/
maxItems, and clarify that entries 1-4 correspond to XHCI virtual
functions 1-4. Add an allOf conditional that also constrains Tegra264
to interrupts maxItems 10 and iommus minItems 5, instead of leaving
Tegra264 with the same flexible top-level bounds as Tegra234.

V1 -> V2: Property definitions are back at the top level with the widest
constraints, The allOf conditional only tightens Tegra234 to interrupts
maxItems 9 and iommus maxItems 1.

 .../bindings/usb/nvidia,tegra234-xusb.yaml    | 52 +++++++++++++++++++++---
 1 file changed, 47 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
index ec0993497fbb..71e01701ae2c 100644
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
@@ -43,6 +45,7 @@ properties:
       - description: USB wake event 4
       - description: USB wake event 5
       - description: USB wake event 6
+      - description: USB wake event 7
     description: |
       The first two interrupts are required for the USB host controller. The
       remaining USB wake event interrupts are optional. Each USB wake event is
@@ -50,10 +53,9 @@ properties:
       platform. The USB host controller can function even if no wake-up events
       are defined. The USB wake event interrupts are handled by the Tegra PMC;
       hence, the interrupt controller for these is the PMC and the interrupt
-      IDs correspond to the PMC wake event IDs. A complete list of wake event
-      IDs is provided below, and this information is also present in the Tegra
-      TRM document.
+      IDs correspond to the PMC wake event IDs.

+      Tegra234 PMC wake events:
         PMC wake-up 76 for USB3 port 0 wakeup
         PMC wake-up 77 for USB3 port 1 wakeup
         PMC wake-up 78 for USB3 port 2 and port 3 wakeup
@@ -62,6 +64,16 @@ properties:
         PMC wake-up 81 for USB2 port 2 wakeup
         PMC wake-up 82 for USB2 port 3 wakeup

+      Tegra264 PMC wake events:
+        PMC wake-up 79 for USB3 port 0 wakeup
+        PMC wake-up 80 for USB3 port 1 wakeup
+        PMC wake-up 81 for USB3 port 2 wakeup
+        PMC wake-up 82 for USB3 port 3 wakeup
+        PMC wake-up 83 for USB2 port 0 wakeup
+        PMC wake-up 84 for USB2 port 1 wakeup
+        PMC wake-up 85 for USB2 port 2 wakeup
+        PMC wake-up 86 for USB2 port 3 wakeup
+
   clocks:
     items:
       - description: XUSB host clock
@@ -97,7 +109,13 @@ properties:
       - const: write

   iommus:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: XUSB host stream ID
+      - description: XUSB host stream ID for virtual function 1
+      - description: XUSB host stream ID for virtual function 2
+      - description: XUSB host stream ID for virtual function 3
+      - description: XUSB host stream ID for virtual function 4

   nvidia,xusb-padctl:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -137,6 +155,30 @@ properties:
 allOf:
   - $ref: usb-xhci.yaml

+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra234-xusb
+    then:
+      properties:
+        interrupts:
+          maxItems: 9
+        iommus:
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra264-xusb
+    then:
+      properties:
+        interrupts:
+          maxItems: 10
+        iommus:
+          minItems: 5
+
 unevaluatedProperties: false

 examples:
--
2.25.1

