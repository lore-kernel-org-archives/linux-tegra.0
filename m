Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBE61DDC1B;
	Mon, 11 Aug 2025 07:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754898460; cv=fail; b=LTxC2mVo4LawkVm+BwrLIlut7nkO4q/UzclK/wzBoYryqCzjNxQRPdyrQOv85Tb6cYfkcijv6rKQHC9NgDTyWSMTIfhO+/jb5HAlHo24v5qa8/ADFG1eHhvr2YZ0V5t6oYkVGpHAKuj2YFDPHhPCHW0TVwyQx351+9A5zP42ogY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754898460; c=relaxed/simple;
	bh=vg5GQviEqXZFf8wgCeP2gKeBn3IbBZG5Jkwd6t84bqU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SVdML9i6O2q6AhRgJ6lUf4pBfwqceoPYbclTIoXXRXKGAPaOJYZBlDp8yVi+CKc1KWlxm9rH9x32UYcVypN+Lu6j8U8+ziSIgP5TVtPrAcIOX3u4r/mTZ7Z0EC3GLQLMZjGNBIo3PEGnL2vsD3hyc39cLjyd6y0CALFwxQxbjLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=apeeCH/k; arc=fail smtp.client-ip=40.107.94.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="apeeCH/k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NeHodwss2BzXN2yTaxf9ZSCo6QSZlwFZJQ8PjdLyiV0XL0oCxxMTiqbNKYzW02msPM+v08p4zD3tobOdC1wEaR7bvZBd4og0k4MWiZ6OrpO4mijNaCjb9xkM0IsThLNM8qvfvcxx4NvKJyubY/bkXTacNQ4LQDFkZhdjU7tnzwtzHhTCrjlpiR8nr4gvjV/RxfkHhX1S8ZWzQ85BE41isjU3JawbUX/uciQqt4ia8VkHPtSYy55/rLdOzmfNpyiJgIO9wVNAWRsJljHXEv45/wOdin/FwJID7LjIi94NI2uO4sLUsu/7sfeoji6iQQMd2AvnAkM7ydPjPizuQt45Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3n82f1DlB3+5uGaVylaHYC2rDHV1xPTJIM/2H/YVioI=;
 b=dx6lPEeJjdH8fPIgdGidpGJK+VlTtQ402k3lCFkSLHvDf1wgOlY4MQvmfI9hNBsvRj1XgupZ/+xls4sNXZCvLiYslztltDAuW41Y8Wcxy41ZtoO7edh9qiL6UppIVlynbGlf85u2evNkWDigXTF1Ri72YBn1BfBz6o/UmGkZBAZDZpBqtDOfOrAt2avDMPKXmlzuhvO4hGlb0AYIq8KL6pTvmpGsJqK4NxGJxrrIxb+bjJPlDXVvKovoRECOF+3icFyDO+X/dQWjjP92JrOxkeHLnvfplBFBpVp1lOwjka+P4eSfPG+CCyX4qzEgXRk8LwXgSwgIsx0HqScnvAtQ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3n82f1DlB3+5uGaVylaHYC2rDHV1xPTJIM/2H/YVioI=;
 b=apeeCH/k3hgBQ7Zg2w5z3Pqkj/TzQfkJvoCBblyBhRf+57b7afNx1MhIpDkuhJLKGfMJx5hXUSdJnrQ/AX2mYa3xJ3wEC28F/wvRc4POd+rOLvparX4Sh/lADOM46Qb0frT7A/A2qRGevnjNNmAwyfzLkAqaMF9Bj4jBFCI3N4Auwv9X0OTYl+u3zEpCiLAEfpqbXP+5g03pEo8IpFHLHEkHFbJJEfhOlTg9R9HAkJ0Uzzt4YtypUnk8xnojQpek2x3pWM/WKQXK9V07V6GF3pvXgef1lRKWAst50P20Zw7rS9DJ4Jzk+nwcNvHGJVquScywvLbb2XF1Ia+7w86C/Q==
