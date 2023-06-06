Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12AD0C7EE24
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Jun 2023 15:36:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237159AbjFFPgg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 6 Jun 2023 11:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230320AbjFFPgf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 6 Jun 2023 11:36:35 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3B8610D4
        for <linux-tegra@vger.kernel.org>; Tue,  6 Jun 2023 08:36:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMd5QVQtlg18j/k42A1rq1Kdi1Tip1GBnct0QXZeyCOOHziHuNimbX3983sz6XF1D2eJO8FUcsAVH5ddNpof53qSxbXgE7E8QCy6blJ8LEYE2mdI0j6Jp3lsjWMtXikOIeTGx9NCWEIne4+iCiyfuZ7dJ9Es47DFecDlAWFLhduNXOAzrA9guCsMYHMjEGo4AJ8FP6HLYlzF9ScvkUGMuo18B5UGC9CQiZeo2Y502Abqz0WXpqzXFa/WLdDFSYd35M3wS5T/wkGP5Ycb7+YfTwymZQBiicxVqz4fYd4YoYQ4H0LN79wKIF5uf6vPdgWCRzjptZutpoK7ucFebtLGPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0T3KLLsFeiV1ei9HdCPr1T3QttVoplMyBgnbkZ/8D3I=;
 b=OpN9YpI9ZpKNsiTclCH8F5X2+or7DrTsD6ZbCPafxgkQRdB97ErP6YP5Ky+IoAxW8KP65KiuIcvEY9f8PpPQ7iXBT/7SVDxq9skB4HjyZpdRsz64ooQmFVS4ucmFuSTOcP4f5af9N5YVAACKzrUOnGGVhGFHvUvrrjv2krCA3PavSrTBkyEpbx8ipfzMtugq79viDZ0qRkG93Bsz6hv2fQpSCZGR3a1zsl5sFpEVA583cp79vNygWOvRhBwA4vBck+89GBRPa653Q7ELTjWHx2GUGmru7+5F2TdjNRk6Ze1OUBrLKuJzx2T4nsbEI3U0OWG+rtrSivd/gbIs0tEHsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0T3KLLsFeiV1ei9HdCPr1T3QttVoplMyBgnbkZ/8D3I=;
 b=bBoQJ0atzIdLIiyaIKjFH2E7laeP4+sx6VSFqCXAScbVSmPMxBzWM3nrvyhTAXD7h1/vsl3dpNc7Ahcc27l7khre5xPLTBDh6Tt9HdZCm2GobU1IJm7b/NbDTnfb7r6dTfXU023AIXznYFd0/E35sLonsgO91psHb0ulWo3TOwzbNXCtf+8znLDJH2QV92/ocFAf4Bqc3gGxGRSSi/moOuP1giLEbAOc1QqhJ2dMD8VwAWTlFKppz+9pmKKrJ0KBIpYuha7q8VCDiqrB/G3mjjcz7N/QowtJ9h5lo7DqWSJGOEmWf9e72vEBsMqXKWqAQR5oumaU2DzdcZ6GBdzMjw==
Received: from MW4PR03CA0191.namprd03.prod.outlook.com (2603:10b6:303:b8::16)
 by DM4PR12MB5085.namprd12.prod.outlook.com (2603:10b6:5:388::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 15:36:29 +0000
Received: from CO1NAM11FT108.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::9b) by MW4PR03CA0191.outlook.office365.com
 (2603:10b6:303:b8::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.34 via Frontend
 Transport; Tue, 6 Jun 2023 15:36:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT108.mail.protection.outlook.com (10.13.175.226) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.33 via Frontend Transport; Tue, 6 Jun 2023 15:36:28 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 6 Jun 2023
 08:36:19 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Tue, 6 Jun 2023
 08:36:18 -0700
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Tue, 6 Jun 2023 08:36:17 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>,
        Petlozu Pravareshwar <petlozup@nvidia.com>,
        Viswanath L <viswanathl@nvidia.com>,
        Kartik <kkartik@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 2/3] soc/tegra: pmc: Add AON SW Wake support for Tegra234
