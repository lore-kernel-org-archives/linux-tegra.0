Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E93C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 09:42:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 387E661178
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 09:42:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231450AbhIUJoY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Sep 2021 05:44:24 -0400
Received: from mail-mw2nam10on2049.outbound.protection.outlook.com ([40.107.94.49]:26125
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231421AbhIUJoY (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Sep 2021 05:44:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NUhPQNaMs+hq7aOk4TS2Mz160ch9EqiEHMTrz7Z8V743kZt01t5GapzNB72SUerUP9Iwd9/NnsaSFDdTmHZwwC+48+fgpnDVhq5h5gRl3S50fOYlSBWaHLVj371LB6MkQavfdLyGEipXou0D0wv520eaN5mGyZAxk3MK8iGwiKa7gZsRT3Eh6f/xk0/ixjL/fUOct5XJm0O+VXnR51v80cLIKR/P7LDv9fhFy6c4vOD/iNkb/UDZ6dI3iSW7rM0pC4JLtxXeeiwkbAww8zwqsIy8fk947LvRAOPjKQ5xiOjWmjjwMxTGCloRaQzIxU4glyeBVYvrMITW5VymgL8PHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=cdL+ucw765YydZvZncLSXIWbVQBqF5vIlmC9GirlczI=;
 b=cUNbaLyUxZIkVWYZhVR3qkF3GSnsBFBCETfzgGf6xexxTEI6u3H3yEYqX5b8Cgo77VjKb+rQ2geJnvWK4S2MzYpnQo+ILAC5yt8htR5YLZoo0pnykSfVNikuB2RUzR/nGiaK88n+6VY/ncjjYFNH0Eo7rCo3GxOHbsgf4mDstfe8YgepbZsZg/GwLfo6ZaA7VpSDb7MFVFgjP1KzJFMVEdgpUJblYctm8Szz6tfGKq3QT/KZL0qO66bNH4njvRXGzkZN/qhr+43UZZYBNT3JcVtt7UTr5S+5sEVLCvUgxfQZL2/0JL2ZHQjvSU2LUdf20WtW/ECC3mClKg9L144vQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdL+ucw765YydZvZncLSXIWbVQBqF5vIlmC9GirlczI=;
 b=Gc63qcjY5bDZ+YWHSZafDmrl70Hoi5GCEsgY3fdxkCDoApZMUQ+NTxJXcTU4HHViZAjH/8jmOz7PC4JXkEK1fQOH0ZuK4atnUkNB7S2c56orfmlZs/QA5tt2CkZZUCEjGB4GNLFJx//FvmYJNKrs2luVHchRKnMBhuMaSEn1jH8qK1d5XLX+wnq4bOaXwi46L87n+vMU6EPQGczFHnGEkpeCBAbd9zO5b+gHD1jm5sOyJFu9pXnhhhjd76wx/tjeLexUOxICWd2VAjHoEwXGKF1vaTobGo4yQ0hgt5T0PXUyMt8LiR7Q2F9yKdKH9KWRSfUikm3P1rHKylzHa941Ww==
Received: from DS7PR06CA0020.namprd06.prod.outlook.com (2603:10b6:8:2a::21) by
 MN2PR12MB4517.namprd12.prod.outlook.com (2603:10b6:208:267::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 09:42:54 +0000
Received: from DM6NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2a:cafe::38) by DS7PR06CA0020.outlook.office365.com
 (2603:10b6:8:2a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Tue, 21 Sep 2021 09:42:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT015.mail.protection.outlook.com (10.13.172.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 09:42:54 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 21 Sep
 2021 09:42:53 +0000
Received: from dhcp-10-19-66-63.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 21 Sep 2021 09:42:49 +0000
From:   Bitan Biswas <bbiswas@nvidia.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        "Jonathan Hunter" <jonathanh@nvidia.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        "Ingo Molnar" <mingo@redhat.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        "Philipp Zabel" <p.zabel@pengutronix.de>
CC:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Bitan Biswas <bbiswas@nvidia.com>
Subject: [PATCH V1 3/3] dt-bindings: tegra: clock,memory,thermal: add header Copyright
Date:   Tue, 21 Sep 2021 02:42:06 -0700
Message-ID: <20210921094206.2632-4-bbiswas@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210921094206.2632-1-bbiswas@nvidia.com>
References: <20210921094206.2632-1-bbiswas@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa24e547-ef0e-4f99-ad8f-08d97ce42fbc
X-MS-TrafficTypeDiagnostic: MN2PR12MB4517:
X-Microsoft-Antispam-PRVS: <MN2PR12MB45173E7B903E4A898D42176BD7A19@MN2PR12MB4517.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DmcD4EBch5B8X112Iwt1wTFeGzusbx0rjI7zNDNKiPYjdZGD0Jai1ltvUnx2wSf60s7Q0f3CZwsfEjGN1t6v6rrxJWdL+JnbjPuzJGNfD96FtAy3X3GzdKD4K6X1J6s9TxzgKHdKBnKhgFr0XD8aCm0Ni63N9nDIf9FZq1ZYsxzcdfGbuI1ArRXuaNmf2Ap3gYHPJCu2zTcuByxfxXIjhYzLK8MbbFMaSLDJuzFHunm28iemlRejcWvCH9TtSutOuBWzE6BAxdgF/i6dsGEJHM1zwG1A+AyUFhjHjxujC0cP9hPElaOJOJO82ECVo92nUvTH7v9Kuu4lhgb0kC9lk4BF/b1EFxutVq1TWIO5aOk4BuFOJy2kOfeFK5UwRg0YZxN+MBKn8LIcW5AIiEJfxrNYNNZWAj3gpZkpuRJP6ADdtbwjbN+P950YbYjpTELHI/7rkYDUG085xWP6FWzbE+CBPFl5hMsoxjZmDObxd7AUO9sRHxuwDvOkPuLtxmXmAntvB8lNxRmsQjMi9ZfjR/smXA2K2UqK0Nn4nlr6R7vSF4YQ/5m4W5e6TC9WUpb45lmIUrtps4hgP80MlPFaUQcK3RahsgTN/dXf28d75quU6dt2nHqp9qHZ3m2uxC+N/g1CnafuD9mqVLmhPNvcNJEmkiOtNRd/VjpVuj6pbUq3S5oTvUVQ4Ivt2ChMJJgTtdIl7ViDMQ27YnQw6mNczQ==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(316002)(70206006)(82310400003)(36756003)(508600001)(186003)(70586007)(26005)(54906003)(5660300002)(107886003)(426003)(8936002)(110136005)(6666004)(356005)(36906005)(7416002)(86362001)(47076005)(7696005)(336012)(1076003)(4326008)(8676002)(30864003)(83380400001)(7636003)(36860700001)(2906002)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 09:42:54.3818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa24e547-ef0e-4f99-ad8f-08d97ce42fbc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4517
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

