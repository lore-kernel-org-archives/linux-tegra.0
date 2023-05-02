Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51AEBC77B7E
	for <linux-tegra@archiver.kernel.org>; Tue,  2 May 2023 15:03:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234343AbjEBPDM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 May 2023 11:03:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234261AbjEBPDK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 May 2023 11:03:10 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83DDE198A;
        Tue,  2 May 2023 08:03:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGcTT/XQkHZQtWviHfTMbpyxrzv8+QCXoOQq7N3cx+bIdb4Z4cMK8GwLOsyIYnx11ex4TVmuy3Nnk6O7xEK+rMpj8L5HyAN+canRf7gJb9PfETLdb8b3XPSfIXWRHpWyy5Sost5qISHY+UAn1wJqEYIuyRBiL1f5sYzy1ffiYIXA/RgeOtwQ00NEfoHNHchDl7P1duWIPepr3yymxy11xeEJDPibHFL3qJGmOnFd6bAZJzyZaRqM85FbM3kNiKhibCUbq88P7uaT+nVmDGJYxCcMOTVGXDN+sRse3bG3mNDCYQvMoXNTSH/Kpci2kxzTEd6mu1FriAD+5fZjL3SI7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEXO2dT+cXoY/nflIiEU5zfJD/JAKlzTm8WAoERRH88=;
 b=l/+homf37Lzpo0vrNk0r8X4iacXbXHwZOL4kCjEUiqyPR35D18Fprt3ZcYXpc4AWsY0LxHO1LHJr5bgnhmTlxZKpZqtPe8ufvQ7S7M2qFJk7LAQD5Ki+12rZfp290E2FJ6xq0M6GPRfIh/zF5Dbdfk4Rsj5b0K50tbQebspo7C3jNoqRAf92x9vI2vgAzGx3/sDIVonHO/HNjBO5eB6ZNV2uSHb0z43b2v7Tn4uhacJ0uNZThxVBXzf0PyLPyg7s06AmKUYjrKKe4hCCKyLPfXP9e7XThQ2uKqSKBWPMqSzo/S8gk/DxTaBYHn7rbM10vfCQJben/WN4az3tSDcvtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iEXO2dT+cXoY/nflIiEU5zfJD/JAKlzTm8WAoERRH88=;
 b=rl+z9Y0cDFa9yNkRfQlzqQbh3shQjfdOe919v1PC0Q58y9NEaVT/D/Nf4ZRLf6LnSSGFy324TA/QqM3Z+7JOBTrbzBffbwboI6QITdqUxvUORmNuTgs8tTEoTnCZUgDvqnaXvuHb12QtuFizVv9jj5YeWGhBMHCE/9pXuIXoYQ92/p42swP+85/kfeqA2IFhohbCENM83cW+YTptjBwuEGS/gRTzr5pFfN+YeaIdkp+QzuinyejM9dVR75TjG/mWEoIr/LgBJNJB4RW2wJevVkTAoxMUtH1KKsXp+9caKI0G2ZcsSHSOinQ8UIo4oH9rcdewj4pv6S3tqMngMIeuNA==
Received: from DM6PR03CA0058.namprd03.prod.outlook.com (2603:10b6:5:100::35)
 by CH3PR12MB8402.namprd12.prod.outlook.com (2603:10b6:610:132::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 15:03:07 +0000
Received: from DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::4) by DM6PR03CA0058.outlook.office365.com
 (2603:10b6:5:100::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31 via Frontend
 Transport; Tue, 2 May 2023 15:03:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM6NAM11FT032.mail.protection.outlook.com (10.13.173.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.21 via Frontend Transport; Tue, 2 May 2023 15:03:06 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 2 May 2023
 08:02:52 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Tue, 2 May 2023
 08:02:52 -0700
Received: from build-shgarg-20230103T221109854.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.986.37 via
 Frontend Transport; Tue, 2 May 2023 08:02:52 -0700
From:   Shubhi Garg <shgarg@nvidia.com>
To:     <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC:     <shgarg@nvidia.com>
Subject: [PATCH v1 1/2] dt-bindings: tegra: Document compatible for IGX
Date:   Tue, 2 May 2023 15:02:48 +0000
Message-ID: <20230502150249.773425-1-shgarg@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT032:EE_|CH3PR12MB8402:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fb0a846-af9e-474e-c6f5-08db4b1e55f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x/0umhgnFPoyPAA35e4R1dLI8VYqMrZ18k8D6jtUZwHbWZuc2gSE2bPFgLCbSOYsTJqflJokowHW41FmonpfQRRWR4KB8vtyhzi/9iLGpzmZDDnL43MoNQgVhDd9DfDquXj8/53r3W4zPNYrtQjEVgfQeml2TdzReVMSINWBw1kSzYoAAAzwRJafYAtlwOkBETEP1IF+MsRmqaUrOEpTrDb/YaOZGaaoeK5Sd2S06E1/AIL7sSEvGhtqByjXS0M+9yi3PUefUXvB0W4y/WyyzGzT8Fa9LvUvg8wOmpnrrwRFj8gLJydVjjDuFFUVDJHqBc1ZS1aoXUbXMnp7Dn1nHNHuW6/Ac79KB8onF6x/JOfEE9T6ucjBeN6eFK6vFPvt8fVZo34Tivlj0+l2b/p1C5t2EhOMK/IWRWCXFTv7LFlJJ7wVldutjoEzFKEcnmwb/dFGzdQ4lPFpvSqc8Y1gxkDG8he09XnqNODY7i03ujy3WY2PHd9AxdOZIVfvnoqwNCifvRMOnJ+LbzbpURBb/DDJzUdejdjQzU8CHoqMS53VX7ZhUdcKntWuFcmPF/LhV2GiOQB6/BLxX/U+3JlgAyHJteQxzNL0il3q07X4sJnedcrRVldkjIHBzWyMCYRViNw8q6VOz9Kt966/nWhxIx1PXZXf50QUah7FQ6vKtnUeTRVIFlcGWxgB5j4nluX86Vu9zo9SWuhrrmZHm77z2g==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199021)(46966006)(36840700001)(40470700004)(8676002)(40480700001)(8936002)(36756003)(86362001)(316002)(7696005)(6666004)(82310400005)(4326008)(478600001)(41300700001)(70586007)(70206006)(356005)(7636003)(82740400003)(40460700003)(5660300002)(426003)(110136005)(107886003)(336012)(2616005)(47076005)(26005)(186003)(1076003)(4744005)(2906002)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 15:03:06.4858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb0a846-af9e-474e-c6f5-08db4b1e55f4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8402
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Document the compatible strings used for Nvidia IGX Orin Development
kit which uses P3701 SKU8 and P3740 carrier board.

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 0df41f5b7e2a..34523b8b5d1f 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -176,5 +176,10 @@ properties:
           - const: nvidia,p3768-0000+p3767-0000
           - const: nvidia,p3767-0000
           - const: nvidia,tegra234
+      - description: NVIDIA IGX Orin Development Kit
+        items:
+          - const: nvidia,p3740-0002+p3701-0008
+          - const: nvidia,p3701-0008
+          - const: nvidia,tegra234
 
 additionalProperties: true
-- 
2.17.1

