Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25577C433FE
	for <linux-tegra@archiver.kernel.org>; Wed, 19 Oct 2022 13:43:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232531AbiJSNno (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 19 Oct 2022 09:43:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232879AbiJSNnT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 19 Oct 2022 09:43:19 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB7E0ED9B1;
        Wed, 19 Oct 2022 06:29:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HxLLYXnIU5usPdg09kJgEePkzlbrRaRbBpPlr/pOPsMGjp/sPFVACbF0mQXXAcTxMvDuCDGujdvh+qqn0R+QFigvzAtsJEHOyaBW2LzkeP+0qEHJU0Lf8A+78N/DH1LfHjQ/bR7/LaSPf7K00VB1gSMLPPhi4TwbqTzLkOPx8aznuI89I8efgiClEsYC0IaX1fDQTAb6Icde+I4zQI0qSNhl+jU4pXQt13GbZ4YKaYZQDS93/9bGm+rG+3eSAS0ND4KK0i+VZ9WiHlOMjh2/tsPG+T0bWE3IYZkGwZHIyXBtmiYtCmox0nZ+Hj2WUJCyCv32RMAbdLO2uU43dZaADQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FKigjMBWcxLkzHfn4qtZB2HXteX+b0KocmQNJpGIdAE=;
 b=CkPiWN7D43uxlEYzA4+3dkatELpioC+ta52kd6uXYn16yRM722Xbx0xDaxevznKKztAzC7Bz4Ehp3kPn5+F0dafD+DXGDpD67icozYdERmbdSRupYZ/20esDltJYBH1irSGkZGUSRSxpLFgCc+RmC55RAbIoY+XgDOLhZUZIMTTWDJyXwp8CCpBTolku1tkfQmOAUsCuSzRE/vuZECPItkZfEq7n4cHoWZhoNhlWrE2MK9j1mlA+25dvEKqdTVyoclqd/QgAsGIyX8YNcPgBspg6bpq7FnoJjgVl730WXtAikAXsf4B2mJGoXyMhLTj9XDo1214ujTviNr8W/iDG3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKigjMBWcxLkzHfn4qtZB2HXteX+b0KocmQNJpGIdAE=;
 b=qux6HI4zaw1XQNpxYcKaD06mZSGXeNckICViCtpQy3Hz4RD3YnLnAh11jIsPKjBCeTHag5nVvGrVgSYPfw1Tg2FqAezABRqOz4oNMSN2YBlCYQuxm10+BGt3mowCiRazKvKO1JEWl+BCKMHnR8m4X99Hppe2PT8aHEdICZeh3lgqLX66etR8TrtvqWlesYz4Nu2o7/LLQ920ZOpF5TrtngatBW/45u8v7TllXR/Zo/WP80QCJ8nwF93MUUdWmlCxvfc089YEvUxjoYnhGmBue5ud65tbiOXHUlzXr+ExorevyLjzwwoOiIKuAM5vZsbXSymb8T+IMTpboOF43mga+w==
Received: from MW4PR03CA0083.namprd03.prod.outlook.com (2603:10b6:303:b6::28)
 by CY8PR12MB7364.namprd12.prod.outlook.com (2603:10b6:930:50::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.22; Wed, 19 Oct
 2022 13:29:24 +0000
Received: from CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b6:cafe::9) by MW4PR03CA0083.outlook.office365.com
 (2603:10b6:303:b6::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34 via Frontend
 Transport; Wed, 19 Oct 2022 13:29:24 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=nvidia.com;
Received-SPF: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT016.mail.protection.outlook.com (10.13.175.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Wed, 19 Oct 2022 13:29:24 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Wed, 19 Oct
 2022 06:29:12 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 19 Oct
 2022 06:29:12 -0700
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Wed, 19 Oct 2022 06:29:10 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 2/2] arm64: tegra: Add PWM fan for Jetson AGX Orin
Date:   Wed, 19 Oct 2022 14:29:03 +0100
Message-ID: <20221019132903.157703-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221019132903.157703-1-jonathanh@nvidia.com>
References: <20221019132903.157703-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT016:EE_|CY8PR12MB7364:EE_
X-MS-Office365-Filtering-Correlation-Id: d0133824-4ab3-44ce-f419-08dab1d5f024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UXjenR8CQbFPmxEU5vpC6Q0HOEP0Q9n+DHtfPST/93aKhpZG0c5O5egpNsqMMFnkcNPvvw/7M/ariksBr1PaIYd8gWZKzczvCTeIaZsKmyWWLhnSNksf6522xUTiLmqRVZ3s5tVMuwv4N2sW1utCC8+ecuIq91pRW88b/erzoS9gQRrAJiI8nDxL8H6MZ8QWwJcbXN/IQXo0ZAtoMc5Jr16T7fjoQlABHzrqhZ3gJLUXMkLrLRrAclcQzW5ni3gsrs1F+kucsmgdOdyzRqv4M4b4ily2CLUD/4BVC0ZuX29wpilWVFnM9RZTUVTM+TfvSG0xZ2M9SMl7IAarHQ287iwSTz9Xr4aCEdUALnRYV8JQQWlQZWUm139Ybxu2tSOgxlBcJvFOTiSEmva5gGYYWRNN6jXGHacuU8g1t1H3S8D3noN0FLgdGCJCJ+Y882ZwicEjqdi0ysEOMH/046VKEK0qm23pykeFLA6v7gs5cdminps5FEuylvWBVBfCIB8IkQ2tdKJuXb38oOnX+MMl9QoRi/J9/Gmw7VPbAIAjgf2riEU1eWhetPZqmsP8MYotYxgJVMOAWZvy+meMi64AU86apP1f8oXxqB7lsjcLtyT6mjnrRgzSfGaDC06hzcD76cpzhNieyPyw+PeI2+DSSyBM+aKGYSC3vlEKpB1MUh3rBpsYlC+2GPnJBoD0JfxTCQ9D/VFeNtUVxqIcQDZE1AA+yu6Zc34Rterz/V+JMpuKDEpQvr7NPN5nS4ZdchGd1a8LxkC3KmhfI49jse+TVw==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(136003)(376002)(451199015)(40470700004)(36840700001)(46966006)(86362001)(82740400003)(6666004)(41300700001)(107886003)(7696005)(110136005)(82310400005)(316002)(26005)(54906003)(5660300002)(40460700003)(40480700001)(8936002)(356005)(7636003)(4326008)(478600001)(36756003)(4744005)(70586007)(8676002)(70206006)(47076005)(186003)(2906002)(2616005)(36860700001)(336012)(1076003)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 13:29:24.0513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0133824-4ab3-44ce-f419-08dab1d5f024
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7364
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add the PWM fan node for the Tegra234 Jetson AGX Orin platform.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index 57ab75328814..fc7dcd521340 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -2184,4 +2184,12 @@ TEGRA234_AON_GPIO(AA, 4)
 		phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
 			    "p2u-5", "p2u-6", "p2u-7";
 	};
+
+	pwm-fan {
+		compatible = "pwm-fan";
+		pwms = <&pwm3 0 45334>;
+
+		cooling-levels = <0 95 178 255>;
+		#cooling-cells = <2>;
+	};
 };
-- 
2.25.1

