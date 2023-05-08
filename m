Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24FC1C7EE2C
	for <linux-tegra@archiver.kernel.org>; Mon,  8 May 2023 10:28:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234614AbjEHK2c (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 8 May 2023 06:28:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234669AbjEHK2G (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 8 May 2023 06:28:06 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA306E72D;
        Mon,  8 May 2023 03:27:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJRyMzr51LczMsFQOp0lqlcgsJ3JblHmY7i9Ak6TZYpV435YBEH7UpE8h1XF7CnC/Rbxm0RJV1vLUyp5K8lMXJrqlO4ZY1ZKpuobmzM1BVjtmOgufymkEyhMMw71zWplCk7sISVQv3wzdT1ZIoLuJ5G8OBTr7tsQyb1zhJb+RCIUAt3okLP7nz0tpaZ+ophB3nyiK67WhQ7SOlHE9sQnANL+hAY8BqYsx9lrlPUpFPtGGZkvIHzTqvtUk1D9XAWIXzgD7bLzLxEEs910YAdtjjPk/7WeQI20dd0QVx1EvsB4C0sfkTZT2TMflSxZ94DQImidaTwBljxHvrC2KEeU0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/a5w0QbZKONxp3gMdToJjkIIrTHq9aCccC8PnB26TI=;
 b=a7fwOnmk2TDfzy/A1erGarPct253t2xFUcWBg7klycIbetd7SL9R6r9cX8/Vadi92gDUOj5dclDb2ktUDFjogi/NVecKhLHlvqmkAjlCmfqkLuHpiy/Fy42j3to8ocHLrhocvqlXIugjY28XcOl1ASfnkRnnoZZfs1Xgq+anU/yiPr9/ekkF7revL6PL7J9fkFaaeq4ZRSN4qZGTcwkCzyDvPJJoHVttNHl52Mo5n4E10neA18mBv2bZ7/jQhBkf6RtYu2YtydqCewVYtdTY8wXrUrhRH6NfILcOvMpojePCUZvAoejJWPbZ5cgM0fGyfMhPdo5M6GZGUt0RmUnfqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/a5w0QbZKONxp3gMdToJjkIIrTHq9aCccC8PnB26TI=;
 b=B4+PXHPeb6WZBjDsdS2HjJzCb1EVr/NyT/m8SB/UjNIozB8A82hgDxTvYer8gP3V8OuKbviAhMejApG/B0ID73t8SGLpMbPacZejon18Kod/9hZaD1etzHLtTFxbDK0TwHc+FcCusN41t4OWqFJxXutRXRGXY5fr2TqzFxe1yvH5XJG0Y2t1Rjixn75YHJ+sYD4Y8m0yKkeoT3lLMHYxgMF68Pe5Wwwn2wdMLA+KPcPoPQjsg7mMdCC0vh2qg0NwSWLwFaYvMbyT/aa8MPubzQ4VzHs6VthaSMCsGZmCrva4tWQDjTCJCoCMx3J5cSZhGUZMiQpgVmTU/FD+cfpzKA==
Received: from SJ0PR13CA0182.namprd13.prod.outlook.com (2603:10b6:a03:2c3::7)
 by DM8PR12MB5462.namprd12.prod.outlook.com (2603:10b6:8:24::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 10:27:48 +0000
Received: from DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:2c3:cafe::78) by SJ0PR13CA0182.outlook.office365.com
 (2603:10b6:a03:2c3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18 via Frontend
 Transport; Mon, 8 May 2023 10:27:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM6NAM11FT028.mail.protection.outlook.com (10.13.173.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.32 via Frontend Transport; Mon, 8 May 2023 10:27:47 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 8 May 2023
 03:27:35 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Mon, 8 May 2023
 03:27:35 -0700
Received: from build-shgarg-20230103T221109854.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.986.37 via
 Frontend Transport; Mon, 8 May 2023 03:27:35 -0700
From:   Shubhi Garg <shgarg@nvidia.com>
To:     <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC:     <shgarg@nvidia.com>
Subject: [PATCH v2 1/2] dt-bindings: tegra: Document compatible for IGX
Date:   Mon, 8 May 2023 10:27:32 +0000
Message-ID: <20230508102733.1751527-1-shgarg@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT028:EE_|DM8PR12MB5462:EE_
X-MS-Office365-Filtering-Correlation-Id: 1febfaf5-ad73-4d25-b525-08db4faede8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tRmJta6CXqCPz3gJtwE3/cQOqzfj6w/iqvFDm1iu+nYn51/8B2+W2QnPujVe2RxZcBKKPUmha6WKr2eQXwYlCe5ED8p2fHN131Pah37qHDMJfZPawfnLtw174bRVL11JCGKNe0DmtBT76hUIPodwYCLe9Sb+v1y7itiLp2OvN/oyu/lPgHBtAVB/xbacQeoEhznFfjHxixARRCqv/oMgu+wDnpLJHiXRFnzu++w2IwvukU2HWeASupUXr7WAugb5Z6740dyEj/tEooTQYru9AHIN+iRkxP+Gp4xu/MCpTW6BqGZUUafshzTY7d5GRVbdxITU3QTzKZyHdvwxZCoFRhC6dNhrW+crwh8vLvu8QZfYMitpcRvpCLAnbSzZwG5PT6kNjpvfZAQ4FmCMiSmJeC+9l/igVEwtPeBb/90sOfL4aMtUIWuAPmJPSZDouJNW3uPgroU/M7zhcKL/bud7RGxnbD0rCo3+2ZirDnl7ESAmaZTz3O6F+5s6cSZoZ1z/od2J5nhR+iXTUTzd93K/FvJGERWWLshE2ulvh5L7/klFKIwklL0yLQR17tN0sJJofCkXST9GYpAEK6kefgg9lmbw3/onuNW3Lo1soUBJ/gnVCSaaLGMnAHzPKKHHaRfS97rHgcIXMvryby6VwKJcaloPB/v01pXYDVec6DPxxiAbXcdnga2ilyEBENv3CnQPedMJbfCItDkLGh+m2Ap0eQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199021)(36840700001)(46966006)(40470700004)(2906002)(4744005)(478600001)(8936002)(8676002)(316002)(41300700001)(110136005)(6666004)(4326008)(5660300002)(70206006)(70586007)(26005)(1076003)(107886003)(186003)(82740400003)(356005)(7696005)(47076005)(40460700003)(36860700001)(36756003)(2616005)(336012)(426003)(40480700001)(82310400005)(7636003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 10:27:47.8096
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1febfaf5-ad73-4d25-b525-08db4faede8b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5462
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Document the compatible strings used for Nvidia IGX Orin Development
kit which uses P3701 SKU8 and P3740 carrier board.

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---

v2: sorted IGX Orin position as per part number. Since
P3740 is designed prior to P3768, it is placed before Orin NX.

 Documentation/devicetree/bindings/arm/tegra.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 0df41f5b7e2a..6970ca1b8bd8 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -167,6 +167,11 @@ properties:
           - const: nvidia,p3737-0000+p3701-0000
           - const: nvidia,p3701-0000
           - const: nvidia,tegra234
+      - description: NVIDIA IGX Orin Development Kit
+        items:
+          - const: nvidia,p3740-0002+p3701-0008
+          - const: nvidia,p3701-0008
+          - const: nvidia,tegra234
       - description: Jetson Orin NX
         items:
           - const: nvidia,p3767-0000
-- 
2.17.1

