Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE72C004D4
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Jan 2023 10:43:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbjASKna (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Jan 2023 05:43:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230194AbjASKnM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Jan 2023 05:43:12 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35A8B44BF7;
        Thu, 19 Jan 2023 02:42:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FwzhDmz1+ket15G68nTn2i1QvenqWZ8b7ZuRrFZaESs931T9hPPQUHPHxwlkm05l5HuYNBz9f+WJ6v8iuSBQ+Vsqhrq+Tph3dXqnv23CGxZKsbtL/iwZzh5CRRNxGC3IaqbdkW+Wv+FscrmdIROo/83E6ZBJiqbMjn2rTc7kbSS5mVvD2PvLIm14vVL1e277CcvTIZBaJXAq55Lk7a659dv1maAKDrKCKSUb+NsRIE4JDzragbAzUjGMCcYM9GQVNDt9h63t4iZWlG/F8uyuISOahZdi/zQv4NLlE1UvoWWbdE2pKiOUoW8yfZyeXrWCXEHtjUhVZvxf9xED4y/V1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ktNQcZcw7Tnz+Lzteza0SHXXEQHQcszCvb+eseQEq8=;
 b=EPxGf4NbcDl41DufMnoImy+c1F5oTbDA2VZHCNaFQnDKOzHIBq4B/CGS2fdYhu8+TkXvTpGtP/bQ0LszUhMX0zPFLMP/SPGUdu3rwfMlu/Dfa2CIzaS4wr4xG8KlrGbs6R8HXf9TahGt7MZ2RF3p22UXcWPP0YqDcnsKAITcWQEbuihUiDvaFKw7t1djU2YfbJP1B0EwOQS8GkrTs/1Hze2smx1wa22eeIer0gpNgx2wEd6Tqq5fIwf/UWJw998pHsMY9K9PR7odbhqpSmeesugxLlSczQR10hl1VLpF53Rk9P24Mb6ZVRTFimgnfhkuIw0ygCDrhp4x2+DviuL5qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ktNQcZcw7Tnz+Lzteza0SHXXEQHQcszCvb+eseQEq8=;
 b=Lk+ifcfwzGIS6TxLwJQ7ImUcBRX9c6RraWAQd85JMq4fjeSmHmpur+Qe2dHVwSCWKcfv+fQWbUgpz/rS2OGrKmFChZOosS8ALIzHs7TlfcKtC3amY/ymsWJEodtu8x2KkFV3sVY4GoSscYxx8WUqGx8IQf9arc5oBxL1pt7yOJgClPO0y55uQbI1dF6MeEe5myrizBwY19aDuLZIXZUtY7qJta923HXBz2ZNloajjvhnCMnHvc9zUFsvYla6tkeYEngtd6F7BcbeYaNOBFmY+RyThMAFwByZ1ZvncDpKOVd4jKVhSbfOZlyY/S2Old24gAE0yebfUSycYmFcts8snw==
Received: from CY5PR10CA0020.namprd10.prod.outlook.com (2603:10b6:930:1c::10)
 by IA1PR12MB8335.namprd12.prod.outlook.com (2603:10b6:208:3fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 10:42:39 +0000
Received: from CY4PEPF0000C983.namprd02.prod.outlook.com
 (2603:10b6:930:1c:cafe::83) by CY5PR10CA0020.outlook.office365.com
 (2603:10b6:930:1c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26 via Frontend
 Transport; Thu, 19 Jan 2023 10:42:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000C983.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.11 via Frontend Transport; Thu, 19 Jan 2023 10:42:38 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 02:42:28 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 02:42:28 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Thu, 19 Jan 2023 02:42:26 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V5 5/5] arm64: tegra: Populate the XUDC node for Tegra234
Date:   Thu, 19 Jan 2023 10:42:08 +0000
Message-ID: <20230119104208.28726-6-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230119104208.28726-1-jonathanh@nvidia.com>
References: <20230119104208.28726-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C983:EE_|IA1PR12MB8335:EE_
X-MS-Office365-Filtering-Correlation-Id: 6df32588-1cfa-4b72-0032-08dafa09e28e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xAsKA+p+Bk83I4u/t4F/nZXrwBn5l/D2h5KrH0vs2m+Y2GLHv0uBW8v0lc6E9/OC1g6MWAXHZnx9B6dMuO49Jc+A7FeLdI3kGiaL0e8NfW6XaFbjKNR0P6vGjHEHLJFM3+OokYuIIR/neyDf5ESH9rUrfdDHvg6HcyKiINpOd2kqQSzQyniAuERndLHn3bvuMWr2DxK33qHj3+sha9naVax2tg70CJPxUfVjCKNtDLb91HVrm89viRrgozg1y7aV/ax6WAPIr47wPWVCQjsRtDWNIzlQLEVst7d/iddAGufb4bzIk6H0wj0Y6KP37EZ/777/699+K/ExnH+ioWFEOhhlN3yL9R2G07hBInXx+8XPJEslgg2HdDRRxgk/Qo3RB91MJoszfZggdaRpUxdDKAM1ymn0Xscpq4kvtDkmyZGR7kfzLwy2OiScxPa9TaSdcyIq2lqFArb5su6svel6+ck6HgdclHbonavISSBYGHupJLirZkFnhNY/1XNgKHetX4BU94Ld7/xOWCI+Sjb3a5cgt2Bu7PPTLE6MtxSLmbzvukX6F8XMjWtLws4iOmrSx3UNGLgJOf/IbiKYghvsdyUeZblR6BkqZnP0vzQeCAehIUdMa8lC68avYdumNeJrgbWZw4mP82vdhRASVMiTiWtNdyhTQ79N+0VSsK+PR+DRS1fN06EQrKOV9+N9Cjfv+95JfXr9eOI9eMaby98uQg==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(40460700003)(356005)(82310400005)(40480700001)(36756003)(7636003)(86362001)(82740400003)(7696005)(107886003)(2616005)(6666004)(36860700001)(478600001)(186003)(26005)(8936002)(5660300002)(2906002)(8676002)(4326008)(54906003)(70586007)(70206006)(110136005)(1076003)(336012)(41300700001)(83380400001)(316002)(47076005)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 10:42:38.7703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6df32588-1cfa-4b72-0032-08dafa09e28e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C983.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8335
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Populate the Tegra XUSB device controller (XUDC) node for Tegra234.

This is based upon a patch from Wayne Chang <waynec@nvidia.com>.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V5: Nothing has changed
V4: Added a new patch

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

