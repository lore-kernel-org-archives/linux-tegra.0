Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC56C433EF
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Apr 2022 17:17:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238694AbiDFRTJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Apr 2022 13:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238708AbiDFRSx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Apr 2022 13:18:53 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2484488BCF;
        Wed,  6 Apr 2022 08:17:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlHKO2IAU/kjkDu0AIfQKr05R/zEBTAIWZ20zS0Io3gPJQq0MT2pf6TnN5QYNWu+m7ow2HWH99hjKnKlvZWcIfNH0c1JUXufx0XawSKC/8ojjrMt7J0Ovs6aT1OUmoNt0nFLnGikYjuFK1wnisVBYSHqByVDkGn92nh6/1pirFCHGe+u9DtXju3scbLLVcRttMmVdKYUfyvWtI1cjvpdGx8kyjfV9qqAmokaikMauW6zi13dSigaw6NKhVaiKcBNl9FeKSPPMklJv5Z0N9KZWlllsDVzdV03CaFjiPjV8thoOPOxZiSkyfRlXj6/Pxxf1d0t8RuG/ntECeQCrclWsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsyXstWOKckViiNhj7eFuSiWnjNgv1uq0BjNnqJ0iWg=;
 b=bhR9z/61Ycmrv5m4ebR3a6if35Op4lUbM2sni4TX7BwFKNh7IGTChAPPORdKr0KIPaiCddJCWosiuGgLrNXNiQXNEBlBiqkxvdZ+bgUe3fW+qjVvDoOueaUwe2U+KQ1tTNiYvl7xERcf45jtEBtsuUFerDd6BjjlV8aLPfuYbGDwfSBoCOs5Ov6a3/O8RZMWrsDDONsqrHLO4XKeqOo7SkWLxO3pIS7tIeg4L1yuc4Oi0BEGpVOdb+BdofJMJAX16sJdyhkdR+ZCOnEtv4V+p8d5oiwYtOmZoG2yyrfow11VXjxzJbiNpwBFkvu6Cz8flTDSNBooetQpd6e3wZE2lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsyXstWOKckViiNhj7eFuSiWnjNgv1uq0BjNnqJ0iWg=;
 b=UVIVevQgP3wvzpkQ+GV6Dghgn/6nkYThQz7LzeV5yExhGsQ2ryNeU7t6WxX6OTDjvYiX5NZSMsjv18fIEbYKGso4yzyUtDUqMyeZ6iiBQ7CvsGPOMnNq9R8OkxQcPtroxE9a2xqoR8jFclAkMkZoJ7yH5ZQoPue+QBuqDL1l0CsuBjmCXQM8Y3QMAP9RHG/6iiy3ssn41FNqS6oCHNvLw5aJMsWSoJRCVBX6JROBN6uUP1m2C9vSwLFWY6BnE8Qcs/5D/Os40yM8CxQFM3+ZJQ2ThrmDJWdo+2MhQHmgUGgQ5GAhUwxSW0qzIeu7cAcFHJj19Jy8rOMCGVApxHoLOA==
