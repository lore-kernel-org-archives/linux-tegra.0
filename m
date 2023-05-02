Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FAC0C77B73
	for <linux-tegra@archiver.kernel.org>; Tue,  2 May 2023 10:54:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233450AbjEBKy4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 May 2023 06:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbjEBKyz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 May 2023 06:54:55 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E98919AB;
        Tue,  2 May 2023 03:54:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BlfSGoe5PUASA+zk1gTJAVJ2uvuF+1Dt7oCfg3c9H0byOqLciGpMfZl4U55cR8uWbMDFWEu59kROjJ8KNcXb9CTmQxvkpB3O8JpBuw5xrjkN3dYpAgpZQmIZOAcQhrH/aZrPptZw+SPH/wcrAfYBep68Vu7vQImtKetsLX9HMoNS9JIsuq+k3Wz5q56ZbpTCRaNFD7zggzgp1cpq209y6EK0ShZjegT3JbkUl78L+3PcDmVKKXT+ElGLhnlZOze99MRmue2jZV2LgDQL4MFxYMMXvY5OEDSLyhPSaElNevbkUaOpr0pxq8rhQchktYvhcIXlT5Q3cZTBRM6EfsL8jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csjxRFqD8VX4FMTK/9a8EFjf5T7MrNRPGe0nBZbLlVM=;
 b=i6NYXqaqXsuPkLoe8GBbDMvjoNsikPGErWe5YHqnnKmfopPLeq5tER/yj/DJ6RaAZ6mYAhfMRzMobHV6MOluUKHy+PYNN3UO0m2ZaN/9FuwwSWF7Usiqae6ZeZHpeloA1KRnzlsWNYTsECB4GckdoRiHivMX8kNGdZTYBuStrjrqaxa4SIV1Xj4VPJjn1D9Q4vugI4nMuKhq0laclgEL9KOpZVLspxhgzD6B/fckeuwWZ8IvlwWnWm41fhWL8c+0E/UmglRIULqTLQZbMc7DlThhGYTRKsBSlwmM4qbMROkVhBBKtvhqiuYL53yYOv0SKmTB7Dz2RANrwUbJ9kTYhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csjxRFqD8VX4FMTK/9a8EFjf5T7MrNRPGe0nBZbLlVM=;
 b=swm2Fx51pgZ7tNnofmKdJlKV0p88hH9rci80GnUANTAWA2jnqgs0sn5eur2Bctv87f1Crxk6wzDJns0y3htInJlswWUVsbQBfpiRk1dHVib0PHGHpn767ZCm6AgSgb8w0cM52OrQkit/CuPsqi/j9xGnx3VoyvW4dAyVl6+XsRfs2beQblNZmWVeQFuONPfwT4MNalHmszabmY6nX0R1fj1hgsMad91bdFn+U7LB23CB/dnl08rPK0CjQ1N3+16OLcNlJdtq6r0+0RkAKVjMat8Mu+yQChL/fDOikhzmTTfXxeyEdPCqq8YT7UZefUrM3fzD6zQB7EnywUdvpvYdLg==
Received: from DM6PR18CA0035.namprd18.prod.outlook.com (2603:10b6:5:15b::48)
 by IA0PR12MB7555.namprd12.prod.outlook.com (2603:10b6:208:43d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 10:54:51 +0000
Received: from DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:15b:cafe::4b) by DM6PR18CA0035.outlook.office365.com
 (2603:10b6:5:15b::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31 via Frontend
 Transport; Tue, 2 May 2023 10:54:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM6NAM11FT034.mail.protection.outlook.com (10.13.173.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.20 via Frontend Transport; Tue, 2 May 2023 10:54:50 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 2 May 2023
 03:54:41 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Tue, 2 May 2023
 03:54:41 -0700
Received: from build-shgarg-20230103T221109854.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.986.37 via
 Frontend Transport; Tue, 2 May 2023 03:54:40 -0700
From:   Shubhi Garg <shgarg@nvidia.com>
To:     <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC:     <shgarg@nvidia.com>
Subject: [PATCH 1/2] dt-bindings: tegra: Document compatible for IGX
Date:   Tue, 2 May 2023 10:54:36 +0000
Message-ID: <20230502105437.769350-1-shgarg@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT034:EE_|IA0PR12MB7555:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d1146b4-8c80-4580-9f03-08db4afba77e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fF55WL/Gy4XHUnqN3rZYab9oMXw7DCkNnDnrtuv6U/Dx6SsBnTW7/fyXhtvGaGcbk4+OfV/UNExlEDJudFLUTe8GvlcG/dJyg1dpANVWdS4fwYLsq4oqaWy1v5T/oCZEPDr3+mriEZeuKK8Wy6q9O73LSPIowJd14tW51G7LGclGFZ9PBBDiKkBxs3+7245JJ1XDC1KauqJJ85NmOgzrT86u2ngBpwo2xwXk6n4SgZidfnpZCaGZ5z3EFtpPUgBggrxS3ean99IkKBt4N9n0x9mYdWSOwN0vEaRu3zMobIOHA4ms+OXft142Wbds7g4OS3fjAxneP7U3ObgBkfbRC6U4ENXwMtLfMxy3P2KR2OdFLpG9V004eUQBEho04SK7cmiKlGdiLQDsDDADeXOx/bKA5n5Hq1/bVkoGRAqYF02l9VTX+7UP+U3d2UMb0V8/Up+H6CXmr3FnLnpQrDwWxwWKO4I+omU9wZapRR3N8YI5eBMvhveDBjL152xPPP4SBrs8QOke+ymVIZyCZ2O+o95nt57nQ9MfyyhgSOUFKhdg0MHBNNoCbzQDcmrr88H4XPtqXqLmaxLO9lHZim1hVx5WmEC7Eflcrp6kdLB2PeI/JMjwcC/4oQwpk8v0pQk9pVYBynZJ2ZJ+Ob9QvXcJmTecaRj4ghQ5fNrNyYMnihTp0adQAf2kGI3FlPTlKp2R7Bg45hidIEy/EtJfd+guVA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199021)(40470700004)(36840700001)(46966006)(478600001)(36860700001)(36756003)(5660300002)(4744005)(2906002)(40460700003)(8936002)(8676002)(86362001)(316002)(70206006)(40480700001)(70586007)(4326008)(82310400005)(7636003)(356005)(41300700001)(82740400003)(426003)(336012)(47076005)(107886003)(1076003)(186003)(26005)(2616005)(7696005)(110136005)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 10:54:50.8991
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d1146b4-8c80-4580-9f03-08db4afba77e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7555
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Document the compatible strings used for Nvidia IGX Orin Development
kit which uses P3701 SKU8 and P3740 carrier board.

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 0df41f5b7e2a..6a5e303fba08 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -176,5 +176,11 @@ properties:
           - const: nvidia,p3768-0000+p3767-0000
           - const: nvidia,p3767-0000
           - const: nvidia,tegra234
+      - description: NVIDIA IGX Orin Development Kit
+        items:
+          - const: nvidia,p3740-0002+p3701-0008
+          - const: nvidia,p3740-0002
+          - const: nvidia,p3701-0008
+          - const: nvidia,tegra234
 
 additionalProperties: true
-- 
2.17.1

