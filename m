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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CFF4C433E7
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 00:45:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 380F22177B
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 00:45:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTdpDqm0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728119AbgJHAo6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 7 Oct 2020 20:44:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728062AbgJHAox (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 7 Oct 2020 20:44:53 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2675EC061755;
        Wed,  7 Oct 2020 17:44:53 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id o9so1892851plx.10;
        Wed, 07 Oct 2020 17:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DLOwLCelRomrUn/Qw97RwUnGMw4P5bSiPeUa0JIEZFs=;
        b=dTdpDqm0domkJ/ni/514cqll5T5LNeTOwnFnZKaQ1JqjJzyYMiXIYJKKRgw6kZ0HGQ
         pfg313RqoV8botgSuzpHkZ8n7PmPyr7V8OlBswguEJAZPLRM8RkUDFTT6n74s2WBj2Bl
         MQwVvnxMp46SCSrAVemJUkyWnv5uJEdEh19h31U7hRy3ySGAzENgxwiSDmGY3hYcf43I
         uH/StSnNJa457ojva1yMqe+acvH4gDGnUdNo9+JZ5dWoNlZa61lRSr/as3TZ94bu7KHr
         jf6keejZBrd5nAFH5o2+N86lhbfp6wZDh5joXlEN1GXoYNI9OTYPKOxteI9Adc70TgIP
         K9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DLOwLCelRomrUn/Qw97RwUnGMw4P5bSiPeUa0JIEZFs=;
        b=fGGqGUfUCbSGT9gqEq7/d0HxiIxpzhOO4XKlENhhS5ytrRCf4jHJyTtZM+7dn+1dXi
         E9KCez2P3oELe+dGEePbjwKDrpdWs8ZMtot16r/Q+8Mbrw0qIjufM997AmMz1x/hBH9N
         GBqBp9BPnx7TtxdK6MBbwGoTtKNkbrLep4zwNOCzBkccNDUtM/CwVPeFS+Lr8svOqjaS
         SMho6VnEEq/GFo9Lj3MXvwcVG53zw0D9wPavRjiBp/DNiW7jmYqhRviMr+YZ52K5SDkt
         SOijqZ8GiEwKdYHnG0ZGv/rTFAtMausNoybOySHuguWZ9P2n8Eiqo8IH+DBO7PvcQ7KR
         8JnQ==
X-Gm-Message-State: AOAM532C8jVLS+XYLwYSv9vvvN0we8KPfiq2zOIhCc6L7TFskbfeAtji
        Ngp3fbhIdJFSZ7s4x85KIhHgSSPz5/A=
X-Google-Smtp-Source: ABdhPJyWud04M4DfKnt2SsXUNZeeDCtjfz+YgZh2b5kqHNxgVuuxlub732fP2qYlkzWOUzArLO2SeQ==
X-Received: by 2002:a17:902:c14a:b029:d3:f494:e709 with SMTP id 10-20020a170902c14ab02900d3f494e709mr3994499plj.3.1602117892676;
        Wed, 07 Oct 2020 17:44:52 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id z6sm4939922pfg.12.2020.10.07.17.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 17:44:52 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     krzk@kernel.org, thierry.reding@gmail.com, robh+dt@kernel.org
Cc:     jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] memory: tegra: Complete tegra210_swgroups
Date:   Wed,  7 Oct 2020 17:37:46 -0700
Message-Id: <20201008003746.25659-6-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201008003746.25659-1-nicoleotsuka@gmail.com>
References: <20201008003746.25659-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

According to Tegra X1 TRM, there are missing swgroups in the
tegra210_swgroups list. So this patch adds them to the list.

