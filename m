Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B955BEB64DD
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Jul 2023 00:56:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbjGFA4E (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Jul 2023 20:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjGFA4D (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jul 2023 20:56:03 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5C661722;
        Wed,  5 Jul 2023 17:56:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tw813niHf0lbuHU5/oGn2OYUWKIdaS4wJsHKUC/XlkTyzSuIOnuQrCtS9pmkQ0W8iMd1Ocv7ShcMIFTdZqBmu67OtP1WvB86oAQaZWsfvVzqeXtS3gAUJyy61h4mABbhbhfQvpnpI6xegmGkZfZIUBC6sTqUClHyNz2wKeWYquV6LIew82pEDeTyQeRT0fl/qWlq0JckZRRqww+Dx16voFbH1yr2Hlx0qs9IU+kzzo9DYKuv7Z5dlHqdSNCj2rNIzNU6ZFPCWxQJTEyfXiI6+mEgnR8rWJBbWpsRwCArfFTG3qD+nSn4wfiYCH3CcXPywTIyRL+fLPJWQHwuDmoRVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOipAcIt52X2bslgfQPNj78kIihkdfhPGlfAbUMbztk=;
 b=f3fYVLa8WfQs4ucSi9vEMQ/TkTvsXgqM4HVrY3HssjJhqqVJBUErQszbVgDjcw5b/LDXOIqZJVlnwlbYhyY46fMn+7CO8PG/gWI2EPnWOJfIPyubnXNmC1G3PS72fTGPMr6TZ5dDehChWLvwLsJIA/SyzM6i3UYXKSi6X52oAUljiGEKnAAazBMTo+ICu+zDhgGViKUhftTUCzSKactPfJoheDPqoLypXQyOTy4vm23fx5tmsmdoxmSR6SocqydmgggDlSWXLXxn2OifFaY7IkdCEG8u+Qh5sh9NGiX0PPn8Q1G7MiL6mPYdnWHwRlrxhUnXA3vGDU2TjoXf/iq9Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOipAcIt52X2bslgfQPNj78kIihkdfhPGlfAbUMbztk=;
 b=t47ucv0mHj3Z4q01wqSFkaLtJ8rnTQsUZqJfWnaw1WnwYAbP1rGD+tFu3pEBAQjIlFAuPBfpBhHQQIbcNrfbfcpRzRZRlbS+exczObRzBAALiI47B8LyqkKcFpt58kUo2RcZ0sHHcfGxmPRCG8pAv8TleZsZRceg5F5aIYiIw+Z5voTKx7fehziSX3szAe7jXKxqBJ7k2IWOUCdANbuZYUB0EX2l7M3tFsoVOb/zfmA9XMQdf6OO2FYawarD2FC3xmY0xYOrB8ALG9Ody3KNo3+cpI1iDHW/VrG3SjW2zuhvwHjIdUpUiYJs3IjCGcR1D5rUiCI2KG9+lKfwLs7sNw==
Received: from BN1PR14CA0016.namprd14.prod.outlook.com (2603:10b6:408:e3::21)
 by PH7PR12MB8825.namprd12.prod.outlook.com (2603:10b6:510:26a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 00:55:59 +0000
Received: from BN8NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e3:cafe::d2) by BN1PR14CA0016.outlook.office365.com
 (2603:10b6:408:e3::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Thu, 6 Jul 2023 00:55:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN8NAM11FT042.mail.protection.outlook.com (10.13.177.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.45 via Frontend Transport; Thu, 6 Jul 2023 00:55:59 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Wed, 5 Jul 2023
 17:55:50 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Wed, 5 Jul 2023
 17:55:50 -0700
Received: from build-gauthams-20230504T093912783.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.986.37 via
 Frontend Transport; Wed, 5 Jul 2023 17:55:50 -0700
From:   Gautham Srinivasan <gauthams@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC:     Gautham Srinivasan <gauthams@nvidia.com>
Subject: [PATCH 1/2] arm64: tegra: Enable PWM nodes for Orin Nano Devkit
Date:   Thu, 6 Jul 2023 00:55:44 +0000
Message-ID: <20230706005545.1813584-1-gauthams@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT042:EE_|PH7PR12MB8825:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ce2eb8c-7acc-4b35-dac0-08db7dbbc384
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jar035kVoVv+ZJlulMWkbLoaR0ISGbnnr8E6lOBWGJKxRpETCyKf7HoZk+xN7SFWfzTuuekqZDLNcaMXgvdpnoEy8yvt4VRRwDBBWpJK2TAgl3sZF2FxD0nWiov/2777doqw3GGdpk0/EfsTH/uUTwau97qk1GSJinJp/01jqCSbi/mer/wWMlHsmaHa4tWtdT5f4BJVI7nu4oeQGGzM5zbaSv+BMwl3fGrUqX+x6+d1xWJTeAu89QE+k6LyE0Ehu89mHoFoTyvTlGrkQaQYVORGp03BN1672UBlS5wP8HUdeTLcnOC9LDx+o/rTa0Oq+gf+nw1TkHA4F4UFF2kdpgmIteWY6Vz/v+yrn4+23RJOEtiPpM29KGjfY2LmAhwvWmOMtlHnVojRGYQq9/pz7Re63+b1D24INwbhoUJ/cYmTN+twYS6ga3MSVx11Nz93UtrPNn/1Q9B0Xz6iMcPTAf4Nq5Ds5Fx3tPqQMqr6xc6wGNaNjYFlCMqg/rLXbibeC8uM/LKStfJpZtpsEW2jf7JulHjPDJZ8ZKS0OlcUrtjvTEadkJje9LGDCO7lhth6O0iwAhdIThPwKaNTb7hjjpg4orhfTpGPVNjEGQ4xiEvWSqC75EeC3ZSSr1b+9Js0upV1e6RrKWvQwjufwJorpBcJqmGP1V/8gQexS1k8RH/a9hDW2hoaHzforVXtzlUZfWjMxfkYu/NxrERgCXIpufmo3cBNwz0JR5TZtxYa3rz49ANgf5PItfaJ3e6T++b5
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199021)(40470700004)(36840700001)(46966006)(70206006)(8676002)(8936002)(2906002)(2616005)(40480700001)(5660300002)(26005)(1076003)(336012)(186003)(107886003)(41300700001)(70586007)(40460700003)(82740400003)(7696005)(356005)(7636003)(426003)(4326008)(47076005)(36756003)(316002)(83380400001)(6666004)(110136005)(36860700001)(478600001)(82310400005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 00:55:59.3490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce2eb8c-7acc-4b35-dac0-08db7dbbc384
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8825
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Orin Nano Devkit (P3768+P3767) supports PWM1, PWM5 and PWM7
in 40 pin header. Enable them.

Signed-off-by: Gautham Srinivasan <gauthams@nvidia.com>
---
 .../nvidia/tegra234-p3768-0000+p3767-0000.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
index 65e4b51b79c1..b2473a8b43ff 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
@@ -25,12 +25,31 @@
 			status = "okay";
 		};
 
+
+		pwm@3280000 {
+			assigned-clocks = <&bpmp TEGRA234_CLK_PWM1>;
+			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			status = "okay";
+		};
+
 		pwm@32a0000 {
 			assigned-clocks = <&bpmp TEGRA234_CLK_PWM3>;
 			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
 			status = "okay";
 		};
 
+		pwm@32c0000 {
+			assigned-clocks = <&bpmp TEGRA234_CLK_PWM5>;
+			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			status = "okay";
+		};
+
+		pwm@32e0000 {
+			assigned-clocks = <&bpmp TEGRA234_CLK_PWM7>;
+			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			status = "okay";
+		};
+
 		hda@3510000 {
 			nvidia,model = "NVIDIA Jetson Orin NX HDA";
 			status = "okay";
-- 
2.17.1

