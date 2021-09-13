Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF74FC433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Sep 2021 16:43:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A91A460EFF
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Sep 2021 16:43:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239374AbhIMQpC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Sep 2021 12:45:02 -0400
Received: from mail-bn7nam10on2080.outbound.protection.outlook.com ([40.107.92.80]:1505
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239154AbhIMQoy (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Sep 2021 12:44:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nxDCgCepHZcEGyHaX5lE95NZLhMcsp46T4hPAgKmsu3ZV08PKX/73s8dFGLLLGrE0PG/hgGtm74JaB9aAUbkQmJXuyLQbNdl6heVZ9BT/K1AePQQt5keR/wUCwF6ij7UmoUv4xpwh6pGHuCG6w+YZ4+6f47OcyaW8uk0KzpVT4UG0s2L5diO1FdkGY0YNKNNU023oVIlwOigFVwx/kT2f2SfVqHcb6BGF+aTH6J174gapedbNDdxz0jrUU23VPLYF6eWeYpIuqsEu/I8ciCRWRdaBnTQk20r11cEAqAxYu/13x5o/Vh2ckk7r7FmdfsezqIrL7MfHN8bVT5n/j2LNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=uBBL43C0dZB7i/aQsvhsNNDhlNNWaEmQg6+Cd9hPjvI=;
 b=Lo7hbb8+hy9oGqg5Gjh32pvj9jRQ4FpatjoW32YQFpuIIx19MTCCac+pvCVhDIUSu6+xH1CgufMUYuY6C+FOyJ8g4lP8MPVyvE6v3ktmO21MoxEA0ePdw/P6kBeiKvRRtSUXZMFYTQ/IZYvexq9Ua7rzTkakA1JQffXcBMvfsu2aLdLt3+eHmWZgra/Xs4CT08HE3cEtL3nwMOEtxjxGPicKHHvJO2MZSqFBdU74xkqrLtfw+VV3Ef6Rpkd73uJzXu/4SmMRC62uhhI+XTuxowxBhr2h7faurEuNOrACJxxahHQ7RbL4r+ytVPPeC6F5oz+QvRGYaWoxAPO1jGJHKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBBL43C0dZB7i/aQsvhsNNDhlNNWaEmQg6+Cd9hPjvI=;
 b=TQAwKny0pHM1eDRbTIclND8VXuSGndNUvOy4gKKCIpk3tN6Q2jP3Ebj9yokUnLmbCVCwCJR0vUPFpI4DPmgegF3TwpHj7RP5XR3zzQZHErvrvb0qUPxKIg+VuBidC1ng2X0AitZ4Y03FQOo0u6sn30hYXpOPAVw7QxxHiw3E/3yh6mFkMFmPuhz6eYTBHFxFa5Nr1xUnYrqDlxJ5lqYrGT8l32znaFA4bqQ1mLnMBHwZq7qs5in3vmCPMKg7frhz6QfOnRDfBWnmarVUCnW/IlJx6qKMQMzFWgy9JPOQGH4cYRf4eNLLMoiXAR/yZD7fN8NrjAqlEAXZqfP6BYa+tQ==
Received: from BN8PR03CA0013.namprd03.prod.outlook.com (2603:10b6:408:94::26)
 by CH0PR12MB5026.namprd12.prod.outlook.com (2603:10b6:610:e1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 16:43:37 +0000
Received: from BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:94:cafe::e1) by BN8PR03CA0013.outlook.office365.com
 (2603:10b6:408:94::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Mon, 13 Sep 2021 16:43:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 BN8NAM11FT020.mail.protection.outlook.com (10.13.176.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 16:43:35 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 13 Sep
 2021 16:43:35 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Mon, 13 Sep 2021 16:43:31 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <kuninori.morimoto.gx@renesas.com>
CC:     <sharadg@nvidia.com>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v2 12/13] arm64: tegra: Add few AHUB devices for Tegra210 and later
Date:   Mon, 13 Sep 2021 22:12:20 +0530
Message-ID: <1631551342-25469-13-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631551342-25469-1-git-send-email-spujar@nvidia.com>
References: <1631551342-25469-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84dfcd02-4efb-4088-fbaf-08d976d5a1ac
X-MS-TrafficTypeDiagnostic: CH0PR12MB5026:
X-Microsoft-Antispam-PRVS: <CH0PR12MB50260FD52E9B68AA9F983A5DA7D99@CH0PR12MB5026.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:660;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QREahbVkXSBDFhMONDW58oGYs3PAC0T27KtBgPQ66l3B/Y2eSZJPfQpgg5ZbJQPz+rQmBpPFmGHl/7w65jTbTf2EpPmcFw4P0SxlD+05klCKAQ0nodfUgdx84yb7mRY3gYe/nFSVaMHb5KH9P5nWZiRI/XQQzsCYHiS8Z+CJE7VJhZlu+Ob6FI/pVX3XCirxFIEHHOOOQwCAEpPX2hJdklULh5RHsFY4rG1SFiYKN/J0UWxN77BEQcG/RiVwgefiVxfp/aC4CV1ri1g2DI45EpIldmLbKSCuk+kQOug/mmSZfeqztXFo45AfiIgUsCWUHr9+fi5ZGpz1ANA3J6wdZ9brjuJ2CENflIa4MyzEIqu00ViCCfz4RJMmlZVBuhRGRRr/L1CJPr3JFGRp5Jxpo3OppBF4r5R/t7yGa6RfJMClnT14Jadlxf8GvATCuKYps8bQkSm8jroIUbgu1PnnQpjrjTrK7yubxXQpEkC9R5uCi//ygwh8+nvY1lcjtqAEHhQ3OwrG1OrZVVlbrQkwIhkjOCsIvhPEr/3g5p0pCEcU+C17ruP09vgYvpE3+glKRlS20r3GqYJusUoiLURaaRTe6dnnzhKEckf82vFAlHa9erkUj0d5Jc9UhWWbqcsujzeQ7dGccVzoFsBO3jtK+mo5Lq0wgpsNVNOlSuLOQSYs1YwJDiYlJjKRl9sOVx8qPBi3MWyMDeHaT25Tb0mgjbt/de+GW87e8vu07WZOWrg=
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(46966006)(36840700001)(336012)(26005)(36860700001)(107886003)(82310400003)(47076005)(83380400001)(4326008)(82740400003)(356005)(7636003)(70586007)(316002)(186003)(2616005)(54906003)(6666004)(5660300002)(2906002)(426003)(478600001)(36906005)(921005)(8676002)(110136005)(7696005)(36756003)(70206006)(86362001)(7416002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 16:43:35.9967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84dfcd02-4efb-4088-fbaf-08d976d5a1ac
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5026
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add DT nodes for following AHUB devices:
 * SFC (Sampling Frequency Converter)
 * MVC (Master Volume Control)
 * AMX (Audio Multiplexer)
 * ADX (Audio Demultiplexer)
 * Mixer

Above devices are added for Tegra210, Tegra186 and Tegra194 generations
of Tegra SoC.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 120 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 116 ++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi |  77 ++++++++++++++++++++
 3 files changed, 313 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index e94f8ad..d05aac6 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -354,6 +354,126 @@
 				sound-name-prefix = "DSPK2";
 				status = "disabled";
 			};
+
+			tegra_sfc1: sfc@2902000 {
+				compatible = "nvidia,tegra186-sfc",
+					     "nvidia,tegra210-sfc";
+				reg = <0x2902000 0x200>;
+				sound-name-prefix = "SFC1";
+				status = "disabled";
+			};
+
+			tegra_sfc2: sfc@2902200 {
+				compatible = "nvidia,tegra186-sfc",
+					     "nvidia,tegra210-sfc";
+				reg = <0x2902200 0x200>;
+				sound-name-prefix = "SFC2";
+				status = "disabled";
+			};
+
+			tegra_sfc3: sfc@2902400 {
+				compatible = "nvidia,tegra186-sfc",
+					     "nvidia,tegra210-sfc";
+				reg = <0x2902400 0x200>;
+				sound-name-prefix = "SFC3";
+				status = "disabled";
+			};
+
+			tegra_sfc4: sfc@2902600 {
+				compatible = "nvidia,tegra186-sfc",
+					     "nvidia,tegra210-sfc";
+				reg = <0x2902600 0x200>;
+				sound-name-prefix = "SFC4";
+				status = "disabled";
+			};
+
+			tegra_mvc1: mvc@290a000 {
+				compatible = "nvidia,tegra186-mvc",
+					     "nvidia,tegra210-mvc";
+				reg = <0x290a000 0x200>;
+				sound-name-prefix = "MVC1";
+				status = "disabled";
+			};
+
+			tegra_mvc2: mvc@290a200 {
+				compatible = "nvidia,tegra186-mvc",
+					     "nvidia,tegra210-mvc";
+				reg = <0x290a200 0x200>;
+				sound-name-prefix = "MVC2";
+				status = "disabled";
+			};
+
+			tegra_amx1: amx@2903000 {
+				compatible = "nvidia,tegra186-amx",
+					     "nvidia,tegra210-amx";
+				reg = <0x2903000 0x100>;
+				sound-name-prefix = "AMX1";
+				status = "disabled";
+			};
+
+			tegra_amx2: amx@2903100 {
+				compatible = "nvidia,tegra186-amx",
+					     "nvidia,tegra210-amx";
+				reg = <0x2903100 0x100>;
+				sound-name-prefix = "AMX2";
+				status = "disabled";
+			};
+
+			tegra_amx3: amx@2903200 {
+				compatible = "nvidia,tegra186-amx",
+					     "nvidia,tegra210-amx";
+				reg = <0x2903200 0x100>;
+				sound-name-prefix = "AMX3";
+				status = "disabled";
+			};
+
+			tegra_amx4: amx@2903300 {
+				compatible = "nvidia,tegra186-amx",
+					     "nvidia,tegra210-amx";
+				reg = <0x2903300 0x100>;
+				sound-name-prefix = "AMX4";
+				status = "disabled";
+			};
+
+			tegra_adx1: adx@2903800 {
+				compatible = "nvidia,tegra186-adx",
+					     "nvidia,tegra210-adx";
+				reg = <0x2903800 0x100>;
+				sound-name-prefix = "ADX1";
+				status = "disabled";
+			};
+
+			tegra_adx2: adx@2903900 {
+				compatible = "nvidia,tegra186-adx",
+					     "nvidia,tegra210-adx";
+				reg = <0x2903900 0x100>;
+				sound-name-prefix = "ADX2";
+				status = "disabled";
+			};
+
+			tegra_adx3: adx@2903a00 {
+				compatible = "nvidia,tegra186-adx",
+					     "nvidia,tegra210-adx";
+				reg = <0x2903a00 0x100>;
+				sound-name-prefix = "ADX3";
+				status = "disabled";
+			};
+
+			tegra_adx4: adx@2903b00 {
+				compatible = "nvidia,tegra186-adx",
+					     "nvidia,tegra210-adx";
+				reg = <0x2903b00 0x100>;
+				sound-name-prefix = "ADX4";
+				status = "disabled";
+			};
+
+			tegra_amixer: amixer@290bb00 {
+				compatible = "nvidia,tegra186-amixer",
+					     "nvidia,tegra210-amixer";
+				reg = <0x290bb00 0x800>;
+				sound-name-prefix = "MIXER1";
+				status = "disabled";
+			};
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index c8250a3..47e1d9a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -363,6 +363,122 @@
 					sound-name-prefix = "DSPK2";
 					status = "disabled";
 				};
+
+				tegra_sfc1: sfc@2902000 {
+					compatible = "nvidia,tegra194-sfc",
+						     "nvidia,tegra210-sfc";
+					reg = <0x2902000 0x200>;
+					sound-name-prefix = "SFC1";
+					status = "disabled";
+				};
+
+				tegra_sfc2: sfc@2902200 {
+					compatible = "nvidia,tegra194-sfc",
+						     "nvidia,tegra210-sfc";
+					reg = <0x2902200 0x200>;
+					sound-name-prefix = "SFC2";
+					status = "disabled";
+				};
+
+				tegra_sfc3: sfc@2902400 {
+					compatible = "nvidia,tegra194-sfc",
+						     "nvidia,tegra210-sfc";
+					reg = <0x2902400 0x200>;
+					sound-name-prefix = "SFC3";
+					status = "disabled";
+				};
+
+				tegra_sfc4: sfc@2902600 {
+					compatible = "nvidia,tegra194-sfc",
+						     "nvidia,tegra210-sfc";
+					reg = <0x2902600 0x200>;
+					sound-name-prefix = "SFC4";
+					status = "disabled";
+				};
+
+				tegra_mvc1: mvc@290a000 {
+					compatible = "nvidia,tegra194-mvc",
+						     "nvidia,tegra210-mvc";
+					reg = <0x290a000 0x200>;
+					sound-name-prefix = "MVC1";
+					status = "disabled";
+				};
+
+				tegra_mvc2: mvc@290a200 {
+					compatible = "nvidia,tegra194-mvc",
+						     "nvidia,tegra210-mvc";
+					reg = <0x290a200 0x200>;
+					sound-name-prefix = "MVC2";
+					status = "disabled";
+				};
+
+				tegra_amx1: amx@2903000 {
+					compatible = "nvidia,tegra194-amx";
+					reg = <0x2903000 0x100>;
+					sound-name-prefix = "AMX1";
+					status = "disabled";
+				};
+
+				tegra_amx2: amx@2903100 {
+					compatible = "nvidia,tegra194-amx";
+					reg = <0x2903100 0x100>;
+					sound-name-prefix = "AMX2";
+					status = "disabled";
+				};
+
+				tegra_amx3: amx@2903200 {
+					compatible = "nvidia,tegra194-amx";
+					reg = <0x2903200 0x100>;
+					sound-name-prefix = "AMX3";
+					status = "disabled";
+				};
+
+				tegra_amx4: amx@2903300 {
+					compatible = "nvidia,tegra194-amx";
+					reg = <0x2903300 0x100>;
+					sound-name-prefix = "AMX4";
+					status = "disabled";
+				};
+
+				tegra_adx1: adx@2903800 {
+					compatible = "nvidia,tegra194-adx",
+						     "nvidia,tegra210-adx";
+					reg = <0x2903800 0x100>;
+					sound-name-prefix = "ADX1";
+					status = "disabled";
+				};
+
+				tegra_adx2: adx@2903900 {
+					compatible = "nvidia,tegra194-adx",
+						     "nvidia,tegra210-adx";
+					reg = <0x2903900 0x100>;
+					sound-name-prefix = "ADX2";
+					status = "disabled";
+				};
+
+				tegra_adx3: adx@2903a00 {
+					compatible = "nvidia,tegra194-adx",
+						     "nvidia,tegra210-adx";
+					reg = <0x2903a00 0x100>;
+					sound-name-prefix = "ADX3";
+					status = "disabled";
+				};
+
+				tegra_adx4: adx@2903b00 {
+					compatible = "nvidia,tegra194-adx",
+						     "nvidia,tegra210-adx";
+					reg = <0x2903b00 0x100>;
+					sound-name-prefix = "ADX4";
+					status = "disabled";
+				};
+
+				tegra_amixer: amixer@290bb00 {
+					compatible = "nvidia,tegra194-amixer",
+						     "nvidia,tegra210-amixer";
+					reg = <0x290bb00 0x800>;
+					sound-name-prefix = "MIXER1";
+					status = "disabled";
+				};
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 26b3f98a..055511d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1641,6 +1641,83 @@
 				status = "disabled";
 			};
 
+			tegra_sfc1: sfc@702d2000 {
+				compatible = "nvidia,tegra210-sfc";
+				reg = <0x702d2000 0x200>;
+				sound-name-prefix = "SFC1";
+				status = "disabled";
+			};
+
+			tegra_sfc2: sfc@702d2200 {
+				compatible = "nvidia,tegra210-sfc";
+				reg = <0x702d2200 0x200>;
+				sound-name-prefix = "SFC2";
+				status = "disabled";
+			};
+
+			tegra_sfc3: sfc@702d2400 {
+				compatible = "nvidia,tegra210-sfc";
+				reg = <0x702d2400 0x200>;
+				sound-name-prefix = "SFC3";
+				status = "disabled";
+			};
+
+			tegra_sfc4: sfc@702d2600 {
+				compatible = "nvidia,tegra210-sfc";
+				reg = <0x702d2600 0x200>;
+				sound-name-prefix = "SFC4";
+				status = "disabled";
+			};
+
+			tegra_mvc1: mvc@702da000 {
+				compatible = "nvidia,tegra210-mvc";
+				reg = <0x702da000 0x200>;
+				sound-name-prefix = "MVC1";
+				status = "disabled";
+			};
+
+			tegra_mvc2: mvc@702da200 {
+				compatible = "nvidia,tegra210-mvc";
+				reg = <0x702da200 0x200>;
+				sound-name-prefix = "MVC2";
+				status = "disabled";
+			};
+
+			tegra_amx1: amx@702d3000 {
+				compatible = "nvidia,tegra210-amx";
+				reg = <0x702d3000 0x100>;
+				sound-name-prefix = "AMX1";
+				status = "disabled";
+			};
+
+			tegra_amx2: amx@702d3100 {
+				compatible = "nvidia,tegra210-amx";
+				reg = <0x702d3100 0x100>;
+				sound-name-prefix = "AMX2";
+				status = "disabled";
+			};
+
+			tegra_adx1: adx@702d3800 {
+				compatible = "nvidia,tegra210-adx";
+				reg = <0x702d3800 0x100>;
+				sound-name-prefix = "ADX1";
+				status = "disabled";
+			};
+
+			tegra_adx2: adx@702d3900 {
+				compatible = "nvidia,tegra210-adx";
+				reg = <0x702d3900 0x100>;
+				sound-name-prefix = "ADX2";
+				status = "disabled";
+			};
+
+			tegra_amixer: amixer@702dbb00 {
+				compatible = "nvidia,tegra210-amixer";
+				reg = <0x702dbb00 0x800>;
+				sound-name-prefix = "MIXER1";
+				status = "disabled";
+			};
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.7.4

