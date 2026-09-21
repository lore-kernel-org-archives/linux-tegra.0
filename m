Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012029.outbound.protection.outlook.com [40.107.209.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7994F31D39A;
	Mon, 21 Sep 2026 12:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993179; cv=fail; b=OadxJMzJUrQBYDGwyC0GyTuPuIqO4yQDLqDv27gOzXEYcgYpqHHCvrWdHdHvyAnlXQYPL4ZjgHhSielDIJV0kE6uXKmTrJx4w4aEqG1meSd1sz+Sa6nGseaZ40Tth0OmX8oIuI5IlFMB5s7DIyVojscFM2FHel9vubTbY0Sjukw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993179; c=relaxed/simple;
	bh=4JsR0pZKtl+tFd8e8o1WZHjAvM0n398VMLRZVVvbSM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=t9IgPhr0/gRC+YXIkgpHJ0rtyiuUSv0eUuoMLSEZV6+mwF1RcF4AAbI354d92HEndNN+HBiJpSNYu8+dfwWqwKiGRFCQAzCWEaeucXh93UTc1w+G945sZm3VxauVeJ5MXkcGPCTtisb9YxzGM5GKKHR411KcnYcL/u/Q6/3AL2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=brIHpows; arc=fail smtp.client-ip=40.107.209.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="brIHpows"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cgue8/gKa+zgbLvvOiVDJDm1+DVKW6m4u1AOQci5Q16N3AVwyiuYVxumk4ILVoyXCawkJeR33owwNpLHAJqLwRJGiXJt8GhW9QewxOT8cTQJNyCPJ3j64xwV12WTePvYVAGwDuYJ1L8dPQkehnOz983TxyToNtUruYmYcY4WMUg6Oj1/oBSpMNxaLifwveZ+MG37n7AuEKsqjdRM/z++j0Ru39hzxvRLUMC7LhNzOhgSS7OnlRQz5BuCXLuTT4V0kyB05mphJ9KGTgwGuUWoZj5g3bYN6zDRo2SN2pVbULbe9naga2qy0NQMWTuUiEselZrRYhfkxknMwgVXUDXQdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/nVMZnSzou+zBAfIzSNGYbhmNbBdbkGfNvYUZQZ+ZU=;
 b=jIEb4YvmrrJREGHQPSEyV5QHZsd+b7f2S82ZlJMYjGV9w0HzLq3yWQJrWTflhKN6pidgzGf767hXXd0ceEJsmaIYYVDxLqgwU3kGSZe3VocAUnw0KE+Jb7FRNqpGgnHWdmsaJdBBcfujDxiqp6xv3boe7NSOXm1PeCTeUl1DacNEr/YDfiXov2jQj6dAaHNfxU/i5xLlFiRJN0o/TiM/3bYg77BKUw7hZ/kI/YNNPLZHEnm0Js1Ny7Czj19pNVXa6lgHL2UZcPAkCwISP0+1rZ0PTWfj3M5Dw46Cyb3jHT1EFz57l5wzsgHOpTEmE5MwjNOXJmbl0WXuNDJZjlLi4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/nVMZnSzou+zBAfIzSNGYbhmNbBdbkGfNvYUZQZ+ZU=;
 b=brIHpowsvUo60EbcZwfUysaRIXbnvPhbAZU6F/F00nU5mmTS5KdH9DaTeiNNfg3yYxqpawwEYYfRQpP0GzUf3z1n2taYlUj49lQ+SmrOFLwv5PIYRnb8GU9zcHLwU5ECG7UF2QfNFjPMkoYkds2zQNdodMQbbsQFf3y1XMkd1fwTSKTXKy+Al4dyPUfMju2X49kE4NEgfEE0ay1XjopHJCKiD4GOTBA86Ci8IjnkERLJdf7j0yATGq2cuOIDBQIOhQiMuXuxWrQVzCGASSdP5zJ0xLzGZXKezndET5M7u/vkQFE1NB7LbCgVcP3qG4k0yLoK4sC2jihFeFrowXE1hA==
Received: from BN0PR08CA0005.namprd08.prod.outlook.com (2603:10b6:408:142::20)
 by DM4PR12MB6229.namprd12.prod.outlook.com (2603:10b6:8:a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 12:19:31 +0000
Received: from BN7PEPF000000A5.namprd05.prod.outlook.com
 (2603:10b6:408:142:cafe::7a) by BN0PR08CA0005.outlook.office365.com
 (2603:10b6:408:142::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 12:19:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN7PEPF000000A5.mail.protection.outlook.com (10.167.245.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 12:19:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 05:19:16 -0700
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 05:19:13 -0700
From: Jon Hunter <jonathanh@nvidia.com>
Date: Mon, 21 Sep 2026 13:19:01 +0100
Subject: [PATCH 1/9] dt-bindings: usb: Add Tegra238 XUSB host controller
 support
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260921-tegra-usb-v1-1-74a925a35d82@nvidia.com>
References: <20260921-tegra-usb-v1-0-74a925a35d82@nvidia.com>
In-Reply-To: <20260921-tegra-usb-v1-0-74a925a35d82@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A5:EE_|DM4PR12MB6229:EE_
X-MS-Office365-Filtering-Correlation-Id: f97ab2c3-4b19-4d85-c21b-08df17da9719
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|7416014|1800799024|10067099003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	IdUSFv933T8mNNWxk0ukOzKo6rcgUzKuLLBygXYDEbk4+4MkFafe7bjgaDVdT1sjz/MXfg8lUcvbUK8PXCh8RBCMpunQFkNfznB6jPyiILjf2YNK+DInOe79j4Meo+Z4+zs+4yiGxKnmuTIk/45ACDkcC2TzYq4RDZx4uYoymm1Wl0WBjjvT4cmpG+PskYLGh56xu1NRtMPLhfu3xLg/26Dnc1C+nN/yEqlZ6bAl7blQZdSHSXcLrBhDAaGdNM8UDdSXiTfSEt8runXu8jf/mNmj5W5DBR64J6cM9CP6KCD2Tf9Pz3C10w/5okgYqz2YOyiIlwdYREb73WpAbpUtz5XwY6EVJKt6ji9zbjCdgkvP0WLduISjjhNllQiaig1ebRrxFyG9K8lBUelk+zeA3cIExuvPeQeHiFQnLtmnhHSjJifHZhG9oHOvCKyTZ1o3J85Th4Ofdg5ffe8Hz01XxCG7f6wRoEMz75OHm6WXpA3vv9oai2VA5gOOW65QW6vd9z4176q+D3cQ/SKATVyr2QB6Egvy87fV3E3gc08i167npfQh1FaDrrvrX8I3N3ZeFWkml0jof2+03uaV+g7G17CtbJD0qfFXzsVJjucCkkQ4MzocwJ/EavxVeiTZGUFVav2MRV13zcY2YCodpdQ1wNBfnrVQ6NYsu8R3OtMdAcWsdSPUEctZDN0IO1Xqo/cmsXw/5jqrlA9Xuhw9Y8LRhA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(7416014)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ESdWSR8qD6DidDbiz+xX06wBtO+EstKHdRySXG49Tz2qcJR7WTXbm3G3euzl50DxyXHK8FYRqlHBJNQhkHTDYyIsD9RGs77OZ2NrSXx71u5Oqgvet2SAGW+mwad7BPnTyv5sOp0v1u2rVJmD0tIKgpCz1SuxHPYCZ8ER+7m5hszLmSOZk7P32vyRLAqJj/MM3crcnjRiCKTDuFazWEDvb9/cXikQYtRTSzp1fhjTXEkICQEMNKpqnq1TfLvjTndUNgFsjsZn2yrWeBMZFGdzXJIv0iba//hQ0TeXi28yb8F9EsL8fKisQbO3vOzkVnMcZWtlYIw2/L1dd+hVXmDrmIBXzD8+xo/v40jU9NnflMm2PGASiuiKiBP2oqgz6zKsZFu2O1P1xtYyL7HO3PFmH3bv0oQUw16EOfiaejqZYrS2nmk/3nTx+oEmRpbNwMEd
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 12:19:31.3175
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f97ab2c3-4b19-4d85-c21b-08df17da9719
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6229

Add a compatible string for the Tegra238 XUSB host controller. The
Tegra238 XUSB host controller is similar to that found on the Tegra234
device but only supports 3 PHYs compared to the 4 PHYs on the Tegra234.
Hence, the binding is also updated to limit the number of PHYs that can
be specified for the Tegra238 device.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../bindings/usb/nvidia,tegra234-xusb.yaml           | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
index 3f56110be915..9d605db7e77f 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
@@ -19,6 +19,7 @@ properties:
   compatible:
     enum:
       - nvidia,tegra234-xusb
+      - nvidia,tegra238-xusb
       - nvidia,tegra264-xusb
 
   reg:
@@ -154,6 +155,25 @@ properties:
 
 allOf:
   - $ref: usb-xhci.yaml
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra238-xusb
+    then:
+      properties:
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
 
   - if:
       properties:

-- 
2.43.0

