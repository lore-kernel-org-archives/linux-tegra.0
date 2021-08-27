Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45506C4320E
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 09:39:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2FF0560FE6
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 09:39:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244845AbhH0Jjz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Aug 2021 05:39:55 -0400
Received: from mail-dm6nam11on2063.outbound.protection.outlook.com ([40.107.223.63]:42209
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244994AbhH0Jjt (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Aug 2021 05:39:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Np3NAnXoFZSI4MI8kLJ3PFwlljEqpfGIuVPe6tsNKbEb6f2jlmLzrG3+Ktp6AZmOglToKeqMzMyRNM79OV13CFgF1WpmG6CO/txXAU/PzQdQpDWMXuzT0SPUeUYgQgCfRFPHz1ck4icbm069/Yz9ee3p0t4ZoS8Ptgq2IYpGRMtDVors4G5Ozl5cg3e9+w2cjuy+u+ihWcBcqcMygK1oVwdoYw7VwgbTBohwWTxmVuCXaEavqGKpw6036yqz8hnXuZvy0AkcTYaBa94bxGiczX5pslqqnm379KgVjieicpEkaOU2Q2bRH4TVSKT9LmCSqwV0kVsu9BDgDsedzfO1dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYCaXMTv0jG/SdPf7WU99ndTBCyajEY7L027r2+VVuc=;
 b=V6t7iUOCrlOq6Eee8l1Pv8L9y5IxVSGp7Z4S/SK/pGeD4kc2HeKfwtogrs+e1Plef7dyhIxLJ6ZGwPKMS159d4INPvzrBtBpe0Lif6kU5vFX/+ZGckvJqT3gzv74w5I0QaXQvfmt3RqjiIbsCpmy13fMJ4t+mvJMaUCHykP0F1NjOBz5ANeHhvEqc+4Ua3wcTQFUXq+F+s9HQzC0bw7dRPG1bPyv43x4TIAq0X+kEiuU0VeF5LeQhxp5TU80/XhDiOwfShn75L7LgIWXFA76swfgU0hEkLwSqezSMmGjq0S2k/2H4mhgR45iK70z6hs9u5LlFvMYiwH6N1kLN55nEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYCaXMTv0jG/SdPf7WU99ndTBCyajEY7L027r2+VVuc=;
 b=rN8ukbbUrmcqWQT6vmOqDY9gYdJAy6ufm+jTJaEmVyM2xz5VVjn970san45JiTvzdQ2A55Ia4Ec97pLSreSXHriqMaVG216ZAtxPG4vvoLUilCH3tvJ4Ct9AkJuBh0DAgtNphtM7S0avxoCN+L03Qw0V+r5WynPOHjjzxHf1J2P5CluWVxxcbtt+lMoQT3ohSXwpHZ/lAkjJWR81ExpG0BkvGRrVGXAY5pDfRdXUZs1MznzC/G5R7n6TcRmmu1B9e8KZQEMLdQOFR9iv7UaIQkHSZkezmua3WJdt6HZ4VWY+wj8W0tZnHAJYvNSQ2dPHJDe/sLMayZPy7TMg/2F3sA==
Received: from DM5PR08CA0044.namprd08.prod.outlook.com (2603:10b6:4:60::33) by
 MWHPR1201MB0109.namprd12.prod.outlook.com (2603:10b6:301:52::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 27 Aug
 2021 09:38:58 +0000
Received: from DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:60:cafe::bf) by DM5PR08CA0044.outlook.office365.com
 (2603:10b6:4:60::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend
 Transport; Fri, 27 Aug 2021 09:38:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT003.mail.protection.outlook.com (10.13.173.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 09:38:57 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 27 Aug
 2021 09:38:56 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 27 Aug 2021 09:38:52 +0000
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
Subject: [PATCH 12/13] arm64: tegra: Add few AHUB devices for Tegra210 and later
Date:   Fri, 27 Aug 2021 15:03:58 +0530
Message-ID: <1630056839-6562-13-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
References: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80c5b3bd-c27e-4a11-708d-08d9693e7e12
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0109:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0109041FD029725C46E66966A7C89@MWHPR1201MB0109.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:660;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QA+djK7+ov+UrwFB3XYYVa/hDpHry3jSfSfscZEFsNBFbjRntuo4jMra87LtS9R8Nl9kpb6voVEkAeE94j9GkOlE2e7rQcWpkql098sMqU76yGCx+LBbISdWlZm91nwqx+ebUD7kp1Ah2C49DHOe35Zf+2OoafvZn8WR8nFDm37GnbJyi63+whqPsG31ta0BGC4YZsanxeYaCp51S7+/fxqwZ0TZzaRARzGk926YHyktrv9zJE518QtC7qTy3rggSeJOYBu1nx4sg2opNUJrtcn27Eyud2qgwmgkFwIz90l+V/oEnldD9XMlUGDFoWOjbQ/4+bMQV6aC32sqoxPrcY6m9ODhq7YrA7stOZCKNnBSWusfSK3Bbiwe55/4b67cfErycShwSp61pnhtK6PExS3I9t/5HtfBH6Y23k9gd7wObtG/3X11psaureLztz0DNFzQZ0DNdHQJ5bGhQayKgkzQ0t+1WMhEOiG/sTjBJnb23Zb0t1ZL0n9CeyfuTeoL0OA+EcEn1uolQJ3ZMMKJNfURWPY4VBUqgwWmuOu4fmsUSnJktE/YprEBFvarGOnKreTz5XRtUvJ0yH7pLEuUEhBdEI2bbJYNfDWm6F4qirwz7JixoTtLB1uOz94rhnQw7sR2F74zorEc311XJZerlOl8Oxt4rGGXvuaOUn5CcY2WY2eqeyMYYc/kqEHz2TNMVvaOswepaqvLSd4c45B8vngqpe5K28DObSaIqZb18qQ=
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(46966006)(36840700001)(356005)(47076005)(36860700001)(8936002)(316002)(83380400001)(7636003)(478600001)(82740400003)(2616005)(921005)(7416002)(4326008)(82310400003)(5660300002)(36756003)(426003)(8676002)(7696005)(186003)(36906005)(54906003)(110136005)(2906002)(70586007)(86362001)(107886003)(336012)(26005)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 09:38:57.2143
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c5b3bd-c27e-4a11-708d-08d9693e7e12
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0109
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
index e94f8ad..0d0ada5 100644
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
+				sound-name-prefix = "MIXER";
+				status = "disabled";
+			};
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index c8250a3..6027d84 100644
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
+					sound-name-prefix = "MIXER";
+					status = "disabled";
+				};
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 26b3f98a..b84c963 100644
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
+				sound-name-prefix = "MIXER";
+				status = "disabled";
+			};
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.7.4

