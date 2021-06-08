Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A97EC4743F
	for <linux-tegra@archiver.kernel.org>; Tue,  8 Jun 2021 10:50:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 235A26128A
	for <linux-tegra@archiver.kernel.org>; Tue,  8 Jun 2021 10:50:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231995AbhFHKwD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 8 Jun 2021 06:52:03 -0400
Received: from mail-mw2nam12on2046.outbound.protection.outlook.com ([40.107.244.46]:27520
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231994AbhFHKwB (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 8 Jun 2021 06:52:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQEufuuw2VA3z+qDb8/nLsNJSAfQKdwR7Y2S5S/JirwFB3CkDAae9hhHqQqZUh+M6/9u+aqg4yimauljUO+BUh3NBERwvGhat8uD4OxlkSVAGsWSahJVs6xcbyHn4FI+/5/AV6vMACVqoOAPlcLUHqu3mjrv3n8ql+II7ERxbMEkk1crI76Pfqa81trpjM/q1Zvmte1tUR0aMatBD62XY5uEBQC+7G6Hd6D+1+3L0AwJ2v79QsqLxaQqLsgR3X8AujlZWVkSwf2X71x4T80WM+7hkl+BZECjswn1kJG4RgaCQ3DAS60cl/A703L7QiPkePyD/YfICsvaSnRLUGNunQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MITPOn1uhPc8mNxQrzMWUp/kmhBipqgLsuyP6qsXBWk=;
 b=NQPYv9GKPEACQORKlUNJCiVw8F8i9iFKVADfkbsClLmNd0NCv07iailN/YfbJSa5TxtHV8mvaMsP+xOD+Emn6YcV51hq8284MuLLDb6WfMCfPOIneb+uGotEhvMdJ1RjPSqzJKvIeJxo8nfrpxxcBuYMjF3VQn93JvgSubbCDrlYZ20FmXzQwk11rB9EsGO31ijuEVODbLSuc0sHI2H8NWb0weswpXrWVtWjt9HYvsMUCPWDMuLGBxI4fGqJiKlcw5RdXDXksGUo5Rf4lxh5hUfrkTT2daY5QFNDgdp+0JqXC34hEB0zHAFrHn6GoVOpdf4kRZ3X6tqdNmHYK40/AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MITPOn1uhPc8mNxQrzMWUp/kmhBipqgLsuyP6qsXBWk=;
 b=WsgykVyBxxpFa5/kCnjvXK8iFA+NXAFJXRGhnUrTnYChvWpri0lTi+BTT/2ZQVxzvc/1yqrtcjKtN1w0aWOt0L8qTQqWa5w4oo1oCdIw7cIeFZ7y9471F/RIdMcqWhr6VsfwNaQe+atdDy0G4Fb/NdIrxObvhu2StMVO/KKEQoqoiND3NRUrkMQRwWLpn+QQOlk4qNOfTZO6FVAxiY2vI3TGilVCk3/Og9RWr99YD7g1fZMHfkTShtSare/jXOjKJ3EvpISVu/dOt9a3rBJLbsq4xJ9q8AT9u6I8Kds8ylDn9V9r985tCkJOvGBZjzA9IhC38FND5mIxbBCeH+jEHw==
Received: from DM5PR21CA0062.namprd21.prod.outlook.com (2603:10b6:3:129::24)
 by BYAPR12MB2808.namprd12.prod.outlook.com (2603:10b6:a03:69::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Tue, 8 Jun
 2021 10:50:06 +0000
Received: from DM6NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:129:cafe::a9) by DM5PR21CA0062.outlook.office365.com
 (2603:10b6:3:129::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.4 via Frontend
 Transport; Tue, 8 Jun 2021 10:50:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT006.mail.protection.outlook.com (10.13.173.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4195.22 via Frontend Transport; Tue, 8 Jun 2021 10:50:06 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 8 Jun
 2021 03:50:03 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 8 Jun
 2021 10:50:03 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Jun 2021 10:50:01 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <thierry.reding@gmail.com>, <robh+dt@kernel.org>
CC:     <jonathanh@nvidia.com>, <linux-tegra@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH] arm64: tegra: Audio graph sound card for Jetson Xavier NX
Date:   Tue, 8 Jun 2021 16:19:48 +0530
Message-ID: <1623149388-11995-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f298f897-cf2e-4195-8a30-08d92a6b2db6
X-MS-TrafficTypeDiagnostic: BYAPR12MB2808:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2808A258A37A9123C43ACD68A7379@BYAPR12MB2808.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:773;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CsSz+8nqeOkhH6FJQyA7MPChSY12hGy6vbuXaax1sgDPHIT/QkAkvMNcN1pZo+QOtQaImmxupjYmd+Yk/OI604ynoyLBtXulxmrsJSTrOvuUnafKjJ+wfxTRAdndx3WYNu5hFIkiSI8s3hPSgFBwSAvRC4Rw8xGCkOFW6Bn+XZYBBEhdpl0EoBGK/IfPNYvZGVNYFsUS3ljhPv/yAoDlTWhPn4bT2FOXuiJgpwLSigxvEhATz8XmR+SsTi9IRF9AsPj977xCrnP8xGQhOi2BCdHkyIIycPWjnNdG1wx0dczvkUhqlGNiS4cjSUrQmqfHhl0cWY2/9saPp3s/S16jEtlAjwugZoTkK4WC1/WAqnezxXW7nxkwmJQNa2OnMbSYQ0O6sjGtg0mRhleuZag/bMK41dEJLktn6xoZ/UhEklxl4pHPwFV5BHS+RcYxPW5DSmDYprNAlj+d3wI2eciVV54/4DfjTIrMnvOy8ctPBo+FtrdqehvU2UUWrk/9tT7FSoNPcNTA4Xi2P/tUDAcN4F8IN4dBIpAHDqk70IkyaOKBJsFqh1VW60TeIqSkIsyWxNvUrxEr0nodLIbPU2Erl4wFdmbgZ7simqj+Ij7AalHw2m4O6THa5/pK7iOwooZBRPzmx/GUzWFniT/azaOECw==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(46966006)(36840700001)(478600001)(36860700001)(7636003)(426003)(6666004)(86362001)(54906003)(110136005)(82740400003)(5660300002)(7696005)(186003)(8936002)(70206006)(36756003)(356005)(70586007)(2616005)(8676002)(26005)(2906002)(47076005)(4326008)(107886003)(316002)(82310400003)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 10:50:06.5251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f298f897-cf2e-4195-8a30-08d92a6b2db6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2808
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable support for audio-graph based sound card on Jetson Xavier NX.
Following I/O interfaces are enabled.
  - I2S3 and I2S5
  - DMIC1, DMIC2 and DMIC4
  - DSPK1 and DSPK2

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi | 593 +++++++++++++++++++++
 1 file changed, 593 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
index a717d2b..836a7e0 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
@@ -15,6 +15,577 @@
 			interrupt-controller@2a40000 {
 				status = "okay";
 			};
+
+			ahub@2900800 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0x0>;
+
+						xbar_admaif0_ep: endpoint {
+							remote-endpoint = <&admaif0_ep>;
+						};
+					};
+
+					port@1 {
+						reg = <0x1>;
+
+						xbar_admaif1_ep: endpoint {
+							remote-endpoint = <&admaif1_ep>;
+						};
+					};
+
+					port@2 {
+						reg = <0x2>;
+
+						xbar_admaif2_ep: endpoint {
+							remote-endpoint = <&admaif2_ep>;
+						};
+					};
+
+					port@3 {
+						reg = <0x3>;
+
+						xbar_admaif3_ep: endpoint {
+							remote-endpoint = <&admaif3_ep>;
+						};
+					};
+
+					port@4 {
+						reg = <0x4>;
+
+						xbar_admaif4_ep: endpoint {
+							remote-endpoint = <&admaif4_ep>;
+						};
+					};
+
+					port@5 {
+						reg = <0x5>;
+
+						xbar_admaif5_ep: endpoint {
+							remote-endpoint = <&admaif5_ep>;
+						};
+					};
+
+					port@6 {
+						reg = <0x6>;
+
+						xbar_admaif6_ep: endpoint {
+							remote-endpoint = <&admaif6_ep>;
+						};
+					};
+
+					port@7 {
+						reg = <0x7>;
+
+						xbar_admaif7_ep: endpoint {
+							remote-endpoint = <&admaif7_ep>;
+						};
+					};
+
+					port@8 {
+						reg = <0x8>;
+
+						xbar_admaif8_ep: endpoint {
+							remote-endpoint = <&admaif8_ep>;
+						};
+					};
+
+					port@9 {
+						reg = <0x9>;
+
+						xbar_admaif9_ep: endpoint {
+							remote-endpoint = <&admaif9_ep>;
+						};
+					};
+
+					port@a {
+						reg = <0xa>;
+
+						xbar_admaif10_ep: endpoint {
+							remote-endpoint = <&admaif10_ep>;
+						};
+					};
+
+					port@b {
+						reg = <0xb>;
+
+						xbar_admaif11_ep: endpoint {
+							remote-endpoint = <&admaif11_ep>;
+						};
+					};
+
+					port@c {
+						reg = <0xc>;
+
+						xbar_admaif12_ep: endpoint {
+							remote-endpoint = <&admaif12_ep>;
+						};
+					};
+
+					port@d {
+						reg = <0xd>;
+
+						xbar_admaif13_ep: endpoint {
+							remote-endpoint = <&admaif13_ep>;
+						};
+					};
+
+					port@e {
+						reg = <0xe>;
+
+						xbar_admaif14_ep: endpoint {
+							remote-endpoint = <&admaif14_ep>;
+						};
+					};
+
+					port@f {
+						reg = <0xf>;
+
+						xbar_admaif15_ep: endpoint {
+							remote-endpoint = <&admaif15_ep>;
+						};
+					};
+
+					port@10 {
+						reg = <0x10>;
+
+						xbar_admaif16_ep: endpoint {
+							remote-endpoint = <&admaif16_ep>;
+						};
+					};
+
+					port@11 {
+						reg = <0x11>;
+
+						xbar_admaif17_ep: endpoint {
+							remote-endpoint = <&admaif17_ep>;
+						};
+					};
+
+					port@12 {
+						reg = <0x12>;
+
+						xbar_admaif18_ep: endpoint {
+							remote-endpoint = <&admaif18_ep>;
+						};
+					};
+
+					port@13 {
+						reg = <0x13>;
+
+						xbar_admaif19_ep: endpoint {
+							remote-endpoint = <&admaif19_ep>;
+						};
+					};
+
+					xbar_i2s3_port: port@16 {
+						reg = <0x16>;
+
+						xbar_i2s3_ep: endpoint {
+							remote-endpoint = <&i2s3_cif_ep>;
+						};
+					};
+
+					xbar_i2s5_port: port@18 {
+						reg = <0x18>;
+
+						xbar_i2s5_ep: endpoint {
+							remote-endpoint = <&i2s5_cif_ep>;
+						};
+					};
+
+					xbar_dmic1_port: port@1a {
+						reg = <0x1a>;
+
+						xbar_dmic1_ep: endpoint {
+							remote-endpoint = <&dmic1_cif_ep>;
+						};
+					};
+
+					xbar_dmic2_port: port@1b {
+						reg = <0x1b>;
+
+						xbar_dmic2_ep: endpoint {
+							remote-endpoint = <&dmic2_cif_ep>;
+						};
+					};
+
+					xbar_dmic4_port: port@1d {
+						reg = <0x1d>;
+
+						xbar_dmic4_ep: endpoint {
+							remote-endpoint = <&dmic4_cif_ep>;
+						};
+					};
+
+					xbar_dspk1_port: port@1e {
+						reg = <0x1e>;
+
+						xbar_dspk1_ep: endpoint {
+							remote-endpoint = <&dspk1_cif_ep>;
+						};
+					};
+
+					xbar_dspk2_port: port@1f {
+						reg = <0x1f>;
+
+						xbar_dspk2_ep: endpoint {
+							remote-endpoint = <&dspk2_cif_ep>;
+						};
+					};
+				};
+
+				admaif@290f000 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						admaif0_port: port@0 {
+							reg = <0x0>;
+
+							admaif0_ep: endpoint {
+								remote-endpoint = <&xbar_admaif0_ep>;
+							};
+						};
+
+						admaif1_port: port@1 {
+							reg = <0x1>;
+
+							admaif1_ep: endpoint {
+								remote-endpoint = <&xbar_admaif1_ep>;
+							};
+						};
+
+						admaif2_port: port@2 {
+							reg = <0x2>;
+
+							admaif2_ep: endpoint {
+								remote-endpoint = <&xbar_admaif2_ep>;
+							};
+						};
+
+						admaif3_port: port@3 {
+							reg = <0x3>;
+
+							admaif3_ep: endpoint {
+								remote-endpoint = <&xbar_admaif3_ep>;
+							};
+						};
+
+						admaif4_port: port@4 {
+							reg = <0x4>;
+
+							admaif4_ep: endpoint {
+								remote-endpoint = <&xbar_admaif4_ep>;
+							};
+						};
+
+						admaif5_port: port@5 {
+							reg = <0x5>;
+
+							admaif5_ep: endpoint {
+								remote-endpoint = <&xbar_admaif5_ep>;
+							};
+						};
+
+						admaif6_port: port@6 {
+							reg = <0x6>;
+
+							admaif6_ep: endpoint {
+								remote-endpoint = <&xbar_admaif6_ep>;
+							};
+						};
+
+						admaif7_port: port@7 {
+							reg = <0x7>;
+
+							admaif7_ep: endpoint {
+								remote-endpoint = <&xbar_admaif7_ep>;
+							};
+						};
+
+						admaif8_port: port@8 {
+							reg = <0x8>;
+
+							admaif8_ep: endpoint {
+								remote-endpoint = <&xbar_admaif8_ep>;
+							};
+						};
+
+						admaif9_port: port@9 {
+							reg = <0x9>;
+
+							admaif9_ep: endpoint {
+								remote-endpoint = <&xbar_admaif9_ep>;
+							};
+						};
+
+						admaif10_port: port@a {
+							reg = <0xa>;
+
+							admaif10_ep: endpoint {
+								remote-endpoint = <&xbar_admaif10_ep>;
+							};
+						};
+
+						admaif11_port: port@b {
+							reg = <0xb>;
+
+							admaif11_ep: endpoint {
+								remote-endpoint = <&xbar_admaif11_ep>;
+							};
+						};
+
+						admaif12_port: port@c {
+							reg = <0xc>;
+
+							admaif12_ep: endpoint {
+								remote-endpoint = <&xbar_admaif12_ep>;
+							};
+						};
+
+						admaif13_port: port@d {
+							reg = <0xd>;
+
+							admaif13_ep: endpoint {
+								remote-endpoint = <&xbar_admaif13_ep>;
+							};
+						};
+
+						admaif14_port: port@e {
+							reg = <0xe>;
+
+							admaif14_ep: endpoint {
+								remote-endpoint = <&xbar_admaif14_ep>;
+							};
+						};
+
+						admaif15_port: port@f {
+							reg = <0xf>;
+
+							admaif15_ep: endpoint {
+								remote-endpoint = <&xbar_admaif15_ep>;
+							};
+						};
+
+						admaif16_port: port@10 {
+							reg = <0x10>;
+
+							admaif16_ep: endpoint {
+								remote-endpoint = <&xbar_admaif16_ep>;
+							};
+						};
+
+						admaif17_port: port@11 {
+							reg = <0x11>;
+
+							admaif17_ep: endpoint {
+								remote-endpoint = <&xbar_admaif17_ep>;
+							};
+						};
+
+						admaif18_port: port@12 {
+							reg = <0x12>;
+
+							admaif18_ep: endpoint {
+								remote-endpoint = <&xbar_admaif18_ep>;
+							};
+						};
+
+						admaif19_port: port@13 {
+							reg = <0x13>;
+
+							admaif19_ep: endpoint {
+								remote-endpoint = <&xbar_admaif19_ep>;
+							};
+						};
+					};
+				};
+
+				i2s@2901200 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							i2s3_cif_ep: endpoint {
+								remote-endpoint = <&xbar_i2s3_ep>;
+							};
+						};
+
+						i2s3_port: port@1 {
+							reg = <1>;
+
+							i2s3_dap_ep: endpoint {
+								dai-format = "i2s";
+								/* Place holder for external Codec */
+							};
+						};
+					};
+				};
+
+				i2s@2901400 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							i2s5_cif_ep: endpoint {
+								remote-endpoint = <&xbar_i2s5_ep>;
+							};
+						};
+
+						i2s5_port: port@1 {
+							reg = <1>;
+
+							i2s5_dap_ep: endpoint@0 {
+								dai-format = "i2s";
+								/* Place holder for external Codec */
+							};
+						};
+					};
+				};
+
+				dmic@2904000 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							dmic1_cif_ep: endpoint {
+								remote-endpoint = <&xbar_dmic1_ep>;
+							};
+						};
+
+						dmic1_port: port@1 {
+							reg = <1>;
+
+							dmic1_dap_ep: endpoint {
+								/* Place holder for external Codec */
+							};
+						};
+					};
+				};
+
+				dmic@2904100 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							dmic2_cif_ep: endpoint {
+								remote-endpoint = <&xbar_dmic2_ep>;
+							};
+						};
+
+						dmic2_port: port@1 {
+							reg = <1>;
+
+							dmic2_dap_ep: endpoint {
+								/* Place holder for external Codec */
+							};
+						};
+					};
+				};
+
+				dmic@2904300 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							dmic4_cif_ep: endpoint {
+								remote-endpoint = <&xbar_dmic4_ep>;
+							};
+						};
+
+						dmic4_port: port@1 {
+							reg = <1>;
+
+							dmic4_dap_ep: endpoint {
+								/* Place holder for external Codec */
+							};
+						};
+					};
+				};
+
+				dspk@2905000 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							dspk1_cif_ep: endpoint {
+								remote-endpoint = <&xbar_dspk1_ep>;
+							};
+						};
+
+						dspk1_port: port@1 {
+							reg = <1>;
+
+							dspk1_dap_ep: endpoint {
+								/* Place holder for external Codec */
+							};
+						};
+					};
+				};
+
+				dspk@2905100 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							dspk2_cif_ep: endpoint {
+								remote-endpoint = <&xbar_dspk2_ep>;
+							};
+						};
+
+						dspk2_port: port@1 {
+							reg = <1>;
+
+							dspk2_dap_ep: endpoint {
+								/* Place holder for external Codec */
+							};
+						};
+					};
+				};
+			};
 		};
 
 		ddc: i2c@3190000 {
@@ -265,6 +836,28 @@
 		regulator-boot-on;
 	};
 
