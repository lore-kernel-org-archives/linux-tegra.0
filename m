Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72BE8C38142
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Jan 2023 15:11:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234312AbjA0PLk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Jan 2023 10:11:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234253AbjA0PLi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Jan 2023 10:11:38 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8F2A84B67;
        Fri, 27 Jan 2023 07:11:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UvP7KtQfght7bNKlT/RB6dH3c+bTDH6HuEcmbByU54wbKw3MUK9jAP3scIjR10TBUrUzdx2XDlFDDEH8W5wu2fw0THy6PJ65IqittNiFcvDW4R+rL6sK8HdxehZ+g4J8P3Ts9+iMtMojcuZ20shItOwYgBa+oj0ZANSbJ3BY3CtPtHgqcVa+zGMa0Ha0qNv2xp4oIeKwJfwhJwJ1F1YljKbyP/rkfooPc8sTXbGikWnZAq/x7Rpse69P9Obm99eKwoIep8BGTXrf2VrG68cPcEyDwqSulYQ6sarA8ryJ9tdJsBz4BAgvInSqrzdqXg7BfGbKPz6/3G9qGDH18xwdCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmRcd5VUiO2rkU0EnnCsNEDa2lP5CSxMzj3tGED5A9Y=;
 b=T30UwRJgTDy71lQm7hr9efwxdPcNL0tOyArRBWqgu+xjUoH0s3Ecy/XDSGvJ8y7OWQsrBzIE23dPHP7LOM+scOxy/MzVb8rx0dmWgaftSqkKPR+K2dw77sXFqI3nakyoE5LFs91wEPpsu1O8KmM+S0IXCkWWQ0vgXjh4NyFy3EaJUUvbMKpJKXdiE0Q+4AzZ7OjdOOL+oT0ow+Fo++8Mztw/7DXXCt15+2tZUmHR9cjSyE+oZ5tsMS8m98T907eu2Yo2tklQcqhSCfVxRiAttDWeiWcyKGKfh2naH8riABLReEGxxeLEe2QdisxdcbmO8Q3RWEfOopK0frHdz2Ut+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmRcd5VUiO2rkU0EnnCsNEDa2lP5CSxMzj3tGED5A9Y=;
 b=ow6kacWYYxTqEq9u3IaxQehGBT3pMo2s0NLiayzr2AZlPs6S+3dYLL4DNLtzfsy+cVJPiZ4sXJGZAiuwZtVLlrpcH5nSS7gIBgdj66yc5kVeOjVMjS3BNJVddhEYl9ugjC6Y/dMWl8ZCZrOHhDVA7URMq7i28XpATjx7ioQ8bs/zXXUZJVeoTQxiTNnjRi2g7jx/O1RU28yZ5xL6VeKbzo7hxl0kQ+Ol5rqEhKsSTLlJO47KB5Hw4hBUhCVEHTPYdLMjfHI+AtC0FYUqwMJIiJZ+W9bUpeuGaZnkLQLqQs5NajSbuuCN74Xgx4zMGuhV43CS08IX9tJB4vsQPcohHg==
Received: from MW4PR04CA0207.namprd04.prod.outlook.com (2603:10b6:303:86::32)
 by DS7PR12MB6191.namprd12.prod.outlook.com (2603:10b6:8:98::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Fri, 27 Jan
 2023 15:11:24 +0000
Received: from CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::66) by MW4PR04CA0207.outlook.office365.com
 (2603:10b6:303:86::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23 via Frontend
 Transport; Fri, 27 Jan 2023 15:11:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1NAM11FT029.mail.protection.outlook.com (10.13.174.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.22 via Frontend Transport; Fri, 27 Jan 2023 15:11:23 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 27 Jan
 2023 07:11:06 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 27 Jan
 2023 07:11:06 -0800
Received: from moonraker.home (10.127.8.14) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Fri, 27 Jan
 2023 07:11:04 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V9 6/6] arm64: defconfig: Enable UCSI support
Date:   Fri, 27 Jan 2023 15:10:41 +0000
Message-ID: <20230127151041.65751-7-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230127151041.65751-1-jonathanh@nvidia.com>
References: <20230127151041.65751-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT029:EE_|DS7PR12MB6191:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c33e94b-ca28-4a1e-fb00-08db0078c12c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oZ59n9nCbvU9ChPzmgvlI7yVBz1+LBS6NyXwdYgJ8OX+/LX5AZR11Z0kvenDfz0Bz3guWkfOdVb4JgqYl9wK4I7TuYe/YW3a6sTqYxbprZXG3RG0Oml6+UWZZtpz0pwu72zuajx1oEO12u3xs2KWKouyIuYDPCv/gBkSkHPnBOqhBRmw+q/jiCeKFKq4/fNXUghrxLxWk1oewUzkcoCxzJd+NFw27gK+zLIAA7wsQChmdpcEZIvwd+3uDzITTAH7rQg3YqJ64OVa9Z1yG/ZoEiwtCx6wasYrAxezr10l0gx7TlONopaikQFZ/0y4LlyF5X7ar9yl2dxVsZwe3bS/KAVpLrw/lfEBiPiwapEy4Mysfsk90Qw6g1T7Z2R4QYZEleDX+M35QIkT3Tt2T+r/N8CZQCljVGNMmMqylaxhjvtFD4am/1Wphd5wnMXEPoPDOCduNIxpiIWK/mDBOzxQtb0kGRizlDSHkmVTCypEj/NMSgMztxdUOud2mTFtC0XuZMJ14CoOUA95kVuA+O+91Q/UQ6c6I7KtrQZn9LLq8DRQADqK1yum0/DT04bLYAf2c8nBKt99f6X/PpM7OIUQAPiWCyhY0YYSv0PhOpZkJdPQ0AlZeoLTJz/VmpFnhc0j4+4F0x2IruHqpDZ8Va3JpLYJ8HtholpOOlBvomM0W/tVmepL7V1dVP3oowREdT21XIhw2p9DPc1PQll4fEZShw==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199018)(36840700001)(40470700004)(46966006)(186003)(41300700001)(26005)(356005)(8936002)(70586007)(5660300002)(8676002)(83380400001)(70206006)(6666004)(1076003)(107886003)(4744005)(478600001)(36756003)(36860700001)(2616005)(110136005)(54906003)(426003)(86362001)(7636003)(82310400005)(336012)(4326008)(40480700001)(40460700003)(82740400003)(47076005)(2906002)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 15:11:23.8520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c33e94b-ca28-4a1e-fb00-08db0078c12c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6191
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable the TYPEC UCSI support and the Cypress UCSI driver that is used
on the NVIDIA Jetson platforms.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V9: no changes
V8: no changes
V7: Added in V7

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 984553d55e17..d487d0e2b8e0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -959,6 +959,8 @@ CONFIG_TYPEC_TCPCI=m
 CONFIG_TYPEC_FUSB302=m
 CONFIG_TYPEC_TPS6598X=m
 CONFIG_TYPEC_HD3SS3220=m
+CONFIG_TYPEC_UCSI=m
+CONFIG_UCSI_CCG=m
 CONFIG_MMC=y
 CONFIG_MMC_BLOCK_MINORS=32
 CONFIG_MMC_ARMMMCI=y
-- 
2.25.1