Note that the TEGRA_SWGROUP_GPU (in list) should be actually
TEGRA_SWGROUP_GPUB (in TRM), yet TEGRA_SWGROUP_GPU (in TRM)
is not being used -- only TEGRA_SWGROUP_GPUB (in TRM) is. So
this patch does not add TEGRA_SWGROUP_GPU (in TRM) and keeps
TEGRA_SWGROUP_GPU (in list) as it is.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/memory/tegra/tegra210.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/memory/tegra/tegra210.c b/drivers/memory/tegra/tegra210.c
index b400802c9f14..b3bbc5a05ba1 100644
--- a/drivers/memory/tegra/tegra210.c
+++ b/drivers/memory/tegra/tegra210.c
@@ -1028,6 +1028,8 @@ static const struct tegra_smmu_swgroup tegra210_swgroups[] = {
 	{ .name = "hda",       .swgroup = TEGRA_SWGROUP_HDA,       .reg = 0x254 },
 	{ .name = "isp2",      .swgroup = TEGRA_SWGROUP_ISP2,      .reg = 0x258 },
 	{ .name = "nvenc",     .swgroup = TEGRA_SWGROUP_NVENC,     .reg = 0x264 },
+	{ .name = "nv",        .swgroup = TEGRA_SWGROUP_NV,        .reg = 0x268 },
+	{ .name = "nv2",       .swgroup = TEGRA_SWGROUP_NV2,       .reg = 0x26c },
 	{ .name = "ppcs",      .swgroup = TEGRA_SWGROUP_PPCS,      .reg = 0x270 },
 	{ .name = "sata",      .swgroup = TEGRA_SWGROUP_SATA,      .reg = 0x274 },
 	{ .name = "vi",        .swgroup = TEGRA_SWGROUP_VI,        .reg = 0x280 },
@@ -1036,19 +1038,27 @@ static const struct tegra_smmu_swgroup tegra210_swgroups[] = {
 	{ .name = "xusb_dev",  .swgroup = TEGRA_SWGROUP_XUSB_DEV,  .reg = 0x28c },
 	{ .name = "a9avp",     .swgroup = TEGRA_SWGROUP_A9AVP,     .reg = 0x290 },
 	{ .name = "tsec",      .swgroup = TEGRA_SWGROUP_TSEC,      .reg = 0x294 },
+	{ .name = "ppcs1",     .swgroup = TEGRA_SWGROUP_PPCS1,     .reg = 0x298 },
+	{ .name = "dc1",       .swgroup = TEGRA_SWGROUP_DC1,       .reg = 0xa88 },
 	{ .name = "sdmmc1a",   .swgroup = TEGRA_SWGROUP_SDMMC1A,   .reg = 0xa94 },
 	{ .name = "sdmmc2a",   .swgroup = TEGRA_SWGROUP_SDMMC2A,   .reg = 0xa98 },
 	{ .name = "sdmmc3a",   .swgroup = TEGRA_SWGROUP_SDMMC3A,   .reg = 0xa9c },
 	{ .name = "sdmmc4a",   .swgroup = TEGRA_SWGROUP_SDMMC4A,   .reg = 0xaa0 },
 	{ .name = "isp2b",     .swgroup = TEGRA_SWGROUP_ISP2B,     .reg = 0xaa4 },
 	{ .name = "gpu",       .swgroup = TEGRA_SWGROUP_GPU,       .reg = 0xaac },
+	{ .name = "ppcs2",     .swgroup = TEGRA_SWGROUP_PPCS2,     .reg = 0xab0 },
 	{ .name = "nvdec",     .swgroup = TEGRA_SWGROUP_NVDEC,     .reg = 0xab4 },
 	{ .name = "ape",       .swgroup = TEGRA_SWGROUP_APE,       .reg = 0xab8 },
 	{ .name = "se",        .swgroup = TEGRA_SWGROUP_SE,        .reg = 0xabc },
 	{ .name = "nvjpg",     .swgroup = TEGRA_SWGROUP_NVJPG,     .reg = 0xac0 },
+	{ .name = "hc1",       .swgroup = TEGRA_SWGROUP_HC1,       .reg = 0xac4 },
+	{ .name = "se1",       .swgroup = TEGRA_SWGROUP_SE1,       .reg = 0xac8 },
 	{ .name = "axiap",     .swgroup = TEGRA_SWGROUP_AXIAP,     .reg = 0xacc },
 	{ .name = "etr",       .swgroup = TEGRA_SWGROUP_ETR,       .reg = 0xad0 },
 	{ .name = "tsecb",     .swgroup = TEGRA_SWGROUP_TSECB,     .reg = 0xad4 },
+	{ .name = "tsec1",     .swgroup = TEGRA_SWGROUP_TSEC1,     .reg = 0xad8 },
+	{ .name = "tsecb1",    .swgroup = TEGRA_SWGROUP_TSECB1,    .reg = 0xadc },
+	{ .name = "nvdec1",    .swgroup = TEGRA_SWGROUP_NVDEC1,    .reg = 0xae0 },
 };
 
 static const unsigned int tegra210_group_display[] = {
-- 
2.17.1

