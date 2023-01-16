Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F48C54EBE
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Jan 2023 15:22:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232427AbjAPPWn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Jan 2023 10:22:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231421AbjAPPV6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Jan 2023 10:21:58 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AADCD10E1;
        Mon, 16 Jan 2023 07:19:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+JlEJmldMohMzCP1j1LFqBdbqBYUJajEqLMoU4EwT3RKMxV3YpjauRftLnQ7UMIl0SjnYmzfwrEgcZCodqnOlUTXACzkh5dm5xf9+8Xu3Gq+/PU2mjGZsOWMut9rQeekbdmUjcjiccZPqj6eaeTUaDX5TQSLxRgBFc/rAuxFmoGsWzKRF/CMHgDUX24SxsESCp8JE35FRTBj7q/AXYYWCMoQPwvp+IO7dcaso6FIOQ9D1C4oWV3cLeJoQusX8I7HuIWks5Emz1GQEpwRBSoU6HEnFIJe7PzZ9llcEQz1DzfaVAKyKLZejxjm6YNMA40a9QFjeW2RMi5+7Tv4u4FlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i11yGm/GqAvTFOs/abNIwa/Htf082/AZA7ZJ41d1ALs=;
 b=Avv4es5yfo1XFrezpA3Tryj/DfioXzMCm34yd4nFKxbeyQYhISzQJ9KmbipO+LybXq3SLV6c0UiTsdZ9nvcVvZuWjXY098aJW+b4eoox7ao2GJs5/M0o4eCLGJV1ZzXgQ5VPpXc0JWjXoDwqd0/djkKWhQ5trL9rQ0SQJr2dwWQ3aw3ODNOhdJwKLMcBF1WFLBsTL73e6u/XhE9Zy444n6+gEQ8syB8uXyT8OqT629t4S4P9r4WjrbAcZnxY8pNriDXrc1yJBOfCo03IfjDM4DMpbqrcfrSgpp69pk2H/yhOANWCT3RZVjH4bCfVJGN+qq3M/+3buF0cM03w3FU4JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i11yGm/GqAvTFOs/abNIwa/Htf082/AZA7ZJ41d1ALs=;
 b=j3YDKmMdj9TyUzS3DoulDqfRZpCV0Cjav7FDt8A9K+NKc3woTOX/gcvjIXn4eDz+GC1lz+074YEwNb7Oc+E/UnzrANksQCFsS5uMBOReWeSZtSMUl0ERdEMzNKuo48smTqxVu3NKW6ElcxWzbhbyZ/OYdeVHBaZpKyL0CMiC87y2dYB4IcrrEW8yoq0oeeN7Lhh47Ld40z1iPD9rKsnx9ugvWUFFZ8SjEg+5am86y9b0HZIJ+wjFLv32IwncZj50vP4pjYNZAPKzkIVoMPaJjpltjEGxkU3Ga+2bjxo5Xrz7vipjPwvxu4Iuebo6f/86Yxiw/5wyso1kk472WfQ+jg==
Received: from DM5PR08CA0051.namprd08.prod.outlook.com (2603:10b6:4:60::40) by
 MN0PR12MB6272.namprd12.prod.outlook.com (2603:10b6:208:3c0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 15:19:41 +0000
Received: from DM6NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:60:cafe::e6) by DM5PR08CA0051.outlook.office365.com
 (2603:10b6:4:60::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 15:19:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DM6NAM11FT042.mail.protection.outlook.com (10.13.173.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 15:19:41 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 07:19:35 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 16 Jan 2023 07:19:35 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Mon, 16 Jan 2023 07:19:32 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [RESEND PATCH V4 3/5] dt-bindings: usb: tegra-xudc: Add Tegra234 XUDC support
Date:   Mon, 16 Jan 2023 15:19:15 +0000
Message-ID: <20230116151917.94193-4-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230116151917.94193-1-jonathanh@nvidia.com>
References: <20230116151917.94193-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT042:EE_|MN0PR12MB6272:EE_
X-MS-Office365-Filtering-Correlation-Id: 29fc4669-46ac-445d-4641-08daf7d5175f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NUhKTl5Xte+t0A8RYHDe6ol2eZfYDUbsiPamZjVLOR2XURS0e7jEU8ekRcBYOxd6SwB4PCxrQKBxI4i6eMsy8LBaY5SUYwQT8D7owOLztoUL8QuyCDLGJy9rY+wpk+EO1AmMKPoS2agqLOv4pXk9Rt6wQFY1OSnDw9T0BBA441l4dTl2ZeyXeTIwcbCh/6zXvYRXrPEhWMDYQEc3hvdaTa+OBO6TpR3OtmjQy28YZYYf54Ea8MtNHtp4gKWqOw4RLJxGkTZuhziKRUKYM56T0R8CndOeJ8I/q9jGoD20u/cijdDjiOd4g3S25e3Eu9SXv/glCvO+sQJVHr73nbqQ/R4Puk/++evt2I2gspUKG0lv7mmnxHdgl1Mm9lDYA0ocWfmk4+fNLnEv/dW9Z7RpVXrWtC7CDRytd5fUKfXi2w7dcbzYL6fl+z9stIvFN4AaBeh1oPbNtKyjRhcq3x+7vmuJqz01wrCXzed4Jxt6WzwtG2zlxxcnPdejuD/qRLqnRiVlDA2SrPjiixVDeu5wAIkaAIaLwa1/H/c+zCV7RkIncv8JtpOJkpV8T8+USjhr1hKqx3l3pHsYfigG373PUoEWJUEUOjzF7RRrn+/4vj42e6l43F1iObFLrNSLJrlmmHuNCb8KTdQsXwmxFdHQYT7QLczTpKYPguu4MH2XKPKfuMYB+2vrwD+BGJEZ1OSW/jeN7edLAKoWEMHBE7DfLA==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199015)(36840700001)(46966006)(40470700004)(36860700001)(7696005)(6666004)(107886003)(2906002)(86362001)(36756003)(7636003)(8936002)(54906003)(5660300002)(70586007)(4326008)(8676002)(70206006)(40460700003)(316002)(40480700001)(82740400003)(110136005)(82310400005)(2616005)(1076003)(426003)(336012)(478600001)(47076005)(356005)(41300700001)(26005)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 15:19:41.7154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29fc4669-46ac-445d-4641-08daf7d5175f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6272
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Wayne Chang <waynec@nvidia.com>

Extend the Tegra XUSB controller device (XUDC) tree binding with
Tegra234 support.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
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

