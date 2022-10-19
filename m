Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D6BC43217
	for <linux-tegra@archiver.kernel.org>; Wed, 19 Oct 2022 13:43:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232900AbiJSNnl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 19 Oct 2022 09:43:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbiJSNnO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 19 Oct 2022 09:43:14 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC26AF07F0;
        Wed, 19 Oct 2022 06:29:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4kbhGZYYsp9UO8kq3xGRvcW8GXEa0eQGiMAvfo1/J+uB/xHmCjAZXwUc5/cu/7IPIQemgkn6JNBBwx9EXDUWsaJKBDOXP06d9bvWTjqDOl1Xd9e67Hx55YShun80OYKmQD5IRRRhTftSXTGVG5m0Ycdh28rWGAuF28+pu7mInXzyPuVQWmCZNxjKcfNr6mCblVprjW35jaccQEiGCUVyleVQ7zUCr5AgG2zTBd9/raePeQ6KpTnSCiEayGsBtNbj+gwILymBlHJCP1N7wxSUnIF6zbbRAV2SAIex2G1+NCJBcV78ytB6+peDXShRp6sqf1Q/DfVzihKq0pPvisKMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dRzsi3IhBRX7dHA7y4LVb5L68xgFesHcPImkzblT2w=;
 b=eP6KrZEJPmBsbgAcWcAamzZgvH8+69mx2oRs7Fx6dG6gq07mxSksaQkc8Uc/L/8TyG9De5mbmkSWOrs4ATwDcWb/Y3Efr6CDbwXR/9WQLRfcQepb1vrK12gw4XhTfWEmo2BSvLI4EPiFySuIjyWHFst9JlG3Y4lQyP3Lx3zY5DhWYRpspCdMC/U3dV+euMgdXUZ39rYJoO+YSNMRpffVNXYlmlnpuM1QrtFIBDfEnr1a8M+2SWvzXrbouSuUcfMW496iwSMYTVZoOidGnooAvb2D7raqgFKF1iCf6T4kWTmbbfwU+YaT71nY7so/UNpEpbyhqSLiwLZi0iZI1niLmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dRzsi3IhBRX7dHA7y4LVb5L68xgFesHcPImkzblT2w=;
 b=cYNJjHDxFV9Tm8O4IKQUBydpplRm+4JTs3Lz1heWBZb/cqxvpp7ASL7zEW0KUBUWgB7cRxsgMwivNxmO0km3t08fc4IuNW7vTkn9t9x24a0bG8PK3XhTNJtPESllQgzw5Idv7USdKoS8W8oVFRZJcmzUmZ5abkA9KudNuYs/t4oAU+A3WqBXGZb9inW46CoTt2T6ltQdlFNis8Z2slSUqoFezyIWwqaPsfv+7PH96QaNm9Zy/jf2JCw+/7a7aw8CpxjSrFu0DJ61drziGgN0S6E7dcg13VHf+Ics8wOSkw8KFFOyAJ9vzM61uGWtdvJiG8KSWCvGAJf+BvEYN154tw==
