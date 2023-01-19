Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F67CC46467
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Jan 2023 10:43:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230410AbjASKnZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Jan 2023 05:43:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbjASKnJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Jan 2023 05:43:09 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C6981BF7;
        Thu, 19 Jan 2023 02:42:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWunFg52cInvZOVdGOX5sj+efGISAQNPzwF3YGCJoZEXcjPbKHcUD2mdcROXKwnGjcInITusPZ+1QM4yRpu2JAQY7dmQPvybmYoqhRi15qYaA0RkeYIV3lqUcaTB5feDfogoeZYbYADnR84UPmf0PavyN2GqTsVZplgaxXseIFVaQpXQW5uvCk7HxXRIVcSvpDAqTt7EjwmrgZh0jrNO1vGCAyXv3XpmRPPL+pO2BcocXhJ94tjo8YRZakhTMHv1ZZ8l+lRKTYBFs//5BIzOFHhlJQCViDfQ/B3tMbwzz+5a3JgO5qYY4l6KKLAzn1N9mT/e2SzLRZKzxG7Vlf37fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SP06qtiTu2EIg1o9YTXjLcip1hhN+7qpuv7F+XuyjOY=;
 b=Jcr/8N7I9qOl2Xrm0RlJER58dBsx5DnK0SWd/YUhqw4/PnizAPyXYsUXFl4+TDpiPMmtFTcrUFaSzOB7ImMCCL6KmXFkGwuznxYsQCtLeJSifRCCE5TUARYjCqN8Bs+72Gr9kJio1XFdcanKfxUr2xl3Bl1jKSaaicJm9Lq1nt/CU18JMkMJ8kq2gSEFBfMQlTKM+oshAYxlu1n+PfmfBersEZPm3EIjAETf2mPgRslLmLt/sW7UWUEkdvfc0IhyYGIMAYb1ybQWQ34mCA1JeJQSarGeywfcTAHwBkzUd5oIIdTITvVLySRx9vtBP6GkNmOs0MbCjsFgLs9I2N51BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SP06qtiTu2EIg1o9YTXjLcip1hhN+7qpuv7F+XuyjOY=;
 b=YqA1aFdyZweJG6QYlOww8h7SHp6omRAqsW7zqqlEpFNpCX6+aj6yeGNwrEDEMmMxiUt7HWClsrJeTDvk0nWdcjsSabCaXwnnL93rrQv5OBPR8QobmsvV/UTGFKdxYrZHlSP8f9jX+VeIpGMJRx7skBGfKrbstZm6lMVqHogIImfHGOWG/CZFLgq/zS4rf45pxO0Nh0lcFg+VOTj2ul31lbkC7NZClDbdgav8Tkwdua67ncgp+I4nl4hyyOsDW2FA8LHEViG1PTHVPI6ldjZuDZD3oL22mhR4eW1ESB0qKl4pkuRcxGWYHUaKmylHNuXDadpW0lig0n9OR4Ve1EUZvg==
Received: from CY5P221CA0053.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:4::23) by
 MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 10:42:34 +0000
Received: from CY4PEPF0000C985.namprd02.prod.outlook.com
 (2603:10b6:930:4:cafe::7d) by CY5P221CA0053.outlook.office365.com
 (2603:10b6:930:4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25 via Frontend
 Transport; Thu, 19 Jan 2023 10:42:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000C985.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.11 via Frontend Transport; Thu, 19 Jan 2023 10:42:34 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 02:42:24 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 02:42:23 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Thu, 19 Jan 2023 02:42:21 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V5 3/5] dt-bindings: usb: tegra-xudc: Add Tegra234 XUDC support
Date:   Thu, 19 Jan 2023 10:42:06 +0000
Message-ID: <20230119104208.28726-4-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230119104208.28726-1-jonathanh@nvidia.com>
References: <20230119104208.28726-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C985:EE_|MN2PR12MB4206:EE_
X-MS-Office365-Filtering-Correlation-Id: 39e9963b-3b0f-4412-506f-08dafa09dfbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JMfPv4ry+56U1yBtkeRWucHe2fi8ZxEZHxou96TUkcHIbyU1xMm6OSajwtiLcRllQArvFCZokAqbTD0Px0tORZ8/1JRW/XrjCtwDliYoqqy98f+x1Ay+2NjDgjXJ1eN/0OVeKNOErj6jCik2+kNbp4tRVJ3/ZHyMoXiiIS/3Zn2CEEhv3fJrjiesQSG5BV2teqmr4I+XSn7rKM+6g7AXy07PJF90jaUzerXfKsj0BkYgfHkTl6umR2mA6YnsjBnTB8R+gTRFC1pf8HZpXiScVlXh5YArVUMtOHX/OlmVUtEcYY4X2E+xccGjSHSm62L1O70VpJtUJ4eZldwxqKYFttZzyC/OA7mrH5sbULuv3OHEv7YYc1h41ii2sfDDafiN+BJVhUDbckkfGNpNSx+jxo+SDuFUQFnkcU7+0O0csD5KGMDBRgA4H/7Y4wqx9140Q64SiHIME31tNxvBUXYhWcAKfApBBrHiBNBuNspSPtoBNjEhnV+TI2pT0zxcFAp9QNKX90SAicQ9OymwtOmIuh0mYfwTNediudlQzE3t8/c5ySd0tyJSwmTtwLdX+PCWgW/9x5TKQSPTj+AkfrgaLQLH4hh8SfKW6L+pM/Y/hKcg6nvhty63OoKH9UH1sWJJi5RWhTIb8+Pz3GznWRIAO51idtxbmDAhMo3hhM7utnbEkCgauv9KJ7tH88AHPd279/Ksxj+aoK9X+dyvFItDQw==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199015)(40470700004)(46966006)(36840700001)(40460700003)(86362001)(6666004)(478600001)(36756003)(7696005)(8936002)(5660300002)(316002)(82740400003)(40480700001)(70206006)(70586007)(8676002)(4326008)(41300700001)(36860700001)(186003)(356005)(2616005)(82310400005)(26005)(2906002)(7636003)(110136005)(426003)(54906003)(47076005)(336012)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 10:42:34.0497
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e9963b-3b0f-4412-506f-08dafa09dfbb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C985.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4206
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Wayne Chang <waynec@nvidia.com>

Extend the Tegra XUSB controller device (XUDC) tree binding with
Tegra234 support.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
Co-developed-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
V4 -> V5: added Krzysztof's ACK
V3 -> V4: added 'dma-coherent' for Tegra234
V2 -> V3: nothing has changed
V1 -> V2: address the issue on phy-names property

 Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
index 4ef88d38fa3a..e638f77658fc 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
@@ -22,6 +22,7 @@ properties:
           - nvidia,tegra210-xudc # For Tegra210
           - nvidia,tegra186-xudc # For Tegra186
           - nvidia,tegra194-xudc # For Tegra194
+          - nvidia,tegra234-xudc # For Tegra234
 
   reg:
     minItems: 2
@@ -155,6 +156,7 @@ allOf:
             enum:
               - nvidia,tegra186-xudc
               - nvidia,tegra194-xudc
+              - nvidia,tegra234-xudc
     then:
       properties:
         reg:
@@ -172,6 +174,7 @@ allOf:
           contains:
             enum:
               - nvidia,tegra194-xudc
+              - nvidia,tegra234-xudc
     then:
       required:
         - dma-coherent
-- 
2.25.1

