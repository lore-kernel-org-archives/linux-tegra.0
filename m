Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA0D8C678D9
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Jan 2023 15:22:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbjAPPWm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Jan 2023 10:22:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231570AbjAPPVy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Jan 2023 10:21:54 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF8C10DB;
        Mon, 16 Jan 2023 07:19:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TzIc8yXPiDIDtWa2aN/+4VubVRtxQ4RuBBVVYkHEvNCcllYEv1/b4ytuQRaeMklCdwYO+KDmx/DtV177F4Ct5YLR4zIYjxcECbLcxkx5/u2UpAE73i+YE9nswjM/seXEBc7jNpF5xdrlkP2DlS3Kr7XtaOt2IFecOkZSEYrnxJWpkbsSZMhjudAZegpa9K1ZM5iuRNoimxZq6YzTQVOzdyfJRCsFm34US4ag/llBvYCLhdXkRGbRrVlQchFFK9wX616nWy6zhEQTQssgeKxone54At6qRuNYVDwCAUgP+Tqitp1Uh4OEcI1DGbNgNYa9qRileMjShucsTdIPn0XHPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qg/q+9j0qYPEI25pFHLS+EV8tL4dggbI4Kltq5Yuw0k=;
 b=F0PkGJVeCdT/Mgj6Wwkvc7FKn68+y5OLssDfTuQyKZdCg594dm/WNZ7OfKH02rKDZ8M8w1S8fEy+HjV86fvnB/EEtzrn9vIW7J7szTuKVtWdNWpebgrlNSPHoGIvp1iexbEm1P9Y9C5Nuhh0+tsO0q3GVfZFf9zJzkIbX5A9lNMmAj5O703PfB6vnE4fc0RdIKvwLKySzU/TuZV1zIlh33OdPYembMQEH/Z/xXzMTMT75ZOO4ZYvTO+cN0smupRLVVDZDMLpFHMZ+YdVc1AWNiWlvtE7DNqMv6Y+4QASeAZhmr0T5vPs0x3HYwLAHT+yoqg/HZudl2oxg9Hvhglrlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qg/q+9j0qYPEI25pFHLS+EV8tL4dggbI4Kltq5Yuw0k=;
 b=FQkG5XAfErvkwJqCQSNM3LfAevNtz2Gyj9wokziIijGPiz20jTzuesC3JP/6l53RJ6ZRzkUk6N+aGll6ff+qqaX4Gq/jHLqy3luN7c/JpXU+sykMvcklZE9RYsSLZJ2IDal8qGTroQiwCfZxKZbs0/feW4FfShYqoWRRYR5WWlq6iAYQKabIjrBXJRTYo8g1AZrfSEVQhbvocvIINxThiGsNvSY1CsrsOjy51ghRkYiYBV/wYZL8wXM36MkRt4c6LLqGuRt9HvwgkFG3bh9r1QsjV5ZO3w3UhKPN7jW379Rw3eijfyE11nKOA+b1o1xevVdUtPGDbcocwVEhjc05Ag==
Received: from DM5PR08CA0026.namprd08.prod.outlook.com (2603:10b6:4:60::15) by
 CY8PR12MB8314.namprd12.prod.outlook.com (2603:10b6:930:7b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13; Mon, 16 Jan 2023 15:19:38 +0000
Received: from DM6NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:60:cafe::17) by DM5PR08CA0026.outlook.office365.com
 (2603:10b6:4:60::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 15:19:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DM6NAM11FT042.mail.protection.outlook.com (10.13.173.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 15:19:38 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 07:19:32 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 16 Jan 2023 07:19:32 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Mon, 16 Jan 2023 07:19:30 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [RESEND PATCH V4 2/5] arm64: tegra: Add dma-coherent property for Tegra194 XUDC
Date:   Mon, 16 Jan 2023 15:19:14 +0000
Message-ID: <20230116151917.94193-3-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230116151917.94193-1-jonathanh@nvidia.com>
References: <20230116151917.94193-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT042:EE_|CY8PR12MB8314:EE_
X-MS-Office365-Filtering-Correlation-Id: 06e94b4f-d858-41ca-084e-08daf7d5152f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: whR2HAfmlY6NtfAsIgkLO1Cs/yAr5hzHVxj6+IuCJpfVG2u7NS7s2A39BSv+ag15GwY/xj8bKF50Lcqj1sNxs0muMLGeL1eOd3aQ0FZfHEFUS1DaIvNay0rHsUvKfjDK543hBKc2fNf+my9//evWeZwrxVDNtMnazJ7ulAhemASs7vo/xX0335yjHjTZTP0bTcv8RPulAHxrifBNxdcyX2FkLk/nOEwlKroeAAiM0xn1sANWEWviH84cTsRMaT7Pav1UQ5umRInWbnUcka9rZqU6MFAQ6GVl4QCdIduMqD8pN9Rq5cHyhUl++g/fdbBvzTmHqPplSQIrzljfUOEEj15+LRHvM94LFsbOCJ8aXIdlQ1woKDvEVIx3vdsdSb/YoOE0J4kzKs9VK7pETcu0RV39qpLt4P6S/5WWcNbrWBZLIAMr+dGXAKXbGGQYP7oBGYsszhGh6m+YaB0coxNLBB/mRlJMvBcGqPUXtOLeuGyiFsSVLodmrNOa3oYzXe0ZxORu4MuqmhvGycnQq/Jo3VCc6lF+MlYPx4Y4c6UPZC6Tgx9cfCVmT3N+rO0lPNCY4qdsxI+VYyoJtjfi1CxSLDgr3siP5ZOhO8xR2Q2Ub0ldGBR5AGvCIaij+0C7CQZ63fFp/IzaFmU2yGCMDKT4Z/GcXMd+wijUzGCD9y6rrUhLx83jamaUM8WWF8Qu9mpmCHsrtcw+wlKFteIC9AEI8g==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(136003)(376002)(451199015)(36840700001)(46966006)(40470700004)(5660300002)(41300700001)(8936002)(7636003)(83380400001)(86362001)(426003)(82310400005)(36756003)(40460700003)(356005)(2906002)(82740400003)(40480700001)(4744005)(47076005)(36860700001)(26005)(478600001)(186003)(7696005)(70206006)(4326008)(336012)(8676002)(107886003)(316002)(110136005)(54906003)(1076003)(2616005)(6666004)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 15:19:38.0438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06e94b4f-d858-41ca-084e-08daf7d5152f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8314
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

DMA operations for XUSB device controller (XUDC) are coherent for
Tegra194 and so add the 'dma-coherent' property for this device.

Fixes: bc8788b2f3a0 ("arm64: tegra: Add XUDC node on Tegra194")

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V4: This is new in this version

 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 4afcbd60e144..99eeba8de6bd 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1291,6 +1291,7 @@ usb@3550000 {
 					<&bpmp TEGRA194_POWER_DOMAIN_XUSBA>;
 			power-domain-names = "dev", "ss";
 			nvidia,xusb-padctl = <&xusb_padctl>;
+			dma-coherent;
 			status = "disabled";
 		};
 
-- 
2.25.1