Date:   Tue, 6 Jun 2023 16:36:07 +0100
Message-ID: <20230606153608.94289-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606153608.94289-1-jonathanh@nvidia.com>
References: <20230606153608.94289-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT108:EE_|DM4PR12MB5085:EE_
X-MS-Office365-Filtering-Correlation-Id: 81ca72e4-bc7b-4311-499f-08db66a3cbf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3QcTPkDDeTOo/9AqNQnGf+ajn4MGE6JMttSobwXFQ/2JA1t0jdFROrklldUdy7eSh8sXVsvgZWYCMRUMvohNfhQjnjUACQxVTNQ9iQEuJHrk14hAW3sQifi6HL84e3vIEF/Dds/TC83v4zD0EPugEqFVT4J5obGjJy/sjuDBphAGMh88UB5a4M1jthkAKagrcBgZ3RFKsYvkC7aI5ID+7CCXv3jZ7+2uLuTIJFh86CORSAxr0K3uu2R3MTYincJv06OlkV43xf5oGHnZQy9rAEYpgf8JuToyer6DNCg8GJONEHLSim8EBW1I72ze89X9XTGCIRRk1fhWpi8OmqDCVy2WT/6ftigXakVnGU4bjWt4TI3CtMoSaKAv8VSGSdSBug2qx0tK1/v3D1d9J6A3qt1PEKmv2lJr/Izu4klvFjuGHhOnR6rkEx69yLqWCoDq3H/qiQ+WxfodWIw7Yd2qS4TC6yGoV3uZpNvh6EiNIvHFWN2TX3SPLe/b2kavaRFZU8jPF8egbYcWlL5CmsvqOAUuurSFHTWEmRFzpIBqIHNCxyF6a335LhRCESUYgkK9q7VHj3MIz4jXFhKNH+iKPZSy0hMvgfXNgOJ1V+VYROQx3pjZZtZlfXY1FLLVbAjImjWT6IqY4IrygBBAJH5c6b7rMxzWGnTyKI+vbubxfCsuWBIVst32HuYlpQuK203cufx6C6EuL9UID5Ao5p7K1eqX4ZOQ+Es/29s3yBJx1MsVGcBSM3xHGpA7hHd/gGGF
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(396003)(376002)(451199021)(36840700001)(40470700004)(46966006)(40480700001)(1076003)(26005)(40460700003)(107886003)(36860700001)(36756003)(83380400001)(426003)(47076005)(336012)(86362001)(82310400005)(82740400003)(186003)(356005)(7636003)(2616005)(41300700001)(5660300002)(54906003)(478600001)(6916009)(8936002)(2906002)(70586007)(70206006)(4326008)(8676002)(316002)(7696005)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 15:36:28.9500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ca72e4-bc7b-4311-499f-08db66a3cbf0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT108.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5085
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Viswanath L <viswanathl@nvidia.com>

Wake-up signal 83 on Tegra234 is triggered by software writing to
WAKE_AOWAKE_SW_WAKE_TIER0_TRIGGER_0 register. This wake-up is mapped
to CPU interrupt 179 and is used by the Sensor Processing Engine (SPE)
in the Always-on (AON) power domain for waking up the system.

Signed-off-by: Viswanath L <viswanathl@nvidia.com>
Signed-off-by: Kartik <kkartik@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 12e852a8a609..c77ce91a369a 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -4250,6 +4250,7 @@ static const struct tegra_wake_event tegra234_wake_events[] = {
 	TEGRA_WAKE_GPIO("power", 29, 1, TEGRA234_AON_GPIO(EE, 4)),
 	TEGRA_WAKE_GPIO("mgbe", 56, 0, TEGRA234_MAIN_GPIO(Y, 3)),
 	TEGRA_WAKE_IRQ("rtc", 73, 10),
+	TEGRA_WAKE_IRQ("sw-wake", SW_WAKE_ID, 179),
 };
 
 static const struct tegra_pmc_soc tegra234_pmc_soc = {
-- 
2.34.1

