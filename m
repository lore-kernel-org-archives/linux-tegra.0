Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011039.outbound.protection.outlook.com [40.93.194.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFEC495AE3;
	Mon, 21 Sep 2026 12:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992924; cv=fail; b=r+ZA07WzB6bhwgd7sExYZHCH371+FRVfO57FwQKcvEqPxoHhyrZIg6mSMw3rto04al98uROXa1BentC57Ms9O0+jIabHICWaSY+LxMbbr7eqKAlTGYYAm4AQr+LZIdntS3m+tyu7NQkgt3Hjv9XIbereeKYMYslj1GFZoX4vv50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992924; c=relaxed/simple;
	bh=j/ILL8a1RFFvdOTHpLuG7h9LcBhGaL3gZXwKHApsxbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=QYEzCfgo4T99N/Tx3tV8cthRL4S4uixDr8W9bnXcqzNhQ+MA5qKsyBkNHOI1voQGGY8UNYhcEHY1Hb+f9OWa4btRjtqoKjnyP/O0Ob3z/5xPqJ5FmsSLPG+oilwYUCaQWgED2imhWVEDsmAamO9feJU5lDJ1npTfJFEZD892W3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OotypF0g; arc=fail smtp.client-ip=40.93.194.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OotypF0g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u2VlvYarPssUI+EI2HOm6VUKRRNZeLqHJMJfHJHIwq8jpXjtMgKQVJX3hlnVCsslo6opSjL7f5vqnphZrx9kW4CkfwF0DOxg2gty4RdRdP4K3emwgiDizPdu6gTKVuM3+dv1RwMYPjyWe710iyYkUpPK18XHTINJ3sDTa+otNnoVWu+EDpwbp8lBa/zTH8DOYQHAj9dTaZd7ey2KT4LJCmR/qpzexyx7aojWpSLJnzC5VeC+95ulZxyLg3lBjGlR/Y3SBcGuIKYTLp0kiN+gevuPFwTwecApY5Us2JIzckhG0pQJJVHxD3bmTg7qDGPSX1F0SfqYJhYEFA2mVFjYDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5UYcvepGsE1gJcjbopDFDY6mwjJ67mpD602vPzLmRE=;
 b=B97uTWHKoxlVcUKcGYmUo6AQEwDut6rY54p9CVHp/o812Z36SJEN+lDdalOUDJLHluSIJYMeT+7nM6FFURSmjAs6wRC9yJfvxegOrOhMOuguNeUbNeAGkS1DaHWo/3APOBTj7iBPDGrYtbTIdPS56T6CFef8MOuFawyNre1/gg5PrQCmSWpuLHvkWfAPM0kGxbfJu5JjpweQ1n1/GJo3pB14rfUh6QPR1rdkzV/wuynwtN9MEdbKrXePtnminI4wjeoiSpZ6CA2X9+aPIoO9dK/clNg3TsHmsttjCF39GyrwP2Hqf/kxi8VsEGz5fS2aft35rUyrcqomCBWqn2/dPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5UYcvepGsE1gJcjbopDFDY6mwjJ67mpD602vPzLmRE=;
 b=OotypF0g41KFqph34ddl1ppp1wc7NpGGd/9YKKpWOfm3n7DHteY+dy0z//7nnPIFWxe97JVXA1RKDejFoWJa9BNMNgNaJEhk/0iCPHq5xJPzFE6ZgX6CjwErOaCECBem+q6jypD2EUgldkkiJuJ8j120gY4yp2Bf89A5zTcT3nTqv/RnljuewKZXw+7Kt0NNnB+lcjm7+UEBNi9ZXJHNbq68XEtGV79uDrip1x1rjEB6Rm1ARL9bRGy0k0U8DfZYHMC3aElVq+uewvl5QHjIhlJ7TkkxlBfIaKTyAc8zw1CWTgir/hkjuKpsIcePPI6Fb+rLUv+sfE44VkZ5GNV1Zw==
Received: from CH0P223CA0012.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::29)
 by IA4PR12MB9785.namprd12.prod.outlook.com (2603:10b6:208:55b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.15; Mon, 21 Sep
 2026 12:15:16 +0000
Received: from SJ1PEPF000026C3.namprd04.prod.outlook.com
 (2603:10b6:610:116:cafe::89) by CH0P223CA0012.outlook.office365.com
 (2603:10b6:610:116::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 12:15:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000026C3.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 12:15:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 05:14:55 -0700
Received: from [127.0.1.1] (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 05:14:52 -0700
From: Jon Hunter <jonathanh@nvidia.com>
Date: Mon, 21 Sep 2026 13:14:45 +0100
Subject: [PATCH 1/3] dt-bindings: phy: tegra194: Add compatible for
 Tegra238
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260921-tegra-phy-v1-1-83466bf9a7cd@nvidia.com>
References: <20260921-tegra-phy-v1-0-83466bf9a7cd@nvidia.com>
In-Reply-To: <20260921-tegra-phy-v1-0-83466bf9a7cd@nvidia.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, JC Kuo <jckuo@nvidia.com>
CC: Thierry Reding <thierry.reding@gmail.com>, Wayne Chang
	<waynec@nvidia.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>
X-Mailer: b4 0.16.1-dev
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C3:EE_|IA4PR12MB9785:EE_
X-MS-Office365-Filtering-Correlation-Id: e4225e08-1d66-470a-545a-08df17d9ff02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|7416014|1800799024|23010399003|10067099003|22082099003|18002099003|11063799006|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	6AVp1fRCr7hqT8DcBOQXrjLyB5D6EOF68MfEpfmar9yBmkDQwPMfg3I1RRUTHQA/hZJNtt4nKhq8dmz0SM8NX5uu2jRTvfZKur9zY4dZmIzJAUYE6JcFVVwJLdws3zHAoISc0iFuDxp4V36Xq9zbmppzPSguMs3LzBD3GAJd5P4ApBmvQ2WzCgPaUn+TmSfvheVZ/3x69LPGHUJd6ZsznHWbqf15MDX45JU4G9+x43L62eZoOJxFYz2jPQRfzvqzY9VztDkyL07pQawoeXHfTxZb4GQeDxMTSOVgiv+NUgXarLlE4DFgl9Fcs5zN3jpxCAZdlshs0FrrabIOn3LVm+e3op63oGzXZPncPrsiFV3i3Tw+pMv0wyOWlE5+aDsl2BjM56BqXvowbCAXrASGeTAeXJYc9RuLk3tcQ5CtxyT9ekxeitnPP5WWPcf2tbfERX3LwVVa9O6Tjruhizi0N5meklat9VvbywyCeQhp2WZctQY6CS1G89rLlBRbSPTZs8DTWztYOJI1u06dwH+rCsRNuulzqFstU5dKSiQUtTCTzpWg/A+/80NQH4kuMTpavBW572Cvkasa7hUCrx+r6LAc9TN6yPcdc6I9QmApS95zfRlYYweoyboAFaMV7ws2BwSnJw18aSco2zK1CG8c+U2r9TteWJVqa8ADCYKMVpJ8GVeu3qPrDEsDIBjJzqcfiXxRiCLY7qJko6KxPerZxQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(7416014)(1800799024)(23010399003)(10067099003)(22082099003)(18002099003)(11063799006)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	p2s/U0CAU68TvR1QbNfUGtJTQ6LqTzmIT+evHcX+yU0j/skAfgWtBDo8ekvHDwWHR2mr7jKn+XZtdbfVARwGLfGf4CRzGu4WPU3wYJ1/XM42ASYhJydD0bpSeqVMZRtrKkamapgvMHioU5S/0i30yulDRj3kENlNgqLLE+5m6F4d3PfszZM64VLF4yV9YZa9SsqB2mjFSE7SyACsoavU1YuTxEu7LJgM4JpJUiT21xblCIu8Pz2AOgY33fXc+WLtp7Kcq8RzeeuW2Ah8NYsRPEspBY6g2VZ1vxUDrld/g7MZqBfe9hBg8JHZD5fa4Lt6M2ejtaiBUotjS9nHkUmKqTrGOuJpvnNIDv9SF1amtYLms8rVrWkweDsfl9nndyhHpwF4CUkbtDroapOZEtBeNUmSfJC+55m+qHj2vk4dUW70e64y5Qlp1PyDi0bf7Lmg
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 12:15:16.2147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4225e08-1d66-470a-545a-08df17d9ff02
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9785

The Tegra238 XUSB pad controller is similar to that found on the
Tegra194 and Tegra234, but only has three USB2 ports and three USB3
ports.

Add the Tegra238 compatible string for the XUSB pad controller and
constrain the binding so that a Tegra238 device tree can only have three
USB2 and three USB3 ports.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../bindings/phy/nvidia,tegra194-xusb-padctl.yaml  | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml b/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
index f6fe3c90b5b0..fbafe8eb150b 100644
--- a/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
@@ -45,6 +45,7 @@ properties:
     enum:
       - nvidia,tegra194-xusb-padctl
       - nvidia,tegra234-xusb-padctl
+      - nvidia,tegra238-xusb-padctl
       - nvidia,tegra264-xusb-padctl
 
   reg:
@@ -542,6 +543,43 @@ properties:
             description: connection to a USB Type C controller
             $ref: /schemas/graph.yaml#/properties/port
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra238-xusb-padctl
+    then:
+      properties:
+        pads:
+          properties:
+            usb2:
+              properties:
+                lanes:
+                  properties:
+                    usb2-3: false
+            usb3:
+              properties:
+                lanes:
+                  properties:
+                    usb3-3: false
+        ports:
+          properties:
+            usb2-3: false
+            usb3-0:
+              properties:
+                nvidia,usb2-companion:
+                  enum: [ 0, 1, 2 ]
+            usb3-1:
+              properties:
+                nvidia,usb2-companion:
+                  enum: [ 0, 1, 2 ]
+            usb3-2:
+              properties:
+                nvidia,usb2-companion:
+                  enum: [ 0, 1, 2 ]
+            usb3-3: false
+
 additionalProperties: false
 
 required:

-- 
2.43.0

