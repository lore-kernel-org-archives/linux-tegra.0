Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1487E575;
	Tue,  9 Apr 2024 08:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712651026; cv=fail; b=jAIpFk3mM5KEeuQW4pZcl93LGByKVSDxxpOrNnwEZpVFphyrrPXB7mIszZVTFffwNRZXklAx1s+j6KnPke+eTu/9xRi0i1tWzHJM/j3pn3k4F8hWZOQ0lVse/M9qaVy05loz8XV+7+n7rbwuR9Vk3fYmcqisu+5Xwo4CEynhY+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712651026; c=relaxed/simple;
	bh=wAXTVyEk2PLZ+PW/qBChbyADGdtvU/uNK+UBlktd71s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YX0QWaH2smvbONpD3xts9j8MtWiCLREpUm3ZqMEnE2DjMX7TRAySbXWbG4n/Ua6Pjl8llpSUWbMG950tiisETxStbfkrF2hAwMJozpGdlm/zMb1k4l5lz48xTTXWhGyGa2WM4O8Q1JDq26dUjcmzYauok01ivVYieAcF/0Ln9Bg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=p6NGHk55; arc=fail smtp.client-ip=40.107.223.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="p6NGHk55"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrZubIsFeqyUYj7M/ur58ynSOmvmnD490ImRsM4x2hK/2qsWQ2ZH1t0nesOKYKXXU+Eu55LL8Ebyantg1Tbka6ypyX2aQ6H2nuLRYcPwoOhtuNu3d81RKtCrhYpu2QooBNGw47CrYp97Wv0w/M1XUP2iddIIv8m7ENR2xxLyaoFgCTSntB/Ygixbf/etISG4QF1+uArEOG4f0IMafQvkhgSh6Jbu6tyOl0eDFr2sZZcmVj4uhh862uEOVCESDxlhuUZHxrwul2AFKAmuRxyzF40KKIqBMzuARPmHGaYlX83iay8XaTYi96ExEPjE1kTYeCEXrXNIuukM8T/fKYxBzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57S8jhWfL3Y2v8G6sXLftG9XHZhgLiTjeV8SFSWotfA=;
 b=FN4QNSBl7PJ3sqFH/J0zSTuh1qntluMn0Xsqe/b4idhY1dMq8DYRQykxHODO/wzpMBO9zMCwX42sWBlGoxdEB2HYf96j1xmdfD3ZyYakvIy95F3Bv1y7h4lYw0qaPnrRgjjl366ouKdT1l3Gpsn8u31Q2UkRd45o9CjGzfNl/A5yjaNB2ZUrwF1wbRrGUskEQ9MFHdCMhuIVYC53U5O2PVnRjjJfcY2ZyqstxzCTOO4E6fWdCsjn5cx0LSGs9bycW5E+wRGOnzHDpYeIJTqJXDKlzVjCAp8RJOhNRj3h5q+lT6zrJt/inm0WJc7TRluQvD6cBkhmP8RdZOVjl3ZIjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57S8jhWfL3Y2v8G6sXLftG9XHZhgLiTjeV8SFSWotfA=;
 b=p6NGHk55M0dpV35JU/bbfpR05T+FMwOVRKFUt6Aj3Y3c1fSNrjW6CsfVgGWmO0lIdC49pZf6s5hT61ZNf7HN2nRge6KvDoMpF4lUQaej1kEK0za6QXNPGAKi8jpAa+BHUIhmrFqum1la6M8jo7v6ZITtKo7vd0WuCc7/OMU8cUsoFBDC4MUXwYxXjGhfDsrbW+IjltZBhrm0+3r67pI5SIZ2Ai8Oc1trq9T8XRtwMWOacbN5S/xwGEedDM33lCxUFrHKQHl4FYWQBsJxhBES8daOBUwvX3rQaHg+rw/rwQm5UJNBxfENApT5otLJDCrOhah5c72uVMvxR8HV8Fdh0g==
