Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012003.outbound.protection.outlook.com [52.101.53.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399043644A1;
	Tue, 21 Jul 2026 04:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784606956; cv=fail; b=t20HP9JPWPQ8+KOJBZKDcMq7/GaxTVc1TLBswLcVrcyK4B5wxtfIS27oSYOCZgedaCyIZP0uQvRpgCPdU+URZWPHMZndXdNDAp5iNvFtixyDkhlUrewZI+4I2zT5JztGLceeUfFaHXTiswrfCovA44hWI7Namf+BRCidyBMuVMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784606956; c=relaxed/simple;
	bh=JqcDKy2xbgxavswn4nfFXMG01yGkosVARFYJykh05mU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cAp/Rxgdthzklr2dVwBGlT2fdR5UFUnRs1y6n+jGI80AJwDRMnhVViZsnDIZ8Qif8/xlyT3O8TZn3vzXnkWfQU6I3lwKMtoNP+VTLXnhjGHZ5WdBHo3gTCuMjqOLF0pzA5onNCqbWEqtlJGyXJVblP80SDgkHLu5i3ydWVnB84g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cdOhYEhk; arc=fail smtp.client-ip=52.101.53.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cdOhYEhk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYuRAL6y7ShpI9rF0qg3vfdEBQ+nrFzSZN/75AkMmgYmB3UNqn8UwK2RxTYw3aCHR1Rf4S2ChGbmVWgx5bxgejmm0A9Eoc3eZzUy/uQ15Tb5pkSYGfkiUfQjSM0U4qp0zty3WHfkipaTeM4i6CSo4Bow+EHgLCGaiZelfHEE/7EuPCSW3mbD+sdplxxQSPdOTLxJXm1wCiUJ0k0NJzWPlvDmA+Ol/7VL1ipP5LSrlXeZkigMfyq8jrixLLzikXB++Q1Afe0IQAnDQEZ8cfkjNADuXtI+gpKrTv/cNszSnX4YBfL31ehkSq+T2LHjnVGKO+mpNRMIDdqiPpGzx1ZXuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3HhTQ3KDMGn8KeLJKTWHxM3Z/uH2oQelCJEK3n4yMM=;
 b=padw2Cpimykqe9OTIx88RYmqZVbRPo1zB6ZnenvUDwlpHgxxAD3BSqEK0/h95cq+eky8ILh+qp4BKuRnpYKByK7hh8cU1FRgz63oHAztojI1m8KK4sevXVDatKjSN7CIpaxEORxnv/CefmPMaC9VO3Ic/eIHb6chq9ctt4FbgWSnUSZCzA0vv9yMTEbyMLX95+HxT4jT5U8VByk6s4U9+hmF61+QoWDBSuA4jIt7Qx2qBwDq/6NJXQEhZv9KL0dj4oEv9r6iI1aFGJ1DKnZoR7yw5I0v0m0UW20kHPJtczxzRyv0VJuyZw2qQEObRKOlg/bQ1hp69E8zV/ODpt62/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3HhTQ3KDMGn8KeLJKTWHxM3Z/uH2oQelCJEK3n4yMM=;
 b=cdOhYEhkI9kE/CSs20DJLiMuy5VSLrGqMr8ArOC9Q+RigOUqSVcL2jhw3I472xPuYk13zFSj7dYIqhhs3UgDs/A/uIffTTNCBflPcTyCjYpLar1xzYjftoRZpABcg0wGYUxqG4A6+U7U/jLpoBbDnGynilYZ0EybclhH6NyWSAYuNH8gbTYOu6F395FjgCO0ayNC6Qsm8K8EK3CVlnSxwlXJjgIWgS1YBP9j8k2ciKw4jU5tGWLQAN1KlMrkIEgeBBcwttoEZ/ihY+a09vBKZPwnKGn1LXfpQm5UvM2y+d7RCKQa2K4aHKbsNt4SRsfW7NwEF3zM6xv0SV4jXviR3A==
Received: from SJ0PR13CA0189.namprd13.prod.outlook.com (2603:10b6:a03:2c3::14)
 by BL1PR12MB5779.namprd12.prod.outlook.com (2603:10b6:208:392::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 04:09:06 +0000
Received: from CO1PEPF00012E82.namprd03.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::51) by SJ0PR13CA0189.outlook.office365.com
 (2603:10b6:a03:2c3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 04:09:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF00012E82.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 04:09:04 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 20 Jul
 2026 21:08:43 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Jul
 2026 21:08:43 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 20 Jul 2026 21:08:38 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Frank Li <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>, Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Akhil R
	<akhilrajeev@nvidia.com>
Subject: [PATCH v6 01/12] dt-bindings: i3c: Add mipi-i3c-static-method to support SETAASA
Date: Tue, 21 Jul 2026 04:07:49 +0000
Message-ID: <20260721040805.1696503-2-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E82:EE_|BL1PR12MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a83a0ff-097b-45ff-cf23-08dee6ddcdf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|7416014|376014|22082099003|18002099003|3023799007|56012099006|10067099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	mv1KXHX4Mp9pKxYvKthDSip0u2GbY/LLg3/89jmvFmiUS4pMx313cRyVTscnMmNAzja7uWQfy8pm2FePQnZidC1BB8jhMYk74EsWE0JEkklGAz8eRybTqinO82EGSeL+ySPowkUudCgJNoXJsptnnIQK1eXIyeVA22sYOvvVtaAyXOANDD9/+yVvKI5Nhvc8BbX66SAXZ4BfgJS9ZlsAMw2vthq8LkD9mAbbH6TIe/B7K6xJu/X1vd1JgNL9LZHINPW2fw+SYz2st1xEExn1ZCc0rTqe62vmt3lvH7TLmUplAaSoS3gUd5peDDOFFkiEy+qTC7Le66eHbipnb91ZSsNPkRTrycUa03UP1pxJE7Oe92eqRwQI23IVHrK1mDkU6el9QfVn+aJ9bjBztbvMCrwe3l2HEVCv4O6Ahaebc0tgNeXe+URoR2T8G1Wpknq6CVv/HN6xGl9Tr7RnwHJ/TsLWRuu+Gyza3S6Nwe9sfanS+t7KuzVftykCWp1VhogyJo5VMjJ72IrW0GhiqqZsCcL8nWEBtf4o/EVXNM7szd2/jOHf/ACRXm5h53okYuw+lq3eoGt3XOZNHnXtiYu60nTekQPyDj0h9WxcqQ9nub6unVoct/ag1vuNvg6NfF6QzdvEz9XwEHdfM8gbFMigJCMKCu37bE6QZn31qE4xJUxC73haplGDO7EeefErrKcpdF3hYfSpI9PROhbfbkpX5w==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(7416014)(376014)(22082099003)(18002099003)(3023799007)(56012099006)(10067099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JDnE8kqi9XEqkAyqre1is7Zr0VJrs66wLQXNsjRM//0ivLh5+cb7FIVkRsjZJk3eE/51HI5beYI7vg5GXf2ZzqRpIwMeSfAOITZ3FG1RtunrQn/r1djF3yqrQgHLlI+XdxJ2WQiSbVu9d7+YwGcysNlLTa/61MMGKWe9rmc5B7isc3XV4QnjKFDnpXZBa9m8GEEjmVVlK4V6NEELhEkB30wtere4Ab9sKml13u4fdUHmYzUtQ9ghm3/1Jz7v8K33CciVMqGK20l4qcDJVG3iXcyx4MC41L2qZFeC8iKSgNYkl540NJSmd8edA2uam1pSWnsD5xP9eDj31pKEw6s8CXXCT9W/H0fWqqobNaoqEQZgQcneg7YT6Ph4GKOwh9iPLvmc89pO2hmI73N95HdZkrWs6gqq252rfd0ZM6xXcngf9LCp7WdxaixKssTBuv4L
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 04:09:04.9479
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a83a0ff-097b-45ff-cf23-08dee6ddcdf6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E82.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5779

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

