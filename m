Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B405C67871
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Jan 2023 15:07:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232943AbjAPPHz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Jan 2023 10:07:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231836AbjAPPHa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Jan 2023 10:07:30 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F15E1A49A;
        Mon, 16 Jan 2023 06:55:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBbMKqAC6g/PeGGuXu/SEZxzH+ObaPoRl2LQAht7I6zin9T5A9igdAwLoF5dipbOMLAJ+H/eOXztU5CMknvxTnuZNNSijZhrPgJLLIcR/31s5i9wNzoSW/FMnRVZiKbI0JxwBh7UF1bGqKhk/zrkqM15ud5S0aiWkbLyEtP8Egu4e60dOgbga7lWWBD94xXnhTEtIzxFWMijl3UJFcc92rA2Fh5cFRtmOVmkkzO3BvO6p+jcBJyCBu1T+LX7bXRJJNAj0N30ltQJLbgSupxAXLtzuBWjthDgjrfGhuex8MRC6NugzQx10Gv2OTFTiLHJGa22WiT81LdkNj+1UNa9cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGor3qU3tLxGkWqP0q07ZodhS02AH8vH5/527YABl/E=;
 b=Cwj3yzDxI2T7xN7SSahfBSMOjCZYJGuFNr/quWw8iUQFaXu1lKuckCJmZKRTOnV1dnd5NGUl4GeAMBNdU9Eh6wQVCydoc4QyBYrI9nci6ehX/998Gbt0SH4XkEIODDhIP53BoBwvLb0aNDGWbHyvpafQC/4rkJs+cWVOl8k80oA6tl+hRWyuvX2cFKnoUs3gwkUx8PPxLyk+pReHmu7X9cke/kMGDgv9E09+aRy2naumrwmUGdfsOdPqSm9+kIpul4EenoYJZL5IKrmDi9v5mmeqoe3vYjQ4jjGMAgw+8h2WFUm7F8WdfWU6c8phF07b7EDgWyYF3TrzC0qGwLPIIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGor3qU3tLxGkWqP0q07ZodhS02AH8vH5/527YABl/E=;
 b=h7POD26Wtz/uPC8/XfLGt0MovgNneloCcnAauOmFdrEVLqQ54uoeiCG69C/JQ3zNaIMYbIJDZzz7z9IKvwPvtKmZP4Ax6cJ8EWfmDf/TeP/R5HSeppOsju5oqAA8d6XG+uePeX2w/bRsFfwAeqDA9T7cThEE3BhFDxb0qEVmPCZZTt9UHLvUj0gJTPmsykF/2Y+VpTFNYBJVz67wLgA9ujW1V5jxuNUKNmZ34/yW1xllZHYgxl7JbCDfCSE5RHunHDiMjNnV7KTAvDjHSQLMayZoR977LE9uV4AS7Cgt97btUDxvX3thBRZ3g8xvbSVXXuZFUB2WPb2U684fKCgIpA==
Received: from DS7PR03CA0351.namprd03.prod.outlook.com (2603:10b6:8:55::16) by
 DM6PR12MB4896.namprd12.prod.outlook.com (2603:10b6:5:1b6::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.19; Mon, 16 Jan 2023 14:55:12 +0000
Received: from DM6NAM11FT110.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:55:cafe::f9) by DS7PR03CA0351.outlook.office365.com
 (2603:10b6:8:55::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 14:55:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT110.mail.protection.outlook.com (10.13.173.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 14:55:12 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 06:55:06 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 06:55:05 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Mon, 16 Jan 2023 06:55:03 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V4 1/5] dt-bindings: usb: tegra-xudc: Add dma-coherent for Tegra194
Date:   Mon, 16 Jan 2023 14:54:48 +0000
Message-ID: <20230116145452.91442-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230116145452.91442-1-jonathanh@nvidia.com>
References: <20230116145452.91442-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT110:EE_|DM6PR12MB4896:EE_
X-MS-Office365-Filtering-Correlation-Id: d2b57083-e35b-4e32-adf5-08daf7d1abc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G2GEUKPt54/eWAwE7ERdg8uVoOazDIWHQZriJsJPF1BBTNIbH7O5SmRNdVfu72AelNTic3FduFgbUqrgdCbFW6SLfvuaH91ZLT/3I42nrZQtNRUfoCodAp75AdglvU23u0TWX6vkC7Wc0j/mg+IV3FTP6LVzlEngKM5CNlwwMOHhdQKewGKQy/A8y7F0C32faEy0oAakc9knXE6+30D0JqncIXpCXahK0Q0244DhBLvwfjAdtNkRnE7VnVwVtG0lzuwYG4j/xC8Ii7Q68jHBuThmi0TPq8F+7qQA8FsfJxmrqigl/usueX/5yW41Lgkk3F9Yn0rArU9ZgwEgMx/2iBa4NUjTSV3lh95qpXCVk5xX/dzuBmh/uxq1tNXrzfRlIAcCfnCtt+IkXtm96uWMNOGK9KNeOEK1ola2At7aUW+Y1pg9cnqoV6J0QHPviMTFBfv06b9/MdqyA1nMTgzL22g2+nZUva46ysxY3ZwKjtt3cOrLBaBzujJmxCsmSPXspog6GkpevkckoZvfeLmNG50dksXhHcB1c0ss0oNLsBl4enbT+NJHMUSvPFSoP2RrKYKtxo01mhD4z/sBcBpH91Sp3OxahICxuEuZNas2y3Hxfo1V150cNBdaDkkPrEWM0HtNq9PSspN416wfBq+kWFnWu6yPNQIc76tigPlyPCrDu0yzw2rc114+LeqdFN1YM9jtu6bEbDG+m+RS9GHWVg==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199015)(40470700004)(46966006)(36840700001)(110136005)(36756003)(86362001)(7636003)(8936002)(5660300002)(41300700001)(36860700001)(82740400003)(40460700003)(54906003)(7696005)(83380400001)(478600001)(356005)(186003)(26005)(6666004)(107886003)(70206006)(8676002)(316002)(70586007)(82310400005)(4326008)(40480700001)(47076005)(2616005)(426003)(1076003)(2906002)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 14:55:12.6762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b57083-e35b-4e32-adf5-08daf7d1abc1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT110.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4896
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

DMA operations for XUSB device controller are coherent for Tegra194 and
so update the device-tree binding to add this property.

Fixes: 394b012a422d ("dt-bindings: usb: tegra-xudc: Add Tegra194 XUSB controller support")

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
index f6cb19efd98b..4ef88d38fa3a 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
@@ -112,6 +112,8 @@ properties:
   hvdd-usb-supply:
     description: USB controller power supply. Must supply 3.3 V.
 
+  dma-coherent: true
+
 required:
   - compatible
   - reg
@@ -164,6 +166,16 @@ allOf:
         clock-names:
           maxItems: 4
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra194-xudc
+    then:
+      required:
+        - dma-coherent
+
 additionalProperties: false
 
 examples:
-- 
2.25.1