Received: from MW4PR04CA0249.namprd04.prod.outlook.com (2603:10b6:303:88::14)
 by PH0PR12MB8174.namprd12.prod.outlook.com (2603:10b6:510:298::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 9 Apr
 2024 08:23:41 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2603:10b6:303:88:cafe::73) by MW4PR04CA0249.outlook.office365.com
 (2603:10b6:303:88::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Tue, 9 Apr 2024 08:23:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 9 Apr 2024 08:23:41 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 9 Apr 2024
 01:23:31 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 9 Apr
 2024 01:23:31 -0700
Received: from moonraker.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 9 Apr 2024 01:23:29 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen
	<mperttunen@nvidia.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>
Subject: [PATCH] dt-bindings: host1x: Add missing 'dma-coherent'
Date: Tue, 9 Apr 2024 09:23:24 +0100
Message-ID: <20240409082324.9928-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|PH0PR12MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: 83764c89-95e2-4d95-91cb-08dc586e5d64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CyKWgdDzA8iKCgKr6OY63vg/w0oB509qMW0n5ZSTHUYbn06saHVCTNecvptGRWX+hH80AItC92NrqJ+WpbfWu7/en7x/C15bjY7yoTM3ReKRNHqSFMDOtQP9IeMs9YxcUlaoEx1+1/2nTP/cl34VDCuxBcHiDywQkawiu0QuQJ4KPfX2fhKr/Egk5mwYYvWZuAX/yBlpS3Mk6PhBbuNskQxSPhOy7m0uDbyg5TueHj9b5AgQt4FgDo+s59ZRyVy63zExLFmC+kV3PxZOo/GlP2QEnVCByJaTlYgdx2vyBZOqCn4ki3GVel2+SVOo17/OgBBHvLBLSoruruYKDjSTVO4fpN8AYlGHSL6EjauCeGXO763J6MyCarcRZDWYcpLWV2ifa/M09y19TqOHFAHBEXRtv/Zy1vBQs9TryyINyUh+VBS7ikpnnUkW1sPzo9TNmalomEXpphx8pLwbde1geMdMn5RIk9rXOwEXb6vAp4z3VDGsRyfOfVarTLRY1/BGclWJwjPYH/mQtAb1QTvPJuxn4XlCmMtzEeTJR/ykpUfyrrpdUXC6Q0LX+0SLCTWcVU0Gepgz8GTnLFOtX2txVRRmO6np/EoSZWc8BhcWTbapH1CK7WQRwdGgB+r8ZzSuP/bDLchqAr7E+4rQYN2UKsnguY9QC4lAPA9ARvqZ7JryhiE2DfM7Lp8jmjrJsqV1M73ibK7S58KJgBf7MSby/IpsQ9qnm+I8XfPfvlPM3Buysaa5BG5ekyW0vJ99I/gs
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(1800799015)(82310400014)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 08:23:41.5505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83764c89-95e2-4d95-91cb-08dc586e5d64
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8174

The dtbs_check reports that the 'dma-coherent' property is "unevaluated
and invalid" for the host1x@13e00000 device on Tegra194 and Tegra234
platforms. Fix this by updating the dt-binding document for host1x to
add the 'dma-coherent' property for these devices.

Fixes: 361238cdc525 ("arm64: tegra: Mark host1x as dma-coherent on Tegra194/234")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../bindings/display/tegra/nvidia,tegra20-host1x.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
index 94c5242c03b2..3563378a01af 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
@@ -177,6 +177,15 @@ allOf:
 
       required:
         - reg-names
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra194-host1x
+    then:
+      properties:
+        dma-coherent: true
   - if:
       properties:
         compatible:
@@ -226,6 +235,8 @@ allOf:
             use. Should be a mapping of IDs 0..n to IOMMU entries corresponding to
             usable stream IDs.
 
+        dma-coherent: true
+
       required:
         - reg-names
 
-- 
2.34.1

