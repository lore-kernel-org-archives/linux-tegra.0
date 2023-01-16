Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23128C54EBE
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Jan 2023 15:22:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbjAPPW4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Jan 2023 10:22:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232058AbjAPPWM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Jan 2023 10:22:12 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2065.outbound.protection.outlook.com [40.107.223.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B2CA55B4;
        Mon, 16 Jan 2023 07:20:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RU6YfTxBQfzQhOjByXQtna/KV7OjzOp5yYKWw5xgnbKMGOrC3lHDH0MQiokt3b0lwM/zOjc33D229mab/W6H3il4uRewOH4JgRnBxA/G83qxTtUx5xBBIXox0ao2IrpErM+ys3lUlpj/U4cDsZSTSk+uwTeYkFsMARmGLC7wglGsaf48MPsFA5Oe/lLkFVzAfCYoCrJLcK/rZKdrGtO0U2j5nfv7TSAx8NzFvcBGqaaBJze3VpXnUasdefVlWh8mIEKGKRxKf4AzEGSP1kHxG1a6cqdGdKnQBWQ8XsZHPZqwWKVmfT0WHZB2PQV+nSV6UgdmqI31fYtKn6FUJlPUVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SyKt1NzrIMfq1hyjPp9yxIo6IRkqyvnZzbQYJVs8BGU=;
 b=SXJoyuDRLczdZdN9EzKELRHP/dQYXpjQV1Q1Q4O8OHQ4UbUy28is2EqCNW9zzWOQ+T2dCd4XkYAGV8ykC1i/YmxIjLythi5jAxNJAa+sV6h0OEwjbQkkVR1CDsPeiJY9Qu+VpXGKdv68k6GNavaMeuIaOqQ4nD7LRjirTQ+Tzh+AkunyEFlu4ehJFbEGefMu/FM2FkRh4uGLiEtfoR4i9WQx5mWT4QapvWjv6gDF+pLj0KtohelpdWgcjS8jmmPjkYrle7fvNGOCahYfA1s62z9QCo9gYo5nsFEmAdRaxp5dK9OJxw/LOajCUOvPsKpfUyVfQQ/0Vj/zbdcWc2BvWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SyKt1NzrIMfq1hyjPp9yxIo6IRkqyvnZzbQYJVs8BGU=;
 b=twTKdm5dP2IRCl1ye4skma6mHaJ3aNu03EATBiYSXnmXf2ZChiPhVelH6mAlLFXnXnX/SHXAYO8W3YB3aZhBPiTzbf8YSpVbWiQi0qvnjHF6o7Wn7mF6NpDhJ5NTogjs5IsCU6r2eDBQwgulXFzRAzOcRiZ0VgXSyFkGHu1ViPVH6TCkGBE8ERuZvnJjrS1KZhNhTOCfTAK6yQpY1sF8XUWOxqC5xRj26r734dFS/Uoeta9sNgg4Eu4uorMy803OGPM3LwpPVamiPsK0uuppdj639C5jaENDNYXoZjW1wsikk9CLQIN9powyBBR2sDlgTwskenpZzF92K2zhZZJGYw==
Received: from MW4PR04CA0142.namprd04.prod.outlook.com (2603:10b6:303:84::27)
 by IA1PR12MB6209.namprd12.prod.outlook.com (2603:10b6:208:3e7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 15:19:57 +0000
Received: from CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::fb) by MW4PR04CA0142.outlook.office365.com
 (2603:10b6:303:84::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 15:19:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1NAM11FT046.mail.protection.outlook.com (10.13.174.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 15:19:57 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 07:19:40 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 16 Jan 2023 07:19:40 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Mon, 16 Jan 2023 07:19:38 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [RESEND PATCH V4 5/5] arm64: tegra: Populate the XUDC node for Tegra234
Date:   Mon, 16 Jan 2023 15:19:17 +0000
Message-ID: <20230116151917.94193-6-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230116151917.94193-1-jonathanh@nvidia.com>
References: <20230116151917.94193-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT046:EE_|IA1PR12MB6209:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c38b4ce-3b96-4f6e-2a0a-08daf7d520a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A5W7QWD7WdRMhlUPjYy/3bTiajH94jc8m/RPTg8N0RAL7KfLbtjXH2H7oMESxj0AVFPQS8naeIYFicCehmWpXeMuVJNrrCpN1BRJtu5osLTJ6qqUegfi7esyxwRsfVDQ1/PsnWQcLl0NyV5KoiRLLa/ZWZMMCESuAjnOeVEYKb7RzO1w5VlmdElUBdFdR/6rFRGmVWfSEPS3hWYxuG8uHdN18ZwcZiAZTVSt1QORdbZNZYOKgVR3Cd9U4EQuNC8jFJWirrX0lr8f10j494B512NLna6oTeByEsjr8IgyN8cSBXsByBLlNLe5XZ/w0i6QPYPXSfeK04cXJWSXsmZ1SYldV2TO/gUGHxKqJivsOVORimXRZQcJC+AYn294Nr6e/dCVesV8KmE3ZCb1BLOkL6e2REmXo5a6aeNQE5goGe7H/U8fNKKsq/1w2hPv2tybLcz4W4yQzh4bWDO1x689RhNcmPkeu+lqISDx5Oauf2AZBLaMNiEtSdw0JILzG7fENMu4g4Q9c5LxZT/49yW+tGpDWfTVbRvlTPwbP83alab9RxguZ+AZ8tbQRUap+IxZk7FzPZnPzW46TmH23ldaobYL5cpLoa/61FwwSe0ICbB/zfxHpl/u9mgWwiix1SyJ22ktZjcc7MC74HRpAWcxk1d1NkAjJORx5pALHWLiZeNNADfkDv/oibluWTtc7cDP64eMTntvtbyLVk8+AjsZew==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(36860700001)(82740400003)(83380400001)(7636003)(86362001)(356005)(8676002)(5660300002)(2906002)(4326008)(70206006)(70586007)(8936002)(41300700001)(82310400005)(40480700001)(186003)(26005)(1076003)(2616005)(336012)(47076005)(107886003)(6666004)(316002)(426003)(40460700003)(110136005)(54906003)(478600001)(7696005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 15:19:57.3461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c38b4ce-3b96-4f6e-2a0a-08daf7d520a9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6209
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Populate the Tegra XUSB device controller (XUDC) node for Tegra234.

This is based upon a patch from Wayne Chang <waynec@nvidia.com>.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V4: This is effectively a new patch that has been added, but based upon
    a patch from Wayne Change that added USB host and device support in
    a single patch.

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

