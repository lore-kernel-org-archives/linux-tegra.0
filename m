Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA33323D2B5;
	Wed, 16 Apr 2025 12:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805215; cv=fail; b=aho5RF5wxURUKas5tZU7Bvs2fpSf5Yb1RRTErgHFzp9W8WRA91c7voCIkTAtPmZoTUEGQDKH8GC31PHUjh2miiphVM1M5p0vi50uuj6ulkwyaygiAYCDsg+cTvcofmUsm7+kZSi9nXXlWP5Q8hZdAJ9PaHuoEvxV/D1OnnV0//0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805215; c=relaxed/simple;
	bh=ACXYe5BIcHZjVxas6L1P+O57gnFhdfRRwQuXqAZA/qY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iEBHEhSUHJsgcWWTuaL5iHdjnjUxNomrH9ntp/KACAKFMXoMIL8y0RstPfZpJxjFeMafNNd08D9Bom4nqPbMTYuCYFzWU7ErRbHlowkm7UUWVzlV8QN0ssMBe5Cr8ByJnJrDVjI3CCL19lUXWRrYAbo/hBBDHGq8cRdiDH5rbwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=q20RZmKT; arc=fail smtp.client-ip=40.107.244.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="q20RZmKT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mnATt8+kt8+0GaRDsyoChpIdysfIYYaW0WclU8ZwftLU/a4t6by+bbmAXB2hvlBDNF/feAXqerYug8qTfIRDWtWO7BtyqO47BldmjvHiCa4iwJ/4Rdb5tK33Tb7ajLVDlIgL0nlHB+HXQO4kj90SOwpOoOgSThFWPUwR0lV9dtPwrd15DTZs2UgWDY7R4+TPSh9tf12F6IHFHeD/XNKJssRkdxCfrrykgLPPuoOKpUXC6nPVChA+XlJvVSu766mSL4FqpguxdVJj5+c5I+UH58HJNUIrrJZtRNN2wNi+FFgS8l6lmdUWZCfnMAUSiqphTFVyG+v0AwdXUKtCmkb1Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnTB3u78pfYa+Wombpuiaadn/ZNR4QcrIKAHxG+96mw=;
 b=HsdrKJ5nBUVWa4tcHYSgdLobAZUmpVSiF0rg4mxYqSnOt2REdIT7aJuNQkGOEh6Rqlv3XPUsvXi6dIa24eaxHJi9FkKlr2NHQL24yQU1w1H06MS++av88sDKv00cGp86Azmm2ITLmIlzM9/32w3SqoW95736ie3EegTRVsyWElnNPCaUgv/iK/zDJDDNOKNSYp3Sn+7SsXwV8JYkUnYncQb3/vmM0OzWhR8NMU5JsP9Nsd/maJLYc3oDBB0y/P4NobLlfVAp3a6N66QMoBN9B4pVM1pzKLioyKs43RppBp1qJKhZI1KmIyLv3lxcnoANup7TEV8mBui08zbcZk0qdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnTB3u78pfYa+Wombpuiaadn/ZNR4QcrIKAHxG+96mw=;
 b=q20RZmKT2BaHSuoJITEXFnGgInZgXS+uV7faaOZvMYPydC5Xy0A38+PaST1pcY+Wub28GEP/WrEsNIr5PYLGucZpG0NBQgGpCylQfwjCmqPmDlnzXNz9ir2yEI+AAVsFngiq0MFP2UzXP++yMDrMmlu51zzCFKHYFHX/uALuGPGz8Cji/vw0xBbF01JJJ7oChToWx1viVi1mFxd7Kna5f39exCux4vZ1uSlUrA8otEOuWraXyoeDLZrARjXgoWiy+ISnR86GzNQQo1Ip1PlzoTogGtHnh2GofYjarVH6eCABiDzxaBJWxXC8hjfstz/G+MhX4tIvydTlJLZ87h7g8g==
