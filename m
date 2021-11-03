Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C53C433FE
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Nov 2021 05:06:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 663F360F70
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Nov 2021 05:06:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231254AbhKCFIs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 3 Nov 2021 01:08:48 -0400
Received: from mail-bn7nam10on2070.outbound.protection.outlook.com ([40.107.92.70]:60566
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231167AbhKCFIo (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 3 Nov 2021 01:08:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bIUJZZzRbj9nWo2pP08LTvvvuXYOMpXAUnXML9s2u8fOqXBUVISr72pQ0nIA5fcUzYPjVvLV2uaFPtVKMou5rvf8NB22A53sPGXghioJVRjHXpq+snUAiRL0KFPe/j4U5QspwPgBheJdbncp4qJgTNq54H0nNyhHBG1IClsKGjCRQcfakgIiwm1KEWm2u9tEknpH6ZnNhwvjOjJZs7G0WSuZKpRsSaTQdM0TU75+POqaxZedVBClLdRwnhwF9/LQc7X8ZahbUNGuKyiV2W3a0oIq5pzDpR7T6vlkhqh7gjEfAgyusSweFFqJJmcehDMTn1dTU0qzPFeHWGGMAuPDbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfKfdezJ8Mfc/Hv6hBKDw1/i0Jrxb7Tf38wGUe6Xb/A=;
 b=muigjD3Uegtpupj0ohqdpSbqDMpsMF+NO+AXPFaLNXNSscOBmglUwA2dU1rmhT6MPEorJdkKhVHseE9p3Vi26YJAxRR51jDiaDS+pvuAm1WpX6qET2KO9eaRHMewlb2bZsv1Crq+1fbjML1hhlwtsoBtwRek4kDeyTOrE9WFNqK6FPcpUWXO27xeG0IX4+ACjE7y3n3YzZJa9b8ebkjOXnlJ+Y5XB/YFG82R8DflsTOcaUIr93XLIUYLAbazirO7sCpF7yGjDbYMH4Q5eO0j+X6rTQxV3IQQ38KKc9MJ5Zcp840ZI14hYj3Amv9GDnpMUYi1zAqEoxDtrGhIKvmVFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfKfdezJ8Mfc/Hv6hBKDw1/i0Jrxb7Tf38wGUe6Xb/A=;
 b=dtXqKRxf+SeKMkCZ80wPgVX8q2b2oo4Nwj9VuvoFhiHTC6bLyVuCzVCsfChsuxN701tTjuDAQNzuTL534NiVKT0lGj2GLiMM3Yo5CNrmxvJ1ZAcrRZavYA76FvZdPrFVSVsf3LWOqXX+axFoPkeI6WFjnj87El38HGyDZX/R4HNXlfAgPrU2bkanxz7QpnXwhcmqtkzXJiGbL6IWUJam81PceYX+1Yv4MSyICX8f+MthXP57olagwvTqFwxcAspHtFOj+I2fMP9P86PjblAihpgUdF+mTz76ik2xFiFpdfG8/JhUmI2SMUE57xBolQX+BxYnO8xb8nkO7kMFx/0ogg==
Received: from DM6PR11CA0042.namprd11.prod.outlook.com (2603:10b6:5:14c::19)
 by DM4PR12MB5263.namprd12.prod.outlook.com (2603:10b6:5:39b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 05:06:07 +0000
Received: from DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:14c:cafe::d9) by DM6PR11CA0042.outlook.office365.com
 (2603:10b6:5:14c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Wed, 3 Nov 2021 05:06:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT037.mail.protection.outlook.com (10.13.172.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 05:06:06 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 3 Nov
 2021 05:05:57 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Wed, 3 Nov 2021 05:05:55 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
        <tiwai@suse.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 2/4] ASoC: tegra: Fix kcontrol put callback in I2S
Date:   Wed, 3 Nov 2021 10:34:55 +0530
Message-ID: <1635915897-32313-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635915897-32313-1-git-send-email-spujar@nvidia.com>
References: <1635915897-32313-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62c2878a-8377-408f-a923-08d99e87a440
X-MS-TrafficTypeDiagnostic: DM4PR12MB5263:
X-Microsoft-Antispam-PRVS: <DM4PR12MB5263AA9B3D489320E055985EA78C9@DM4PR12MB5263.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fBHokq89fIhezIpQ7aNSfsSwDTqN0trMXTBvwfgd0O73d7Ph+ZvLOYtbiiNFKERNtyoURLzyBR/5LyP1ZbIR7qNnHXASE6s1FFmIyNFMRrFu2FGZXbu03a2HXtDHB85dmuG+s9id5M6RvOPsVr4fOM2kCjF9MIniHETZYTmDyd6A+fr4a0VczOSCdvaTvOkfhhQ+f4fYSutxzmpqsyA0fPi6MlAGYBOaqjBtmlnsdGWVtmLgG5Dqun/93k14xh9JUYsIjrSZgFJyLQpp9dTjSPlnA93qE9bkVpx5W1t1XMzy8sgD6KvxJAxXya7t6KgzJ6dT1EGvgORJ9sDBiwsjTlsmAlhnFT9eHIJYhYhZ8WYo5f3F0m1evH0F2GE7KPtpKEpkwoST3tXjgfHZrOzOBDl2PEmgyO+5V69pCxONYt1rVqNPF0rNgdngTw4+vjfbjMw9XCw/0D7gqcsDK5MH9oHEtOmlMctQjdvNDAVjh/n3i6tbfLt7+NsiDPLK86TiXVexTskES6lkmcqgcH8lGHCdpUGClpgNmqEx5FsP8eKZK0gl83PDeMvlrdObKYF2hlICmJLBq/yVVQFAnyIlMhjCtqmZ3jYdBUj5nVjfLqbjdAS0YkTnREIEPwYxyQusIGJap+f2cwqEN1aHeA+31t7UOO0k29iWg2S4Djabi2U9K598NGZFrkQrvRAkAH3swzyOZSkaAuNDODr+LHMwPQ==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid04.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(336012)(5660300002)(8676002)(426003)(7696005)(508600001)(4326008)(8936002)(70206006)(2906002)(36756003)(70586007)(2616005)(7636003)(36906005)(82310400003)(107886003)(54906003)(26005)(47076005)(86362001)(186003)(110136005)(356005)(316002)(83380400001)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 05:06:06.2121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c2878a-8377-408f-a923-08d99e87a440
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5263
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The kcontrol put callback is expected to return 1 when there is change
in HW or when the update is acknowledged by driver. This would ensure
that change notifications are sent to subscribed applications. Update
the I2S driver accordingly.

Fixes: c0bfa98349d1 ("ASoC: tegra: Add Tegra210 based I2S driver")
Suggested-by: Jaroslav Kysela <perex@perex.cz>
Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra210_i2s.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index 45f31cc..b738b21 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -380,9 +380,11 @@ static int tegra210_i2s_put_control(struct snd_kcontrol *kcontrol,
 		i2s->rx_fifo_th = value;
 	} else if (strstr(kcontrol->id.name, "BCLK Ratio")) {
 		i2s->bclk_ratio = value;
+	} else {
+		return 0;
 	}
 
-	return 0;
+	return 1;
 }
 
 static int tegra210_i2s_set_timing_params(struct device *dev,
-- 
2.7.4

