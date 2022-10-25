Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 335B1C38A2D
	for <linux-tegra@archiver.kernel.org>; Tue, 25 Oct 2022 14:26:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231704AbiJYO0A (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 25 Oct 2022 10:26:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbiJYOZ6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Oct 2022 10:25:58 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D16E11476;
        Tue, 25 Oct 2022 07:25:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AiuMqSv62jZNqTOMDvngdnIB35QL8ggLplHF9XIll5GJfDBeGkknR3NQt6GU2O6snexDukcyLTJp0w/i+Zs/aIMUJQYlWBJZYuvAP2TdsqdqW45EhIiY71adGL0mH/eHAD5wtkEe35wPRqaYuLt+9PimkUmK6cX4jAb5066qvaW/xoC7STejVutnh8a3qKlkz6XU5FXAc0LNRGCRCOHRjLXIJ2ZA2IdgKJtaTMI5J8/bULtxS4EqW2o7iCfeLX1u3pYsbpHajs1hedBm66J7VEoKe4GsTg9T8fkkRRhv0xVyKhPWIcPrqtd6nWRad/raCn12Z88yJnHvupffTOtXXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKnpvsmNt9TLoyqK3q2tvupirpE/cYRki84s1DK+NoY=;
 b=LUPjWi9Cx/e8tYGkAxARIzxN9TMkNTabJnACjnjamy791YmWuQypWuPmFqeFycZswVkiaJnsg0xo9YA5pWtTpY2XZs4Gfxbjs0YppURMrUsF7t+DyejeUOSClulilG1iLboyPAHv+zrshyU1IO2bPkglsZBoNZyK0aeVUhwVr2SX2QL0yAc/FGSCOcg3yrYa3UR88ZuRAizvKsYpjzG6Atpe0izgx3MFDYKHrInccexruwS4RvAEmL60jQKmkhduAlAcKxRpAVSchEWaEMfrS+Iu6jTSvqssK3yNrc5NCqdsIUIZeZBW7rCc2cNb3lC8y5V4LkXqFa9Xs9z/l6ZewQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKnpvsmNt9TLoyqK3q2tvupirpE/cYRki84s1DK+NoY=;
 b=nzQvZ0EQ5gzy9rrykIjbsHboAp9ukjn4f2ao5m4IaYLtFjiJo6mW++LlXOfLNChX0+SHeHp0MrtAfPd43KmADew2jIErqxlf5jgf1zrTq7M7PrrKAdFFIPBOD1G2/VaMfDZebwvLePHESOagv4ftbJdZYm0x4BNq2AldJW4v0GEqT227ArAsivzjHyT8z5M4m88YzOkY5pLEzBzabJg/oRMw+mpbVZ34SdQLJy57E2MrRFecDf9YE42ApyKeoWMH8ZNOCpTLcxFyntXfTGF0QN9+VcRUbU4zQPnIYfYsWP17SZ9fIFNwTZnL2xLnVKLl5hq1ATOZweXwlVoG68lKzA==
Received: from MW4PR04CA0361.namprd04.prod.outlook.com (2603:10b6:303:81::6)
 by DM4PR12MB6542.namprd12.prod.outlook.com (2603:10b6:8:89::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.26; Tue, 25 Oct 2022 14:25:54 +0000
Received: from CO1NAM11FT087.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::7) by MW4PR04CA0361.outlook.office365.com
 (2603:10b6:303:81::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Tue, 25 Oct 2022 14:25:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1NAM11FT087.mail.protection.outlook.com (10.13.174.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Tue, 25 Oct 2022 14:25:53 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Tue, 25 Oct
 2022 07:25:47 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 25 Oct 2022 07:25:47 -0700
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Tue, 25 Oct 2022 07:25:46 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] arm64: tegra: Enable PWM3 for Jetson Orin
Date:   Tue, 25 Oct 2022 15:25:38 +0100
Message-ID: <20221025142538.33156-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT087:EE_|DM4PR12MB6542:EE_
X-MS-Office365-Filtering-Correlation-Id: eeb4e1a9-77aa-4345-e2dd-08dab694d2e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i0KdlsFmmUbeVwIVqOEZuFrXqkLoqfh+SkoxPPl5g6lgT4tfunq60v2IrORi3JhLc/tm14AYMECoSBxP4LxlHRQVsPzJsujcvSAINO3bReiMdZX+Ql3xQAmPeICchybDhEiScnAv0Lns1ASeO5ZDXhcoMFqlFUAxooE+Aip6F9nnBufWFfYYczoAPWVPoD01HEHuH4RFzGlxEmBgGUirinwyjcwjAr5UffxSErW3051corLQiUpIplRP0Btfw41+nlDgASuVO+fQ1jIDuk196f7rW2Q9Q0syBkztA/ivwnziDp7k1whLzLaEnI2gaZN1QKF3qzWhH7fBn1SkBJ33rtZpBGDWdqJjp6beplQ15ef5ciEDs6j7ej5V9dD1XHtOlXz+NECAeeaMzbLxgnq5kPvHa5Hx+seht7XB5X7nmdIfQhYY0KsT0hg6blyXep84cNkOSB1mntjHtL+gGLyLk5+8EAhVngwbk/xmwpS52Dht5kLzgqAFFy4CRe8AY3Twxp7VcNCMmpEaYkTQDsRJjRSqKvbmNLeZQ23HTP3LuCoZQK1XIi8QSQz04pOTzvAkqduGRVVDbHMseqzY5kMglXgfMlCXS9fJu4Sv2Z5/fZ6fkyBpxT8FDSVDFYlIb/2/lQKCgaMnxXdOXjP8tDjJFCjLk1ls5qa939/0jK54WXPazj1LgUKJ+z418v/QbMybomPc5qsydaYvGLxm9xdc7xkoGRr4yzx5MAD7h0MRUab9UQIVzbzqLhWKXmEYqt9wWd731bcn6IV/IJU5mlrs4A==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199015)(40470700004)(36840700001)(46966006)(36756003)(7636003)(8936002)(5660300002)(70586007)(4744005)(70206006)(47076005)(426003)(83380400001)(36860700001)(86362001)(82740400003)(40480700001)(54906003)(336012)(356005)(2616005)(26005)(107886003)(186003)(316002)(478600001)(82310400005)(41300700001)(110136005)(40460700003)(8676002)(4326008)(1076003)(7696005)(2906002)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 14:25:53.4686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb4e1a9-77aa-4345-e2dd-08dab694d2e1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT087.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6542
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable PMW3 for the Jetson AGX Orin platform which is used for
operating the PWM Fan.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index f7a1265cee97..df703fb0cfff 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -2012,6 +2012,12 @@ serial@31d0000 {
 			status = "okay";
 		};
 
+		pwm@32a0000 {
+			assigned-clocks = <&bpmp TEGRA234_CLK_PWM3>;
+			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			status = "okay";
+		};
+
 		hda@3510000 {
 			nvidia,model = "NVIDIA Jetson AGX Orin HDA";
 			status = "okay";
-- 
2.25.1

