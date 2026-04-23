Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013020.outbound.protection.outlook.com [40.93.196.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AC338D68F;
	Thu, 23 Apr 2026 08:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776934714; cv=fail; b=MLWN8jRbo+vricfVh5zbm5xRhSU/a9VCqCdJodPypAea+9rSAlF51xpeeFBUlwBAHzJUXYsKfoozy3C1GstXX+vmQTt1KnT5aVrpbS/+Gl7TaJ5Jp+xlv+Zv7RDpFBxoTpSavlp79dmSYOREHEdN76dnddWs/aeWQhcy5ITy2rE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776934714; c=relaxed/simple;
	bh=EBZSt6VpqLMpLanowhsAB3J0dNK2HTjXPYQ0zIo9weE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=azWm9zh4mG4xNgUzW3j7QC4Qj8R/QHhBrB9e34+W6DJ2qQYMWwZgBnoEbQ4LURE6XudznC8UuAQvPMfOh/1Qjo+vPvZi1MvxQKjgtlp69HoUQWfNxFm6327VjQgX6i8JvtNW8lERIMQKFQusSzMUIZyi4eeaKgUzNtQaFIr8M/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TIRTrftm; arc=fail smtp.client-ip=40.93.196.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TIRTrftm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Isw9yRdTvhDNOfhuR+hKqRgWvT3cle9wFfXA22QHa1S/vJ4pSI+NxzCYNvlvcYNZ+dz2uH/MubqmjzmodSLZaajIHW/MADbIu4SYIXhciN0o+gYFW5omvV9dcTMB1LnlKY1iInCgGbbytYG17sKYJ16J1pzxypuJxFv24ztUKKCVDpbzFqBViLQfNNG2QHrBz6rhzxWRb4tSnTrat2ZtEtFdVhJz4kDHfJvNR2D01DMJwG2KRbAPBQA+CRzQHOdtK2Z9rrCwSDvLUstt1gQ64QjxN8KMxvI63FPna6PDhkXPAQyfZqMaA8dhs+MAfwkWY5be7TEYQ7llV5DIwWOAfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bzsnL2U6id2ypmtn57KI2bzWdbhnFF1kii1pZTvcOco=;
 b=fAMzaIQ44YtM+x5mcDoNW+trbhmlvYy3oZSprliupyMAbCJ/Ii/MFpPyTcZjGxXfymAjcVI4dUDigKo+v1arW2iXvpPrbhnjIqQ+I+VtcXbkVyqJNF/Cs1K95aGuX9JJZXAGHFi8GYrVDtWTbjIrj0bAdvXAf4tAdPph7Z+BOwjAHPHeQrZzTac8HvQaQQCV7Xt3H5ZgzSi5irOeOalcbZ60MD63kWjLVZcYqihRhGcwWPwE6LqrtfipF9RCxEl/KlvzUFGWf3HpIZnApQ9E5heHUFAfuINXWp5oeJ7p3h6EtcVPgPHq69h/yOKPvFecOBcSNAvQAagqvlSPyXnaxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzsnL2U6id2ypmtn57KI2bzWdbhnFF1kii1pZTvcOco=;
 b=TIRTrftm0UK02HDEMfhmr7G8+let1rtr7Hp+TqMXfJFv6bv5t4RDw04hiH8aPTSCUNXM48AvDwtA5ETvUhvwg/i3n18kzvC2U1MgiizfKwPHslx6pAorAbBECI/k7dDvhheN9FR4TZMRvBCZ0mQZb+VF2wrmHbzF4+KFC24oYyx0f+k+NrlBTzlIuxq3966nLzik3WZ1KLHMIrM2bUi1PBR35gco08PQt4MQs58vKHdkHtKzBFXEdSwDZ6cLrgAl5agdwDa7VkaFBA9PM/M6HuVGUqUnWnQ6531XJ3pbs04vhZm32uyfJ5a1fxwOOx7rOBaGbUM+HYzma1oB3c0j6w==
Received: from CH2PR10CA0030.namprd10.prod.outlook.com (2603:10b6:610:4c::40)
 by CH2PR12MB4216.namprd12.prod.outlook.com (2603:10b6:610:a8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Thu, 23 Apr
 2026 08:58:23 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::43) by CH2PR10CA0030.outlook.office365.com
 (2603:10b6:610:4c::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Thu,
 23 Apr 2026 08:58:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 23 Apr 2026 08:58:22 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 01:58:06 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 01:58:05 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Apr 2026 01:57:57 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Saket Dumbre <saket.dumbre@intel.com>, "Len
 Brown" <lenb@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, "Eric
 Biggers" <ebiggers@kernel.org>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Jon Hunter <jonathanh@nvidia.com>, "Thierry
 Reding" <treding@nvidia.com>, <linux-tegra@vger.kernel.org>,
	<linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<acpica-devel@lists.linux.dev>, <linux-hwmon@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v3 01/13] dt-bindings: i3c: Add mipi-i3c-static-method to support SETAASA
Date: Thu, 23 Apr 2026 14:27:00 +0530
Message-ID: <20260423085718.70762-2-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260423085718.70762-1-akhilrajeev@nvidia.com>
References: <20260423085718.70762-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|CH2PR12MB4216:EE_
X-MS-Office365-Filtering-Correlation-Id: 5074544e-80df-45d0-453b-08dea1167908
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700016|82310400026|18002099003|22082099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info:
	7aIEILfsD+4jXOw+bO0gpycA7IyBiqeCNhs1R0PWJAN1LpuQeoo6eEx43uOq/rM8M0KqsoiA743nN6ByMO8b6UTkSFSFnnsdMHF1CoDeBgCP69pgJtySXUCTB63OeZk6ag0ZubzvtN8KGcf0z1ioyzgQUyx0ghYnIqbS2i5ubtW2hkLam+e7w8bQrIg5uXmJWpnzBEpOrHHcUJg9ukdi2cVhWL6tjwR/OMu+JnDBKNoRr16dx/1mb5KOC9hxBANteyBixPqLU9sSu3FRXLuUnv2iLllK3W5Tm2mGqRMHX1MjNWgzlpeOom2ejhw1TtcbdlL8e5Lr+zCCSIqNqgCtRU7ry6jO28R4ya5MyuvqmZ2mu+/uq99ZKZyGrhF6cFjv6bRRWCviCE/8twHSIZW6WCbN5VndQCWNawGWS9VuskjJjTFkYE26IIjsU6SjMvh1+wm4AYREMetKEcf3G/3w9Py9w8oymnmP75f5qOeldfPgyT32P34w8zXyyCIPWJ5fgQF/PDFuVx0j/eEVoRCvcTfKYdsQS8RsyrFRCniAHq13MP6tTSsPNb1EV5UY8vU6q72siUJwnhYW+eJAB6HDrvFLjOOuhRiNTbRvqsaufyvn1r0SAEl+CaT95hT2YqMvl4ZdtrVyQVdqzBr3ooxGTH2Uj6J2xxUXO5hN+v7wGBxviZcTI2cPHcoachrO4dlmJslqSGnYqSVwar3VP8+c7h1YdPBI2vbcV5k/5w9DII7W0Ard3JPFLF+/ujmJ/2Aed5f0c8QievjxDKYWwL/bBoZcVuScbxJso7XPZ69RMf2KmzH8309vslqSQFvW3tmdNhfmra/4z0UY6eYUJm+oJQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700016)(82310400026)(18002099003)(22082099003)(56012099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nYgbBf2wusCh6QNvL1cvmeOfr6nnn3ccZj+ABiiAFBDiJd1HE0/T84o3tS7VAn8cxyAWXt4jtXUf2KFA9QbOl/CkTvEERtPliNd08uRpUQ2HFQ1MSA64Ln++uwnJc7YPTdGS6NfqQFZStVGV4yFtVP4khtAzfVM23j4XTIlN48W23+E9ZoTgfKd8s5zhd0oQtzmrHkWtsop4Y3LU26GlOc2KCicyXKJNjL2dGH85D//Y0jeHXEYKJ8fFY9OMj1HYukHaRnUAIopEPYK3GyKhX9LTVaZn0WMLuy4uuJ28J31Rq5NKEGfSNMiftprF+ixKbHt9M6Ch/Z+xh0Ecit1vVhem7LynBrMb5JwnEnmoNIzjND6fjD/qvPmt2Hmv91Fr5tLPw+rZWUf2ZYEyYpdnjLziTJGaDc7+qSX6oyNhiCMx9edJbiOrGp9ggfWrBLKs
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 08:58:22.3466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5074544e-80df-45d0-453b-08dea1167908
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4216

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

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 .../devicetree/bindings/i3c/i3c.yaml          | 31 ++++++++++++++++---
 include/dt-bindings/i3c/i3c.h                 |  3 ++
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
index e25fa72fd785..225844abdd1f 100644
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
@@ -147,6 +149,27 @@ patternProperties:
           through SETDASA. If static address is not present, this address is assigned
           through SETNEWDA after assigning a temporary address via ENTDAA.
 
+      mipi-i3c-static-method:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0x1
+        maximum: 0x7
+        default: 1
+        description: |
+          Bitmap describing which methods of Dynamic Address Assignment from a
+          static address are supported by this I3C Target. A bit value of 1
+          indicates support for that method, and 0 indicates lack of support.
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
+
     required:
       - reg
 
diff --git a/include/dt-bindings/i3c/i3c.h b/include/dt-bindings/i3c/i3c.h
index 373439218bba..b4ceb9827ec0 100644
--- a/include/dt-bindings/i3c/i3c.h
+++ b/include/dt-bindings/i3c/i3c.h
@@ -13,4 +13,7 @@
 #define I2C_NO_FILTER_HIGH_FREQUENCY    (1 << 5)
 #define I2C_NO_FILTER_LOW_FREQUENCY     (2 << 5)
 
+#define I3C_ADDR_METHOD_SETDASA     (1 << 0)
+#define I3C_ADDR_METHOD_SETAASA     (1 << 1)
+
 #endif
-- 
2.50.1

