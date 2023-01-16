Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88513C46467
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Jan 2023 15:08:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232955AbjAPPH7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Jan 2023 10:07:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231688AbjAPPHe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Jan 2023 10:07:34 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5706B2FCD1;
        Mon, 16 Jan 2023 06:55:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kHe0Earwgme50kzZsdktPziUawv68SKuz6o+KOhUughxD7al8hh/BA93kAyLziG/Co6DWzY3+tXj0EgEun7jUzsoVoEheh9/HA3nf4IbzEPGfPFa3tVU8zbbIUysbPEtNN+uZ0z39Hu7uFaasbn+IfzbOGFbeMveF4s7MFX10p0znT7LIEjzKuUgnHepkoiCqDUxa2uTCQAT6maWgEbXMs02y33A9Iw/wJ3Yb4UPPhrR3fQLF/9h7YTkg+G/6GV6fEipS1rjj3kjhv+mI4MxVNjJ31UMXOeXjr4qDsVsAcAMN+mWKW26E1EzBnZuGKFHierx2GxP9qQgQddsFKBISA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lyJp8VGY5ZOHbC+vhrmh/QY9ASRgEpkIDyGhKCPLFPA=;
 b=aXtAXJAvSexbtRafHDtOCLXgnklq0IM+rscFx9nunpkF61n1PoZ8kWk0Xh2JPPGSo/k3Wo2Xm4tDlQLpygi8QngYkWbr4lmoZtkndC4+2mHyCrH4oMP6qAqEm9HyUUYboG+UNc0gAYcCN9OdGwGJimAIFcb5gy23PWOw2T/JJaVoEc2ZSb7NzXONfHB+5M4Ii3DoB4J5V9jz5u2q+o35sg5w/i75oo/k9edd5wIqaqjwvSZm9kNeuJv0KpFhul5NKahahuPhBwRwz2mtfix0NsFVEg1zgsgdP55TdJ2uAzNczYaCXqoR+Z3xNohh1i4/GaH5gib2h5eH8Wxyk+F1lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyJp8VGY5ZOHbC+vhrmh/QY9ASRgEpkIDyGhKCPLFPA=;
 b=A5bEvXOFA0xz57fWsHvZ2VGcbTuC4jZ1wG456B381Yp9KWXyNPXUDo5KFJbMV0LfxCbsDq7aFRin2XxhEJGH2bmhyylO+d+OqXCwKO6Yty0WRwLd1ggVgoQ5WgY8HTox/olxr8/AAFZe5V5ZiaztyKo+7b5z+daDGpJs3UJi0YiOnPCcHtK/6sUsC6FuydgMmLFupfBfyRUSvp+q2SEZdfu7j4NWc2KMTS+in/Get6zjQ2QADrtH2KuJGX2v+l4Xy3lHFBu3yJ3SBzFRUcVw6WgozHUmRmVYSM3EWbjmNn3PcXoan4/X0wRX8GfczWQLCu4AyMFoUm0BnFrMTMRUyw==
Received: from MW4PR03CA0357.namprd03.prod.outlook.com (2603:10b6:303:dc::32)
 by BN9PR12MB5257.namprd12.prod.outlook.com (2603:10b6:408:11e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 14:55:17 +0000
Received: from CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::a7) by MW4PR03CA0357.outlook.office365.com
 (2603:10b6:303:dc::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 14:55:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT052.mail.protection.outlook.com (10.13.174.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 14:55:17 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 06:55:08 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 06:55:08 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Mon, 16 Jan 2023 06:55:06 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V4 2/5] arm64: tegra: Add dma-coherent property for Tegra194 XUDC
Date:   Mon, 16 Jan 2023 14:54:49 +0000
Message-ID: <20230116145452.91442-3-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230116145452.91442-1-jonathanh@nvidia.com>
References: <20230116145452.91442-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT052:EE_|BN9PR12MB5257:EE_
X-MS-Office365-Filtering-Correlation-Id: 96e69f56-36e2-49ce-79c4-08daf7d1ae75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0BC1WrHsqzjMpB0BhGALFUmYR++ucfte34AfAAvkqc8cnal7mDNICmeaafWmIpV5pgCsigFw9eMF1ylIYx6It81p5kAQso9yOl9yufwWlL/aqVyyoa5gKUrSJW0BJIrniIw7uU4/AvrdzHTxkJDXTYAUWNVEe+kt/dECg1aT7e6dpjfpXcDyFkCK6ZDTSAsMsLQ//gyTvBsbNYZsNM5xCOWdJlfwtKJx+qp39TQPgKfOdyBDwX3Gr/PEDM9yAFPqvIT3u4B3uRYux1i+GI9t9mrHGja74a1/WXtGN3oOSNuqQeilqP91F5zGSLFELolKN+Hu/Bj/GGzKi+03yoBq0woTMrsmke7u74njhOaz+5LGWpa6mT+K7RF3z5Yzn7WjF+ROmFeAvbOHyKV8AYiEwCLnbKFaKk+08GwZZhdpuMu1330VJ5266QrZP7JiRHqBTS5rlT9algiKeYaRPq3siUun0Rbi46MNp2BArlQSCVG/X19yu3pVuyMSH5OLMvnEYjT8E9XPVsYS/QjNent3Y0Sewdagok0JQ1xAbvdsvbidTPkoQ/9YtsdUYD25O5exTlavHbcrv0pafnALML11keRdMBpUATJfqayIsiFy19LwedvKRBSrXRTt6/gt5bJrZ7HefbSP5eqUfFGLS7qn8Syz6Lav7rXnXF2Pk1kRCvRSXCUizUpM5Fe/Dnjis/ZGej4MW23GhXP753meOI58wQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(346002)(136003)(451199015)(46966006)(36840700001)(40470700004)(36756003)(8936002)(86362001)(356005)(70586007)(8676002)(70206006)(4744005)(4326008)(5660300002)(36860700001)(82740400003)(83380400001)(7636003)(2906002)(40460700003)(478600001)(7696005)(316002)(54906003)(6666004)(110136005)(40480700001)(82310400005)(41300700001)(2616005)(107886003)(336012)(1076003)(426003)(47076005)(186003)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 14:55:17.2412
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e69f56-36e2-49ce-79c4-08daf7d1ae75
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5257
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

DMA operations for XUSB device controller (XUDC) are coherent for
Tegra194 and so add the 'dma-coherent' property for this device.

Fixes: bc8788b2f3a0 ("arm64: tegra: Add XUDC node on Tegra194")

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 4afcbd60e144..99eeba8de6bd 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1291,6 +1291,7 @@ usb@3550000 {
 					<&bpmp TEGRA194_POWER_DOMAIN_XUSBA>;
 			power-domain-names = "dev", "ss";
 			nvidia,xusb-padctl = <&xusb_padctl>;
+			dma-coherent;
 			status = "disabled";
 		};
 
-- 
2.25.1

