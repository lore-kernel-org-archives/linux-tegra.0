Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21BEC46467
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Jan 2023 15:08:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231613AbjAPPIG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Jan 2023 10:08:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232894AbjAPPHj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Jan 2023 10:07:39 -0500
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2051.outbound.protection.outlook.com [40.107.95.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9341B23C5C;
        Mon, 16 Jan 2023 06:55:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjuxmishfDtu0xl3yWY2XuLdX+37Rtj8npKvN/cnUnbyu5WAOLRfWhZKN8pa8w4qjQcgpc2ABsc6xDtfqY08Yq/QLdoNVZTmFfkEBTTwQT4B2s1401Dwx+SFPr91tR1tpzHVWs229xESoUHt1i5TbDe/KTUyyAfDcxVLUFXKJ9ePFkmEpBrgT2wMfaBdABKkvgE5x4b+1wAqNL7KA0c4o7oi7zX6RMZNjWC/uPL2LirNiFO2e199H2sWaeXID9+sxolxyRkVOj0T24TZ6wvmCFV/RXqnvwvRGc9fc3ioj3n8bbhL8x52v+xm8i+HbWTXycy5thVXg2V708KVcRtdXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30qQTOkiY5sfbvT1foBbsf1CAAlDoR6IFS9RmGmMqUI=;
 b=flwq5KuR2IVweQtYvGxucRY75bh9a0dNhsBRMxg6keFUWC2C+9ky42Sgb1ESFwM231o8UhgiBDAL+LbUVr7HlkW/CS5bXKGceSiL8oemor4KEpWTSEly8n1AUsLDAsFMolc7x6hTFkehwE08Q2WdBWVV0FC9QhNpoj3yEsA7Cj+AJCYSRv8imYDr5QpyE6wp4WeAnnZYYHvGRULX+TpX3r5G2euBteLSzeF6uMg2bqOmZkL4+GvOFeHMh2fMEv8hb7NIIteAr6kbOPzBm7gy9FZAH6OBft60cTHdkSQ4NTWZgde1m88FeEtSa+lbFK5dqfATMgqZspojat21KNtAjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30qQTOkiY5sfbvT1foBbsf1CAAlDoR6IFS9RmGmMqUI=;
 b=MWaB7oyhTxYTBv8s6G0PLGvMs/sSzy6nvmgZUva0QXPIs9UnEJMVwGkcXrS/VW3165tiAa6i/+tiVA/Ex98qHXTjcQel7BOV6H9tbtGZV5et1gAFWlHORkkjUUteWo91ez4uYLFsO3fycqJt5dQS2E/4V1HpBAB3TDO+IKWrlERCB2ylFRLfUYo8RF+qEDDx45f9UZwQ9fZor04gwh2xSnkIBlg9GiiulhB6iwgasjvlpvZ1GiwIY3CgW7YAiDT+m/Mq6daTIHTPKkSy0OGjsF04P8edyXZP0hegX7VAkRPsJT0D2n5Dx6U1f+7JEL3V4S04D/8OEwiMBbSpvsz9AQ==
Received: from DM6PR06CA0030.namprd06.prod.outlook.com (2603:10b6:5:120::43)
 by CO6PR12MB5425.namprd12.prod.outlook.com (2603:10b6:303:13e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Mon, 16 Jan
 2023 14:55:23 +0000
Received: from DM6NAM11FT077.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:120:cafe::21) by DM6PR06CA0030.outlook.office365.com
 (2603:10b6:5:120::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 14:55:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT077.mail.protection.outlook.com (10.13.173.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 14:55:22 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 06:55:16 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 06:55:15 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Mon, 16 Jan 2023 06:55:13 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V4 5/5] arm64: tegra: Populate the XUDC node for Tegra234
Date:   Mon, 16 Jan 2023 14:54:52 +0000
Message-ID: <20230116145452.91442-6-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230116145452.91442-1-jonathanh@nvidia.com>
References: <20230116145452.91442-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT077:EE_|CO6PR12MB5425:EE_
X-MS-Office365-Filtering-Correlation-Id: b6200b93-c8a5-43d5-a0e7-08daf7d1b1a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6nLFfEG26jcxxS1DH71NwGM+rnfodZKUNGZQccRGbnCwyiOg56ERawXKa8euxmRBnLrQiaZPCaYY14sVbKqUQnC2IgqZ0ShgX+oqU3HpCApkb95/mDwVqxSLUE0cBQOfUxS+ZHG89jzWsEWCVscgkodUpyde7PH9Sjt+vtvCRIwdciJEP/YlsiM2/bjwMWYr0j3Spd7lF1QcRsizrwe+/kV4RUN3bEtuL0z34jX/yjfjQuM9ZCfn9/51LwtwacPmQGpg2HZKfzYEDUy5n0VbG/2DeeLi61BKazoZSkLmPLisGMkaZsZEH7lJph1ekTUWkU7eJhlH0XclJTTuYIW2h4APefV36t++rXl7wp0aWgPuRRfNXzcS7qcLuPGZUegBD49WcR1ig462t6BfkO5PNYKZypUJpkRXWWpd5uQ+4Eikz6BVdJvpvCiTVQ6EsxN9lHzwdjaimMY3qN139t5Uq6ZJoTVgRoxhb5zSs6UrjnrgAEqxF6NWOCLyHhnlABiSpVBknHS4eXys7wLXvHhxxFKVHhc/tqzV3ZKDfCo1SqUd6ZwrpE4nCaLFzbSj6b/aqx7IJlxZARAvwg0ZBHVNA/nZR7UOvGNCUR2ou4oTpDWNSFYonqpul8g8zNALmXG9np/izyDab1wCgFe9P+k/g1ot+oWlQ/Wwv1GK8vrV7Gldiavas6fjRydgfsg1uVNWlc6XJBYY6QaEYzKe1D7DJg==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(83380400001)(8936002)(5660300002)(41300700001)(426003)(47076005)(7636003)(82310400005)(82740400003)(2906002)(36756003)(356005)(40460700003)(40480700001)(86362001)(186003)(478600001)(7696005)(36860700001)(26005)(1076003)(8676002)(4326008)(336012)(316002)(70586007)(54906003)(2616005)(107886003)(70206006)(6666004)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 14:55:22.5431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6200b93-c8a5-43d5-a0e7-08daf7d1b1a5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT077.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5425
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Populate the Tegra XUSB device controller (XUDC) node for Tegra234.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 242bf59711f8..728099116dd0 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -1199,6 +1199,29 @@ usb3-3 {
 			};
 		};
 
+		usb@3550000 {
+			compatible = "nvidia,tegra234-xudc";
+			reg = <0x03550000 0x8000>,
+			      <0x03558000 0x8000>;
+			reg-names = "base", "fpci";
+			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&bpmp TEGRA234_CLK_XUSB_CORE_DEV>,
+				 <&bpmp TEGRA234_CLK_XUSB_CORE_SS>,
+				 <&bpmp TEGRA234_CLK_XUSB_SS>,
+				 <&bpmp TEGRA234_CLK_XUSB_FS>;
+			clock-names = "dev", "ss", "ss_src", "fs_src";
+			interconnects = <&mc TEGRA234_MEMORY_CLIENT_XUSB_DEVR &emc>,
+					<&mc TEGRA234_MEMORY_CLIENT_XUSB_DEVW &emc>;
+			interconnect-names = "dma-mem", "write";
+			iommus = <&smmu_niso1 TEGRA234_SID_XUSB_DEV>;
+			power-domains = <&bpmp TEGRA234_POWER_DOMAIN_XUSBB>,
+					<&bpmp TEGRA234_POWER_DOMAIN_XUSBA>;
+			power-domain-names = "dev", "ss";
+			nvidia,xusb-padctl = <&xusb_padctl>;
+			dma-coherent;
+			status = "disabled";
+		};
+
 		usb@3610000 {
 			compatible = "nvidia,tegra234-xusb";
 			reg = <0x03610000 0x40000>,
-- 
2.25.1