Received: from SN1PR12CA0050.namprd12.prod.outlook.com (2603:10b6:802:20::21)
 by PH7PR12MB6611.namprd12.prod.outlook.com (2603:10b6:510:211::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Mon, 11 Aug
 2025 07:47:33 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:802:20:cafe::cf) by SN1PR12CA0050.outlook.office365.com
 (2603:10b6:802:20::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.22 via Frontend Transport; Mon,
 11 Aug 2025 07:47:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Mon, 11 Aug 2025 07:47:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 11 Aug
 2025 00:47:13 -0700
Received: from 553356c-lcelt.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 11 Aug 2025 00:47:09 -0700
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
Subject: [PATCH v3 1/4] dt-bindings: usb: Add wake-up support for Tegra234 XUSB host controller
Date: Mon, 11 Aug 2025 15:45:55 +0800
Message-ID: <20250811074558.1062048-2-haotienh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|PH7PR12MB6611:EE_
X-MS-Office365-Filtering-Correlation-Id: 64ab5238-fb77-46bf-76be-08ddd8ab54c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TclHZg9GcLYMFfVOLH5tWoQinmDQzXd5X0MMDs7FFbsCtTb9dRVZGwBxpPt+?=
 =?us-ascii?Q?70shzzhv4sJC0n4w2v8L++pQ3NMJSQ3AKHhqqdOthLnV1HGc09FSu1LReX25?=
 =?us-ascii?Q?8ACJ1Et0v+gTrJNjBAP0EYX6CY12GDZfZO9zTGZ7pWAVxxglxjbC5+HM21vf?=
 =?us-ascii?Q?VV48J6qUuFcuBYCXzCRJoPB8bCg/7zP50G+F0aZC7Oe2unoV3TEWeWE6a2Hs?=
 =?us-ascii?Q?qkxQr0AONJNSAbsWQNSEkNr4ipyxz8+KO+ex45OSBRo3GfY14hyLshOjLGYP?=
 =?us-ascii?Q?fVchcxKR/c/wKmZJSh2qCx9DyGh1+YU6C/xkLkmm6cIVJJHC0iCxsWK1FNH6?=
 =?us-ascii?Q?Wc+w5mQ603lY//xakWmsFNK5l0njlCFVsxyh6ApD8cKJNKAcXVCQEDGCFCr8?=
 =?us-ascii?Q?flBcq3/VNVAwwQHdQfuUJWk2KxtTNYTZxmRnxydUbmpHhZFuVu27KZfGaDTr?=
 =?us-ascii?Q?p/mvARmoiuFmsdZRUIYVoylRqlQ9qhw8ZDXYK15V66nMLr5ltGyMcDQPG1YI?=
 =?us-ascii?Q?Es12vCJCqhMANNzqXuDyzNYFm9Z9ncJOjn/upWIAhw5Z50TYj5IB43ugke4H?=
 =?us-ascii?Q?lZwzX6hThqkomlw/Ycr9mWROwP71xvFPH/b/S3tswqRsPWKky1AXh4CGtbCC?=
 =?us-ascii?Q?mANfT0XkjB3z6BaOGMF1mPFDJ6/XfUkgt0oJoL+SzRiX+zp/3bDM55rQdxGN?=
 =?us-ascii?Q?82MB6oPxOQW8noQ7Z8AvGHtc7ntADJ5t2m80WCS/WoRvc1DuqIma2IsxMtEd?=
 =?us-ascii?Q?WBcJNHanpAvTQ58TaILFiiT3IBWSkQLK55PxVsxFgREoq8E/WCc4Uh/c7sXD?=
 =?us-ascii?Q?QyDmCR0vPrjEmmgyiMfABBC5W2N+qqQpVAfiy9qJl/uKe7xEce4emDz/k1W6?=
 =?us-ascii?Q?zVXZh74SDP9afGCkN8bYu3LOHd7vtve7n/Dp/F8KPjsfcjgYfGIvMEieb3I+?=
 =?us-ascii?Q?y8FRdaTadwsN8oisH64jSjn/+aXOehaGVwU1Fv32iTVhqIKZ8gKWc8F0V1g8?=
 =?us-ascii?Q?HYwYes9BGEsQuHT9D41hUgm3RRVhn7b4owz0satyxWh5EVrS5zqOnZyySeyr?=
 =?us-ascii?Q?tK9m11khqaygNZz1B+n01T1LezBVivTi0F6NvXhfA8seLgrTJWpLM8z92zYV?=
 =?us-ascii?Q?XJa4YR023l9AOwO/zmdmeHp5QammxUfMorKDnsF2KkUKbadk762asHF2WEvt?=
 =?us-ascii?Q?iekysxNfkzEjbuzuNBiAQHIAoyxlAF2/qngA9SuwGVNtS1D6MsZj314mt/vl?=
 =?us-ascii?Q?0vfomjjlCk4JDuTUOoZI7GfqOWjyXLbd7QbyPhRz4Dw9Kf7ZY1n6ugUSVLYM?=
 =?us-ascii?Q?TJzk6+4leluqNJBm0zzZvwoXeUwDmgWG7pyhcKlqPHaUpY0NZ13GvoJjwbTi?=
 =?us-ascii?Q?13WO56m/yMDQncFXwbqAweKDlbaUZx3JkCBc4O8A4mjgWxAr6RYxEceKqYYZ?=
 =?us-ascii?Q?/7Xsg2p27yQYuZ3noITfFHgbzvacsduaD8/xLZ+hvQGk4FuU/YpmYBjbuxoV?=
 =?us-ascii?Q?6cT9ytviNuf3BTS5WmRHNC969iHa4LCT0FFYRMUdaPSktzYrL5mfVpU3fw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 07:47:32.8932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ab5238-fb77-46bf-76be-08ddd8ab54c9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6611

Populate USB wake events for Tegra234 XUSB host controller.
These wake-up events are optional to maintain backward compatibility and
because the USB controller does not require them for normal operation.

Signed-off-by: Haotien Hsu <haotienh@nvidia.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
V1->V2
- Add the Acked-by tag to the commit message.
V2->V3
- Update coding style
---
 .../bindings/usb/nvidia,tegra234-xusb.yaml    | 31 +++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
index db761dcbf72a..ec0993497fbb 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
@@ -32,9 +32,35 @@ properties:
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
+      The first two interrupts are required for the USB host controller. The
+      remaining USB wake event interrupts are optional. Each USB wake event is
+      independent; it is not necessary to use all of these events on a
+      platform. The USB host controller can function even if no wake-up events
+      are defined. The USB wake event interrupts are handled by the Tegra PMC;
+      hence, the interrupt controller for these is the PMC and the interrupt
+      IDs correspond to the PMC wake event IDs. A complete list of wake event
+      IDs is provided below, and this information is also present in the Tegra
+      TRM document.
+
+        PMC wake-up 76 for USB3 port 0 wakeup
+        PMC wake-up 77 for USB3 port 1 wakeup
+        PMC wake-up 78 for USB3 port 2 and port 3 wakeup
+        PMC wake-up 79 for USB2 port 0 wakeup
+        PMC wake-up 80 for USB2 port 1 wakeup
+        PMC wake-up 81 for USB2 port 2 wakeup
+        PMC wake-up 82 for USB2 port 3 wakeup
 
   clocks:
     items:
@@ -127,8 +153,9 @@ examples:
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

