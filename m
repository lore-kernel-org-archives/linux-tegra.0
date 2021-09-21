Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C205BC433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 17:45:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC02761242
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 17:45:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231669AbhIURqp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Sep 2021 13:46:45 -0400
Received: from mail-bn8nam11on2073.outbound.protection.outlook.com ([40.107.236.73]:3936
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231321AbhIURqn (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Sep 2021 13:46:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXAHuCFXJWv1BfrLVbp72OYe2oFDXR8BBaJM2kflM3eEUyubJlw7egPTxbwDGncVOGGgjZc+0bpQc/NaGKVBhylURaN4T2vtNtWCgEEIIErsqbvnoITqwSxvYN18CSxjGrnN3kwhUJiE4w8+QUY7Q6G7w2GEDjXO7uJ67LdpOTjfoTO/e/TfFC/vhiQbqSGWy8x7LXN7nU52dTvCrd1ZsKN6VLhWsNQmAUPoy7Ztx9Dbd1M9qgB/SKi1E0w8DJzA73odBR8knKnsdnXXdGRRAfCxp7idh9CqQT28RwyMOWC6NUGF5VXo/c/ncA4a+y9Pg9pSEbE8/ebYnACBsXv0Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=cdL+ucw765YydZvZncLSXIWbVQBqF5vIlmC9GirlczI=;
 b=EyfXzalAAdEvzQBCAfjQBI0Z1d+uufOSvaibpo/oUHNwEWYbNTXmC+uzWadtsjv9QSktnEBkX6EqLEOtU6z5yEWHPgpfTylNpJLYiiQlfH8hG8RTR0dzvb5j91n36i1cHxu6LcIj3bNEPQoLpGQcS+D7lecsVTrt5bieCr4bCaJ0JYNUwUa/m0OIKwNa6VayS9OYbIqymVcHbLWo6WHHJkQfyUfLgwihkylOAYOR83Yvg6jfPAsryBIFG6vz6TCLBiW6Y9JxsDMo5zP621zfv1thTPELYZET0iJ42JCI+Em7UScSSBece/RsV/an1oa/qvHWv4h9Z+Vw/9tQzj5mYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdL+ucw765YydZvZncLSXIWbVQBqF5vIlmC9GirlczI=;
 b=Yv9tBPBrlAK3rHLFU7+z15PgiQSXsImuSeNf2IC+NeJAgARy7gUJ/E5mf3m70x6jkYpz7cQu4IO8BqN4M4ypRNOvwYtZybxMsrYLQPiBDaAORAKJVDE2WKGJ0zyFmeUT6SztSfR0lJ9kByAekBCmXsrNAn+iyr6AU9/YGhWaXR5e8n9Jl2PL2eW2IXdG5w3Iep3meqlVFrpj33LFpAkNJ6TRwQVpruJjZqKisXcpQhhH1I2izcM56MwstlQgpm5nByOFqNxAWoJvS4cMyQMxUVEFvRUsK2lHkc8Szj/flxhbUoltGIuRD4Ei3urotTykl+UjB86ln5iIwkgsOHvQ8g==
Received: from CO2PR04CA0063.namprd04.prod.outlook.com (2603:10b6:102:1::31)
 by MWHPR12MB1566.namprd12.prod.outlook.com (2603:10b6:301:11::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 17:45:12 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:102:1:cafe::50) by CO2PR04CA0063.outlook.office365.com
 (2603:10b6:102:1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Tue, 21 Sep 2021 17:45:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 17:45:11 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 21 Sep
 2021 17:45:10 +0000
Received: from dhcp-10-19-66-63.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 21 Sep 2021 17:45:07 +0000
From:   Bitan Biswas <bbiswas@nvidia.com>
To:     <krzysztof.kozlowski@canonical.com>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <rostedt@goodmis.org>, <mingo@redhat.com>,
        <jassisinghbrar@gmail.com>, <p.zabel@pengutronix.de>
CC:     <skomatineni@nvidia.com>, <broonie@kernel.org>,
        <linus.walleij@linaro.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Bitan Biswas <bbiswas@nvidia.com>
Subject: [PATCH V1 3/3] dt-bindings: tegra: clock,memory,thermal: add header Copyright
Date:   Tue, 21 Sep 2021 10:44:34 -0700
Message-ID: <20210921174434.4839-4-bbiswas@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210921174434.4839-1-bbiswas@nvidia.com>
References: <20210921174434.4839-1-bbiswas@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fc6e235-676d-4fa0-db4a-08d97d278fcc
X-MS-TrafficTypeDiagnostic: MWHPR12MB1566:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1566637338E4A18FB9B6814FD7A19@MWHPR12MB1566.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1UN0zobwvS1i3/UpJkAmW45iydH574M5gR5kic1rSRvJRIsumNRQ3E+owBNdcH0iIlTgrzilBRrh2VfYbQyqkrjFLTqjrOOC0E3Nd7ENiV/599RCTrJjqY25X8zX0rNZx5XBq+OwoGYW7mn8cgBtTNpUp3TzgSx5SXqOFCsafQpK+2BXBpM/s4p6qNaYOtjhoXkRbCUMn0Lr+Z+leYSJTE52uFIo4whPRxBGIJJjRXQK5Ba1YjjUyNvY8nn7RloFK03/UjHDSxnbpJ1mjGxh5VyiXqSKSmn7MLkyqKHWRU87CQID/6P8zJVJNY2yvEeBEd3fwE+UT/dKFP+xXrAHZ2mO15mBwuVd5ewEWGgknkNwsO5YL/FMxQ+gpg2NExZJn1cC3ltgUmCpZ3O6TBvpLKwazlWgOqHjIKj+pqAtmEiQGQBqm6JspNsshfU28/WzHDZKRHFW7qErh9hjWoZj35L06YNuytiPDKPbcRHu3BQv28HznpNC1FfM11luVv3pOjEoZ1Z59juYvosIJzeTxwXMpT0JVL+fAL3ElVRbYyGWL3FDf9XwdC/REajTrKqzYhcu3LRtapHlmyCejZ7AWVIR9+TCLjsVVflv4dcVr0vMQO9JKIF3Uz270gmvb1IOlOYMY5ix47d0ZzA8OjM5+HB8UdCf4XXia95bwk802TDx7L+Eq6NKdaG35uYnWNk3d1I0pryMuZ6owRlPHzTJsg==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid04.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70586007)(2906002)(26005)(336012)(7416002)(70206006)(30864003)(186003)(8676002)(5660300002)(36756003)(426003)(8936002)(86362001)(7636003)(356005)(2616005)(47076005)(4326008)(1076003)(83380400001)(508600001)(36860700001)(110136005)(6666004)(54906003)(82310400003)(107886003)(7696005)(36906005)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 17:45:11.5322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fc6e235-676d-4fa0-db4a-08d97d278fcc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1566
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add Copyright for below Tegra dt-bindings headers:
1. clock
2. gpio
3. mailbox
4. memory
5. thermal
6. reset
7. pinctrl

Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
---
 include/dt-bindings/clock/tegra114-car.h            | 4 ++++
 include/dt-bindings/clock/tegra124-car-common.h     | 4 ++++
 include/dt-bindings/clock/tegra124-car.h            | 4 ++++
 include/dt-bindings/clock/tegra186-clock.h          | 6 ++++++
 include/dt-bindings/clock/tegra20-car.h             | 4 ++++
 include/dt-bindings/clock/tegra210-car.h            | 4 ++++
 include/dt-bindings/clock/tegra30-car.h             | 4 ++++
 include/dt-bindings/gpio/tegra-gpio.h               | 4 ++++
 include/dt-bindings/gpio/tegra186-gpio.h            | 4 ++++
 include/dt-bindings/mailbox/tegra186-hsp.h          | 4 ++++
 include/dt-bindings/memory/tegra114-mc.h            | 6 ++++++
 include/dt-bindings/memory/tegra124-mc.h            | 6 ++++++
 include/dt-bindings/memory/tegra186-mc.h            | 6 ++++++
 include/dt-bindings/memory/tegra194-mc.h            | 6 ++++++
 include/dt-bindings/memory/tegra210-mc.h            | 6 ++++++
 include/dt-bindings/memory/tegra30-mc.h             | 6 ++++++
 include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h    | 6 ++++++
 include/dt-bindings/reset/tegra124-car.h            | 4 ++++
 include/dt-bindings/reset/tegra210-car.h            | 4 ++++
 include/dt-bindings/thermal/tegra124-soctherm.h     | 4 ++++
 include/dt-bindings/thermal/tegra186-bpmp-thermal.h | 4 ++++
 include/dt-bindings/thermal/tegra194-bpmp-thermal.h | 4 ++++
 22 files changed, 104 insertions(+)

diff --git a/include/dt-bindings/clock/tegra114-car.h b/include/dt-bindings/clock/tegra114-car.h
index a93426f008ac..baff21e53a7d 100644
--- a/include/dt-bindings/clock/tegra114-car.h
+++ b/include/dt-bindings/clock/tegra114-car.h
@@ -1,5 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
+ * Copyright (c) 2013-2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ *
+ * Author: Hiroshi Doyu <hdoyu@nvidia.com>
+ *
  * This header provides constants for binding nvidia,tegra114-car.
  *
  * The first 160 clocks are numbered to match the bits in the CAR's CLK_OUT_ENB
diff --git a/include/dt-bindings/clock/tegra124-car-common.h b/include/dt-bindings/clock/tegra124-car-common.h
index c59f9de01b4d..67fd0310284a 100644
--- a/include/dt-bindings/clock/tegra124-car-common.h
+++ b/include/dt-bindings/clock/tegra124-car-common.h
@@ -1,5 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
+ * Copyright (c) 2015-2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ *
+ * Author: Paul Walmsley <paul@pwsan.com>
+ *
  * This header provides constants for binding nvidia,tegra124-car or
  * nvidia,tegra132-car.
  *
diff --git a/include/dt-bindings/clock/tegra124-car.h b/include/dt-bindings/clock/tegra124-car.h
index c520ee231950..65cbc62ae1bb 100644
--- a/include/dt-bindings/clock/tegra124-car.h
+++ b/include/dt-bindings/clock/tegra124-car.h
@@ -1,5 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
+ * Copyright (c) 2013-2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ *
+ * Author: Peter De Schrijver <pdeschrijver@nvidia.com>
+ *
  * This header provides Tegra124-specific constants for binding
  * nvidia,tegra124-car.
  */
diff --git a/include/dt-bindings/clock/tegra186-clock.h b/include/dt-bindings/clock/tegra186-clock.h
index d6b525f4566f..10ef3eda17f6 100644
--- a/include/dt-bindings/clock/tegra186-clock.h
+++ b/include/dt-bindings/clock/tegra186-clock.h
@@ -1,4 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2016-2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ *
+ * Author: Joseph Lo <josephl@nvidia.com>
+ *
+ */
 /** @file */
 
 #ifndef _MACH_T186_CLK_T186_H
diff --git a/include/dt-bindings/clock/tegra20-car.h b/include/dt-bindings/clock/tegra20-car.h
index fe541f627965..85b3930bcae7 100644
--- a/include/dt-bindings/clock/tegra20-car.h
+++ b/include/dt-bindings/clock/tegra20-car.h
@@ -1,5 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
+ * Copyright (c) 2013-2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ *
+ * Author: Hiroshi Doyu <hdoyu@nvidia.com>
+ *
  * This header provides constants for binding nvidia,tegra20-car.
  *
  * The first 96 clocks are numbered to match the bits in the CAR's CLK_OUT_ENB
diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
index 9cfcc3baa52c..34cd79c35b36 100644
--- a/include/dt-bindings/clock/tegra210-car.h
+++ b/include/dt-bindings/clock/tegra210-car.h
@@ -1,5 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
+ * Copyright (c) 2015-2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ *
+ * Author: Thierry Reding <treding@nvidia.com>
+ *
  * This header provides constants for binding nvidia,tegra210-car.
  *
  * The first 224 clocks are numbered to match the bits in the CAR's CLK_OUT_ENB
diff --git a/include/dt-bindings/clock/tegra30-car.h b/include/dt-bindings/clock/tegra30-car.h
index f193663e6f28..707f2de4f0b1 100644
--- a/include/dt-bindings/clock/tegra30-car.h
+++ b/include/dt-bindings/clock/tegra30-car.h
@@ -1,5 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
+ * Copyright (c) 2013-2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ *
+ * Author: Hiroshi Doyu <hdoyu@nvidia.com>
+ *
  * This header provides constants for binding nvidia,tegra30-car.
  *
  * The first 130 clocks are numbered to match the bits in the CAR's CLK_OUT_ENB
diff --git a/include/dt-bindings/gpio/tegra-gpio.h b/include/dt-bindings/gpio/tegra-gpio.h
index 7625dbc577c2..bf62c1194ae2 100644
--- a/include/dt-bindings/gpio/tegra-gpio.h
+++ b/include/dt-bindings/gpio/tegra-gpio.h
@@ -1,5 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
+ * Copyright (c) 2013-2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ *
+ * Author: Stephen Warren <swarren@nvidia.com>
+ *
  * This header provides constants for binding nvidia,tegra*-gpio.
  *
  * The first cell in Tegra's GPIO specifier is the GPIO ID. The macros below
diff --git a/include/dt-bindings/gpio/tegra186-gpio.h b/include/dt-bindings/gpio/tegra186-gpio.h
index af0d9583be70..5e08cb581a00 100644
--- a/include/dt-bindings/gpio/tegra186-gpio.h
+++ b/include/dt-bindings/gpio/tegra186-gpio.h
@@ -1,5 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
+ * Copyright (c) 2016-2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ *
+ * Author: Stephen Warren <swarren@nvidia.com>
+ *
  * This header provides constants for binding nvidia,tegra186-gpio*.
  *
  * The first cell in Tegra's GPIO specifier is the GPIO ID. The macros below
diff --git a/include/dt-bindings/mailbox/tegra186-hsp.h b/include/dt-bindings/mailbox/tegra186-hsp.h
index 3bdec7a84d35..dbfeab92068b 100644
--- a/include/dt-bindings/mailbox/tegra186-hsp.h
+++ b/include/dt-bindings/mailbox/tegra186-hsp.h
@@ -1,5 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
+ * Copyright (c) 2016-2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ *
+ * Author: Joseph Lo <josephl@nvidia.com>
+ *
  * This header provides constants for binding nvidia,tegra186-hsp.
  */
 
diff --git a/include/dt-bindings/memory/tegra114-mc.h b/include/dt-bindings/memory/tegra114-mc.h
index dfe99c8a5ba5..1a2d16853847 100644
--- a/include/dt-bindings/memory/tegra114-mc.h
+++ b/include/dt-bindings/memory/tegra114-mc.h
@@ -1,4 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2014-2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ *
+ * Author: Thierry Reding <treding@nvidia.com>
+ *
+ */
 #ifndef DT_BINDINGS_MEMORY_TEGRA114_MC_H
 #define DT_BINDINGS_MEMORY_TEGRA114_MC_H
 
diff --git a/include/dt-bindings/memory/tegra124-mc.h b/include/dt-bindings/memory/tegra124-mc.h
index 7e73bb400eca..8a7abf2325b6 100644
--- a/include/dt-bindings/memory/tegra124-mc.h
+++ b/include/dt-bindings/memory/tegra124-mc.h
@@ -1,4 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2014-2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ *
+ * Author: Thierry Reding <treding@nvidia.com>
+ *
+ */
 #ifndef DT_BINDINGS_MEMORY_TEGRA124_MC_H
 #define DT_BINDINGS_MEMORY_TEGRA124_MC_H
 
diff --git a/include/dt-bindings/memory/tegra186-mc.h b/include/dt-bindings/memory/tegra186-mc.h
index be313d3790ae..283ea29bf426 100644
--- a/include/dt-bindings/memory/tegra186-mc.h
+++ b/include/dt-bindings/memory/tegra186-mc.h
@@ -1,4 +1,10 @@
 /* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2017-2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ *
+ * Author: Thierry Reding <treding@nvidia.com>
+ *
+ */
 #ifndef DT_BINDINGS_MEMORY_TEGRA186_MC_H
 #define DT_BINDINGS_MEMORY_TEGRA186_MC_H
 
diff --git a/include/dt-bindings/memory/tegra194-mc.h b/include/dt-bindings/memory/tegra194-mc.h
index 16bb62bf8166..30182fd94f0f 100644
--- a/include/dt-bindings/memory/tegra194-mc.h
+++ b/include/dt-bindings/memory/tegra194-mc.h
@@ -1,4 +1,10 @@
 /* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2020-2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ *
+ * Author: Thierry Reding <treding@nvidia.com>
+ *
+ */
 #ifndef DT_BINDINGS_MEMORY_TEGRA194_MC_H
 #define DT_BINDINGS_MEMORY_TEGRA194_MC_H
 
diff --git a/include/dt-bindings/memory/tegra210-mc.h b/include/dt-bindings/memory/tegra210-mc.h
index 5e082547f179..c4e3ba88f77b 100644
--- a/include/dt-bindings/memory/tegra210-mc.h
+++ b/include/dt-bindings/memory/tegra210-mc.h
@@ -1,4 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2015-2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ *
+ * Author: Thierry Reding <treding@nvidia.com>
+ *
+ */
 #ifndef DT_BINDINGS_MEMORY_TEGRA210_MC_H
 #define DT_BINDINGS_MEMORY_TEGRA210_MC_H
 
diff --git a/include/dt-bindings/memory/tegra30-mc.h b/include/dt-bindings/memory/tegra30-mc.h
index 930f708aca17..4972cf7e3cf2 100644
--- a/include/dt-bindings/memory/tegra30-mc.h
+++ b/include/dt-bindings/memory/tegra30-mc.h
@@ -1,4 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2014-2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ *
+ * Author: Thierry Reding <treding@nvidia.com>
+ *
+ */
 #ifndef DT_BINDINGS_MEMORY_TEGRA30_MC_H
 #define DT_BINDINGS_MEMORY_TEGRA30_MC_H
 
diff --git a/include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h b/include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h
index ac63c399b4b6..a3ee0772fa36 100644
--- a/include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h
+++ b/include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h
@@ -1,4 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2014-2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ *
+ * Author: Thierry Reding <treding@nvidia.com>
+ *
+ */
 #ifndef _DT_BINDINGS_PINCTRL_TEGRA_XUSB_H
 #define _DT_BINDINGS_PINCTRL_TEGRA_XUSB_H 1
 
diff --git a/include/dt-bindings/reset/tegra124-car.h b/include/dt-bindings/reset/tegra124-car.h
index 97d2f3db82bf..7e050ccad994 100644
--- a/include/dt-bindings/reset/tegra124-car.h
+++ b/include/dt-bindings/reset/tegra124-car.h
@@ -1,5 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
+ * Copyright (c) 2015-2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ *
+ * Author: Paul Walmsley <pwalmsley@nvidia.com>
+ *
  * This header provides Tegra124-specific constants for binding
  * nvidia,tegra124-car.
  */
diff --git a/include/dt-bindings/reset/tegra210-car.h b/include/dt-bindings/reset/tegra210-car.h
index 9dc84ec76301..70388558fb6c 100644
--- a/include/dt-bindings/reset/tegra210-car.h
+++ b/include/dt-bindings/reset/tegra210-car.h
@@ -1,5 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
+ * Copyright (c) 2017-2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ *
+ * Author: Peter De Schrijver <pdeschrijver@nvidia.com>
+ *
  * This header provides Tegra210-specific constants for binding
  * nvidia,tegra210-car.
  */
diff --git a/include/dt-bindings/thermal/tegra124-soctherm.h b/include/dt-bindings/thermal/tegra124-soctherm.h
index 444c7bdde146..9eae79d61b6d 100644
--- a/include/dt-bindings/thermal/tegra124-soctherm.h
+++ b/include/dt-bindings/thermal/tegra124-soctherm.h
@@ -1,5 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
+ * Copyright (c) 2014-2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ *
+ * Author: Mikko Perttunen <mperttunen@nvidia.com>
+ *
  * This header provides constants for binding nvidia,tegra124-soctherm.
  */
 
diff --git a/include/dt-bindings/thermal/tegra186-bpmp-thermal.h b/include/dt-bindings/thermal/tegra186-bpmp-thermal.h
index fe9f5043c7b9..77e98b083424 100644
--- a/include/dt-bindings/thermal/tegra186-bpmp-thermal.h
+++ b/include/dt-bindings/thermal/tegra186-bpmp-thermal.h
@@ -1,5 +1,9 @@
 /* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
 /*
+ * Copyright (c) 2017-2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ *
+ * Author: Mikko Perttunen <mperttunen@nvidia.com>
+ *
  * This header provides constants for binding nvidia,tegra186-bpmp-thermal.
  */
 
diff --git a/include/dt-bindings/thermal/tegra194-bpmp-thermal.h b/include/dt-bindings/thermal/tegra194-bpmp-thermal.h
index debea44bf115..fdaf5f3af2b2 100644
--- a/include/dt-bindings/thermal/tegra194-bpmp-thermal.h
+++ b/include/dt-bindings/thermal/tegra194-bpmp-thermal.h
@@ -1,5 +1,9 @@
 /* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
 /*
+ * Copyright (c) 2018-2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ *
+ * Author: Thierry Reding <treding@nvidia.com>
+ *
  * This header provides constants for binding nvidia,tegra194-bpmp-thermal.
  */
 
-- 
2.17.1