+	sound {
+		compatible = "nvidia,tegra186-audio-graph-card";
+		status = "okay";
+
+		dais = /* ADMAIF (FE) Ports */
+		       <&admaif0_port>, <&admaif1_port>, <&admaif2_port>, <&admaif3_port>,
+		       <&admaif4_port>, <&admaif5_port>, <&admaif6_port>, <&admaif7_port>,
+		       <&admaif8_port>, <&admaif9_port>, <&admaif10_port>, <&admaif11_port>,
+		       <&admaif12_port>, <&admaif13_port>, <&admaif14_port>, <&admaif15_port>,
+		       <&admaif16_port>, <&admaif17_port>, <&admaif18_port>, <&admaif19_port>,
+		       /* XBAR Ports */
+		       <&xbar_i2s3_port>, <&xbar_i2s5_port>,
+		       <&xbar_dmic1_port>, <&xbar_dmic2_port>, <&xbar_dmic4_port>,
+		       <&xbar_dspk1_port>, <&xbar_dspk2_port>,
+		       /* BE I/O Ports */
+		       <&i2s3_port>, <&i2s5_port>,
+		       <&dmic1_port>, <&dmic2_port>, <&dmic4_port>,
+		       <&dspk1_port>, <&dspk2_port>;
+
+		label = "NVIDIA Jetson Xavier NX APE";
+	};
+
 	thermal-zones {
 		cpu {
 			polling-delay = <0>;
-- 
2.7.4

