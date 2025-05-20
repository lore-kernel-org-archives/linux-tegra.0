Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED602185A6;
	Tue, 20 May 2025 09:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732136; cv=fail; b=XMiS16lQN8CFtvn97Mg0CKxf5R67DApg3qJRHEpfEWJCSquq0G1Obfhc+xz5m+BKfe1lB8p6H3w56sdYibkZrmKj/NRTtO/Na5YlFQ4jIF1LlCpUB6LGVkrSjhtQvbE9jC6Fjus+Oft89xuuqnBKcxPHeTVKdseB2Gl8LwfUZtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732136; c=relaxed/simple;
	bh=ZBgoD5fij/Al19rWCv8yb379eOzg1p0hJ4AclHD3xVQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s5crf4mhYgCn9abOpMrJ8qhBdLTcPsR3LwpfqGMjQqJ82/duw2fXUZrvzptxP9GQV0Nlru6U7+17PQum3vxDMY3Ms2mAiYwpbTjt8l4wYN/3G63iErLYvanqN+EyyUexMSiSE4TwpN+dXJQhftcUm1wTHsoXdgGVZ/JpWWLaq/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Q3Aa5sFN; arc=fail smtp.client-ip=40.107.243.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q3Aa5sFN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JbbGbecSsoBTxmC1AP1SHb3yBf7JoB3Ka6NOsKoHclvAXsM/iCR8ZcoT72kmVqfsqzlNQ6eMSBeSMWAD5oBSDP1ncPuq51zMdRdjnTlWawdaij4lpalvwc8h3L9dwTNEXdf0Owjhg74X4gc09HYSNnh6HpRyXC7fSyla36Bdw4Fae56eghuYG6xaSuAr2BAmG4HKowWs4VOb4EYrhr2W8aOIxVIrPjJ/mGtiYc4a4XitfkImsxoWJxEnTB9NRjQ7/dn09YGZnEjWIsVGYPq8HoylCgqZ/z3GRWaOiKLHU1GyiNgAF6LzaYAmXMEYfEoILW5O0zwx+1UeX5YTe1GuDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+K0UD6nyYkJLIfYPdeiyvzJCjigU5Yn6pj2OIrIyX6Q=;
 b=T2ZJLi4gI28gx/iLNyiShT03g0aFWwWw0crYXPI0cp+DLZ2DPMRr7waiXsfj7D2hxQh6XVfzAl/G8u2Nr3cRbrdPDYeCYpcKLNHWjknolpv2mcz2G+QN4CfLqDIDMz1pfKqqGS13tbghHJZVqiPQhC0gK4G0yopQb7YArwmxf1ctT0Vun3FZ+HiW+ofZlZ/Shncqic21w+/hJX5rO6+3IYvgfLEJJ4xM/+w/7a+s92NrEE5lWqMBJBJd+OaEZCZTu8updTe0RJEXAz5VOaKyd+aQSaNONxBo3JIIZOZ5cezdsHeGT51IXf2b7fm+cSyFSVSKWKoyBQrYvSEQgDpiLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+K0UD6nyYkJLIfYPdeiyvzJCjigU5Yn6pj2OIrIyX6Q=;
 b=Q3Aa5sFNTpHTu2RPYc6PEX01bCPkUH1GpvKQP0/WDw4A8qmZ6p002gn6/qmaOHb/EIOUiGxn1MV0LufuZSJ6UH5XVC44vNbB6cU51+p7EchrHKpGz4xfANY6Z9ebEcne+Jn6hZN2HmsRyAf9NcFjHIBjKHOVLTiGiWYTjsaI6vIduhzNtTzIKmSwYF8LM43a86FBS9SohBKESQuNSjVEcPtaCKzBlBT9y240TXOKR3ZOFKund2g2jRz5GDFifsFBkAmIRMapTBQNSQXrVWHJQ5BzCixaAjd4yWwtL6Hq25y0OONhOFRLlPNDJZidjVIuQmKPIKRRVCV7qTmjU0oXDg==
