Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F4BC43219
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Nov 2022 15:41:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242350AbiKRPlE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Nov 2022 10:41:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242195AbiKRPlC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Nov 2022 10:41:02 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 255A3748CA;
        Fri, 18 Nov 2022 07:41:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bcGjLI3y8QCnanLbs1wWduGWOa3h+FEt9Yl8anHn4y7JERTF8nloqnCtOgfrosOCkIEA2zUIfuQFcN8dCKgFyscBpE7g9iRoRhsTCO6pn5x0yakEfPJ+AJQ7i7K4AJfiWYvKCf0qptRnu/PpAcAkAK+VPsmJSNlKDfBUpSorbmdz1oPIlwR6/3WHVUEe9Sqz12SQfHb/SblDc9w761QmGnOsJrcy/cI5ONxa/wFjdoby1cUPS4MyRPL30Dad8KXcacB0/oXZZaKSqn9/H8FXB3k9sIgv38wMR5a5S8liGpWCrItkKwFzSGm98bncSjswSL9lv/yselHjwJ0e+G25lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zv9sXowOF3TPGQmZPV+KeV3c6a1dsM37pxVovP1Ckrg=;
 b=eUWew6D4Msx+G77y2Z9f7vOMauW9WFnISEi/2PcJrwfW2oeEincV1mJTIG7/eF6dsQBAkiABwHe8u/9UReAJUsamGtfMaqqWIF1UW1gLmGAAiXeQ5qHnwSu2hMvn0Jp3LzXEC02Xtm3HmUs+m5elPP2vmJMUQnFIYZa2cX/70kFM3T/kPETYAGhLIvT3H8Y8X4BvXGemRuS031wChcXMhBmYzOUDXKahpFPHjPChLAoAwoQIU+cF5cxBLwLVgQ94b8SE2lN0/wQS63O0fPb1QmrS17sRu7qJXOnSjQwrbgbmeiltz9PbGby8Gs1e/YPOl5MXRvOdcrBGUaUmBuO7OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zv9sXowOF3TPGQmZPV+KeV3c6a1dsM37pxVovP1Ckrg=;
 b=bK9YpSjnmg6DrVP/jlTDCPFcMDHY3cmvCBy6xbwd7y9O2eHI63eM+EaPCzb/ZE/ycF4qeTwU/B8NkpAGnG6UzJGcu+tVLXW8b9y7GPS7AhXmqE8OM+YXEUOInDxPeYK7jkw+z/nO/xgIe4v5GiYMGa9RmjJqBVABz0HM1+gAhzfijKHA40KuFWwMLWU1CxToVa6selk7u2Qi+VglO6nAmk+6tLWFN1V8/96T4+G0mfE17yC1NTR0cG7tR2g0WZLocQ3Cti0KOJsI+cI9XbZ8G5IXKJ/9roi+SJ8aAQn7UeiIc4FAVE+UBBh/VaCfWaKEP3+lcV/vcxtt+DY6zjkX5w==
Received: from MW4PR03CA0056.namprd03.prod.outlook.com (2603:10b6:303:8e::31)
 by IA1PR12MB6042.namprd12.prod.outlook.com (2603:10b6:208:3d6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Fri, 18 Nov
 2022 15:40:55 +0000
Received: from CO1NAM11FT098.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8e:cafe::9e) by MW4PR03CA0056.outlook.office365.com
 (2603:10b6:303:8e::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Fri, 18 Nov 2022 15:40:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1NAM11FT098.mail.protection.outlook.com (10.13.174.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 15:40:54 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 18 Nov
 2022 07:40:42 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 18 Nov
 2022 07:40:41 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Fri, 18 Nov 2022 07:40:39 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        <gregkh@linuxfoundation.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <robh+dt@kernel.org>, <vkoul@kernel.org>, <treding@nvidia.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
        <waynec@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V4 6/6] dt-bindings: phy: tegra-xusb: Add support for Tegra234
Date:   Fri, 18 Nov 2022 15:40:06 +0000
Message-ID: <20221118154006.173082-7-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221118154006.173082-1-jonathanh@nvidia.com>
References: <20221118154006.173082-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT098:EE_|IA1PR12MB6042:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ef512af-b8be-4db5-0a0a-08dac97b47c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 85n1jdoQaJRzaW1rYE+voxMqaYu2dKVV8amfQdEr/vOZnvcMgKx28cvwW4pcCcu7frTMINEGVGj74/gKB+o9O3ySxqgo534kyfNXjszepKknzjFLpPp3k1NVdA8d8L58N4FFVbV6jDkJX2F8vOeIDhg/D5K0Iv1Z7HKnSn/jiRvHkz+nwwGbbCHk7dTzlb5NHpWw1GnBcDK1X0wB8O49/wW8vsyLKEMDQ0buPmcPjd/vtF76TKU4ThKxOADOnDWHaHeSv/vBpZrO3GxDkYP8jHXnpo7z/JhW6RWPWS7nDEGU2UAjPSviJjYHvziqJ7ScV/xGb7EUSYN5HUyAbEiwp3hIVFRiu+vHL4wK7c3FCYLYMXUkgoacmdU2SwHSxEW4XYOgOt8J9uItEzlG3V+GCtLk8InZr2iQ3SMLWm06b72rse3cVGE6q2/urOdIFRC80Tz4ZTUm0hOE9Mr/78ufG/T7l+ZU1cD1gNJ6eF/u32Bn6y5AkrxxsNP3+tkEQZl245jYb+lttRhEj/FCOJC8CLRa+W1s5Qtttnyeoti0mPzDuiYcjxIg1k/GUuhm7OwOrrlHDaB4abn4jY5jcrYzh6HFef0JA+NoQiJ+eNjZOD9hxnOJ6k/So16pdglqYYLrV6HSrDmQgPXjhkSSTxzW392NtSh6QMKPhI7P+awimZFIks7yoWErwLwQRc1QUFxWd6/D6V7xcSzyfFdJFWvgcpksacoGAOsBFLHr9nGjmJU2s4vFYEQUPfuyOKbvqqojanXP8tTo8VUhIBDITEyNYtGH5FczkqLWAv6egI5GuBw=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199015)(46966006)(40470700004)(36840700001)(4744005)(47076005)(7636003)(5660300002)(426003)(316002)(2906002)(83380400001)(40460700003)(41300700001)(70206006)(2616005)(26005)(4326008)(82310400005)(40480700001)(36860700001)(8676002)(336012)(1076003)(8936002)(36756003)(186003)(70586007)(86362001)(82740400003)(54906003)(966005)(7696005)(478600001)(110136005)(6636002)(107886003)(356005)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 15:40:54.7014
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ef512af-b8be-4db5-0a0a-08dac97b47c7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT098.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6042
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add the compatible string for the Tegra234 XUSB PHY.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
This is a new patch in this version of the series. This patch is
dependent upon the following patch.

https://lore.kernel.org/linux-tegra/20221118144015.3650774-1-thierry.reding@gmail.com/

 .../devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml b/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
index 1c570ff65eb4..5302fdb0949c 100644
--- a/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
@@ -42,7 +42,9 @@ description:
 
 properties:
   compatible:
-    const: nvidia,tegra194-xusb-padctl
+    enum:
+      - nvidia,tegra194-xusb-padctl
+      - nvidia,tegra194-xusb-padctl
 
   reg:
     items:
-- 
2.25.1

