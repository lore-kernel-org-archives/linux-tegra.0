Return-Path: <SRS0=64AB=DP=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5485C47420
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 00:45:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A74120872
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 00:45:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHK9cV8z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728056AbgJHAox (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 7 Oct 2020 20:44:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728020AbgJHAov (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 7 Oct 2020 20:44:51 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB25BC0613D2;
        Wed,  7 Oct 2020 17:44:50 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id a200so2542618pfa.10;
        Wed, 07 Oct 2020 17:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FG1OkLKNhedfjn4j1mmL6YOHUlRev6qzvK0rtufvQ04=;
        b=XHK9cV8zeK1J+by8dmx32Mtc6IMO5SR+LXBNKhp7E9NWPmIy15JRQboioa1EUSObus
         Qx1LiSnXJ1ZVKMcqqOeSy7CX2BbKOHNFDyyxBN7rWMQlcvD40ICz51Q8HcgndNFIxtSA
         h84OeLy6G+I6X6fCJwnd6G2O8ILMvlIhs7lD2M52IqsfsysoaMEVou0FYXoOkDNgFMHJ
         2DvOX1eTId/Zsvsym+Kg+8ukFHMH+wz1QVPAfLgof5KdyaIlHFgjZ2WUNi2pn19vTdxx
         T384ZyUFp/hxgl9yHgw2tOilvj2Y2tfDW9Vr/uvoOguak99xLUHn8FEFQCpzT5v2L15U
         /lXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FG1OkLKNhedfjn4j1mmL6YOHUlRev6qzvK0rtufvQ04=;
        b=X5h/kCr4n7Jzjk+b7TpCYUWCTpqy+HTyFNRxkGbuSOkK08KaPo4TJ+Z+hzRvc5jzi7
         mgWOVIGMNT+83oo0IaB2dcOH/7d+7XUqLdxd08D7hMdPEBYfyMnXG9IPhD+il8qLX7ba
         lv68SGCkRtG278udfUbPS81yNsz1FvZOxoKuta9L0kj8X/lT5hutoQC/5VY0V6okMjcC
         LZkTWNpqfUhoZhe0pT4Mh/BSyyZlxE1l7LAcUxnpGtFINpg/UCSsFM1mSI0w5w5ii2aD
         zhmyBfXFePsJCM7/c9008DhkPqBaqzz7EACNpORNLsRSTCgoC6ZJ7cwu5X7dpZV63YyQ
         j6gA==
X-Gm-Message-State: AOAM5305bxNrVVWbr75PowzgYW9zeRi8yUHpdwgx9o7dLuxXWnCjBLTM
        iUsCvuQdj51Jc1WDbpFm/lfVZP/rv2U=
X-Google-Smtp-Source: ABdhPJzO2XvMIz0iL9fbB8ui2KrEzRgOgsmhFPYlkXT9my290SkmGdaGDq5OXM9WHQ8IexoJs6HOew==
X-Received: by 2002:a17:90a:62c4:: with SMTP id k4mr5219122pjs.174.1602117890449;
        Wed, 07 Oct 2020 17:44:50 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id z6sm4939922pfg.12.2020.10.07.17.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 17:44:50 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     krzk@kernel.org, thierry.reding@gmail.com, robh+dt@kernel.org
Cc:     jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] memory: tegra: Sort tegra210_swgroups by reg address
Date:   Wed,  7 Oct 2020 17:37:44 -0700
Message-Id: <20201008003746.25659-4-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201008003746.25659-1-nicoleotsuka@gmail.com>
References: <20201008003746.25659-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This is a cleanup change to prepare for new swgroups.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/memory/tegra/tegra210.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/memory/tegra/tegra210.c b/drivers/memory/tegra/tegra210.c
index e8a7d266802c..b400802c9f14 100644
--- a/drivers/memory/tegra/tegra210.c
+++ b/drivers/memory/tegra/tegra210.c
@@ -1020,32 +1020,32 @@ static const struct tegra_mc_client tegra210_mc_clients[] = {
 };
 
 static const struct tegra_smmu_swgroup tegra210_swgroups[] = {
-	{ .name = "dc",        .swgroup = TEGRA_SWGROUP_DC,        .reg = 0x240 },
-	{ .name = "dcb",       .swgroup = TEGRA_SWGROUP_DCB,       .reg = 0x244 },
 	{ .name = "afi",       .swgroup = TEGRA_SWGROUP_AFI,       .reg = 0x238 },
 	{ .name = "avpc",      .swgroup = TEGRA_SWGROUP_AVPC,      .reg = 0x23c },
-	{ .name = "hda",       .swgroup = TEGRA_SWGROUP_HDA,       .reg = 0x254 },
+	{ .name = "dc",        .swgroup = TEGRA_SWGROUP_DC,        .reg = 0x240 },
+	{ .name = "dcb",       .swgroup = TEGRA_SWGROUP_DCB,       .reg = 0x244 },
 	{ .name = "hc",        .swgroup = TEGRA_SWGROUP_HC,        .reg = 0x250 },
+	{ .name = "hda",       .swgroup = TEGRA_SWGROUP_HDA,       .reg = 0x254 },
+	{ .name = "isp2",      .swgroup = TEGRA_SWGROUP_ISP2,      .reg = 0x258 },
 	{ .name = "nvenc",     .swgroup = TEGRA_SWGROUP_NVENC,     .reg = 0x264 },
 	{ .name = "ppcs",      .swgroup = TEGRA_SWGROUP_PPCS,      .reg = 0x270 },
 	{ .name = "sata",      .swgroup = TEGRA_SWGROUP_SATA,      .reg = 0x274 },
-	{ .name = "isp2",      .swgroup = TEGRA_SWGROUP_ISP2,      .reg = 0x258 },
+	{ .name = "vi",        .swgroup = TEGRA_SWGROUP_VI,        .reg = 0x280 },
+	{ .name = "vic",       .swgroup = TEGRA_SWGROUP_VIC,       .reg = 0x284 },
 	{ .name = "xusb_host", .swgroup = TEGRA_SWGROUP_XUSB_HOST, .reg = 0x288 },
 	{ .name = "xusb_dev",  .swgroup = TEGRA_SWGROUP_XUSB_DEV,  .reg = 0x28c },
-	{ .name = "isp2b",     .swgroup = TEGRA_SWGROUP_ISP2B,     .reg = 0xaa4 },
-	{ .name = "tsec",      .swgroup = TEGRA_SWGROUP_TSEC,      .reg = 0x294 },
 	{ .name = "a9avp",     .swgroup = TEGRA_SWGROUP_A9AVP,     .reg = 0x290 },
-	{ .name = "gpu",       .swgroup = TEGRA_SWGROUP_GPU,       .reg = 0xaac },
+	{ .name = "tsec",      .swgroup = TEGRA_SWGROUP_TSEC,      .reg = 0x294 },
 	{ .name = "sdmmc1a",   .swgroup = TEGRA_SWGROUP_SDMMC1A,   .reg = 0xa94 },
 	{ .name = "sdmmc2a",   .swgroup = TEGRA_SWGROUP_SDMMC2A,   .reg = 0xa98 },
 	{ .name = "sdmmc3a",   .swgroup = TEGRA_SWGROUP_SDMMC3A,   .reg = 0xa9c },
 	{ .name = "sdmmc4a",   .swgroup = TEGRA_SWGROUP_SDMMC4A,   .reg = 0xaa0 },
-	{ .name = "vic",       .swgroup = TEGRA_SWGROUP_VIC,       .reg = 0x284 },
-	{ .name = "vi",        .swgroup = TEGRA_SWGROUP_VI,        .reg = 0x280 },
+	{ .name = "isp2b",     .swgroup = TEGRA_SWGROUP_ISP2B,     .reg = 0xaa4 },
+	{ .name = "gpu",       .swgroup = TEGRA_SWGROUP_GPU,       .reg = 0xaac },
 	{ .name = "nvdec",     .swgroup = TEGRA_SWGROUP_NVDEC,     .reg = 0xab4 },
 	{ .name = "ape",       .swgroup = TEGRA_SWGROUP_APE,       .reg = 0xab8 },
-	{ .name = "nvjpg",     .swgroup = TEGRA_SWGROUP_NVJPG,     .reg = 0xac0 },
 	{ .name = "se",        .swgroup = TEGRA_SWGROUP_SE,        .reg = 0xabc },
+	{ .name = "nvjpg",     .swgroup = TEGRA_SWGROUP_NVJPG,     .reg = 0xac0 },
 	{ .name = "axiap",     .swgroup = TEGRA_SWGROUP_AXIAP,     .reg = 0xacc },
 	{ .name = "etr",       .swgroup = TEGRA_SWGROUP_ETR,       .reg = 0xad0 },
 	{ .name = "tsecb",     .swgroup = TEGRA_SWGROUP_TSECB,     .reg = 0xad4 },
-- 
2.17.1

