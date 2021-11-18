Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC0E1C433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Nov 2021 07:08:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2D9760EE4
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Nov 2021 07:08:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243643AbhKRHLx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 18 Nov 2021 02:11:53 -0500
Received: from mail-mw2nam08on2083.outbound.protection.outlook.com ([40.107.101.83]:5729
        "EHLO NAM04-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243684AbhKRHLK (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 18 Nov 2021 02:11:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8fDT2QEqpknlRQOMgfjMusOVmu6yEn9jBXs3vB830y9QMTndF4jl45LvliLSrSmSKO4VapmcvueorkRLt+GjZMokj70g4nT+2af1/2dzb8ASCq6C1VX9EHbWORHyd7HT6ni2puKr3/oolMuPlqOePmxL/y3n7q9QkFxh52HMjtQJX5euBsFu88OyYpAZPqQK/74Zu9mc8OfoKEmBj5EzK4ffl+s/Cn/w0teqlRWqDYCrQWEGdTHsQMtKac28fQjDe3KxKWLble6LV0DJmBq1WDDhSCHRznm4/HbNVXbI41px7sCB2tBGEgXeKdLIP9/meCtOG+UFPoyDCg7OpU5EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PktcI9cavefHccx9wJ7xoNYt427yPivaSQDVB9VDtMs=;
 b=Ur1zucmw5RuI+vatBTj62p2LHD5C3jlltSGcd4WZLN5DTzv/PufdbLwH/vAtqbLcZJGPIfQ7x5uBuc4IVy1YYPIJjOC07A3M7Q4LwT/2pgStbrNqWKaQKyHcx/ICqLxqxqKZCFlQZOH1e0DmoO3LOuqWYQ1Ps2pWe5ZG0cOAO4tliDk8h0e8P/NyuwuhqX7sx1RRsl0soVO7m+D+Cv3pAvz6KwIreoc2bkbJx8rjbQPtuh0vs5R17blvSuOLOALWs6NIxUAh8AjK4sIHYG/pXq80EGvx9lXD6DtglsS+0k6qboNJ9DftqnT72s1Icnl4eMYubgd/9FoRiHDJz3EvsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=perex.cz smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PktcI9cavefHccx9wJ7xoNYt427yPivaSQDVB9VDtMs=;
 b=AKF7PRMVRW3W4H3zDjYOSgDcCYy4euvL1T/Tp2PaGfbH3xU07eIWWwEnPdAsX5GnW07oObfld0OU1/bfRMAWozIwMrkFwCKURpCnP0KVFNuFiF6wFyJFfjmelbG8IA2KLBE6zd28D43bus2wmvTIl85iqLUZMTGEvtHbIncX2qupgYeK6QMz6g6zCzZLYObxz8njnPKv/WJKMp3zcGUHl8FPLPmwz79FOWndhK9qO+rT83z4NY5wtI1OOXklQE6/Zi0KacSDAED9JnumATp/bL0UpUC7Xg6NmfJ2S5mL1fozgpZGQPCsDQBtXCxDDYRbhCl5kksyWcwYgDP8/9bzwA==
Received: from CO1PR15CA0075.namprd15.prod.outlook.com (2603:10b6:101:20::19)
 by MN2PR12MB3968.namprd12.prod.outlook.com (2603:10b6:208:16f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Thu, 18 Nov
 2021 07:08:07 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:101:20:cafe::66) by CO1PR15CA0075.outlook.office365.com
 (2603:10b6:101:20::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Thu, 18 Nov 2021 07:08:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Thu, 18 Nov 2021 07:08:06 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 18 Nov
 2021 07:08:06 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 18 Nov
 2021 07:08:05 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 18 Nov 2021 07:08:03 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
        <tiwai@suse.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v3 14/16] ASoC: tegra: Fix kcontrol put callback in AMX
Date:   Thu, 18 Nov 2021 12:37:09 +0530
Message-ID: <1637219231-406-15-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637219231-406-1-git-send-email-spujar@nvidia.com>
References: <1637219231-406-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4219fd8c-0db6-4006-f074-08d9aa622bc8
X-MS-TrafficTypeDiagnostic: MN2PR12MB3968:
X-Microsoft-Antispam-PRVS: <MN2PR12MB39688510B2B4BA3920E03EC2A79B9@MN2PR12MB3968.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uTXufS8RmKi3XWT64Gi6qN3abcaDr3grpuIe6ixa/zTSOqoC0mQRAldve6AReSjp7vDiuRiLvUUYlKMBXQcY261e5AxIJxA47l0oes5R5smxfhvXKteqv3YZMkvOGyF1E/5CkjM0J+Lbcrq7HBdhGlQa9kNUIqXTYFxbtx9n7f4gnAUDA64/1LMzoXddV7bqPjKtMamZ3rw8su69+iYf1CQJlPoPm2SdkmXNSHYXEJTHg0Iai7m8Km7VdqAV+dfD7qNgLHaBt2kijWxQUkKOu6g4dRow90pHOchjQ3b7zOKXrRGt7KWawsOaLqOUWxpxoTSMH1oUZ598h05c9ftGL/VOKlcWa6f9aJLCHqDkWEcpOm0jld2R0QkCwF82uLNcYwvCg1Gj/gBsxCaW3JSgB3V8kqiYdYBzgS5RcFru6Zmkm44e3wtIdmdxVA/svFt5iVWT1WcVIts/xOB5FNrW0BqAAQ4gZPuWN20dhEDNg1UIFDRDASyt5kWSpVOZwbA0uCg8Y06QpzB3dvYFtQxIyrQMTMQPZFd+nDT1XPsqKZRN5Xosnx36CXOy60FEHLbEkj0oDjoXMSuNBnuZdwX99eECvbq5Z2TkDdI/Z8uGN2loQAwKbystCUICTHfhEsu/wql5uMK2mnuhWWIyw7f8nAeTXJ70eTlwGkaKDb99Fune5M8WOCv7Qb4w/YlqKjb6zfhq72VBte3JRqpyQ51Qpg==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(107886003)(316002)(36906005)(36860700001)(83380400001)(70206006)(4326008)(70586007)(8676002)(82310400003)(508600001)(186003)(356005)(5660300002)(7636003)(47076005)(26005)(8936002)(110136005)(2616005)(36756003)(2906002)(426003)(336012)(86362001)(7696005)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 07:08:06.6722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4219fd8c-0db6-4006-f074-08d9aa622bc8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3968
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The kcontrol put callback is expected to return 1 when there is change
in HW or when the update is acknowledged by driver. This would ensure
that change notifications are sent to subscribed applications. Filter
out duplicate updates in AMX driver.

Fixes: 77f7df346c45 ("ASoC: tegra: Add Tegra210 based AMX driver")
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Suggested-by: Jaroslav Kysela <perex@perex.cz>
Suggested-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/tegra/tegra210_amx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/tegra/tegra210_amx.c b/sound/soc/tegra/tegra210_amx.c
index af9bddf..6895763 100644
--- a/sound/soc/tegra/tegra210_amx.c
+++ b/sound/soc/tegra/tegra210_amx.c
@@ -222,6 +222,9 @@ static int tegra210_amx_put_byte_map(struct snd_kcontrol *kcontrol,
 	int reg = mc->reg;
 	int value = ucontrol->value.integer.value[0];
 
+	if (value == bytes_map[reg])
+		return 0;
+
 	if (value >= 0 && value <= 255) {
 		/* Update byte map and enable slot */
 		bytes_map[reg] = value;
-- 
2.7.4

