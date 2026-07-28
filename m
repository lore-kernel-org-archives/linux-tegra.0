Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011056.outbound.protection.outlook.com [52.101.62.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF2723BD06;
	Tue, 28 Jul 2026 07:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785222070; cv=fail; b=K6vgqXrZWCNxOqYIXvSxw91COHej67iAy3su2LzXINE17iTdWfDKps+n35+cY9AFLpn3DwO/fnENWnGB7y++KvwlsuyxLJjJOecsBpNUgeYsTA9Tg81Cha+Pdr2sTPLJezHDnvYIPj/EtzIIqd/a/8Whc8oXrPpV2Ohq6G/798A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785222070; c=relaxed/simple;
	bh=JqcDKy2xbgxavswn4nfFXMG01yGkosVARFYJykh05mU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MRlH2KpA+ZyOrFraQtboOt1kVTpgqCenX9qXnkHyFsI7qBiToD+8lDZV/zFfCJ51P2B/FV/vW9gH7Ws6zgt0gEPMOEnBRJsy2G0+wGqUH9hG48ZpOrKKiMMKljt3HQVkuqxQvz0vwv/tVWUZnB2+9FmLDaujRzanJA2IDr/NbOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NGtNErMs; arc=fail smtp.client-ip=52.101.62.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NGtNErMs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxlB5TnOPJ6BzmIa/ryR7Y+yWeH6BX8N7J6QuT4Svqg1xojNWWQVM6wJwEwqYoWxbP9cQJiLo0MEfXg4nkuQ6PH7OEnZMKg47m9xUL38ZjJy5J6gpzbdykuUvXCk6ZdG9MML8w7ZLmkhOpYP1S2y3XQKP8x8dtWNqib2QYCBjgutIjMTNaZDZ6xZ4HgnEih7mASIWqzQ2sgbfN40m5623HNez8GqxhYOnKF8tu9hDLASYSgEPzxw0O82ArSuvkWxrOtSsW5Xd78lCKp8DCbgPbqX+diwoimSQyM05tckNozj1xkukGd3O8ZfSrrd0ZblclovIWKDZbG2FW60mZVYrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3HhTQ3KDMGn8KeLJKTWHxM3Z/uH2oQelCJEK3n4yMM=;
 b=YkIjZCNTny9OTqa4oBx7EU8A2yiBjB+PmKBads+/1lsBCMTLAhRpH9kU2ZmEyFqIw9VYYYKsQsXQ/vRqWC4JL/LnWNtbmLPT0b9AOW9bC0oVv5Xbmt6R1uu21Z72vx71kDHMI1iP4bZZ56hXCC/Pi4wd2iMjeG2TeJNaT5hddVJI5ngRjVcnmCpKjWAY4BBZdIdbmuiNw3GXKpjtY/vBqaKhs9IZtGIkIk0poAqON9QOItnHTySuQOl7PUKUsCB1oXJj7iKiCMKo4XQjKplAcLr8WUOmviv/9puI3UKLuEPJ3LlU/rWa4MBMwMbIRjPiJvmjDBINo455S6kdBHQ+1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3HhTQ3KDMGn8KeLJKTWHxM3Z/uH2oQelCJEK3n4yMM=;
 b=NGtNErMsog9+dIfwHsvMDzNXjpnyYCBw+ku/z82ceoA9y3Ldpk+J6LRcZIK6uxX1G56zz2o86r++qcwQzQZPSrp2S+k/s5AikGEKbEKQ3HSjISDshBDBjlpYSmmC4c2xk+DAeEPeeKQIHHI54ntFa6mYjFAm3fbDL1CrvI/oZ0e3AwblGHLk2n4F5YWFZ5WVK6RZxxljQvClc/VGEFKnTKvCpG06QEe6nRjWsGoDhim+Sy+So8PktarRIGuDwYebt4sivNV3dKoCEegDqgCTV2rja7QwgVRSncFfTjheZyE+w9kz3KCEHZ+hC/hW6leXx66BZXu2rOhbF+yp6a/FwA==
Received: from MN0PR05CA0014.namprd05.prod.outlook.com (2603:10b6:208:52c::25)
 by DS0PR12MB7680.namprd12.prod.outlook.com (2603:10b6:8:11c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 07:01:02 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:52c:cafe::30) by MN0PR05CA0014.outlook.office365.com
 (2603:10b6:208:52c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Tue,
 28 Jul 2026 07:01:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 07:01:01 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Jul
 2026 00:00:43 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Jul
 2026 00:00:43 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Tue, 28 Jul 2026 00:00:37 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Frank Li <Frank.Li@nxp.com>, Frank Li <frank.li@oss.nxp.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "Guenter Roeck" <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, "Jon Hunter" <jonathanh@nvidia.com>, Thierry Reding
	<thierry.reding@kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Akhil R
	<akhilrajeev@nvidia.com>
Subject: [PATCH v7 01/12] dt-bindings: i3c: Add mipi-i3c-static-method to support SETAASA
Date: Tue, 28 Jul 2026 06:59:43 +0000
Message-ID: <20260728065955.809445-2-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728065955.809445-1-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|DS0PR12MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: 599f8d37-4f01-4b07-2bad-08deec75fbdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700016|23010399003|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	/+WHnoAkvMJeQkIdiymCC0zzxL+pg+g0xAtyiU+DrI36nsRZJcGuKrcHK3sbBXWRiReIVWxxzJGm3zAOVoAPgGzQHWydNeZHACRod8oaQjdLdR/4OyrkMMRvHMrE7oa54LMkQH45whzoKivC07J2YCFdIBqjyG8L3dvIf48McCiwPz1RE0Zss7lTB5jygLLQvdsE866cMkU6OMoU9pF/a8IHjannp2JhOuACGaWWjc5BTGfXRyOYK5o35mytHZc22WxhTA62Pnf9H3FgW8EZM+GCELJDoUEiKHaWyOcdmyCs8vzFubMaJ386G0o34EMrbqL+u0txZUL/c9XEdbnMwHu8FOyB0l9Id0w5EsI/vwipyXYBFaBks8jNHesOfh9cqC4fXJafe/KdQzWXmbubuckiUpAnCQyCuNGl33AeMSP1Y34pN5ove6XC15dBwAppsVshYqsFJZzW9fNAGwbG2E6HgSoBpTjTV3oRYpyZ5C88b+e9ixm7ATCcOjPI85CA2uSoN3EOGdOutX3SmXb+cdSqWwYJtDMzU7g0NtY9zApKPRopIhuV00hvKILWsn+rWt2ZPGuGrCesUNZIRjtCuT1z610gOJ6or4WQ/LdM1B1e7eJvU79CdPDsEK1wmbaz6r/y3t45nttasGRcb2CktI7OjNl279erHu9TEQ6G9QqpyYI6Szwwwyhm5CSYKh45nALo52ZqsSm/MtmsTY5adA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700016)(23010399003)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ll+hTuEp7NYU5RIdIdAsCu/gmizKARx4pofsPpljKSJ7b7TkRhLe1xtUuaZGNN12i1Q0Yp8w9elYu7QjLwDBsaJbXDmXEiJrSewpyPnjSkJ1nsb4XJ0WOfq66nYv+YfT3fpZnffE4oh95ngyKECNdWJUEF9phzogVF29KVvYZMOpFoRzoUT/tbgX7W1uJZCi22BmuVv2RGi1oO1CHNQbfgvS0MdjMs1JOuySRUq5ydteVceAit9hgo6ZIaeAbdZFp7NGJrJh8gaUn3wNDq/A3jQ5mt+rpFPK5P1AzEZnkaZ+ehk6p0I1bWRZtLfl0yzKRtiWyLFg0xIxTsdh8/jCQJUG4n5NdlEQRYZHF+mwI+vI84wzMuGPFaYZYA/X4ZnZVnweMO3JRnmXAfRrDztz9SBPGPNUTKCLC7AHgEHv67FVPPepdjTQHQ3XIKZBIzqH
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 07:01:01.2158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 599f8d37-4f01-4b07-2bad-08deec75fbdb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7680

Add the 'mipi-i3c-static-method' property mentioned in the MIPI I3C
Discovery and Configuration Specification [1] to specify which discovery
method an I3C device supports during bus initialization. The property is
a bitmap, where a bit value of 1 indicates support for that method, and 0
indicates lack of support.

Bit 0: SETDASA CCC (Direct)
Bit 1: SETAASA CCC (Broadcast)
Bit 2: Other CCC (vendor / standards extension)
All other bits are reserved.

It is specifically needed when an I3C device requires SETAASA for the
address assignment. SETDASA will be supported by default if this property
is absent, which means for now the property just serves as a flag to
enable SETAASA, but keep the property as a bitmap to align with the
specifications.

[1] https://www.mipi.org/mipi-disco-for-i3c-download

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 .../devicetree/bindings/i3c/i3c.yaml          | 36 ++++++++++++++++---
 include/dt-bindings/i3c/i3c.h                 |  4 +++
 2 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
index e25fa72fd785..5603f2e7807d 100644
--- a/Documentation/devicetree/bindings/i3c/i3c.yaml
+++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
@@ -31,10 +31,12 @@ properties:
       described in the device tree, which in turn means we have to describe
       I3C devices.
 
-      Another use case for describing an I3C device in the device tree is when
-      this I3C device has a static I2C address and we want to assign it a
-      specific I3C dynamic address before the DAA takes place (so that other
-      devices on the bus can't take this dynamic address).
+      Other use-cases for describing an I3C device in the device tree are:
+      - When the I3C device has a static I2C address and we want to assign
+        it a specific I3C dynamic address before the DAA takes place (so
+        that other devices on the bus can't take this dynamic address).
+      - When the I3C device requires SETAASA for its discovery and uses a
+        pre-defined static address.
 
   "#size-cells":
     const: 0
@@ -145,7 +147,31 @@ patternProperties:
           Dynamic address to be assigned to this device. In case static address is
           present (first cell of the reg property != 0), this address is assigned
           through SETDASA. If static address is not present, this address is assigned
-          through SETNEWDA after assigning a temporary address via ENTDAA.
+          through SETNEWDA after assigning a temporary address via ENTDAA. If
+          SETAASA is used, this property is not used, and the static address itself
+          becomes the dynamic address.
+
+      mipi-i3c-static-method:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0x1
+        maximum: 0x7
+        default: 1
+        description: |
+          Bitmap describing which methods of Dynamic Address Assignment from a
+          static address are supported by this I3C Target. For each defined bit
+          position, a set bit indicates support for that method and a cleared
+          bit indicates lack of support.
+
+            Bit 0: SETDASA CCC (Direct)
+            Bit 1: SETAASA CCC (Broadcast)
+            Bit 2: Other CCC (vendor / standards extension)
+            All other bits are reserved.
+
+          This property follows the MIPI I3C specification. The primary use
+          of this property is to indicate support for SETAASA, i.e Bit 1, but
+          will allow other values mentioned in the specification so that it
+          mirrors the specification. SETDASA will remain as the default method
+          even if this property is not present.
 
     required:
       - reg
diff --git a/include/dt-bindings/i3c/i3c.h b/include/dt-bindings/i3c/i3c.h
index 373439218bba..78b8c634aad8 100644
--- a/include/dt-bindings/i3c/i3c.h
+++ b/include/dt-bindings/i3c/i3c.h
@@ -13,4 +13,8 @@
 #define I2C_NO_FILTER_HIGH_FREQUENCY    (1 << 5)
 #define I2C_NO_FILTER_LOW_FREQUENCY     (2 << 5)
 
+#define I3C_ADDR_METHOD_SETDASA     (1 << 0)
+#define I3C_ADDR_METHOD_SETAASA     (1 << 1)
+#define I3C_ADDR_METHOD_VENDOR      (1 << 2)
+
 #endif
-- 
2.43.0

