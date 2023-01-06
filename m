Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0235BC63707
	for <linux-tegra@archiver.kernel.org>; Fri,  6 Jan 2023 15:30:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235416AbjAFPaQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 6 Jan 2023 10:30:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235633AbjAFP3d (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 6 Jan 2023 10:29:33 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB7988B770;
        Fri,  6 Jan 2023 07:29:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyBGtZbs9UVFLgNKN4EQu3i2M1nrs9TNFeyAySnqPnSqLUv6FjqzLdY+SQ8ruhEgX5AsvOeupie/Gel79leFmVUo71fyNMujSv/HsufDoL9DYJP67ZG+TwuGPy018XSdUtG41urEF2kpyUI99dxouCCLRueIgf/MBfHyIvSAl+vBoiElW4RaRncyiGt4Bvs/WJDmciXh60RY8R5ykY1g7d1Rl01xLgYnfPKczL8bwGyJBDBVnY+gaqTJh42ADYk/hIndnYPnexFKLGgbcL/BPEnNcsehNJ1YNYUoxUca28ParqYGZiZsChl1psAFBGNUiDoa9k1jO6k0fmLniWsPqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAp+pj6CHvqD/Pn8AfuIy/ExWGmAcAcuHlOvpuel4RY=;
 b=GOSqi7PMZ+I0XHNRFek4VNQ4PlRDOiYz1C4ga1GokBI5ax/R7Iw45h/1RPOH9JsRfNpRGBZOVIWl0pDDNjT2/5CddhiB02JyP6GWXUoDf/yWxFtOVxblQfdScQVPcT7OujzixSB/6BXzOzaeX8J1HrL3BZ0E+0+lSM6zFGHDVUeMlVJ6QqlicUfdYyIfmqEpRy8XjB5D7BbVtnP6CyClb1d11ZJCuZipTJMrjAWKTToTA9QKE0AktXR9bRF/oCh3bXpRcyDywFFE9lSkLw6eI1X4mujLtevlHEI2dt94EX5BDEe1k03GwbCxRZ1TMFw+wU17J4YKQ9T13s6XEoUyuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAp+pj6CHvqD/Pn8AfuIy/ExWGmAcAcuHlOvpuel4RY=;
 b=NtacOI6X+DkuGraycztZnWz0qFqHXYb8EtjyYzoUKvx5s1MfbOqMH4SttwMVvPPQjsgXY9JCAfOVldNqj4lFNzGdWXWFMI/5f1AZbNNP0DugzTTZw6HeqfXnjM7KYUITCFzhlTJu4I/0MTIFJinRCbJz3tLFUg/Laq1yatx4P/SH6O1BqILPtYvOYfceFfpcUa+xcqP1LcMJwzuLzBETTZCG5jz0OhTXdLdAt8ZWUXxvBA8tfzvkB86CmnVx+/PM3djtDR9np0mDHibMjPd6BP8GWOhUTFjluRvf4Um67LVaHgaPUBLVRm0XeeWsn+6sVOLqaumlXJbMoxNxa9vBBg==
Received: from BN8PR15CA0014.namprd15.prod.outlook.com (2603:10b6:408:c0::27)
 by IA1PR12MB7614.namprd12.prod.outlook.com (2603:10b6:208:429::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 15:29:30 +0000
Received: from BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:c0:cafe::1b) by BN8PR15CA0014.outlook.office365.com
 (2603:10b6:408:c0::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Fri, 6 Jan 2023 15:29:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN8NAM11FT058.mail.protection.outlook.com (10.13.177.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5966.17 via Frontend Transport; Fri, 6 Jan 2023 15:29:29 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 6 Jan 2023
 07:29:17 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 6 Jan 2023
 07:29:16 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Fri, 6 Jan 2023 07:29:14 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Vinod Koul <vkoul@kernel.org>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <waynec@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V5 2/6] dt-bindings: phy: tegra-xusb: Add support for Tegra234
Date:   Fri, 6 Jan 2023 15:28:54 +0000
Message-ID: <20230106152858.49574-3-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230106152858.49574-1-jonathanh@nvidia.com>
References: <20230106152858.49574-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT058:EE_|IA1PR12MB7614:EE_
X-MS-Office365-Filtering-Correlation-Id: fbeea384-5d70-43b2-9a3a-08daeffacddf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FZIFJQb1ESCztJihLvPxcV9VGTgGUfFXxh6xGMkFOxfvqwl5bhLAitr64iSxmZZ3eXj6vqBrAavBc4bJ/bGinMGa3BFnfShM652EZuPbrvsPxq3P91fTLJqoN1Rfdy3X45I/absRhXZSCQzt5WAOCh1FAts6LRH/I/ta8a7eUFBYdsveATrwium7KUV7i0fh2KrY5PeDMoe9y68CtiFw9Qk6DXnQRC8quqWIOsMrutYWspL09MJ2tIGdm37ABfKEkkc6EBdECy/2IkixN5xNOynqY1g54Cqhe5YijS+sPNFyzT3geW1L5RS8PdAfoHowaQofbZqd96GwRIK9bde8u/51WcPczUWqLqC0PX9n4xLdrHRhsfFrh9SIuSwgFy5LQNCydeQ0tC0MOrAsutyOaWGnaCBMCLdVZ1+x2bPMYrtsZ3CkhZOdEngic/fO6Z5mS+f1+BpM6pkO7F8Zc3tf5n/wfBpVqYLxufqKxh64QxIKeMMxXIGUFvh9J9d749gFQJ/ZLT1nUhsDVtb3ta4nug7WpBJl2rADUUKLhIbWeAAgONfg2+vhDL8ti3U10DDlL1d0Q9/ua64nOJWF7zNJBxUqpY8M2hrQ47ohjElGT25/7N0hKVNgOPPCL4+9Ng2MkhLVKcKB4ZirnvhdQmEHmRD/PFkHa4EsGW3JPl9c3MRzKxuw6hLh6KKDaC9ycENzd4DldpUW3BPufvRPFAJdyQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199015)(36840700001)(40470700004)(46966006)(316002)(4744005)(5660300002)(70586007)(2906002)(41300700001)(54906003)(8676002)(8936002)(4326008)(70206006)(36860700001)(83380400001)(110136005)(82310400005)(107886003)(478600001)(6666004)(36756003)(26005)(186003)(47076005)(1076003)(426003)(2616005)(40480700001)(7696005)(7636003)(82740400003)(86362001)(40460700003)(336012)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 15:29:29.9161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbeea384-5d70-43b2-9a3a-08daeffacddf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7614
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add the compatible string for the Tegra234 XUSB PHY.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V3 -> V5: Fixed compatible string
V3 -> V4: Added patch

 .../devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml b/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
index 1c570ff65eb4..873a97df5150 100644
--- a/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
@@ -42,7 +42,9 @@ description:
 
 properties:
   compatible:
-    const: nvidia,tegra194-xusb-padctl
+    enum:
+      - nvidia,tegra194-xusb-padctl
+      - nvidia,tegra234-xusb-padctl
 
   reg:
     items:
-- 
2.25.1

