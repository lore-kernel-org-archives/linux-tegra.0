Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E3CDC432BE
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Aug 2021 12:57:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0878C6135F
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Aug 2021 12:57:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237225AbhHXM6b (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Aug 2021 08:58:31 -0400
Received: from mail-mw2nam10on2042.outbound.protection.outlook.com ([40.107.94.42]:1825
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233952AbhHXM6b (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Aug 2021 08:58:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVAtIXLlLDaloQPuDWokhRD6zSJJeO5+SSRpwYa1lr8UAwkUv8pveU30hpLJp2dMamRbmaF6p/T05AXw1Se17YeYMRbLIUvNQI1VU9kRHSW+TPCK3rEGiqzi9As9lQAw42n2yGxO0KGLUsnsD4KR7bRDMmaV1YJLOV4u0E2ElxLhY7+lK/TvtxjTSMpqKuwiL2L4d2AgW4AjBhVXYlW6+/HOJc1Cz/P/Y4ucZhMkqTCYjIm8SHxsMk/OJ0fHGha2AFPum0CgrNY5V0mpX09lLV1ceJ6u9xsnh3ltokdnMuY90snIxYOeo67DBlQ0HIEsVXRogwGVdZvpnpU8f1Xw2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Py3hhbjbW3lDwMOg5mP6LQ2dVHR7r7YoholjIMFt6w=;
 b=k6nMwM0Q+ILYk3RO6ljgSKD1PeAjFXj9wTBtQdU7LpR4ZP9hYYn0mcKLZ2ysDL8UjsYxXoXWbTA4sOD4XsNkJoyj0AeBxVQCOeyyCASNaEzxEuFx1lZRBH59yHRnw7GZvV8tS+8khjLalGp8jYJVXqCUU2Ws3jHr8D8ccXZt4kbr2ryn3okiQQCZLp6mEYksoWAuDI/Io+96NDrFMuHpph8Iy07nUZRLCY6d02Rk1WYXbPvfuQjcyhLwrVaom4TZbbs7LzNEmAiZE23kcaByIqQLzufwbqlqch9jf06vbBDblowEqkv0woOEx7n2MNKDRVBXgwlHkU+Fzb6xay+7ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Py3hhbjbW3lDwMOg5mP6LQ2dVHR7r7YoholjIMFt6w=;
 b=Dzx+gfAEEaXrcolqIBZ7VHeSEuYPnmLPL2XA/nr8EC7s/HO24SPilgJGhRAYRb3UZ5abzwT8n4oMakL3sTA/mxfzuaZt3gpmIHa2PDxf5AswotsaY6V6mUTofg/rFdpIe5jqLeZyb6YnnyW4fWhmMHNvYNduxJsYWZGhQLT0krqMXUHNUu5pZk7yPZ3+TCZfMIs3UGso5cqG6dvxSnJTTUdrvxZGK1r5TxS5Z5xkOrGiZIReurq4NOvN9R1AkoKwvcwqLVPeT8A15CIqGAom2cLnCvW/mjo0AwMIgFUXTmUyCGJs6+hzOiaW8fKINS30SzYDm4mbT13PGqgY/QkyAg==
Received: from DM5PR13CA0024.namprd13.prod.outlook.com (2603:10b6:3:23::34) by
 BN8PR12MB3444.namprd12.prod.outlook.com (2603:10b6:408:47::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19; Tue, 24 Aug 2021 12:57:45 +0000
Received: from DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:23:cafe::e) by DM5PR13CA0024.outlook.office365.com
 (2603:10b6:3:23::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.8 via Frontend
 Transport; Tue, 24 Aug 2021 12:57:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 DM6NAM11FT066.mail.protection.outlook.com (10.13.173.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 12:57:44 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 24 Aug
 2021 12:57:43 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Aug 2021 12:57:41 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <thierry.reding@gmail.com>, <robh+dt@kernel.org>,
        <jonathanh@nvidia.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 1/2] arm64: tegra: Audio graph sound card for Jetson TX2 NX
Date:   Tue, 24 Aug 2021 18:26:09 +0530
Message-ID: <1629809770-7456-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629809770-7456-1-git-send-email-spujar@nvidia.com>
References: <1629809770-7456-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78ccf7f3-7c55-4fcc-68e3-08d966fec428
X-MS-TrafficTypeDiagnostic: BN8PR12MB3444:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3444F913832C8786CD7EF208A7C59@BN8PR12MB3444.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:773;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 48156KlbPzPcmS1QE5QE6ewPZ6O+LLRDGlf7nkcTruEiwe0A3APN4jj1zieJQyxUEHebxwi/UclzAkZlBHTUkbHjqNJA6gN/3jY3aTvuLY5wiRYNcdl7L2WOWHhTQKq3EeQ3g5V4vtDzM/hM1EIC6MnyQt5NCvncMJEEybcvIJviQ84W9NYchWpan2RTMH6jjugNGMYCQEgpsa4glAQNiyHZ32S6Jq6GYQ5e7joEX5V4GupusXi626JJrUPzwNUHEgCCqJHmFgRBaFUw/twtYz/pw9NfJcfrYtkdFxPV0HZt15921+jVvl5i68rC6bCzxa5VNVLjwc+7Grww6juV8xJmjy8Oijm3cRFMTqb1A4qf1VCu9D1b70UE8rVeUS0bPrYou735NKlx1B8BoPirjbZjXgWL+QC0Jtgp0tLTLHszKASvFu+i5sHeaUid1HLG1EGLdn/GePkV4AMKU45URpYJT9dgchoUM9QRBehsSmCkp8uGgIQMWgSVUlrTCka2NbdNt0r6uEx+04NcgqnYq1JgbpQw/9K5Ef9cCEUle0Q8zJM9Mc1LQq+miyTgLSHwqbUl4bCSDn41zobdZAF3GWxOnkUGbwlwjkuuL1Z5BPR6u26k7CQnQAU5f/knoJIi6CLjVYanU7PK0iD+6Q3J/I4Pc6tYKNJDaH26eHWz73rYcQny5u8cNQ3uxjehj2A0WoaiJWC2WEtIEM75Emt6yg==
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(46966006)(36840700001)(8676002)(426003)(70586007)(70206006)(8936002)(336012)(356005)(36860700001)(7696005)(6636002)(82310400003)(36906005)(36756003)(66574015)(26005)(54906003)(186003)(7636003)(110136005)(47076005)(6666004)(478600001)(82740400003)(5660300002)(2906002)(107886003)(316002)(86362001)(4326008)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 12:57:44.7205
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ccf7f3-7c55-4fcc-68e3-08d966fec428
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3444
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable support for audio-graph based sound card on Jetson TX2 NX.
Following I/O interfaces are enabled.
  * I2S1 and I2S3
  * DMIC1 and DMIC2

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 .../dts/nvidia/tegra186-p3509-0000+p3636-0001.dts  | 504 +++++++++++++++++++++
 1 file changed, 504 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
index 936b106..17fc179 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
@@ -715,4 +715,508 @@
 			};
 		};
 	};
+
+	aconnect@2900000 {
+		status = "okay";
+
+		dma-controller@2930000 {
+			status = "okay";
+		};
+
+		interrupt-controller@2a40000 {
+			status = "okay";
+		};
+
+		ahub@2900800 {
+			status = "okay";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0x0>;
+
+					xbar_admaif0_ep: endpoint {
+						remote-endpoint = <&admaif0_ep>;
+					};
+				};
+
+				port@1 {
+					reg = <0x1>;
+
+					xbar_admaif1_ep: endpoint {
+						remote-endpoint = <&admaif1_ep>;
+					};
+				};
+
+				port@2 {
+					reg = <0x2>;
+
+					xbar_admaif2_ep: endpoint {
+						remote-endpoint = <&admaif2_ep>;
+					};
+				};
+
+				port@3 {
+					reg = <0x3>;
+
+					xbar_admaif3_ep: endpoint {
+						remote-endpoint = <&admaif3_ep>;
+					};
+				};
+
+				port@4 {
+					reg = <0x4>;
+
+					xbar_admaif4_ep: endpoint {
+						remote-endpoint = <&admaif4_ep>;
+					};
+				};
+
+				port@5 {
+					reg = <0x5>;
+
+					xbar_admaif5_ep: endpoint {
+						remote-endpoint = <&admaif5_ep>;
+					};
+				};
+
+				port@6 {
+					reg = <0x6>;
+
+					xbar_admaif6_ep: endpoint {
+						remote-endpoint = <&admaif6_ep>;
+					};
+				};
+
+				port@7 {
+					reg = <0x7>;
+
+					xbar_admaif7_ep: endpoint {
+						remote-endpoint = <&admaif7_ep>;
+					};
+				};
+
+				port@8 {
+					reg = <0x8>;
+
+					xbar_admaif8_ep: endpoint {
+						remote-endpoint = <&admaif8_ep>;
+					};
+				};
+
+				port@9 {
+					reg = <0x9>;
+
+					xbar_admaif9_ep: endpoint {
+						remote-endpoint = <&admaif9_ep>;
+					};
+				};
+
+				port@a {
+					reg = <0xa>;
+
+					xbar_admaif10_ep: endpoint {
+						remote-endpoint = <&admaif10_ep>;
+					};
+				};
+
+				port@b {
+					reg = <0xb>;
+
+					xbar_admaif11_ep: endpoint {
+						remote-endpoint = <&admaif11_ep>;
+					};
+				};
+
+				port@c {
+					reg = <0xc>;
+
+					xbar_admaif12_ep: endpoint {
+						remote-endpoint = <&admaif12_ep>;
+					};
+				};
+
+				port@d {
+					reg = <0xd>;
+
+					xbar_admaif13_ep: endpoint {
+						remote-endpoint = <&admaif13_ep>;
+					};
+				};
+
+				port@e {
+					reg = <0xe>;
+
+					xbar_admaif14_ep: endpoint {
+						remote-endpoint = <&admaif14_ep>;
+					};
+				};
+
+				port@f {
+					reg = <0xf>;
+
+					xbar_admaif15_ep: endpoint {
+						remote-endpoint = <&admaif15_ep>;
+					};
+				};
+
+				port@10 {
+					reg = <0x10>;
+
+					xbar_admaif16_ep: endpoint {
+						remote-endpoint = <&admaif16_ep>;
+					};
+				};
+
+				port@11 {
+					reg = <0x11>;
+
+					xbar_admaif17_ep: endpoint {
+						remote-endpoint = <&admaif17_ep>;
+					};
+				};
+
+				port@12 {
+					reg = <0x12>;
+
+					xbar_admaif18_ep: endpoint {
+						remote-endpoint = <&admaif18_ep>;
+					};
+				};
+
+				port@13 {
+					reg = <0x13>;
+
+					xbar_admaif19_ep: endpoint {
+						remote-endpoint = <&admaif19_ep>;
+					};
+				};
+
+				xbar_i2s1_port: port@14 {
+					reg = <0x14>;
+
+					xbar_i2s1_ep: endpoint {
+						remote-endpoint = <&i2s1_cif_ep>;
+					};
+				};
+
+				xbar_i2s3_port: port@16 {
+					reg = <0x16>;
+
+					xbar_i2s3_ep: endpoint {
+						remote-endpoint = <&i2s3_cif_ep>;
+					};
+				};
+
+				xbar_dmic1_port: port@1a {
+					reg = <0x1a>;
+
+					xbar_dmic1_ep: endpoint {
+						remote-endpoint = <&dmic1_cif_ep>;
+					};
+				};
+
+				xbar_dmic2_port: port@1b {
+					reg = <0x1b>;
+
+					xbar_dmic2_ep: endpoint {
+						remote-endpoint = <&dmic2_cif_ep>;
+					};
+				};
+			};
+
+			admaif@290f000 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					admaif0_port: port@0 {
+						reg = <0x0>;
+
+						admaif0_ep: endpoint {
+							remote-endpoint = <&xbar_admaif0_ep>;
+						};
+					};
+
+					admaif1_port: port@1 {
+						reg = <0x1>;
+
+						admaif1_ep: endpoint {
+							remote-endpoint = <&xbar_admaif1_ep>;
+						};
+					};
+
+					admaif2_port: port@2 {
+						reg = <0x2>;
+
+						admaif2_ep: endpoint {
+							remote-endpoint = <&xbar_admaif2_ep>;
+						};
+					};
+
+					admaif3_port: port@3 {
+						reg = <0x3>;
+
+						admaif3_ep: endpoint {
+							remote-endpoint = <&xbar_admaif3_ep>;
+						};
+					};
+
+					admaif4_port: port@4 {
+						reg = <0x4>;
+
+						admaif4_ep: endpoint {
+							remote-endpoint = <&xbar_admaif4_ep>;
+						};
+					};
+
+					admaif5_port: port@5 {
+						reg = <0x5>;
+
+						admaif5_ep: endpoint {
+							remote-endpoint = <&xbar_admaif5_ep>;
+						};
+					};
+
+					admaif6_port: port@6 {
+						reg = <0x6>;
+
+						admaif6_ep: endpoint {
+							remote-endpoint = <&xbar_admaif6_ep>;
+						};
+					};
+
+					admaif7_port: port@7 {
+						reg = <0x7>;
+
+						admaif7_ep: endpoint {
+							remote-endpoint = <&xbar_admaif7_ep>;
+						};
+					};
+
+					admaif8_port: port@8 {
+						reg = <0x8>;
+
+						admaif8_ep: endpoint {
+							remote-endpoint = <&xbar_admaif8_ep>;
+						};
+					};
+
+					admaif9_port: port@9 {
+						reg = <0x9>;
+
+						admaif9_ep: endpoint {
+							remote-endpoint = <&xbar_admaif9_ep>;
+						};
+					};
+
+					admaif10_port: port@a {
+						reg = <0xa>;
+
+						admaif10_ep: endpoint {
+							remote-endpoint = <&xbar_admaif10_ep>;
+						};
+					};
+
+					admaif11_port: port@b {
+						reg = <0xb>;
+
+						admaif11_ep: endpoint {
+							remote-endpoint = <&xbar_admaif11_ep>;
+						};
+					};
+
+					admaif12_port: port@c {
+						reg = <0xc>;
+
+						admaif12_ep: endpoint {
+							remote-endpoint = <&xbar_admaif12_ep>;
+						};
+					};
+
+					admaif13_port: port@d {
+						reg = <0xd>;
+
+						admaif13_ep: endpoint {
+							remote-endpoint = <&xbar_admaif13_ep>;
+						};
+					};
+
+					admaif14_port: port@e {
+						reg = <0xe>;
+
+						admaif14_ep: endpoint {
+							remote-endpoint = <&xbar_admaif14_ep>;
+						};
+					};
+
+					admaif15_port: port@f {
+						reg = <0xf>;
+
+						admaif15_ep: endpoint {
+							remote-endpoint = <&xbar_admaif15_ep>;
+						};
+					};
+
+					admaif16_port: port@10 {
+						reg = <0x10>;
+
+						admaif16_ep: endpoint {
+							remote-endpoint = <&xbar_admaif16_ep>;
+						};
+					};
+
+					admaif17_port: port@11 {
+						reg = <0x11>;
+
+						admaif17_ep: endpoint {
+							remote-endpoint = <&xbar_admaif17_ep>;
+						};
+					};
+
+					admaif18_port: port@12 {
+						reg = <0x12>;
+
+						admaif18_ep: endpoint {
+							remote-endpoint = <&xbar_admaif18_ep>;
+						};
+					};
+
+					admaif19_port: port@13 {
+						reg = <0x13>;
+
+						admaif19_ep: endpoint {
+							remote-endpoint = <&xbar_admaif19_ep>;
+						};
+					};
+				};
+			};
+
+			i2s@2901000 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						i2s1_cif_ep: endpoint {
+							remote-endpoint = <&xbar_i2s1_ep>;
+						};
+					};
+
+					i2s1_port: port@1 {
+						reg = <1>;
+
+						i2s1_dap_ep: endpoint {
+							dai-format = "i2s";
+							/* Placeholder for external Codec */
+						};
+					};
+				};
+			};
+
+			i2s@2901200 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						i2s3_cif_ep: endpoint {
+							remote-endpoint = <&xbar_i2s3_ep>;
+						};
+					};
+
+					i2s3_port: port@1 {
+						reg = <1>;
+
+						i2s3_dap_ep: endpoint {
+							dai-format = "i2s";
+							/* Placeholder for external Codec */
+						};
+					};
+				};
+			};
+
+			dmic@2904000 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dmic1_cif_ep: endpoint {
+							remote-endpoint = <&xbar_dmic1_ep>;
+						};
+					};
+
+					dmic1_port: port@1 {
+						reg = <1>;
+
+						dmic1_dap_ep: endpoint {
+							/* Place holder for external Codec */
+						};
+					};
+				};
+			};
+
+			dmic@2904100 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dmic2_cif_ep: endpoint {
+							remote-endpoint = <&xbar_dmic2_ep>;
+						};
+					};
+
+					dmic2_port: port@1 {
+						reg = <1>;
+
+						dmic2_dap_ep: endpoint {
+							/* Place holder for external Codec */
+						};
+					};
+				};
+			};
+		};
+	};
+
+	sound {
+		compatible = "nvidia,tegra186-audio-graph-card";
+		status = "okay";
+
+		dais = /* FE */
+		       <&admaif0_port>, <&admaif1_port>, <&admaif2_port>, <&admaif3_port>,
+		       <&admaif4_port>, <&admaif5_port>, <&admaif6_port>, <&admaif7_port>,
+		       <&admaif8_port>, <&admaif9_port>, <&admaif10_port>, <&admaif11_port>,
+		       <&admaif12_port>, <&admaif13_port>, <&admaif14_port>, <&admaif15_port>,
+		       <&admaif16_port>, <&admaif17_port>, <&admaif18_port>, <&admaif19_port>,
+		       /* Router */
+		       <&xbar_i2s1_port>, <&xbar_i2s3_port>,
+		       <&xbar_dmic1_port>, <&xbar_dmic2_port>,
+		       /* I/O */
+		       <&i2s1_port>, <&i2s3_port>,
+		       <&dmic1_port>, <&dmic2_port>;
+
+		label = "NVIDIA Jetson TX2 NX APE";
+	};
 };
-- 
2.7.4

