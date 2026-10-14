Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013016.outbound.protection.outlook.com [40.93.201.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A154EC65A;
	Wed, 14 Oct 2026 10:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974541; cv=fail; b=msQKRgr9JM6AdhG7UqFMvR/r6v6/x7QQORJxjSKS6d3IlfPakZb33mlD0ggIhfu8J6TVxfaHARGTJBCm3QEgnlNSQf07crSRpDEuFc0adtncBjZlVWJcs2citURF3uRH7KEVc11XdnWsvLVJexhHwsbP/jA+teQgLhSzH0AgqQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974541; c=relaxed/simple;
	bh=wIbuVTQ01GIhrkICCxeUysz3PPynGMkDdCU9H2djKNs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=awNKJuZnDWKIx8S9Y3hsYbHS6TuR5ys4AF4zfrPsYVcQc9kbVsA5QFuAHMcuIKMlDtjPLhVU4YThKytGGdLW+tH99rDbGL3ID/s0Voeh5vWFACDocaP344Z/QA/XCvMccGeI5Sj8XcJJYL3FqmrM5BPDAeqFdonJW9G2rUNYI8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Myu1VLqy; arc=fail smtp.client-ip=40.93.201.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Myu1VLqy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dp+bNa1N5WYShdmH01dGdaZHP0oEIo/2uwci2T5v8lGV6CSc6PCSHbU4Vct5+cHhi85gkYZa8REPyz+TmafM9l+UkePPgxul8KAlXCgEVNJKCnWasrRdzNFq1O4OZG0caYBOBCzmB2izlJfmPDVPFT3m6Dg/zb/L6BI1ClXktrVABe5xcwYgKqih/kovGK2vPVKS4cr5+IWaeZyjirIP7i3uq7/VAh2NZS2kFM004EEegLBPQ4UBQ3jQP2GWR3dhQWd/1+IP0SLPEfmAJAphUaJKuzpi2s+8Eg2qKR7YtZJ+FveObmchfM5z/wh/24EuyWQPiDggZOCINFbWjNtpKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVkp9KXMtn7rV7JVcYkGMAHnj51VPuCQ4KVmC2sXOtE=;
 b=TMF82AF3rOxXm/rTIsDlatwfbut8ZvLxcDa99cxqzW6PbtQeKTkLW/RMIY4x6mjuTE3z3wP6J8TAwjEe7W6Ki9RSPOfsSf1bFAng3KHXjd/slZAhzAxRLFfrEz3Qngzcx0xzk9pNZT7RWSQNs01YQH4bN5m+AwC0PaVImjSrBERSuXrHU12tsTvGOxKV6uSn/gV9V9E/QrJrETJLWkoeVpCeFa5baRcMfTkWOLYOBNQyz2gLzOLPFbcKTBo7hAkvWsPVNtpGsf/keFQjQC/S5YuzEOMO3ypVeBuJ/lsO3xnc0Sm21MyA2oys5X7h9hcwpx/5lxft0UyQGU1eauGq/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVkp9KXMtn7rV7JVcYkGMAHnj51VPuCQ4KVmC2sXOtE=;
 b=Myu1VLqyo4VxKvacHgsBVWETLHsYlkKHGVTlQY1JNpRqiGf1DhbxEh9/xKcVLXu029Ham76+EFbvT2rLfaCU2lEKj2qOOFnbbGjV5jHkIEEXSKjGN/L5ww3Qa6t9GdH8qZDba+d85bwiahlCeI506y0WFmai//NpNAgYsoIbYLiNzMhADP5bcoXXpdRra8p0g2t1RwqoVPRjbBs60nIz55BdpMC6S+QlNUu9+ltCtXdSEIReAFJklchjMHQ2OxqRqZA/bQUPoNtrWltabG/DWKztTwgY36HuGSzrvNmiBtGRe2Kt7ztaB5yJ2vA6smh/EJzI7YJndjwiOwHI4B8/sw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by DM4PR12MB6040.namprd12.prod.outlook.com (2603:10b6:8:af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Wed, 14 Oct
 2026 10:42:15 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24%4]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 10:42:15 +0000
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
Subject: [PATCH v2 2/3] dt-bindings: pinctrl: Document Tegra268 pin controllers
Date: Wed, 14 Oct 2026 10:42:09 +0000
Message-Id: <20261014104210.3978188-3-praagarwal@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261014104210.3978188-1-praagarwal@nvidia.com>
References: <20261014104210.3978188-1-praagarwal@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:a03:505::25) To CH8PR12MB9815.namprd12.prod.outlook.com
 (2603:10b6:610:277::13)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR12MB9815:EE_|DM4PR12MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e584c1d-e8b2-48e6-2342-08df29dfcfc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|6133799003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	TXPolDamfmshkkxLfqw9gbBwqUpCQU25sOdOEseXcc8aFTjK75OvmxeF6Ox1qIqcLjaiw6P6jW7Y0xkefMU08WrxMu2bn2HMB3J1sWmnvU2RUxF1Rhd6XMTPh4TVpMqytdPZUYrEHETSUao2cRMfQQ/K5fjwWp2scOaaSPhoeS4eZ7QSRtd1RYeIlwpKPZ7zyF6gGiyk0L14ujvA4QumsVzR9UiRLjeyJf5R51Dy0VF8RrTq3cq8howoiH/pmyIEaxVm925ZPn/x5f8O92C9ifx4yj2weZwsqH2E+DY0B8VlztCn3HjFrA3y8WpuJQ6lStywM7H4/Gr05mZTvKxNrtwrtcLQgBXsJrFS7xedYP3B1gOAHsqZGdCHMUhY2V5bDPhGik3Ffh6xRvkwv0WABYbX4/bft64lhAGOKQRK+0P1mgz6US1/DgoqFjkbL0jQr3hhSOWqSZlZwuPKuOu+XnEInE8IW+egjfGsiw7lMYXZSNA0Qk3v81CovaY9v3YPwJuHujM7X1gAH9+9tS6R28sEJl/hA3ZjcJ0+LkMXV1od1cwsDxF7I6Em9NrzeF3CTYOSZcSPUNKniAT6aZIEZlePVmBHKEbTn/x0zFyLrytT0t8fDopEmzCQWUwtnwB6B5ST1Bu2KkgDkBTwG6y8liMGBcdaRY/dRGrk4PnvTtE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KzTEco6uINQDXjLQBapOQk0tnn/LSk16fA/4RZu8ta7aUyuxbRYA9KVEB0YB?=
 =?us-ascii?Q?lHhrJiLWwnndgao8Hhk9YuTxFPv17UrSrooBNFJnXKrOYt+m3R0uP8PZFpG+?=
 =?us-ascii?Q?DXNLCA7h5CG9NjbfhiYh4u7760EXYMWTHg7q+Q42kJk7/ngJwYN/ErhzTOrU?=
 =?us-ascii?Q?buOo282/FOPYLYeeDBw7jR70GfzQjgCjpF3E39/Q1FQ7F/Wj1M8gxlzsMOoH?=
 =?us-ascii?Q?9LChFbHRPRGXNs5X4svcdgLuR1RQK3g0sc6DGerlH2NDApynnVcJJPoAzexk?=
 =?us-ascii?Q?vAE28zfWQGDaurroYLYoOUckznbEtBlAWQ9Bibm2d6zofTaRqSYURDeqxNc0?=
 =?us-ascii?Q?o2fiAMQw0LCJgNkLSO52dw9wAlMMz35JdqlGXNHWPBNxv9Xe/K9OqaHDpRNP?=
 =?us-ascii?Q?YVjkfvyNilp8L7g/lpyAlja6xkGd0FkjsdXo53yhQZhGTjZwYYSPWDj4Nc2O?=
 =?us-ascii?Q?so1P1C+Z1iLBL2d7rd4en2tEzU0o2GRY084GdkwaOlyBZlTzRE1KpJXy/kRS?=
 =?us-ascii?Q?h5HIlZTcxYCal/9ARlJW3FgjHWYHDP88+b26JKMP7isBhcJ3Q3kdksN4EHbE?=
 =?us-ascii?Q?sWag6Hdj3tnWdL1pRI+7F38qj62wPgNZYIEr2rzFUD4vKskd4XLJqDrRL6vF?=
 =?us-ascii?Q?6CveEeWhbIS1K6f4sZnHqiAUHZHqJwPtmilB6jEPNukCF2w86OjTh0Spfnhh?=
 =?us-ascii?Q?6qm1mCcIKcIfFAgg3/jJlgJomz3dCUQBpN6Yar/eYWGGULWhUedXd07BvRKJ?=
 =?us-ascii?Q?IE9ZB93bFDC/wZqDJJRnffEuUUYR7QWx90exNa7BvTG1rSaXJxFC+YaIg245?=
 =?us-ascii?Q?PuYKuZGyhhsMqSZY3mGfmLIDDaENsVwJuCIG7YDRUNwThHcgHmVfWJDvc616?=
 =?us-ascii?Q?wX+wkCvOPF90ECWmlx51oqTI/JQloaMdSiBzzS8C3FcNtFN00Ig3JQkujs3Z?=
 =?us-ascii?Q?3BQvZKneE8lE3ipQRzWaOrm5bqcteE29i1Zb0HZswj2hnuygqnNyBzBCiEQw?=
 =?us-ascii?Q?3YR9Y9CtQ5lwkPzMlBXfL6cRVFV2o6Y8/4All26U3TwVDeHEVCL5hPH5AQ0o?=
 =?us-ascii?Q?/qt66sGyYv7ovDwV8yFkcHnUQT3nGz2GgNR82baMqLJQgXGfjyrYM4V2HEhD?=
 =?us-ascii?Q?wqqE7t/jlSaXFnJAl134Sk3s2T8L52MtjGWoZJO+mVJEICXYKLzB3EWwQYi6?=
 =?us-ascii?Q?rhxYdc3m88qLHAOt/PKKiyN5w2TBUDS3itmVDjvp+WsKvLdA7nH/XMQc1nmb?=
 =?us-ascii?Q?4KZ7gvrRMzxSoP4S/KtIE8D4ns4IZTKgrgwKycsMoD0SHvBIp64S9BLM7Ehb?=
 =?us-ascii?Q?gGMDZ44rkto4UG2sbaEJEzGZ7lkk58GrDQVZtdH4ZJ8El4V8c8UUNL/pinUO?=
 =?us-ascii?Q?1CS0+3MyVTH7cG5prPU9BbBrNaWUFU8vWNUax9o+/62y6CAJYizR1KkOTTKo?=
 =?us-ascii?Q?6yzVNBIEUsz/ZbwE+ad9+wJMyTCe4VT/LABe88sdR1YFfQ+CwxJnw+2NtQVg?=
 =?us-ascii?Q?2sp3XwnJV+uI0Z2c1b5ePBTAPbmbUq7MEShnGzKsqTZPZdE+52Qyjwk6dEOL?=
 =?us-ascii?Q?h6FFycSDmXF/R4Q3b54B3EPuR5wtG47C3hlR9usSUKpZPF5Ay1LYecwNqXIY?=
 =?us-ascii?Q?gbVdf+IBxblz5eXOU3lqwEWGJB8hqar8HxbUjm7HzLRmRQBqA22t5N3qDi5F?=
 =?us-ascii?Q?oQUFvQB5ZDBfChCSPjoBkUVqx5SuIwTDHZ+GKPMtOgukzADz1V6nqXRGDF1f?=
 =?us-ascii?Q?dqcFOt/ygw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e584c1d-e8b2-48e6-2342-08df29dfcfc9
