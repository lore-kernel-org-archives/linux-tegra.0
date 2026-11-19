Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795071180;
	b=Rz/UpRfOv/3C4JTbBK3EgrScLhc0uR3b6VdTERs2/UJ7l7tY3I9z9zpiBohBWeVOQdWZ
	 drDV0SkF64Kz+x1JHxdYz5k+LIXqlYGWmHqThcQA3LJJxKddlcE25PA0sG7hUaL/fWNpn
	 dqVO36V6k0RFUc2s+tQIOVkRdiNTa4SvSB/EZ5rwT+umvP09d/sBkO7bGSkWxVfre3v0+
	 anxMNNNECNYuK0TrK7XBaDA8hgkBiMPrc/bnImZL35VC76UAtsGPLhYX4K40aNufaHHPw
	 l7u1uw+RWeCo4hFJe8k0z26UZroSUsQpfLdCOTIzP7mSIiOg8kvfIZAxppY+kYrq+mg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071180;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=yxy3hFisO8PuBWvOQg4V0n62wKU7vlrXyLHS+CuQu+0=;
	b=N7wlY/whdU3P7eAUTEUauFaFtx7ff/BtDd4AmUAf9MTZJ8pkECU4JoGtYY2ywSGUYCLY
	 5rQevx8hNHCIVJE0aU+2gBuf7AnoZiEHR6Zzisunq6JxspBrgjcF2ajviukVD5DcojT+5
	 VSJdIenN9cvHSRa+VcBKNM8xqlsQiUiQIXwYXt07+syfbhvBYlvPItCbx6b5bG1YnoKzq
	 qQtinxSVDS/PcYltajNsqUwEolSUHj9qq5jbCk5sh+UHlpDzBh1kY7mXhudJsf1F00owv
	 6Grm9w9HluCad66KR7riIOMhpGN8ts5eC8+OKvrTYn022HuoqkAa5iw1kYWVlYMpFfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=btU2oRo4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.63
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011063.outbound.protection.outlook.com [40.93.194.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E943E60A2612;
	Thu, 19 Nov 2026 06:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E943E60A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=btU2oRo4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sdg7GCPWUDp13ioIL4n+IBCQhu3e7Hh60psDm4QGyeX0cYhds870IWhQ8JJHbGZnhJ/TUARvCyn1YzSrGLbwAFGBRhWGbnoBM/GMdvpwFoemWZhwnIY+SaZnYvVQc9aeh49XaPMeonoV0VQP2R5a32S4/9IdS6sD+GXSU3mtc+yJ5z5u8Co7HyZGToWR5RfS7Xs7vv9zWbWJkO6XqDX0gZ6cuSo872IOq8pyQC7t06j0yyJ9fNohiYrhfk33uZGAOJWfqYsIu3rfmtT1ERasOMTYL3BbGtNUzJxlSO4ppJcAgWsJp46SNCJksOtCszYVaOYIojzMp6MCPSxtB6FS6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxy3hFisO8PuBWvOQg4V0n62wKU7vlrXyLHS+CuQu+0=;
 b=u6oA1GX2kkH/HbAqF5mhB86xtJFEIyJgXNmXOvdE1zAV6JCECYFF8cNEMQWTooqN9dRZBrCdpyayEtluIVVrSWKt6yaJ9PN5ECUIcKz0UVWdMNzu3qq+oig1/j6cBOeluZ9mM8CyWLODtkXQYAG7ePA3/gmqGo6CD2wIE/nQloOJCwAbq0urzswhCcy9D76QcjVPxTM9+MkkResOk/jQxdoEE54t8RuX61kFdBNCuB6ZYY8GzqF1CwLCsDuCfoH9YctDsw38QuQHlEL5TOCPPvXt4NUQA5T/1Hkn+Ex0TuTB+X+gWJkllVwi3Lh3T6oxh0r81nGidYovCl0y4WTADw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxy3hFisO8PuBWvOQg4V0n62wKU7vlrXyLHS+CuQu+0=;
 b=btU2oRo49M/8n2UpWl1aIpnNN6Z287lV0fqlv9ub4hvtIQCDBdE1Oyvewl+UVBz/j/3Bhhn5PkzksXiRjxRe4uYw8IzASghWJUgfpj5vrNXHOXez82vDNSe8fVcrs1OtJsU15g94p7ncKBEcO0sXSXHHjvwsv09Yj5G1qbxY9Cp2T15JHQBhckXu7oziVgr407hT1H/1QL1YQsbQqzNAbXjx9Qh0fsc3BkpCC36fbDjXrJOiuSoGPWAzUXaqaE1ZI1pIc/zYc0pNRLc41H8Q1Nk2OpN8qzN1x8gZUW5+26+1X6K2agKgW09mXOgtHrBUfNstBCWEAhQZdBtJRW/nKQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV5PR12MB9803.namprd12.prod.outlook.com (2603:10b6:408:306::15)
 by PH7PR12MB8153.namprd12.prod.outlook.com (2603:10b6:510:2b0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 06:52:55 +0000
Received: from LV5PR12MB9803.namprd12.prod.outlook.com
 ([fe80::8385:c5ab:1034:e725]) by LV5PR12MB9803.namprd12.prod.outlook.com
 ([fe80::8385:c5ab:1034:e725%5]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 06:52:55 +0000
From: Prateek Agarwal <praagarwal@nvidia.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>
Cc: Prathamesh Shete <pshete@nvidia.com>,
	Prateek Agarwal <praagarwal@nvidia.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] dt-bindings: pinctrl: Document Tegra268 pin controllers
Date: Thu, 19 Nov 2026 06:52:48 +0000
Message-ID: <20261119065249.2425224-3-praagarwal@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119065249.2425224-1-praagarwal@nvidia.com>
References: <20261119065249.2425224-1-praagarwal@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0239.namprd03.prod.outlook.com
 (2603:10b6:303:b9::34) To LV5PR12MB9803.namprd12.prod.outlook.com
 (2603:10b6:408:306::15)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9803:EE_|PH7PR12MB8153:EE_
X-MS-Office365-Filtering-Correlation-Id: cb1a4d67-847f-4052-81ff-08df4609bd32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|11063799006|56012099006|261022105027099003|261021121427099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	0OfuL14HUoxnoJmZObHBMe43pb9Rz8ThaWBAY4J/u4OU6kZkB8O3AQIol9FQ+oqNjt4KN5075OHg8Ad2BntcyotqGpSXq1axH/0POTU6B9kBxUx+xtfFZov4l2FJtL2Xix4l0GxQfTPIUVyNhXg61GOAs+ug31EcFONbFhyC0vbDvNYBm+JkK4mTttw+lGUUnkPp+aC4pbiKVr9J/rzsIs/JSqRZiHbHn6vE6tbUzWqJUZHbdzvcKlpA75vAqKe1OxIRJITypcW9bmF9YC0FDSDyL8Pt79mucVVFofCSpLZBn+Wt2oX4LK4BStyFbagPDE3n7NfnDuajpQYoekDd5xF5rCNrdyPu7gll3wbG+QCk7AkUmuq0GF6BY6HXmebYPRxgImBG3ezmgZ5as4kHT09MJ3yoEsYQbvdOXaRGEnQya8bYGR/L6wUjPNTRT0sTrrYqsfZvzk9lGOa9Bww0saucqhgH35wsM+cgRhqdUVnfu+vnjuKJFhD1r/hZ8gUlX0b14Wgo+MItxckfjbh0sGgXhvE7J/YhgxjAGizDLddCq1xaQh85YncbQKUERf5O6ZNhmFovkXv0xOAGWF9kMw1ruQekZeGM71TuF5llZ/U6JZW6LfOGe9zim6U1F1xpBvv0+A0FpSoVs8z2CbnYbshSAShfEz6JdpancxGbGoY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9803.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(11063799006)(56012099006)(261022105027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qOEyH8AiiL+x2wDq8sjq+Ea1+o87FQdchCcvVzHZK+x2xjM4f5NcpoVaoyw7?=
 =?us-ascii?Q?hK4kcPyLXkX+BoFS25FyRF3dggowI+hjeQy4ggugV/Hhv+Lzbbix06huTvaZ?=
 =?us-ascii?Q?hdphYgEvF6uQQeRwydQlN4r4TRLj75AB96+0zN5BGmQpLjEw96CoAnlIb7oj?=
 =?us-ascii?Q?quDKha7TESgVoJtT2mtSPmPiA7oPlXELfS+tZmGuFETa3llijrh+SoGLzO55?=
 =?us-ascii?Q?uv/dBlFRM26uLdwq2k5oWrhBrxEA9cJfA5qHjh0ITqDwrJ7kpgIZeeUJVtU2?=
 =?us-ascii?Q?rga/bOL0QL8ixOYR6a2/Cj2oFzGr5TSFi4HwqDjAM1Fa6t3pkRVO90hG4IpE?=
 =?us-ascii?Q?g8e7t7SlXOBQ6/Zucga4KVzurOoVlBB7RGu1Hk0DULhT9Gv2E8Q//a6qTBev?=
 =?us-ascii?Q?BbBR52xqw3AutTxIXNqvLcIhypFgVc8BN4Iq7Uk9Iml3o40KeL3idrtMHS9d?=
 =?us-ascii?Q?ekIelf1e368cyl0NFyahMl7BYCxCoLKzbbqK017bh6m9S5qL2cqmwb4eSwrK?=
 =?us-ascii?Q?BRxqaNnUMo+ilRm2nvlhGoBKAKyhD4TNAoTIRB5VKbO0ykrqZbbv9O1r4am3?=
 =?us-ascii?Q?cPWQW33jSeB+KqIO/hNjIOtyVv/NEBgAsdwyXYXnwlbeJY7ysi5QHxiD0JhC?=
 =?us-ascii?Q?TTMe4EbCDrwMO3hufYVJgRyveDVLmtest4QP6g64sTtCJH3+qMxR6ZePHMMf?=
 =?us-ascii?Q?SonFaOjJVau0JcVuRvM6fyZk+ECgT0XqKR4ne5OTKkNy49zZZ3tC/Y1YE8dk?=
 =?us-ascii?Q?omz7KI0fld5/Qw79hBzriAMzDm09NKlPqZWmFuTClIaGX+QlAEA2UmgZie0V?=
 =?us-ascii?Q?93SjgAqRjvkdvBwYadfSBXk6UPxwHSPPItnPD/vCtZc7JGfOxxIth9Vp+VCI?=
 =?us-ascii?Q?ufG3aR1csD6qL4p4zJux9wtF/c62esEjSL6UkiVROcI56G9YXsXh1s+LeS69?=
 =?us-ascii?Q?LPM5eqPdDHaY55lQFIVkCqKuJfNZByz93+9mABGR1yhR2uG4vRroB2klRZQr?=
 =?us-ascii?Q?qGo9GnhYbW34pq4l4KV790dPsxbtZy2xunoCHcvmXZmCDQ4/rdXKRnBDywyS?=
 =?us-ascii?Q?Xnk72nQK7sxp4jBygMYzeU1vYzrZ7XXxe1iCUTtySyl7MYrnxOwnkU1mJa9G?=
 =?us-ascii?Q?kushps5wv4YB01u0NZJLeR49ZyG74DU6P/YikTo6CDy34CSp5IXYMcFnqiwB?=
 =?us-ascii?Q?GNeJA352fKmSzXxBbZSsxYMceO2qdiSlWTTANsWjzLKLNkyS8FjFLnv58arI?=
 =?us-ascii?Q?FqDKHPXfGLWiSkqnG06OZoLRaJzskvPVAgzTNXOlYnPeZhSbECBk06h8dyXu?=
 =?us-ascii?Q?oqGq8kv2eXVp8WGu74ZxRSMzkMCV0BWtSXBoy+pmXuOEcXqOn4SzXKludDaF?=
 =?us-ascii?Q?X7IRwAFMEUrnzrPqd2BBLCb0FqC3oWRevQPpIZyJMIzzlfbotsbsSTyImnwi?=
 =?us-ascii?Q?qKwB8umbMXXXSibnWNIhXcXxxAqzUpe7aRdVimdc41atDOepy8dT/EiPU3WE?=
 =?us-ascii?Q?7KZygeGOKOe+sHHcUEN+XMUFubZqPiHCPZpcPzlLxe4sUKiREguqqXbQiXbg?=
 =?us-ascii?Q?D0lglthN9CK8ncI2impmFMx8mEHjT23U8qa5+q/TF0HE4gI94u81ZRGYl4WI?=
 =?us-ascii?Q?r3MATVVUU3Ol1g85kucRIfYr45lbibr5NXcxovAgWCfcnDtu4E2WiUQ+Geq0?=
 =?us-ascii?Q?etfIB4HHB0uVSU4DSkuX1OvJPdTq6vgtEqxSnxVDaWgWlLezHm/ehl0iaqZE?=
 =?us-ascii?Q?9tj+W+dF/A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb1a4d67-847f-4052-81ff-08df4609bd32
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9803.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 06:52:55.4137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1M6WXVP9MkMlq2+FYGVxnRzLiub98u50gunnr4DDvF9YqtHanbQLe3mgvWdwjQ14KMf3Im0rbLp8ahASecHN6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8153

From: Prathamesh Shete <pshete@nvidia.com>

Tegra268 contains three pin controllers. Document their compatible strings
and describe the list of pins and functions that they provide.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
Signed-off-by: Prateek Agarwal <praagarwal@nvidia.com>
---
 .../pinctrl/nvidia,tegra268-pinmux-aon.yaml   |  78 ++++++++++
 .../nvidia,tegra268-pinmux-common.yaml        |  64 +++++++++
 .../pinctrl/nvidia,tegra268-pinmux-main.yaml  | 136 ++++++++++++++++++
 .../pinctrl/nvidia,tegra268-pinmux-uphy.yaml  |  75 ++++++++++
 4 files changed, 353 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-aon.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-common.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-main.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-uphy.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-aon.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-aon.yaml
new file mode 100644
index 000000000000..0757e15c1327
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-aon.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra268-pinmux-aon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra268 AON Pinmux Controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    const: nvidia,tegra268-pinmux-aon
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  "^pinmux(-[a-z0-9-]+)?$":
+    type: object
+
+    # pin groups
+    additionalProperties:
+      $ref: nvidia,tegra268-pinmux-common.yaml
+
+      properties:
+        nvidia,pins:
+          items:
+            enum: [ soc_gpio00_paa0, vcomp_alert_paa1, ao_retention_n_paa2,
+                    batt_oc_paa3, bootv_ctl_n_paa4, power_on_paa5,
+                    hdmi_cec_paa6, soc_gpio07_paa7, soc_gpio08_pbb0,
+                    soc_gpio09_pbb1, gen2_i2c_scl_pcc0, gen2_i2c_sda_pcc1,
+                    gen3_i2c_scl_pcc2, gen3_i2c_sda_pcc3, gp_pwm4_pcc4,
+                    uart0_tx_pcc5, uart0_rx_pcc6, spi2_sck_pcc7,
+                    spi2_miso_pdd0, spi2_mosi_pdd1, spi2_cs0_n_pdd2,
+                    soc_gpio21_pdd3, soc_gpio23_pdd5, soc_gpio24_pdd6,
+                    soc_gpio25_pdd7, soc_gpio26_pee0, soc_gpio27_pee1,
+                    drive_ao_retention_n_paa2, drive_batt_oc_paa3,
+                    drive_power_on_paa5, drive_vcomp_alert_paa1,
+                    drive_bootv_ctl_n_paa4, drive_soc_gpio00_paa0,
+                    drive_soc_gpio07_paa7, drive_soc_gpio08_pbb0,
+                    drive_soc_gpio09_pbb1, drive_hdmi_cec_paa6,
+                    drive_gen2_i2c_scl_pcc0, drive_gen2_i2c_sda_pcc1,
+                    drive_gen3_i2c_scl_pcc2, drive_gen3_i2c_sda_pcc3,
+                    drive_gp_pwm4_pcc4, drive_uart0_tx_pcc5,
+                    drive_uart0_rx_pcc6, drive_spi2_sck_pcc7,
+                    drive_spi2_miso_pdd0, drive_spi2_mosi_pdd1,
+                    drive_spi2_cs0_n_pdd2, drive_soc_gpio21_pdd3,
+                    drive_soc_gpio23_pdd5, drive_soc_gpio24_pdd6,
+                    drive_soc_gpio25_pdd7, drive_soc_gpio26_pee0,
+                    drive_soc_gpio27_pee1 ]
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/pinctrl-tegra.h>
+
+    pinmux@c7a2000 {
+        compatible = "nvidia,tegra268-pinmux-aon";
+        reg = <0xc7a2000 0x2000>;
+
+        pinctrl-names = "default";
+        pinctrl-0 = <&state_default>;
+
+        state_default: pinmux-default {
+            uart0 {
+                nvidia,pins = "uart0_tx_pcc5";
+                nvidia,function = "uarta_txd";
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-common.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-common.yaml
new file mode 100644
index 000000000000..22bb94a5fb55
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-common.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra268-pinmux-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra268 Pinmux Common Properties
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+$ref: nvidia,tegra-pinmux-common.yaml
+
+properties:
+  nvidia,function:
+    enum: [ dca_vsync, dca_hsync, rsvd0, dp_aux_ch0_hpd, dp_aux_ch1_hpd,
+            gp_pwm2, gp_pwm3, i2c7_clk, i2c7_dat, i2c9_clk, i2c9_dat, spi3_cs0,
+            spi3_cs3, spi3_din, spi3_dout, spi3_sck, uartf_cts, uartf_rts,
+            uartf_rxd, uartf_txd, spi1_cs0, spi1_cs1, spi1_din, spi1_dout,
+            spi1_sck, extperiph2_clk, extperiph1_clk, i2c12_clk, i2c12_dat,
+            nv_therm_fan_tach0, gp_pwm9, i2c0_clk, i2c0_dat, i2c1_clk, i2c1_dat,
+            i2s2_lrck, i2s2_sclk, i2s2_sdata_out, i2s2_sdata_in, uarte_cts,
+            uarte_rts, uarte_rxd, uarte_txd, i2c5_dat, i2c5_clk, i2s4_sdata_out,
+            i2s4_sclk, i2s4_sdata_in, i2s4_lrck, aud_mclk, i2s1_sclk,
+            i2s1_sdata_in, i2s1_sdata_out, i2s1_lrck, i2c11_clk, i2c11_dat,
+            xhalt_trig, gp_pwm1, gp_pwm6, gp_pwm7, gp_pwm8, ufs0, pe1_clkreq_l,
+            pe1_rst_l, pe2_rst_l, pe2_clkreq_l, pe3_clkreq_l, pe3_rst_l,
+            sgmii0_sma_mdio, sgmii0_sma_mdc, usb_vbus_en0, usb_vbus_en1,
+            pe4_clkreq_l, pe4_rst_l, eth0_mdio, eth0_mdc, eth2_mdio, eth2_mdc,
+            qspi0_cs_n, qspi0_io0, qspi0_io1, qspi0_io2, qspi0_io3, qspi0_sck,
+            dcb_vsync, dcb_hsync, dsa_lspii, dce_vsync, dce_hsync, bl_en,
+            bl_pwm_dim0, rsvd1, soc_therm_oc3, i2s5_sclk, i2s5_sdata_in,
+            extperiph3_clk, extperiph4_clk, i2s5_sdata_out, i2s5_lrck,
+            i2c14_dat, i2s8_sclk, i2s8_sdata_out, i2s8_lrck, i2c16_clk,
+            i2c16_dat, i2s3_sclk, i2s3_sdata_out, i2s3_sdata_in, i2s3_lrck,
+            pm_trig1, pm_trig0, dcc_vsync, dcc_hsync, rsvd2, dcf_vsync,
+            dcf_hsync, soundwire1_clk, soundwire1_dat0, soundwire1_dat1,
+            soundwire1_dat2, dmic2_clk, dmic2_dat, nv_therm_fan_tach1,
+            i2c15_clk, i2c15_dat, i2s7_sdata_out, dmic1_clk, dcd_vsync,
+            dcd_hsync, rsvd3, dcg_vsync, dcg_hsync, dspk1_clk, dspk1_dat,
+            soc_therm_oc2, istctrl_ist_done_n, soc_therm_oc1, tsc_edge_out0c,
+            tsc_edge_out0d, tsc_edge_out0a, tsc_edge_out0b, touch_clk, hdmi_cec,
+            i2c2_clk, i2c2_dat, i2c3_clk, i2c3_dat, gp_pwm4, uarta_txd,
+            uarta_rxd, spi2_sck, spi2_din, spi2_dout, spi2_cs0, tsc_sync1,
+            tsc_edge_out3, tsc_edge_out0, tsc_edge_out1, tsc_sync0,
+            soundwire0_clk, soundwire0_dat0, uartl_txd, uartl_rxd, i2s9_sclk,
+            i2s9_sdata_out, i2s9_sdata_in, i2s9_lrck, dmic5_dat, tsc_edge_out2 ]
+
+  # out of the common properties, only these are allowed for Tegra268
+  nvidia,pins: true
+  nvidia,pull: true
+  nvidia,tristate: true
+  nvidia,schmitt: true
+  nvidia,enable-input: true
+  nvidia,open-drain: true
+  nvidia,lock: true
+  nvidia,drive-type: true
+  nvidia,io-hv: true
+
+required:
+  - nvidia,pins
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-main.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-main.yaml
new file mode 100644
index 000000000000..d195b7c5d169
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-main.yaml
@@ -0,0 +1,136 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra268-pinmux-main.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra268 Main Pinmux Controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    const: nvidia,tegra268-pinmux-main
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  "^pinmux(-[a-z0-9-]+)?$":
+    type: object
+
+    # pin groups
+    additionalProperties:
+      $ref: nvidia,tegra268-pinmux-common.yaml
+
+      properties:
+        nvidia,pins:
+          items:
+            enum: [ soc_gpio250_pf0, soc_gpio251_pf1, soc_gpio252_pf2,
+                    dp_aux_ch0_hpd_pf3, dp_aux_ch1_hpd_pf4, pwm2_pf7, pwm3_pg0,
+                    gen7_i2c_scl_pg1, gen7_i2c_sda_pg2, gen9_i2c_scl_pg3,
+                    gen9_i2c_sda_pg4, soc_gpio124_pl0, soc_gpio125_pl1,
+                    fan_tach0_pl2, soc_gpio127_pl3, soc_gpio128_pl4,
+                    soc_gpio129_pl5, soc_gpio130_pl6, soc_gpio131_pl7,
+                    gp_pwm9_pm0, soc_gpio133_pm1, soc_gpio178_pv0,
+                    uart4_tx_pv2, uart4_rx_pv3, uart4_rts_n_pv4,
+                    uart4_cts_n_pv5, dap2_clk_pv6, dap2_fs_pw1,
+                    gen1_i2c_scl_pw2, gen1_i2c_sda_pw3, gen0_i2c_scl_pw4,
+                    gen0_i2c_sda_pw5, pwr_i2c_scl_pw6, pwr_i2c_sda_pw7,
+                    soc_gpio139_pp1, dap4_sclk_pp6, dap4_dout_pp7,
+                    dap4_din_pq0, dap4_fs_pq1, soc_gpio152_pq6,
+                    soc_gpio153_pq7, aud_mclk_pr0, soc_gpio155_pr1,
+                    dap1_sclk_pr2, dap1_out_pr3, dap1_in_pr4, dap1_fs_pr5,
+                    gen11_i2c_scl_pr6, gen11_i2c_sda_pr7, soc_gpio351_ps1,
+                    qspi0_sck_pt0, qspi0_cs_n_pt1, qspi0_io0_pt2,
+                    qspi0_io1_pt3, qspi0_io2_pt4, qspi0_io3_pt5,
+                    soc_gpio192_pt6, soc_gpio270_py0, soc_gpio271_py1,
+                    soc_gpio272_py2, soc_gpio273_py3, soc_gpio274_py4,
+                    soc_gpio275_py5, soc_gpio276_py6, soc_gpio277_py7,
+                    soc_gpio278_pz0, soc_gpio279_pz1, xhalt_trig_pz2,
+                    soc_gpio281_pz3, soc_gpio282_pz4, soc_gpio283_pz5,
+                    soc_gpio284_pz6, soc_gpio285_pz7, soc_gpio286_pal0,
+                    soc_gpio287_pal1, soc_gpio288_pal2, cpu_pwr_req_ph0,
+                    gpu_pwr_req_ph1, spi3_sck_ph6, spi3_miso_ph7,
+                    spi3_mosi_pj0, spi3_cs0_pj1, spi3_cs3_pj2, uart5_tx_pj3,
+                    uart5_rx_pj4, uart5_rts_n_pj5, uart5_cts_n_pj6,
+                    spi1_sck_pj7, spi1_miso_pk0, spi1_mosi_pk1, spi1_cs0_pk2,
+                    spi1_cs1_pk3, extperiph1_clk_pk4, extperiph2_clk_pk5,
+                    gen12_i2c_scl_pk6, gen12_i2c_sda_pk7,
+                    drive_cpu_pwr_req_ph0, drive_gpu_pwr_req_ph1,
+                    drive_spi3_cs0_pj1, drive_spi3_cs3_pj2,
+                    drive_spi3_miso_ph7, drive_spi3_mosi_pj0,
+                    drive_spi3_sck_ph6, drive_uart5_cts_n_pj6,
+                    drive_uart5_rts_n_pj5, drive_uart5_rx_pj4,
+                    drive_uart5_tx_pj3, drive_spi1_cs0_pk2, drive_spi1_cs1_pk3,
+                    drive_spi1_miso_pk0, drive_spi1_mosi_pk1,
+                    drive_spi1_sck_pj7, drive_extperiph2_clk_pk5,
+                    drive_extperiph1_clk_pk4, drive_gen12_i2c_scl_pk6,
+                    drive_gen12_i2c_sda_pk7, drive_soc_gpio124_pl0,
+                    drive_soc_gpio125_pl1, drive_fan_tach0_pl2,
+                    drive_soc_gpio127_pl3, drive_soc_gpio128_pl4,
+                    drive_soc_gpio129_pl5, drive_soc_gpio130_pl6,
+                    drive_soc_gpio131_pl7, drive_gp_pwm9_pm0,
+                    drive_soc_gpio133_pm1, drive_qspi0_cs_n_pt1,
+                    drive_qspi0_io0_pt2, drive_qspi0_io1_pt3,
+                    drive_qspi0_io2_pt4, drive_qspi0_io3_pt5,
+                    drive_qspi0_sck_pt0, drive_soc_gpio192_pt6,
+                    drive_soc_gpio139_pp1, drive_dap4_dout_pp7,
+                    drive_dap4_sclk_pp6, drive_dap4_din_pq0, drive_dap4_fs_pq1,
+                    drive_soc_gpio152_pq6, drive_soc_gpio153_pq7,
+                    drive_soc_gpio155_pr1, drive_aud_mclk_pr0,
+                    drive_dap1_sclk_pr2, drive_dap1_in_pr4, drive_dap1_out_pr3,
+                    drive_dap1_fs_pr5, drive_gen11_i2c_scl_pr6,
+                    drive_gen11_i2c_sda_pr7, drive_soc_gpio351_ps1,
+                    drive_gen0_i2c_scl_pw4, drive_gen0_i2c_sda_pw5,
+                    drive_gen1_i2c_scl_pw2, drive_gen1_i2c_sda_pw3,
+                    drive_dap2_fs_pw1, drive_dap2_clk_pv6,
+                    drive_soc_gpio178_pv0, drive_uart4_cts_n_pv5,
+                    drive_uart4_rts_n_pv4, drive_uart4_rx_pv3,
+                    drive_uart4_tx_pv2, drive_pwr_i2c_sda_pw7,
+                    drive_pwr_i2c_scl_pw6, drive_soc_gpio250_pf0,
+                    drive_soc_gpio251_pf1, drive_soc_gpio252_pf2,
+                    drive_dp_aux_ch0_hpd_pf3, drive_dp_aux_ch1_hpd_pf4,
+                    drive_pwm2_pf7, drive_pwm3_pg0, drive_gen7_i2c_scl_pg1,
+                    drive_gen7_i2c_sda_pg2, drive_gen9_i2c_scl_pg3,
+                    drive_gen9_i2c_sda_pg4, drive_soc_gpio270_py0,
+                    drive_soc_gpio271_py1, drive_soc_gpio272_py2,
+                    drive_soc_gpio273_py3, drive_soc_gpio274_py4,
+                    drive_soc_gpio275_py5, drive_soc_gpio276_py6,
+                    drive_soc_gpio277_py7, drive_soc_gpio278_pz0,
+                    drive_soc_gpio279_pz1, drive_soc_gpio282_pz4,
+                    drive_soc_gpio283_pz5, drive_soc_gpio284_pz6,
+                    drive_soc_gpio285_pz7, drive_soc_gpio286_pal0,
+                    drive_soc_gpio287_pal1, drive_soc_gpio288_pal2,
+                    drive_xhalt_trig_pz2, drive_soc_gpio281_pz3, dap2_din_pw0,
+                    dap2_dout_pv7, drive_dap2_din_pw0, drive_dap2_dout_pv7 ]
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/pinctrl-tegra.h>
+
+    pinmux@c281000 {
+        compatible = "nvidia,tegra268-pinmux-main";
+        reg = <0xc281000 0xc000>;
+
+        pinctrl-names = "default";
+        pinctrl-0 = <&state_default>;
+
+        state_default: pinmux-default {
+            spi3-cs0 {
+                nvidia,pins = "spi3_cs0_pj1";
+                nvidia,function = "spi3_cs0";
+                nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+                nvidia,tristate = <TEGRA_PIN_DISABLE>;
+                nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-uphy.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-uphy.yaml
new file mode 100644
index 000000000000..0a3bb45a512a
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-uphy.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra268-pinmux-uphy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra268 UPHY Pinmux Controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    const: nvidia,tegra268-pinmux-uphy
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  "^pinmux(-[a-z0-9-]+)?$":
+    type: object
+
+    # pin groups
+    additionalProperties:
+      $ref: nvidia,tegra268-pinmux-common.yaml
+
+      properties:
+        nvidia,pins:
+          items:
+            enum: [ pex_l4_clkreq_n_pd0, pex_l4_rst_n_pd1, eth0_mdio_pd4,
+                    eth0_mdc_pd5, eth2_mdio_pe2, eth2_mdc_pe3,
+                    pex_l1_clkreq_n_pb0, pex_l1_rst_n_pb1, pex_wake_n_pc2,
+                    pex_l2_rst_n_pb3, pex_l2_clkreq_n_pb2, pex_l3_clkreq_n_pb4,
+                    pex_l3_rst_n_pb5, sgmii0_sma_mdio_pc0, sgmii0_sma_mdc_pc1,
+                    soc_gpio113_pb6, soc_gpio114_pb7, pwm1_pa0, pwm6_pa1,
+                    pwm7_pa2, pwm8_pa3, ufs0_ref_clk_pa4, ufs0_rst_n_pa5,
+                    drive_pex_l4_clkreq_n_pd0, drive_pex_l4_rst_n_pd1,
+                    drive_eth0_mdio_pd4, drive_eth0_mdc_pd5,
+                    drive_eth2_mdio_pe2, drive_eth2_mdc_pe3,
+                    drive_pex_l1_clkreq_n_pb0, drive_pex_l1_rst_n_pb1,
+                    drive_pex_wake_n_pc2, drive_pex_l2_rst_n_pb3,
+                    drive_pex_l2_clkreq_n_pb2, drive_pex_l3_clkreq_n_pb4,
+                    drive_pex_l3_rst_n_pb5, drive_sgmii0_sma_mdio_pc0,
+                    drive_sgmii0_sma_mdc_pc1, drive_soc_gpio113_pb6,
+                    drive_soc_gpio114_pb7, drive_pwm1_pa0, drive_pwm6_pa1,
+                    drive_pwm7_pa2, drive_pwm8_pa3, drive_ufs0_ref_clk_pa4,
+                    drive_ufs0_rst_n_pa5 ]
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/pinctrl-tegra.h>
+
+    pinmux@82e0000 {
+        compatible = "nvidia,tegra268-pinmux-uphy";
+        reg = <0x82e0000 0x4000>;
+
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinmux_default>;
+
+        pinmux_default: pinmux-default {
+            pex {
+                nvidia,pins = "pex_l1_rst_n_pb1";
+                nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+                nvidia,tristate = <TEGRA_PIN_DISABLE>;
+                nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+            };
+        };
+    };
-- 
2.43.0

