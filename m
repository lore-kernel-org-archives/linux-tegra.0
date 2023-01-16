Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1910CC54EBE
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Jan 2023 15:08:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231855AbjAPPIE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Jan 2023 10:08:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232819AbjAPPHf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Jan 2023 10:07:35 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EC9E2365C;
        Mon, 16 Jan 2023 06:55:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilONtNZdzxHl+Bqa0CXFfRUCbvEcpYmk/jTr5i+waGoYF0guzq2aRcfYvWquHHTECSTh6jDLD3vIc3jxBJ8YIuXitCFVBu+Ztr/qJYlwz+kzDE+DXcI//ZIhOrs5xouoLJhqaJxpd/yLu7AkeVK/Nn4JRomX6+8bYNOEk7CKi8SKjpZssTAbAh+xsJ5FLvPjqj/PfJStTQ/CqK7xlyqEQUQjiXiaWLbuYeOaF0+V8RudifLpn+XVyiDcvd32z0enWkHVjWtKZ7IBtIAEfqw/Jb1icF1qMDEltaAkSkzRfBCF7RSCDd/Jf756W3knvztKWkq4KcqFlWVGJR/I50J1oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JlfJ2pkaFjJQmB7u51s1f8vXz8IVLH2isKcrRPXPlg=;
 b=b5pvPDmXramtSjMg0R0ia5KgtgJoeIKOKfsbT6uN0ZUs8MDsr4MoMd7fG44dvSrnKzMexNFLGGTD2ol9y5JnUFhHtM9RgzJTDo0OUKek3uEc7bG7J7s7vWxhtS9wPRGpUnySVR6SkldP3hMxEoVkZcm2BaOHOdu1fA/QM1gP7p8uUaoFhmLj7dejRPY0klLnkq3BgbuBtDrL+GPA0Zh/X1ijkpPwvDaqMHfm2aQnkQIGCkoMe+UierTODlx30m5JE99g98lMhKz3UFmfmad5gTqloFqYMUPthazhibJUwxM6nZnkuocuhnJv3fShieEQ5f5M4go1drncdmCERiaQog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JlfJ2pkaFjJQmB7u51s1f8vXz8IVLH2isKcrRPXPlg=;
 b=evVU0fFVLoDN0ciMsIElo6+Cm8EiJ+nkH/KNRTfJT9kBHZpg4gohNWsQTqhoGP5HMNNbWFdjTi4m65+ORuOsnpnUh247cw3MlNuScKBfOk51kLnTlrSQKj2SZgR7LzKfP3t0oKMU9HCv86gNPnzxprYEMK1174BIpjC6aCXnWZdfW+znBIXPibNNzzD744bXWFqMqbTCqP5vlgqwMI1btMPiQCWqMsOv/7/q8gmBW1pmLirHSDff4ECye8HuKOHdSKawJXKG+N0eLVQBWsrjD47pEigYnyu+77o9/1FKNMaSt+waKX7TuObyXRw7ob2I0cDbvihaW5vGiUxMNr3PGg==
Received: from DS7PR03CA0358.namprd03.prod.outlook.com (2603:10b6:8:55::7) by
 CH2PR12MB4120.namprd12.prod.outlook.com (2603:10b6:610:7b::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.23; Mon, 16 Jan 2023 14:55:18 +0000
Received: from DM6NAM11FT110.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:55:cafe::5) by DS7PR03CA0358.outlook.office365.com
 (2603:10b6:8:55::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 14:55:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT110.mail.protection.outlook.com (10.13.173.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 14:55:17 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 06:55:11 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 06:55:11 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Mon, 16 Jan 2023 06:55:08 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>
Subject: [PATCH V4 3/5] dt-bindings: usb: tegra-xudc: Add Tegra234 XUDC support
Date:   Mon, 16 Jan 2023 14:54:50 +0000
Message-ID: <20230116145452.91442-4-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230116145452.91442-1-jonathanh@nvidia.com>
References: <20230116145452.91442-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT110:EE_|CH2PR12MB4120:EE_
X-MS-Office365-Filtering-Correlation-Id: 75b4e389-ea5d-477a-c290-08daf7d1aeee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SRkKdw1k/s3Cf+Vk5rUcpdeQ/0GcvJINKjrg267ABYaNbPJWC3uwsk+QFJyKxUE06v7RI3eSsFQJp7Os6FHmDt1MNisMHxZ8H+aR+xIvXQZZzxSLyvY5po+H1dnplM2kw5wbSFojgI50ArWj9ac2I+wb/8vyks/FBNCG0xWWx62jVfiM3+4fQwTlAb3+mwLSO03/zUgM9LLcEgLTGfVYDgBL+DOOulouQbEPTy99xJXZsb1WT0r8Pmjq58HcLuBC4Wa3/Z9UYziIufRjGHLF10rti0VRzY3To0V5NjtBfqnA0czxY0BHCrtmgXaP8JEH0mdaGDmYozkKrhpTitrHrgQRsOI6qErmcp9/zohUNor3gOetqOpc0CMmEJugjCSuT6AAp6Mrea84RBzsAnYz7wnMHOGsGHZRzU7rLgkEhmdYRu6iKpr8l/M0smgwk32hHQZaj1JNfPpXi/MEFNuxEr+w6zGtFH3R+ZcVxsDLRDib+1ATTUl566qJfMEwAis02aOdczWHd12HALvchkKKrdWeXSiO0Yd8ZJYIb5F3eXYrjaz8isQCpJXXjeguOjqTsrjBY2tPNU9rRlsn663gzxg43LOVLyvE+CHzGT4AHJpda4L/FAdNXa+hHA0wquX/prVP+toJqVqh1/Jv0dNNPfUzBz9BMSOA76rcyivCK2P66wQoVFosVZQoOh/aUuJ+siR4MAvKyve+y3qr1t6trA==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199015)(40470700004)(46966006)(36840700001)(36756003)(82310400005)(86362001)(26005)(4326008)(8676002)(70206006)(70586007)(426003)(47076005)(41300700001)(186003)(2616005)(316002)(1076003)(6666004)(40480700001)(54906003)(110136005)(107886003)(7696005)(478600001)(40460700003)(2906002)(356005)(7636003)(82740400003)(336012)(5660300002)(36860700001)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 14:55:17.9892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b4e389-ea5d-477a-c290-08daf7d1aeee
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT110.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4120
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Wayne Chang <waynec@nvidia.com>

Extend the Tegra XUSB controller device (XUDC) tree binding with
Tegra234 support.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
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