Received: from MW4PR03CA0125.namprd03.prod.outlook.com (2603:10b6:303:8c::10)
 by PH7PR12MB6441.namprd12.prod.outlook.com (2603:10b6:510:1fb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Wed, 19 Oct
 2022 13:29:25 +0000
Received: from CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::25) by MW4PR03CA0125.outlook.office365.com
 (2603:10b6:303:8c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32 via Frontend
 Transport; Wed, 19 Oct 2022 13:29:25 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=nvidia.com;
Received-SPF: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
Received: from mail.nvidia.com (216.228.117.161) by
 CO1NAM11FT047.mail.protection.outlook.com (10.13.174.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Wed, 19 Oct 2022 13:29:24 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Wed, 19 Oct
 2022 06:29:10 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 19 Oct
 2022 06:29:10 -0700
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Wed, 19 Oct 2022 06:29:08 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 1/2] arm64: tegra: Populate Tegra234 PWMs
Date:   Wed, 19 Oct 2022 14:29:02 +0100
Message-ID: <20221019132903.157703-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT047:EE_|PH7PR12MB6441:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ebaa15a-c3ac-4bf6-b1ec-08dab1d5f0ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uiie14VdbcLwcoPBuxSiUjvGlSQkSko7Nmws6js4juyqlzsRq5n2I3vxTtNrVgj1IALPof6CmXIlp3yF8gzdSy6SRpa0mHWfLA4Q+h55sQ35hvo38kuStNxwW8keEUQ5LYf/LSsARIOQvAxFGOeRyFpN4/w1O7SfrAMuaPW2ls28JfhGNdrJVff9CjNItGB0MPNsXhUDUdZu9VmdIwQ0Yc/ei351rlEdVEZqDg0mtsi49PQ5E4BPzTQlu38rsNGOjswkiOjASKPG3QA9XzyQlgKVrhiSxFCR/fT7jfrukmflbnOPMxLnez4wuuMNKklP54qgCRJYq9+ODIFCDvxGcIFr7cqUVSQEoIIvkZ7XjwYNNl2TSV+LO9X+MxjIFTb1TkaowDI3oucf3szsHQzNERki/xTz5PK7OLMmh64GysWwY4kBQHU5vKky2faws3JbQ43H2zDtlyZGP2dLeyYEbO181zsY5GrWF6t0T2lmCye8paU9wns8A6UmJ3lnwzP/3zBPMSy9K1V2QKTUeCah2vBY2EGZrpxgvScEVRtgcOVkCHz89xc3+u03Q7s28JjtCBRgHB2o3hSUpBKfdVIUR9iiJtuTMsojlZVDhN3rmS7XLo04FC38v7qiwlGpRIySpHmCeZyqrURludaqu9mnWsva8dmgNZigFbOP+v5WI4kpT94HvK3W4h7TZNf/uUtTfHDSLuU6cckB+ZH1yMt6fTZD9+7QYotes2g5b5N6sbG+VS7MwaalFf/Wfm41jpjkAIhAY86bevD8i22D7pXpSQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199015)(46966006)(40470700004)(36840700001)(40480700001)(47076005)(7636003)(356005)(82310400005)(316002)(86362001)(40460700003)(41300700001)(8676002)(82740400003)(26005)(4326008)(7696005)(8936002)(36756003)(107886003)(478600001)(70206006)(6666004)(70586007)(36860700001)(54906003)(5660300002)(110136005)(1076003)(186003)(336012)(2616005)(83380400001)(2906002)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 13:29:24.8471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ebaa15a-c3ac-4bf6-b1ec-08dab1d5f0ac
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6441
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Populate all the PWM devices for Tegra234. Finally, update the
compatible string for the existing 'pwm1' node to just be 'tegra194-pwm'
and remove the fallback to 'tegra186-pwm', which aligns with the
binding documentation.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 80 +++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 499102ce5bd0..a68be5a0771b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -870,8 +870,7 @@ spi@3270000 {
 		};
 
 		pwm1: pwm@3280000 {
-			compatible = "nvidia,tegra194-pwm",
-				     "nvidia,tegra186-pwm";
+			compatible = "nvidia,tegra194-pwm";
 			reg = <0x3280000 0x10000>;
 			clocks = <&bpmp TEGRA234_CLK_PWM1>;
 			clock-names = "pwm";
@@ -881,6 +880,72 @@ pwm1: pwm@3280000 {
 			#pwm-cells = <2>;
 		};
 
+		pwm2: pwm@3290000 {
+			compatible = "nvidia,tegra194-pwm";
+			reg = <0x3290000 0x10000>;
+			clocks = <&bpmp TEGRA234_CLK_PWM2>;
+			clock-names = "pwm";
+			resets = <&bpmp TEGRA234_RESET_PWM2>;
+			reset-names = "pwm";
+			status = "disabled";
+			#pwm-cells = <2>;
+		};
+
+		pwm3: pwm@32a0000 {
+			compatible = "nvidia,tegra194-pwm";
+			reg = <0x32a0000 0x10000>;
+			clocks = <&bpmp TEGRA234_CLK_PWM3>;
+			clock-names = "pwm";
+			resets = <&bpmp TEGRA234_RESET_PWM3>;
+			reset-names = "pwm";
+			status = "disabled";
+			#pwm-cells = <2>;
+		};
+
+		pwm5: pwm@32c0000 {
+			compatible = "nvidia,tegra194-pwm";
+			reg = <0x32c0000 0x10000>;
+			clocks = <&bpmp TEGRA234_CLK_PWM5>;
+			clock-names = "pwm";
+			resets = <&bpmp TEGRA234_RESET_PWM5>;
+			reset-names = "pwm";
+			status = "disabled";
+			#pwm-cells = <2>;
+		};
+
+		pwm6: pwm@32d0000 {
+			compatible = "nvidia,tegra194-pwm";
+			reg = <0x32d0000 0x10000>;
+			clocks = <&bpmp TEGRA234_CLK_PWM6>;
+			clock-names = "pwm";
+			resets = <&bpmp TEGRA234_RESET_PWM6>;
+			reset-names = "pwm";
+			status = "disabled";
+			#pwm-cells = <2>;
+		};
+
+		pwm7: pwm@32e0000 {
+			compatible = "nvidia,tegra194-pwm";
+			reg = <0x32e0000 0x10000>;
+			clocks = <&bpmp TEGRA234_CLK_PWM7>;
+			clock-names = "pwm";
+			resets = <&bpmp TEGRA234_RESET_PWM7>;
+			reset-names = "pwm";
+			status = "disabled";
+			#pwm-cells = <2>;
+		};
+
+		pwm8: pwm@32f0000 {
+			compatible = "nvidia,tegra194-pwm";
+			reg = <0x32f0000 0x10000>;
+			clocks = <&bpmp TEGRA234_CLK_PWM8>;
+			clock-names = "pwm";
+			resets = <&bpmp TEGRA234_RESET_PWM8>;
+			reset-names = "pwm";
+			status = "disabled";
+			#pwm-cells = <2>;
+		};
+
 		spi@3300000 {
 			compatible = "nvidia,tegra234-qspi";
 			reg = <0x3300000 0x1000>;
@@ -1529,6 +1594,17 @@ gpio_aon: gpio@c2f0000 {
 			gpio-controller;
 		};
 
+		pwm4: pwm@c340000 {
+			compatible = "nvidia,tegra194-pwm";
+			reg = <0xc340000 0x10000>;
+			clocks = <&bpmp TEGRA234_CLK_PWM4>;
+			clock-names = "pwm";
+			resets = <&bpmp TEGRA234_RESET_PWM4>;
+			reset-names = "pwm";
+			status = "disabled";
+			#pwm-cells = <2>;
+		};
+
 		pmc: pmc@c360000 {
 			compatible = "nvidia,tegra234-pmc";
 			reg = <0x0c360000 0x10000>,
-- 
2.25.1

