Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B9FC432BE
	for <linux-tegra@archiver.kernel.org>; Mon, 30 Aug 2021 09:54:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 404C66105A
	for <linux-tegra@archiver.kernel.org>; Mon, 30 Aug 2021 09:54:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbhH3Jze (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 30 Aug 2021 05:55:34 -0400
Received: from mail-dm6nam10on2063.outbound.protection.outlook.com ([40.107.93.63]:62560
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235758AbhH3Jze (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 30 Aug 2021 05:55:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MKcH4vVR3Mmw5R1gpzIxLrDnDvw8Bkl4Y5t96TDUNC9WJxcZMxhexynjVL/mszMG+i5y9aTFMYr7NeOGjadrDIrx76r8+W3k6hTBfCWKFQUWeU8HiYUPil3qsKb81uhBFDgwkr0aZq/B5xyZeluxJq4MdOplil52lpSf6Dh/+YWY0iMFrgzK9JMkZDmAMWftMbPy4TCa2p5bpypW7DJRJ4l6RR+cdo3GogjQPtLVLCN8KGWLd8N7hriJK9RkmjS6P/vhvACksZWBrkLo+yKb2KI0McqI3e0Q4Uw2/FOdFZlXEL7KWCESPuMwdOEMqMekJJir0yWIjy2f7SPtn0UHtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s47QFcFmSRPiolz2fjDz2yIY91VrxZQ1u5Adv/EuPIA=;
 b=HdYLEscxUlekCCyNF+TqoKICR4OQj0B5F/mo/oE7CNF0oPch4Fm0Zm0az6WEQ5qHuChCpZPiOHdTYzGPf6S5+n0TfEtaKbj01JzmUJPDsoYHIoIDuOB39cTGmZVstsRsMUyPU/Rj98k4nmIkC2HRVHJ4faIzujSTLry3jkcYNLWalYgF/uBCfS3YR2HkzudVl+/1voz64AmgG6WBySbFEOp9NIBtJVvIVX+tF88aJSiYsOGOuuQDvdsH1iIneyOrJq44gmCse0Zsos+avEVd8pK0Dv2iOlghE7NMFyztQI/5WsUBTxICap4ChtjFFcTR3LmWyWpr3TVTEbugP59rsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s47QFcFmSRPiolz2fjDz2yIY91VrxZQ1u5Adv/EuPIA=;
 b=ll1hWq/anvI9sSxmob7H1O3tVrkuaG04YhZFnwPuRx9HBToFoQiKnt3GESzlOfwzbZKEtjq+7eK5HyBxNiDvEKRK5bXRTUbP6hIj8VAkNs8q/McEWVwHywiXJMZMQ2ssAfKf9gtaXLS7TvgW8on5ZqJaMaqR3pAtzfnqQoXmXRwo24WUpeyC4R3CxAckTgRLfkpqUKO0StNuY/h/aC+w+oplSV/WmxPsAcTRScgBMHOSTE0wphVlpbRkTXlikwB1S/BI8OsX3GqlDSOJyyz5r1Yds2bT3LGTFJD11A7hshS8gumcmaMTxQE5kba0F06enoPV+5CAHFb/Ue5iczHIFg==
Received: from MWHPR11CA0040.namprd11.prod.outlook.com (2603:10b6:300:115::26)
 by MN2PR12MB3182.namprd12.prod.outlook.com (2603:10b6:208:107::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18; Mon, 30 Aug
 2021 09:54:39 +0000
Received: from CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:115:cafe::19) by MWHPR11CA0040.outlook.office365.com
 (2603:10b6:300:115::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Mon, 30 Aug 2021 09:54:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT046.mail.protection.outlook.com (10.13.174.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Mon, 30 Aug 2021 09:54:38 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 30 Aug
 2021 02:54:38 -0700
Received: from pshete-ubuntu.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 30 Aug 2021 09:54:37 +0000
From:   Prathamesh Shete <pshete@nvidia.com>
To:     <linux-tegra@vger.kernel.org>
Subject: [PATCH] gpio: tegra: add multiple interrupt support
Date:   Mon, 30 Aug 2021 15:24:34 +0530
Message-ID: <20210830095434.22098-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33e46062-0c7b-43ba-1f9b-08d96b9c2e9f
X-MS-TrafficTypeDiagnostic: MN2PR12MB3182:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3182AE419DFE5E113A2E2346B7CB9@MN2PR12MB3182.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wu5MU+/1tU+vmkmkPtMUe9RUyxjWVTek3B0QPaNuH5u7TtonLq+ekxVI+Y7GbStj3z+gqOQU77t5pfE/k6cBvIk2FwzFy0WK8okYsytQ9lXaEJmfx/T4+WmL9awNhc1B0N5u9uj+YtK58WTLlPWztsnabrPSMmrmG5GhLzS6cvCa+pqVqAMBdYBSni0jmau4o44gMgIYx7TY15tvZ18uWjoCcD9n/oT74dpWLu9OFOBuo7yk/2o14lnF580hpCz/0DwRc/Q2uqOJY89DGCekBESN0TU+B04WbDuyhsb2W3fYHHL3oYBL5hfSxzRo9UrvKHWKYkHlSDMEYCN0iNRN1ci3rszSsO4f0b/NVGqEuhCik9o9bOtfdbriUePNUuLEg9vnX3SJI3LXMAm5BejfJnKCNnJA/rpOchr/U6P+ueED2be+45M6NCO3FA6/yxdyoGi2c0wAq5P9+l5g3hIEAhCmPQyir+hHaU2JzpZX3BsoycBC9zgb53zRLu+gFwM5boU12KtEGuxNgkExyYOC/bQA6bYBaItnocQFKMHdHKKSiHG/rpRtPOYRB40uq9H/cxDc4+Z+5PACoCMF1VzHTCZnTGU/EGuNRJXQ2dkHjAc/Nrs6CWkYtiSxQkHc7xtn38IewISYL9es2eHT7QHeiDL31cp0bAo3n/mrXoFG0G6NV3pm+W92rNKPG6teoesech1C2hmrq0ox8sX9p5pWWA==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(39860400002)(36840700001)(46966006)(7636003)(8676002)(426003)(6916009)(83380400001)(5660300002)(82740400003)(478600001)(2616005)(2906002)(82310400003)(316002)(186003)(36860700001)(336012)(7696005)(70206006)(26005)(36756003)(70586007)(47076005)(6666004)(8936002)(86362001)(356005)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 09:54:38.9736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e46062-0c7b-43ba-1f9b-08d96b9c2e9f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3182
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: pshete <pshete@nvidia.com>

T19x GPIO controller's support multiple interrupts. The GPIO
controller is capable to route 8 interrupts per controller in
case of NON-AON GPIO's and 4 interrupts per controller in AON GPIO.

Signed-off-by: pshete <pshete@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 49 +++++++++++++++++++++++-
 drivers/gpio/gpio-tegra186.c             | 25 ++++++++++--
 2 files changed, 68 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index b7d532841390..c681a79c44ec 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -34,11 +34,53 @@
 			reg = <0x2200000 0x10000>,
 			      <0x2210000 0x10000>;
 			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 291 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
 			#gpio-cells = <2>;
@@ -1273,7 +1315,10 @@
 			reg-names = "security", "gpio";
 			reg = <0xc2f0000 0x1000>,
 			      <0xc2f1000 0x1000>;
-			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index d38980b9923a..36bd8de6d401 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2016-2017 NVIDIA Corporation
+ * Copyright (c) 2016-2021 NVIDIA Corporation
  *
  * Author: Thierry Reding <treding@nvidia.com>
  */
@@ -68,6 +68,7 @@ struct tegra_gpio_soc {
 	unsigned int num_ports;
 	const char *name;
 	unsigned int instance;
+	bool multi_ints;
 
 	const struct tegra186_pin_range *pin_ranges;
 	unsigned int num_pin_ranges;
@@ -451,6 +452,7 @@ static void tegra186_gpio_irq(struct irq_desc *desc)
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int parent = irq_desc_get_irq(desc);
 	unsigned int i, offset = 0;
+	int j, flag;
 
 	chained_irq_enter(chip, desc);
 
@@ -462,9 +464,20 @@ static void tegra186_gpio_irq(struct irq_desc *desc)
 
 		base = gpio->base + port->bank * 0x1000 + port->port * 0x200;
 
-		/* skip ports that are not associated with this bank */
-		if (parent != gpio->irq[port->bank])
-			goto skip;
+		if (!gpio->soc->multi_ints) {
+			/* skip ports that are not associated with this bank */
+			if (parent != gpio->irq[port->bank])
+				goto skip;
+
+		} else {
+			flag = 0;
+			for (j = 0; j < 8; j++) {
+				if (parent != gpio->irq[(port->bank * 8) + j])
+					flag++;
+			}
+			if (!(flag & 0xF))
+				goto skip;
+		}
 
 		value = readl(base + TEGRA186_GPIO_INTERRUPT_STATUS(1));
 
@@ -772,6 +785,7 @@ static const struct tegra_gpio_soc tegra186_main_soc = {
 	.ports = tegra186_main_ports,
 	.name = "tegra186-gpio",
 	.instance = 0,
+	.multi_ints = false,
 };
 
 #define TEGRA186_AON_GPIO_PORT(_name, _bank, _port, _pins)	\
@@ -798,6 +812,7 @@ static const struct tegra_gpio_soc tegra186_aon_soc = {
 	.ports = tegra186_aon_ports,
 	.name = "tegra186-gpio-aon",
 	.instance = 1,
+	.multi_ints = false,
 };
 
 #define TEGRA194_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
@@ -852,6 +867,7 @@ static const struct tegra_gpio_soc tegra194_main_soc = {
 	.num_pin_ranges = ARRAY_SIZE(tegra194_main_pin_ranges),
 	.pin_ranges = tegra194_main_pin_ranges,
 	.pinmux = "nvidia,tegra194-pinmux",
+	.multi_ints = true,
 };
 
 #define TEGRA194_AON_GPIO_PORT(_name, _bank, _port, _pins)	\
@@ -875,6 +891,7 @@ static const struct tegra_gpio_soc tegra194_aon_soc = {
 	.ports = tegra194_aon_ports,
 	.name = "tegra194-gpio-aon",
 	.instance = 1,
+	.multi_ints = true,
 };
 
 static const struct of_device_id tegra186_gpio_of_match[] = {
-- 
2.17.1

