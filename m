Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011009.outbound.protection.outlook.com [40.93.194.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF2A39B4BF;
	Mon, 31 Aug 2026 18:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788202770; cv=fail; b=d5ALhkP49poDTrlt+qqB1rU5J5sEIZaIPiz7HIDHyzRLA+aGUkOLsjA+PJVCudm09KtbG/pT4sNjF7EaeqyyBc9obDSevH58yrZ7O/saotnfruWtHoBsisWGYPmvqRSzDGoS1zJbP9TIrwTZ4cy89mQJzhriqZPoycKTaPwexZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788202770; c=relaxed/simple;
	bh=ipAYogVEihMVNyt/gLDNicBIOumLpDNeD4AMj9Ve7nM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SG8vdyhemcRa5ddJE51JiqnBYnmMP2qbHvt17yKZSaSZiX+lXgr3e6IUt/jKnQVIglhRk5UW/eRtVMvispQHjKI5oo9srBceI4YnSL9jPqA5efzvc1ZF1+6hEvsnsfWddEuXXgJ2KQWH9nDg/QNjI+ylroqIunQLPuLy3WkU/r4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=prfoVjMs; arc=fail smtp.client-ip=40.93.194.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="prfoVjMs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFY5IsXYUnFjSewd5B/0s6hmggf3D7RI+mXOcW94l6j9I8DjC5ONLimxBoD3WDSVzJPFWVfzcjSr94n9RjVN/NHkBf/EYWL/ejU023BNgwXt4T5KZ5lQ9bd+Eur3fTu1crbECCevNJG3rjxvODwrOPMuHjfTglYQMxlkYIk6g2wDqhSjdt7RNwXAMtnkbZDwZVqIqzWeGVT/1L5eH6BpzmkOXfyj2pUM8bw95hgqWJBbqqRvCNCmwzulc1/E4hJHSgtMg1KTTvQTPuLvOEz5oZMSW2dUxhBWFlR1WLn6IQpGgXb68hnRSrYuOGC2LmXEf60cH1NZM4TZNxD4NshrcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06zm/gQ6Mt/cfYuKFOD4hYEoAGGwDRCM6QCPXSGjmf4=;
 b=GcNVm3Dq7Ww/nDSMcrrvS0IYRo4buJkNnoQJ0nd5LWPnFFyH2WxkAG0gLXAWbxJszXLiRutFZvTBs4VDp+UzZXNZOWhf30P7ziSSnBVWDYBqHBVaFeEPJm3oqPaXBqMlaf0UHU2V3T792M7RnyA0SJSIiZBkbRvD8H6H4jzZr6r55q6xHTl7FbEUeGR3RDPheAJb9BnsiTJG48Iej8yy1WAIR3ZlP1dBjFjqwd4QW8NzJceYOJjppi/mMUqC/+65086yZcOqOxUwGXd3Stc/JIjNMogga7veMwlvuEHQhxzctckCSVy1bWfOOvhhEQIIzDl62mJoUHSeQEytNgvF9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06zm/gQ6Mt/cfYuKFOD4hYEoAGGwDRCM6QCPXSGjmf4=;
 b=prfoVjMs9e5FdkkpByV4gh7amCJe03H/aF7WaKEeF4JHB1H5942P3XMrc7wjT4fm+h6CW0qnlBRUju/zrlu9EeHfTy3I5ZLGTXM1TGQnxhyx4rS2DjC5YhF6GCQZETtutX9qQYcmgZ1oMTyZpUtf64D//xXb0AZCRA9PIvMK7zrg9s9ASpNK1/i/YGznJc16+qzOYhV5CkqKcGSJcu/Z6ftWqBip8wvI6KNdrDzCxpln7cQTbrzfpIwDgOstrBtx9GMkd26NNIjHrQ7MIU2Yi/pXkhbsd0pIt132K5n5y/o4mzRE/9wGe2vHN5FJRD/Z7gnXZKtXB0lBGlLyvfmjSA==
Received: from BN9PR03CA0474.namprd03.prod.outlook.com (2603:10b6:408:139::29)
 by MW6PR12MB7072.namprd12.prod.outlook.com (2603:10b6:303:238::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 18:59:20 +0000
Received: from BN6PEPF0000006F.namprd03.prod.outlook.com
 (2603:10b6:408:139:cafe::31) by BN9PR03CA0474.outlook.office365.com
 (2603:10b6:408:139::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 18:59:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN6PEPF0000006F.mail.protection.outlook.com (10.167.248.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 18:59:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 31 Aug
 2026 11:58:50 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 31 Aug
 2026 11:58:49 -0700
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.46 via
 Frontend Transport; Mon, 31 Aug 2026 11:58:46 -0700
From: Wayne Chang <waynec@nvidia.com>
To: <mathias.nyman@intel.com>, <vkoul@kernel.org>,
	<neil.armstrong@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <gregkh@linuxfoundation.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <waynec@nvidia.com>, <linux-usb@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH V2 2/8] dt-bindings: usb: Add Tegra264 XUSB host support
Date: Tue, 1 Sep 2026 02:58:29 +0800
Message-ID: <20260831185835.3732707-3-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260831185835.3732707-1-waynec@nvidia.com>
References: <20260831185835.3732707-1-waynec@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN6PEPF0000006F:EE_|MW6PR12MB7072:EE_
X-MS-Office365-Filtering-Correlation-Id: 932bc082-9910-4af8-c9d7-08df0791f63f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|7416014|376014|1800799024|56012099006|10067099003|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jI48JKd7Tx7tW26nXZNVdA0/H8XYgNuUjJVTAC0G4ApXnjkGN19UXwMN7wbT2KenXIXLGans2/kM74Xr5nvab0vJYWp2qGBtQ5/MUDQX04kjROXh7OJabqa+fUMfaRKZlMnt/caj0QxbCrG0WXF2RTcSaiZRmpKdDT/mJhcDV6Z+EQUERNL5KuWCHSe1MxZMnaV78kYgp51Lx8S4ahY7IStzkv37liEsr+IEBVCquZexs0ljUJNNrqCKZ8C/j8Xtl9NfmdNjqG5csD7WjRJcf1e/d+u+r0criAXXSst38NQJI9b0dXntqmOhGtD9K9tAJ/I3YGB6vWPfPRaI5wCLUMzZT0iuBjFsOyoUoTrNLb6TYesiFziWKmlHTml03AIDF/7yAhVgAiSeS1uowq7WysPXsI4XpYEG6To6mBSA5jCSso6XBrLgItEv7ZeMspPEyUkdZdnE/qTFBWIRfwgMpYUsBBxgt5tpWZTFxT03j5pnBuq2zn7XM2EvPJW4Qo8TuZuUCMF4Tf0oKFiHFR7gkn7aYiJhunysBKGJRwKzWl7xpJI2k1086LUqyLgIvS8vtjluR0QsMXpgMsluKCm2V0y4viadqxFR3fl684jImAAMF0zfm196TQjFxZPPz+XHiV+RQ8xK88f32B8/8WmEEnD/NhzY9SHXnMrYvZ0HpBQbN96RjhA8jcPQ1tWu8B0RwLeMs4c5mf9YvBhMTIDPDg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(7416014)(376014)(1800799024)(56012099006)(10067099003)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TLAR1jP//05siAZTuFqVTnLrxbmIGOVb+o0+SyQ4dAHtPW6Nm6sLQBY6T8KTvENSO0tj3blRb30uH2K82eb/R5ykZyy8EA5XwlAuGy2VooxUjo5iXR2AdJS540e7Ca7Bg5MiGE8aVhBpFDa/8if8jCqRGQZaKYiDhmTG0pVxMcxzJxGYdEUFKHtcw9a9SpM+Cl3+SK/0MmBvnZqzaRdpFVof+FF9foSBq19EZ5Hyhu5pNYgM4eVuQWK24PtJ9RpqTfoLjEXbrPcg3hMStg+VvwllYOwjZAL2Xpz3tlxs/rb8GiizhcDzEIwfuHMDa1i94ywf7ejcQOgK9XymZmEpV+bVP1dmiNxTV+fEwP0jgD/s4qNNb29O8qptAg6jB49tCuWVPZzYcFCQaZMPraRQGJiUtvhZKr+uAy7WUh+8UtXxFw9SoFVDTwmdvlF1Sn/e
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 18:59:19.0986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 932bc082-9910-4af8-c9d7-08df0791f63f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF0000006F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7072

Extend the Tegra234 XUSB host binding to cover Tegra264:

- Add nvidia,tegra264-xusb compatible string
- Document optional USB wake interrupts for Tegra264
- Document Tegra264 PMC wake event to port mapping
- Allow up to five IOMMU specifiers for the additional XUSB host
  stream IDs

Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
V1 -> V2: Property definitions are back at the top level with the widest
constraints, The allOf conditional only tightens Tegra234 to interrupts
maxItems 9 and iommus maxItems 1.

 .../bindings/usb/nvidia,tegra234-xusb.yaml    | 35 ++++++++++++++++---
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
index ec0993497fbb..d63f0db4224c 100644
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
@@ -97,7 +109,8 @@ properties:
       - const: write
 
   iommus:
-    maxItems: 1
+    minItems: 1
+    maxItems: 5
 
   nvidia,xusb-padctl:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -137,6 +150,18 @@ properties:
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
 unevaluatedProperties: false
 
 examples:
-- 
2.25.1