X-MS-Exchange-CrossTenant-AuthSource: CH8PR12MB9815.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 10:42:15.1771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /I1sOGh6hfUdkx7LEjGn83dqoqF3Q3pl6PYlFRszJ9iC9w1/CzBgYLo6zEH592GDD4vNnajTqa2qc0GQKyP+7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6040

From: Prathamesh Shete <pshete@nvidia.com>

Tegra268 contains three pin controllers. Document their compatible strings
and describe the list of pins and functions that they provide.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
Signed-off-by: Prateek Agarwal <praagarwal@nvidia.com>
---
 .../pinctrl/nvidia,tegra268-pinmux-aon.yaml   |  78 ++++++++++
 .../nvidia,tegra268-pinmux-common.yaml        |  72 ++++++++++
 .../pinctrl/nvidia,tegra268-pinmux-main.yaml  | 136 ++++++++++++++++++
 .../pinctrl/nvidia,tegra268-pinmux-uphy.yaml  |  75 ++++++++++
 4 files changed, 361 insertions(+)
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
index 000000000000..1b276a211b02
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-common.yaml
@@ -0,0 +1,72 @@
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
+# We would typically use unevaluatedProperties here but that has the
+# downside that all the properties in the common bindings become valid
+# for all chip generations. In this case, however, we want the per-SoC
+# bindings to be able to override which of the common properties are
+# allowed, since not all pinmux generations support the same sets of
+# properties. This way, the common bindings define the format of the
+# properties but the per-SoC bindings define which of them apply to a
+# given chip.
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
2.17.1