Received: from CH5P223CA0009.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::7)
 by CYYPR12MB8922.namprd12.prod.outlook.com (2603:10b6:930:b8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 20 May
 2025 09:08:49 +0000
Received: from CH1PEPF0000AD78.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::29) by CH5P223CA0009.outlook.office365.com
 (2603:10b6:610:1f3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Tue,
 20 May 2025 09:08:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD78.mail.protection.outlook.com (10.167.244.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Tue, 20 May 2025 09:08:48 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 20 May
 2025 02:08:36 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 20 May
 2025 02:08:35 -0700
Received: from build-shgarg-noble-20250422.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Tue, 20 May 2025 02:08:35 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: <jonathanh@nvidia.com>, <lee@kernel.org>, <robh@kernel.org>,
	<krzk@kernel.org>, <alexandre.belloni@bootlin.com>,
	<thierry.reding@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Shubhi Garg <shgarg@nvidia.com>
Subject: [PATCH V2 1/6] dt-bindings: mfd: add bindings for NVIDIA VRS PSEQ
Date: Tue, 20 May 2025 09:08:27 +0000
Message-ID: <20250520090832.3564104-2-shgarg@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520090832.3564104-1-shgarg@nvidia.com>
References: <20250520090832.3564104-1-shgarg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD78:EE_|CYYPR12MB8922:EE_
X-MS-Office365-Filtering-Correlation-Id: 21491d48-d2db-4d13-28dc-08dd977deec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YnGcLKOQQox7HBR2mm4AeGOrHdtrkpIO+mTEf0kAQFnQ79fUoBjT8opDz/4t?=
 =?us-ascii?Q?TMr5HjtCdHyTlH/uUkZ8vTqmyrlXD6O+Tot97ZwEAm7tZE+XnYZxLCle0rSL?=
 =?us-ascii?Q?UjQh+c3rCVQWfGRZVX1DM9xbGHgdPTqii+DDCN09fQIB9y81pcpyk5Ng/wYW?=
 =?us-ascii?Q?kxQjvf2NkCttXoCRZzhdEETRg0aqzvK1Y79HTUbcaukGUymyWQtJFk1STZmr?=
 =?us-ascii?Q?AdJ/cEwh9pBOOcpVE2PVchXYGh6ISKmtzsyoXhv1r9OWDXeA99cJEK+NMosU?=
 =?us-ascii?Q?BM/tACKwfIl6pWEAnQ6u4SYfMoS2emLh/cm8KLmVtOrHRvf1JUYAdyDW50BQ?=
 =?us-ascii?Q?6ZTbSedS3VgLSlUPLIBzjvYpdCBW8Vmy0swEbGj9+EXM/FVuz/kjbRzH6r0X?=
 =?us-ascii?Q?ljKQP6BVcEdHueWk1ckN93/azh6zT8gLE1KAL2MClVddRE3NSxhY5oFEb0JU?=
 =?us-ascii?Q?koaER4w3Jf2E+k6R64OTRMs2KkJrDirNcSaEiaxqhoCPzsVPYct7ZP+ms1d2?=
 =?us-ascii?Q?CVl0sGGymjdq3Gb9mO88ayEHZ6w9hzyP+MftTvxtsbpbSboWLNlsFWtQruVm?=
 =?us-ascii?Q?xSs7H+QEz4t0gnb8lIk/636gFTiSKFV22vvOfczsP0Z4T3qtswGDdBRXl8RC?=
 =?us-ascii?Q?cMksaInLd29+deMDTlOiIVAOu39rPqSlztVGKrock2txZeEPZbYqp3+QW797?=
 =?us-ascii?Q?e5jzh/KZzGDic2LgbD5nqKcj0ofVsTcYSkATHBtNMoepRqObUIx9D5S1gOF3?=
 =?us-ascii?Q?C4JNWg2PY8N4FAjkgg0/DZBMzHo3gYcVGQ3JwlgmzFYrwxMH8ssOxV8Iq54L?=
 =?us-ascii?Q?e7JCQyRxl83Q0GVbeVBMvxTkYGQEy8N0Jc6d7QMF7iWBTcx5/LzrYaYiRFO7?=
 =?us-ascii?Q?DgNajSEn9ehb9jJp6LCKOyiljORDANlKXIm7hyfnpo+4wtMyaDWaeJ+PsWxe?=
 =?us-ascii?Q?ZjCuVR/Qgq0PX8oykeen0v6FuSNkWQhJVftQZzBDqTchaUcCYd551rPKU/bf?=
 =?us-ascii?Q?7fvnHSrbFHwRMlWnaIViqkna5nx6IXsFmKAVeipN+C3emFx9Z21AOVZABymE?=
 =?us-ascii?Q?MQeJGT91QXAy2VG4/1FBkx1EHClalFRCyDLAUWGu0C7EY63vaDGy8S/zVkxg?=
 =?us-ascii?Q?X7fzOuD/CO+MHmzpXuF2RVxQnON7nVIIEPMRoPKOm5yOPtkMBWvisn22KTig?=
 =?us-ascii?Q?Zycokyk4wP8ffFjrRtIhVdYorLIRF/hxSxlPDdfGVDFf+CxJxXItEw8SOdb4?=
 =?us-ascii?Q?fRzNge8Ci7gQrWNnrHWDekWGacCq4ryaNxjawhwpPRlrNqfoZTJT9gB6i3di?=
 =?us-ascii?Q?/o8kCn8jAEBJAUhng65EqTkMXzEdB7XDMw/nJ6su4C+lfBAzxHCHqILXisgQ?=
 =?us-ascii?Q?Vrh4KcL/aioo6fVRxq+p3zm8TeKa2YDLWScxIl74yfjsYTc2MIN/xxiAG6Cl?=
 =?us-ascii?Q?vZkbcx7qSUVFmBWUzyesL/FgKaEk8bYDGx+v0Im9fAX8Npvwog7Oe6dL1hlU?=
 =?us-ascii?Q?bRqptiP/ekjPQMsQcngxkt1N4blICk6FKYJX?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 09:08:48.7738
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21491d48-d2db-4d13-28dc-08dd977deec9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD78.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8922

Add bindings for NVIDIA VRS (Voltage Regulator Specification) power
sequencer device. NVIDIA VRS PSEQ controls ON/OFF and suspend/resume
power sequencing of system power rails on Tegra234 SoC. This device
also provides 32kHz RTC support with backup battery for system timing.

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---

v2:
- fixed copyrights
- updated description with RTC information
- added status node in dtb node example

 .../bindings/mfd/nvidia,vrs-pseq.yaml         | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml

diff --git a/Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml b/Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml
new file mode 100644
index 000000000000..676a29d4e1fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/nvidia,vrs-pseq.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Voltage Regulator Specification Power Sequencer
+
+maintainers:
+  - Shubhi Garg <shgarg@nvidia.com>
+
+description:
+  NVIDIA Voltage Regulator Specification Power Sequencer device controls
+  ON/OFF and suspend/resume power sequencing of system power rails for NVIDIA
+  SoCs. It provides 32kHz RTC clock support with backup battery for system
+  timing. The device also acts as an interrupt controller for managing
+  interrupts from the VRS power sequencer.
+
+properties:
+  compatible:
+    const: nvidia,vrs-pseq
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+    description:
+      The first cell is the IRQ number, the second cell is the trigger type.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        vrs@3c {
+            compatible = "nvidia,vrs-pseq";
+            reg = <0x3c>;
+            interrupt-parent = <&pmc>;
+            interrupts = <24 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+       };
+    };
-- 
2.43.0

