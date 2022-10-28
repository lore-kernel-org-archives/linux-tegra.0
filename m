Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6C1C38A02
	for <linux-tegra@archiver.kernel.org>; Fri, 28 Oct 2022 12:38:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbiJ1MiD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 28 Oct 2022 08:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbiJ1MiD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 28 Oct 2022 08:38:03 -0400
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2085.outbound.protection.outlook.com [40.107.100.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 486B81CCCE2;
        Fri, 28 Oct 2022 05:38:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RvOmv1hwseASGKWLu+wvKQHQGaRejNnHN6HhyCOid+O1x6AsnavJziA087tq5fzzTQaUSF5yUMbOPn3+hdgliGVI1seZ9eSQ6fwDFnr4e3BtFOGWVFz7UPfCntgs3sTllcTQWXGRt7N9z1wGrlnlCgmN8sCqDScnb9zLTwfJM1oH4LAg0cpk3lIPRPpCNVj33EjHT+tWWfWvQG1ldrTkawL4yl2exOwnGN8cb0s4R41LjBj8oIj/RoO1Ir+0RYP0fkvz208p+vUHSZBJFFRV3kZJjl963ShmQPWxHYd3Pc2EICxFFwP7PNCw10X6yxN8OTQhV5AZ6WnGTsyMhnYORg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMmBoPy9mi6fMRsSr1KGqSzi0kAaBbJfqgTgSSSlks8=;
 b=FZIBiUvLGJuDofsVva3RFd0gdHbjjF60RkrdrFL+3wSux6/37HkLqcQAMJI26AWZ25GUIZTxKRYeDpUVsEv9W44R3U3RvBqJEKwOpXHaEiiF/+0+IJZRHOBg1yGKisNjLH0RtgUTK4fYNm6LLwbCmydzOuxO/yIYY1ojUiHM8zZtrRfqz0J9tWyVzEusBXl+2GSIhZLvFURqiYpI9Ou3Te60KN7w5kGHBDS1HJjXw6lOcdhsmrgimYc0/G3ReaeOr9THdr+ScjyBl3NJcKWs2EcVOk38Z2iiqOZqhwj+yDVMyRwRJmd6zk7y6NAuJXHrNf0CG+QIU+rTopAuS4H2ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMmBoPy9mi6fMRsSr1KGqSzi0kAaBbJfqgTgSSSlks8=;
 b=EH+nxfVF5VYzbyqPwY0cWOTI3tPmIp6e4i5gRWD2KonokFkz2FhzwU6c+1jux/8zSji/0sMtUyEqSf5+cvhutjmjsWLQuI/+xhHsbGcPIPlJl+fjjfnY9B4pmZcruak3CfthUUNn8CVuJBSsNXdUb0jkAUpZrw3UL6Amrq4LMJ99Z7BQya32EVQjnO2+NgBIwkxmO4aNA3NEBHRBBZkl8Rasp9mEcqLBthGtAewnj7E0fckuGJx8opy/4pAoRlRZfuiWkMwO3kb7ZFudP2DWZEs8bLhXSjzynPvTp0Fop+69QmLZmsrNV+ZXCK6uVVqIAVoPtJ+KMOZpX0uT9O48+Q==
Received: from MW4PR04CA0127.namprd04.prod.outlook.com (2603:10b6:303:84::12)
 by CH2PR12MB5002.namprd12.prod.outlook.com (2603:10b6:610:6d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.14; Fri, 28 Oct
 2022 12:38:00 +0000
Received: from CO1NAM11FT080.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::3) by MW4PR04CA0127.outlook.office365.com
 (2603:10b6:303:84::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15 via Frontend
 Transport; Fri, 28 Oct 2022 12:38:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1NAM11FT080.mail.protection.outlook.com (10.13.174.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Fri, 28 Oct 2022 12:37:59 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Fri, 28 Oct
 2022 05:37:52 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Fri, 28 Oct 2022 05:37:51 -0700
Received: from moonraker.home (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Fri, 28 Oct 2022 05:37:50 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 1/2] dt-bindings: memory: Fix typos and definitions for Tegra
Date:   Fri, 28 Oct 2022 13:37:40 +0100
Message-ID: <20221028123741.134880-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT080:EE_|CH2PR12MB5002:EE_
X-MS-Office365-Filtering-Correlation-Id: f521aa74-366b-4238-c43c-08dab8e13f97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kt1a8LJV8XJNWglynJA2SCp5GkGmuviRcN7G2G6mJef3fYJ2ce0Dfs2CW8Z7tadtuojEEsAYiFHj1Wp5dfw2UcQQ1dxnPmRl0RGehOTtzGmr9OMzza5UDkv3KB/EcOIOSqUJH3OZZQ5vjH2wQ+wApYr2Hsif6vwPE032Bc7nAKBNdCs18jpiOA63bkwGlk1c7/s9fHCa57z1KA22bgcGZ227++zNthONr8r8lRR+QUz27LzXo4tZU1xaXLv+UnPzXO2CqLEYcC1JNps7EkGBkIJg20VTRujg1FPEQNw9hmGzZgOhh7Opn1pY65VBDGoo0q6JCrTTK3jvd4n9lVK3bNoEzuPeEnXxKOyg+m7lh+WCWp88DQ8jfvt1FXsKdnvC2+08p+jvtFP6jCqJpaItFbmn+EAFGOuGXSQ7JtU0QsfLUYgXKTpf4K+xXezCvux+5LoPSK7hfMkYJWLbAtHsgvngwOrnvCbJWpbMjHQX26mb2kCms4+VifGuzbEXxuaNY/Ax6S4IbogEkE1NhioaHJPsPh5z0oB7HFpO3Ug6vsd7u03K1Xd5WZSMiNqjqiIW1ns36PESB6rbVSsfdRfsTf+fDO2zIMlMMf7yro56K0WWP+xo0flNJLdPR0Qm1Q010OL2OQBz0upzPe/Evq/ZYogGg0jt/X12AUUo8hw0nfWplIhxWf0OFidsvTdDlXetItNxL1TaJ0E+Kb1VE4z2AwJYYee08NpgQUr5iQJ+NKEeZQ5Md1e1kb7dIPfzk3FDmqYQVbl78uDACwKevCCDlg==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199015)(36840700001)(46966006)(40470700004)(478600001)(7636003)(356005)(82740400003)(110136005)(8936002)(54906003)(316002)(86362001)(107886003)(83380400001)(6666004)(8676002)(70586007)(70206006)(426003)(41300700001)(4326008)(26005)(47076005)(82310400005)(40460700003)(186003)(1076003)(2616005)(36860700001)(2906002)(5660300002)(40480700001)(36756003)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 12:37:59.9472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f521aa74-366b-4238-c43c-08dab8e13f97
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT080.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5002
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Fix the spelling of 'clients' in the memory dt-bindings for Tegra and
fix the name for the DLA write client that should have the suffix 'WRB'
and not 'WDB'.

Fixes: ea4777f67150 ("dt-bindings: tegra: Update headers for Tegra234")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 include/dt-bindings/memory/tegra234-mc.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/dt-bindings/memory/tegra234-mc.h b/include/dt-bindings/memory/tegra234-mc.h
index 7d49880e7faa..347e55e89a2a 100644
--- a/include/dt-bindings/memory/tegra234-mc.h
+++ b/include/dt-bindings/memory/tegra234-mc.h
@@ -232,13 +232,13 @@
 /* PCIE7 read clients */
 #define TEGRA234_MEMORY_CLIENT_PCIE7AR 0x2a
 #define TEGRA234_MEMORY_CLIENT_NVENCSWR 0x2b
-/* DLA0ARDB read clinets */
+/* DLA0ARDB read clients */
 #define TEGRA234_MEMORY_CLIENT_DLA0RDB 0x2c
-/* DLA0ARDB1 read clinets */
+/* DLA0ARDB1 read clients */
 #define TEGRA234_MEMORY_CLIENT_DLA0RDB1 0x2d
 /* DLA0 writes */
-#define TEGRA234_MEMORY_CLIENT_DLA0WDB 0x2e
-/* DLA1ARDB read clinets */
+#define TEGRA234_MEMORY_CLIENT_DLA0WRB 0x2e
+/* DLA1ARDB read clients */
 #define TEGRA234_MEMORY_CLIENT_DLA1RDB 0x2f
 /* PCIE7 write clients */
 #define TEGRA234_MEMORY_CLIENT_PCIE7AW 0x30
@@ -322,11 +322,11 @@
 #define TEGRA234_MEMORY_CLIENT_SUE1WR 0x69
 #define TEGRA234_MEMORY_CLIENT_VICSRD 0x6c
 #define TEGRA234_MEMORY_CLIENT_VICSWR 0x6d
-/* DLA1ARDB1 read clinets */
+/* DLA1ARDB1 read clients */
 #define TEGRA234_MEMORY_CLIENT_DLA1RDB1 0x6e
 /* DLA1 writes */
 #define TEGRA234_MEMORY_CLIENT_DLA1WRB 0x6f
-/* VI FLACON read clinets */
+/* VI FLACON read clients */
 #define TEGRA234_MEMORY_CLIENT_VI2FALR 0x71
 /* VI Write client */
 #define TEGRA234_MEMORY_CLIENT_VI2W 0x70
-- 
2.25.1