Received: from IA4P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::12)
 by DS4PR12MB9658.namprd12.prod.outlook.com (2603:10b6:8:280::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.21; Wed, 16 Apr
 2025 12:06:48 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:208:558:cafe::e0) by IA4P220CA0003.outlook.office365.com
 (2603:10b6:208:558::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Wed,
 16 Apr 2025 12:06:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Wed, 16 Apr 2025 12:06:47 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 16 Apr
 2025 05:06:27 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 16 Apr
 2025 05:06:27 -0700
Received: from build-shgarg-focal-20241118.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Wed, 16 Apr 2025 05:06:27 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: <lee@kernel.org>, <alexandre.belloni@bootlin.com>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
CC: <shgarg@nvidia.com>
Subject: [PATCH 1/5] dt-bindings: mfd: add bindings for NVIDIA VRS PSEQ
Date: Wed, 16 Apr 2025 12:06:15 +0000
Message-ID: <20250416120619.483793-2-shgarg@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250416120619.483793-1-shgarg@nvidia.com>
References: <20250416120619.483793-1-shgarg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|DS4PR12MB9658:EE_
X-MS-Office365-Filtering-Correlation-Id: 3316848f-7591-4744-1777-08dd7cdf2a10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E0Vng7H3CdPFNjK0l4nhw0FFe2rDlhjg3Vx9A3fnIMGM9jttOCzhcI4uP1E4?=
 =?us-ascii?Q?D/DEGctOOFzQMwU3RqxhNBPCEfx3K12rz5zAbZngA0sjHV0KhN3uC4pDSKsN?=
 =?us-ascii?Q?3l/Z3siPbs38UPTFIDOTCAhCVPKC6SV23WXwNbW7J1M8bYzh8iUMRv/NgVnn?=
 =?us-ascii?Q?r8QWtyYIvYjSax+vAMoGw30ha7Afy6VvCbA8fDfmlMPIPBUiPCkoW7vA8RE7?=
 =?us-ascii?Q?UBUAVjZ6XeG2uuEn2LgyBNZp0+xwYw+nL9NgSqJoX/6TjnZ2cwNMwDLkCJui?=
 =?us-ascii?Q?VBt9OiFMvqMsfiR5ZQvyk4zW6GTQVaVmgX1L0b6eMshi3hdhGdEBQEelAqDR?=
 =?us-ascii?Q?9XREt1xQU4paiHrGfEDif8ru2fiwTBaYPxbanWM0X/bQMS1c8qkyV3bcjRU7?=
 =?us-ascii?Q?uUlm0QxMMawD20K6EKIzxktqyxIlgJhFicrra6RubKylAKeSbyCAIhCcTJyD?=
 =?us-ascii?Q?eJ8Xg/JwdLo13xZ85nonPAtuT7+Eeisgjlp+m46QPPP1EUygWAnLmsqr0ecC?=
 =?us-ascii?Q?m7m1IQ5Z4QUTo6uNNFgBr7jkeBZaTf+GqDQjdgWJOEicssOCGwY0CPoqdtMf?=
 =?us-ascii?Q?UA2bGcE3w78NxX6RvK3qGL4LYPngAIneMcumuE8DCA7/RrWUMJBHiY4bKqHw?=
 =?us-ascii?Q?kgXL2CQW7zAhi6RojQBoaHpNLNDfgyuGEclUW6cdIRsTYMdqcKDjKnwu7bNY?=
 =?us-ascii?Q?UkLrhF1zSAtlGfmSE1qNhy/IDUuFLrcGPnvZtACB3KdtdliYe8eBgFwDhJGw?=
 =?us-ascii?Q?6B1iLMop+dAK6T3lUZ5Dd+aXytyhY/q0oJsidyBnd2nc/FqpGbm7daEMJ1jf?=
 =?us-ascii?Q?Lk+1v/hx0XaPnzfy5MXoygYaWQ/Z0BmsvOdVkZsc+p8dDfs8a37fBykzr3oo?=
 =?us-ascii?Q?nhX8ZB8yqtfcy6u8fR+/UhhGhhtYJZh9dV6iDTwA3ohbr0HFtfXsR3sqMBWd?=
 =?us-ascii?Q?T3dx/yEBe/UbPBEy7ja/i87He5cDB5kPeS6EZ8SkgWSdwP2/PKXDgXcm71Up?=
 =?us-ascii?Q?qaiMT71vRVQYRPYCw0mPPyM1xYV1l3YnyYSXddizoKSXQJ4k1HYhMm8qorGj?=
 =?us-ascii?Q?afj9bxhoJ4aeTApq88pZzR+/FBp+RQHnKiWujFRD7/57TED+YiLg+U/srymj?=
 =?us-ascii?Q?Ds4RjuH/xS6qIYS+ySJEkyLMFy7+qHrpsCfLascnZpN/HplObVzqaVVjvEEf?=
 =?us-ascii?Q?03hNEkj6R2x24l149uwdHD+8tmbHKvJOZH8UhY+eiOganeHzZGXc8d9D7BRL?=
 =?us-ascii?Q?m8M+vhuCcMROKxyEW5wDdd/AN60xPZvt94qz+sNPiNYwNltQkqiZ8bWfhlaW?=
 =?us-ascii?Q?M5w7YI2uxol08CJj1a91YJm2hskQgNhFXaKLDs161I2B0B4MYJ1zrYZkYsJP?=
 =?us-ascii?Q?n+VjkOH96zfevg8D9LvyxVEq1CPt0wxf+NqhB/3yEumVekbv+AWbxN0krBO1?=
 =?us-ascii?Q?aS2OUmDRkGbMmJ1hi8M8wFrltOzTe+zRh9d44bEUprWqzzNQHN+YcmaF2lwi?=
 =?us-ascii?Q?r4jRoFwxHGVDCPinq2apmYdpy2pBw4ys8zry?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 12:06:47.9696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3316848f-7591-4744-1777-08dd7cdf2a10
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9658

Add bindings for NVIDIA VRS (Voltage Regulator Specification) power
sequencer device. NVIDIA VRS PSEQ controls ON/OFF and suspend/resume
power sequencing of system power rails on Tegra234 SoC. This device
also provides 32kHz RTC support with backup battery for system timing.

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---
 .../bindings/mfd/nvidia,vrs-pseq.yaml         | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml

diff --git a/Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml b/Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml
new file mode 100644
index 000000000000..d4c5984930e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# SPDX-FileCopyrightText: Copyright (c) 2025 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
+  NVIDIA Voltage Regulator Specification Power Sequencer device controls ON/OFF
+  and suspend/resume power sequencing of system power rails for NVIDIA
+  SoCs. It provides 32kHz RTC clock support with backup battery for
+  system timing.
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
+            status = "disabled";
+       };
+    };
-- 
2.25.1

