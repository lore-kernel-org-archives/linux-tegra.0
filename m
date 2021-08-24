Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B862C4320A
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Aug 2021 12:57:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0AF66138B
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Aug 2021 12:57:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233952AbhHXM6d (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Aug 2021 08:58:33 -0400
Received: from mail-dm6nam11on2065.outbound.protection.outlook.com ([40.107.223.65]:36160
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237234AbhHXM6c (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Aug 2021 08:58:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QbxrO/pPhn5zOVakRF32e5RJFH1EE/ia/duydsTbhwPkP9d14DsqYTp49+NNvGXHyDc+dXGUubc1Oq5QnL25n69M/SBAMWNAOBd61mrztMdmaw6vUFeE6+T5QVGs50femcypEwA6/YfWWh+SsqXYoGw5tjjJqscTimVAqs6DzegyvsXsJImiIkejBtOos0v82jANt0r+XBorh7F5AggMRzkku5Nn3i5owajDdd1VT/2bZ5A4HiaXCECmuT0HxUXRnvu4zX2HfKRJG8JSTnAsfVJiBPHJfT+2BJF3AzzSSerEJWbR8SIfaWetjL6j43F+oXMznjvLgissQ3tbXU5Uiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1wxG1M1/0MJkE6JPDCh1Q1JsgdKdoplqLXN1309bmg=;
 b=Z0ZV4qmBw9V0bvBJE71ZQSdvcVF/NnT4aL1+skZFtWxrbn7SmLO2adBGvYv+8Uq9NYXE27yL7iPsyUatdAA1+QTyiVHgLNL6AaT5Gulxw6AgYMW8ShQG7kmUsEfaN6e42wLtQon1Y6DR2qBKJNkM9ETaEbawn6CDizYX3OfqBRIqwUeAx7bWPhSUFZnbS50TMFNp1tAQXrFSdYifu3u8sy7FIDdvXMggQLq+bdIPTUDKkcKL1Fyn1p7orosU5pJF6wVDuK43XujKmC1/jgNd2aVqzl++Qq6ya+3d4rhSjSAznM0p37tV0z9muJ86TMlmvFRuYLYWRSpHiamlGmJw/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1wxG1M1/0MJkE6JPDCh1Q1JsgdKdoplqLXN1309bmg=;
 b=LGhFrPCsmjYZVUn6cPXNgx8UM2SQm+f3A+tWCvj528zl2x1arPJlJnWHpQ3kqc3+LHbaSeKQo2Q/0leHDHliJOsD5nFHVnw9N+tqg6izVCDLmf49FUbi2syLsoC06FQGEFA1cmXySxo4wdXuJe/ajJweEsCBRcq2l6hH93KO4wgLBhObwF0/DjBBkHpWN5IvSeCoMuF7MLJrAiA9MiU8RM7tkeSfh5GHLeUXX2oN8B/TeZjsBUTolwPt3QPRmtIBL1Bu61GQBDdV8LyB/VKvCJQYe+1xWR5lIBVpD3TD3IYJJSjV4KhhuFhqYzn1N1zaPn6Yn/6yOBLwlbnzVKhe2w==
Received: from MW2PR16CA0056.namprd16.prod.outlook.com (2603:10b6:907:1::33)
 by DM6PR12MB3899.namprd12.prod.outlook.com (2603:10b6:5:149::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 12:57:47 +0000
Received: from CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::af) by MW2PR16CA0056.outlook.office365.com
 (2603:10b6:907:1::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 12:57:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT066.mail.protection.outlook.com (10.13.175.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 12:57:46 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 24 Aug
 2021 05:57:46 -0700
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Aug 2021 12:57:44 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <thierry.reding@gmail.com>, <robh+dt@kernel.org>,
        <jonathanh@nvidia.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 2/2] arm64: tegra: Update HDA card name on TX2 NX
Date:   Tue, 24 Aug 2021 18:26:10 +0530
Message-ID: <1629809770-7456-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629809770-7456-1-git-send-email-spujar@nvidia.com>
References: <1629809770-7456-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aba32b0a-a0c5-48db-088d-08d966fec55d
X-MS-TrafficTypeDiagnostic: DM6PR12MB3899:
X-Microsoft-Antispam-PRVS: <DM6PR12MB38992C6CCCC026F6E11752E4A7C59@DM6PR12MB3899.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:68;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H7YfxKdrq63WmWrqNTSboj9GRdHs+KoEl1nZLR7deizr73/OMAOCPtmkliTfJcHsfoIO9tdpglNFGEK09f5HblauyzBBsSum4mFnxTcJ2UEZ5n2cmZ9PoVeyVTJIB/TBIg9laIbGThjoiCjueLwAIDp02wL3h3NZdl7Zrv2mlnXEJb5JGw6Dk7Gru+U/4dFORe9alO75j9+YX3BV7QsO1rqZkUlfrJiftHWeUCBGqDg3Uko3UIwbBldDJsQ5IOGPba2MkQ7hWsp7AAAm3eqnBpY3c4syxNJd4mjHu98eksl6/peLxWah0mKkVpciO5smunDEp3VzEHD+FgdTqve2AE31d/fcPy7TK8Ud78WZrQ7S0N+ILhF+InbjcIvKJ9qywBLQmwLC0jJgZ+XxyI/8IzbC3sk2RFcOg7kkkxe6MzA4mdNN2+C+MsDyHZ553/AI2pbwmYWhKVcKDXMuEYnpI1zmHNyLrfMqCcMW5+swYtv2osjT4NHcOkHUlWV4ui2r4r4lmfJVt5UMnDeerDwS9fxUIW8VOFSa+TQMitE+oFEQoYzu7401fOrKyAJEBQ1wBlwdOOyOzB7dibdJXWd+FnjI8UUbk9aZS27mc/jlaEf7pg9Z4ilgqLLBKj8YJuaDN4seX/YlvWC68w3vr2Uixj0Y+Et2xkLXb5vv0+Ti8mICnw0IrIXuPB9v0DO2NOWJnIvcYdN3KoyOabRoCk7nZQ==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(396003)(376002)(36840700001)(46966006)(15650500001)(26005)(47076005)(36756003)(82740400003)(107886003)(8936002)(110136005)(316002)(54906003)(478600001)(186003)(6666004)(356005)(7696005)(36860700001)(7636003)(86362001)(70586007)(83380400001)(426003)(6636002)(82310400003)(2616005)(336012)(2906002)(4744005)(8676002)(4326008)(5660300002)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 12:57:46.7111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aba32b0a-a0c5-48db-088d-08d966fec55d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3899
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Inspired by commit b8928c2b5dba ("arm64: tegra: Consolidate audio card
names"). Based on this update HDA card name on Jetson TX2 NX platform.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
index 17fc179..af33fe9 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
@@ -124,7 +124,7 @@
 	};
 
 	hda@3510000 {
-		nvidia,model = "jetson-tx2-hda";
+		nvidia,model = "NVIDIA Jetson TX2 NX HDA";
 		status = "okay";
 	};
 
-- 
2.7.4