Received: from DM6PR17CA0032.namprd17.prod.outlook.com (2603:10b6:5:1b3::45)
 by DM4PR12MB5215.namprd12.prod.outlook.com (2603:10b6:5:397::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21; Wed, 6 Apr
 2022 15:17:19 +0000
Received: from DM6NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b3:cafe::d0) by DM6PR17CA0032.outlook.office365.com
 (2603:10b6:5:1b3::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31 via Frontend
 Transport; Wed, 6 Apr 2022 15:17:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 DM6NAM11FT015.mail.protection.outlook.com (10.13.172.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5144.20 via Frontend Transport; Wed, 6 Apr 2022 15:17:19 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Wed, 6 Apr
 2022 15:17:19 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 6 Apr 2022
 08:17:18 -0700
Received: from moonraker.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Wed, 6 Apr 2022 08:17:16 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        "Rajkumar Kasirajan" <rkasirajan@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 2/2] clk: tegra: replace round_rate with determine_rate
Date:   Wed, 6 Apr 2022 16:17:01 +0100
Message-ID: <20220406151701.262056-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220406151701.262056-1-jonathanh@nvidia.com>
References: <20220406151701.262056-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a79d8e25-3ca5-466d-714d-08da17e08aea
X-MS-TrafficTypeDiagnostic: DM4PR12MB5215:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB521584C43769367C8D818C3FD9E79@DM4PR12MB5215.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ruPZPppnWF4J8mKbDeJb6cbEdIv1+0ghz4OVk8avHG2SC0I6hWj1rwPxVfSWSpmDhnqoXkG1sTVzbHkeK/XqQsdbAVS1NImBHgY9+daRpCulb9MVcNRM6LEURn2Buy8vTPKC9bY+a0eAJvAKvIVBaCua8oFoPv1ZCkG0QHqa80lBgIKF34XEsHGj5DYKxsfYlZ+cU76XpS27Tomkdc/xbsaIt93Ko2i9dCHta6ODQnoq2L2jLaCwoXTAkz83NWwRxKeROkav6hFh6iDXQIzdv0p/7LHYqN2xQg0lLJ9p+CEgsY0B95NhnmUQDQfk0JxHWfJrwRkdY7f4Zc0tsQ/hFCwmH1o/q/Sw4QnV9Mm1ca/Bthz2oLfzDfOqIoPVacFNITA+XZjtzWCOm6XGmj9Urv69eujpYeTpmeDFrgZidPqcQskgwohjQo6CNdQey5upPqv/NrVzJIuHlM/cfUfde9U2XShtQmWsDZBMTcyUs/9EuRU9ghzqBfgfGc7FTFTCxOpGQB/cr+Z7p3xVn3VkQEXFYuDxB+3wdkHInH/NtKaGcv7tD5TJyKoWrsqiMWgLWXomBXEwfJbMcxMAkyHlmmuSHUq1GHtaoPKWZm+0mzVtxSLqTSuKKwUS+ipsOTVG9guuS0obm/W8yzDIX3+yOrvg8Lb2bO/McHCFIlgYI+oA7N7Swz37n/Npn8AHar3moABYg46I+lFbnrprLwkv7g==
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(4326008)(8676002)(70206006)(70586007)(316002)(54906003)(110136005)(36860700001)(36756003)(81166007)(86362001)(356005)(40460700003)(82310400005)(83380400001)(2616005)(1076003)(26005)(186003)(508600001)(6666004)(7696005)(8936002)(47076005)(336012)(426003)(2906002)(5660300002)(107886003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 15:17:19.5986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a79d8e25-3ca5-466d-714d-08da17e08aea
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5215
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Rajkumar Kasirajan <rkasirajan@nvidia.com>

Replace round_rate callback with determine_rate which can consider
max_rate imposed by clk_set_max_rate while rounding clock rate.

Note that if the determine_rate callback is defined it will be called
instead of the round_rate callback when calling clk_round_rate(). By
using determine_rate, the max rate returned when calling
clk_round_rate() is now limited by the current max_rate.

Signed-off-by: Rajkumar Kasirajan <rkasirajan@nvidia.com>
[ Checkpatch warning fixed and commit message updated by
  Jon Hunter <jonathanh@nvidia.com> ]
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/clk/tegra/clk-bpmp.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
index bacaa468e114..3748a39dae7c 100644
--- a/drivers/clk/tegra/clk-bpmp.c
+++ b/drivers/clk/tegra/clk-bpmp.c
@@ -164,15 +164,18 @@ static unsigned long tegra_bpmp_clk_recalc_rate(struct clk_hw *hw,
 	return response.rate;
 }
 
-static long tegra_bpmp_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *parent_rate)
+static int tegra_bpmp_clk_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *rate_req)
 {
 	struct tegra_bpmp_clk *clk = to_tegra_bpmp_clk(hw);
 	struct cmd_clk_round_rate_response response;
 	struct cmd_clk_round_rate_request request;
 	struct tegra_bpmp_clk_message msg;
+	unsigned long rate;
 	int err;
 
+	rate = min(max(rate_req->rate, rate_req->min_rate), rate_req->max_rate);
+
 	memset(&request, 0, sizeof(request));
 	request.rate = min_t(u64, rate, S64_MAX);
 
@@ -188,7 +191,9 @@ static long tegra_bpmp_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	if (err < 0)
 		return err;
 
-	return response.rate;
+	rate_req->rate = (unsigned long)response.rate;
+
+	return 0;
 }
 
 static int tegra_bpmp_clk_set_parent(struct clk_hw *hw, u8 index)
@@ -290,7 +295,7 @@ static const struct clk_ops tegra_bpmp_clk_rate_ops = {
 	.unprepare = tegra_bpmp_clk_unprepare,
 	.is_prepared = tegra_bpmp_clk_is_prepared,
 	.recalc_rate = tegra_bpmp_clk_recalc_rate,
-	.round_rate = tegra_bpmp_clk_round_rate,
+	.determine_rate = tegra_bpmp_clk_determine_rate,
 	.set_rate = tegra_bpmp_clk_set_rate,
 };
 
@@ -299,7 +304,7 @@ static const struct clk_ops tegra_bpmp_clk_mux_rate_ops = {
 	.unprepare = tegra_bpmp_clk_unprepare,
 	.is_prepared = tegra_bpmp_clk_is_prepared,
 	.recalc_rate = tegra_bpmp_clk_recalc_rate,
-	.round_rate = tegra_bpmp_clk_round_rate,
+	.determine_rate = tegra_bpmp_clk_determine_rate,
 	.set_parent = tegra_bpmp_clk_set_parent,
 	.get_parent = tegra_bpmp_clk_get_parent,
 	.set_rate = tegra_bpmp_clk_set_rate,
-- 
2.25.1

