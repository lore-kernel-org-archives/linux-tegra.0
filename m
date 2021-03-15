Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C6C4C43381
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Mar 2021 17:41:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0763064E31
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Mar 2021 17:41:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234672AbhCORk4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 15 Mar 2021 13:40:56 -0400
Received: from mail-bn8nam08on2043.outbound.protection.outlook.com ([40.107.100.43]:59936
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231144AbhCORk1 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 15 Mar 2021 13:40:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhzT2erI3b8UE4gsbqc5kcFtDZ3xTVcEhqXqHUJ5jEGE/atW8ctNXS3BmVHPTkEx5UEcLjdtTz+GPyAurGBGg68HD0GpNDqOHsmQnx7Cqha1PlnaVpgWb+oUSmKAQgIBQM5yw8Cw2npsmi5hAKVkG+I53XDlVSHpgVCggLnEY7ThWvppgNJXWCkSVXnk1yBJInFUdnkEF+nJrbhCOcoQxT15VGToLxaSakeFDDlNFCaM/e+1x+BDEVj8pgEsZzkReeSHPGfN6aPebdCXJV3oeEnV9Z9iXzlIcZy9b9SzHHC5y3GJHa7t7z8Qdx4yO4SOt9C4Vtz4rJ3NqltOfV/lqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5sS/Dj8AJ/uXnIEtZtTrZI/sVg5Ng7Q0vmV4JoyQo4=;
 b=M74UIccmEuIn5IBMMoM+0RjcKLwkyXsfKX9xsCpNgjwKJGkv4AxEbcojCYu4Hfx5YRG3YwtQ1N+GWv8ygoScImkmm+ELlt9pA64vvPbMFx+KrKNwL7CPtirqAuRqbDoSaU85Gft7B3IPR53fOwZM9dj/ldOMqLFMmFAvosmlTTM2zgoTsH43Urgct1CSslu4i7siweKBs4UXANo08lmHfS3dzfB7HyeYc+x9pIK4ay4hr0slPQvov91+TSgkLQ9a/g9vUsgqC/9B/hHoppGWwmYEDCrOYkuTeNoBZ8wI4df6z9RnDZHR7sVn6smuLQoNL8MNt1USh0xPESoBAl+oJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5sS/Dj8AJ/uXnIEtZtTrZI/sVg5Ng7Q0vmV4JoyQo4=;
 b=aRlNHY3Lt3++0yZ9zxRqEUe6oujzZ1xf++G2kt5U97y4LUr58xl99mRZX4ee+jwgR+GvV8TKCRGSTk3waFq1xjoBPthU8pvpXlTUZk2R4PHoUBTxAsIk8wQG48Cs33YfpN7D3yMloHwHcuRodZGkUESD8xBLMw5jctVflai9wHOX5su0yS43a2jEwPCXqJcur5S/vDg4i0C5kF8YoHxm4Y6wfbtUizYFiebilGgNK76241xZrPRpbUrQnDSDuJ1PFeuj7cEkWjCtJ88ZozwVG6eOCtyuPXH1Pnf/5g6BE8QQ4CQZiS6rTBio5RRzFIhdcY4ievTQ5pq5ZgQiYuhLhg==
Received: from DM5PR19CA0026.namprd19.prod.outlook.com (2603:10b6:3:9a::12) by
 DM6PR12MB4532.namprd12.prod.outlook.com (2603:10b6:5:2af::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31; Mon, 15 Mar 2021 17:40:25 +0000
Received: from DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:9a:cafe::e) by DM5PR19CA0026.outlook.office365.com
 (2603:10b6:3:9a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend
 Transport; Mon, 15 Mar 2021 17:40:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT009.mail.protection.outlook.com (10.13.173.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3933.31 via Frontend Transport; Mon, 15 Mar 2021 17:40:25 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 15 Mar
 2021 17:40:24 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 15 Mar
 2021 17:40:24 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 15 Mar 2021 17:40:22 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <thierry.reding@gmail.com>, <robh+dt@kernel.org>
CC:     <jonathanh@nvidia.com>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v2] arm64: tegra: Move clocks from RT5658 endpoint to device node
Date:   Mon, 15 Mar 2021 23:10:15 +0530
Message-ID: <1615830015-9195-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df998727-fb9f-46c2-c82f-08d8e7d96a7a
X-MS-TrafficTypeDiagnostic: DM6PR12MB4532:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4532D1117DD242F6807769CFA76C9@DM6PR12MB4532.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZYkmVpXY/wjl8qqC7v8oahJatJ0J3vj1UVUET3GfpoKRvajPrRnju/dqPFz4KL8WRNYarDdOfh5NLZQ1eUk1QV1hfgFUpXCUvse2YMedundMRLy9AVZlqJXgoZIwhmQlkbmSVJ+Si8EN5bBU/ipWJkQly3DeLqN3gmZYRv4bR8OBh6VnEX1aOu36k5BG3nx1M4yBBGyaHO7e1gf8jlVBE0k2733XocFZsFMZuoGiEKoYSO7MoT10Qg6eqs9m/VCU7uxvGheYJbpnh3XOOai+asOsx0bwz9BSswBlQmRtW5qjnUkBFgOPLwnHaFnP+vQiZHoHiE7lLdgIrL19CzmC6un6LFM8h6YNIi8jYKzOIatqZ5Zyq5wkzWYBKaBnohBNEfuo0Rl8eCpsATUfR+VWDqZanEQNbMUr/JMDoh6w4LS0ZRklQEKGNUUi0TfEptXXvwBTIx8fUG8cxKVqBWIa/dORNLb1APl63FdBT+9Gox2UOvf23KHN1uLIELunGTc/1uPHpJ2I7JeiXj6vWgQzbvh5VcQ/jurdDthMgwFItLF8K6V+wbTX8Ld5/93qdt5SSbGsVfiyWGvgRVTOrU8C9TcsZMDDcStNNYo7rxTAu+o3TWANb5+i+f3dJTJam3qE3Yt9A2K46Gojcph/HUd/gGfvzWw1BBCPQzR7JiCVD8n3RUqb9ZAJEjdGEpMBE1xG
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(39860400002)(346002)(36840700001)(46966006)(426003)(36756003)(82740400003)(7636003)(54906003)(83380400001)(107886003)(86362001)(36860700001)(336012)(4326008)(316002)(70586007)(8936002)(478600001)(82310400003)(356005)(186003)(2616005)(5660300002)(47076005)(70206006)(8676002)(7696005)(2906002)(26005)(6666004)(110136005)(34020700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 17:40:25.2106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df998727-fb9f-46c2-c82f-08d8e7d96a7a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4532
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

An endpoint is not a device and it is recommended to use clocks property
in device node. RT5658 Codec binding already specifies the usage of
clocks property. Thus move the clocks from endpoint to device node.

Fixes: 5b4f6323096a ("arm64: tegra: Audio graph sound card for Jetson AGX Xavier")
Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 Changelog:
   v1 -> v2: Added "clock-names" property as rt5659 driver specifically looks
             for this clock name.
 
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index b079420..8dd2871 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -651,6 +651,8 @@
 				reg = <0x1a>;
 				interrupt-parent = <&gpio>;
 				interrupts = <TEGRA194_MAIN_GPIO(S, 5) GPIO_ACTIVE_HIGH>;
+				clocks = <&bpmp TEGRA194_CLK_AUD_MCLK>;
+				clock-names = "mclk";
 				realtek,jd-src = <2>;
 				sound-name-prefix = "CVB-RT";
 
@@ -658,7 +660,6 @@
 					rt5658_ep: endpoint {
 						remote-endpoint = <&i2s1_dap_ep>;
 						mclk-fs = <256>;
-						clocks = <&bpmp TEGRA194_CLK_AUD_MCLK>;
 					};
 				};
 			};
-- 
2.7.4

