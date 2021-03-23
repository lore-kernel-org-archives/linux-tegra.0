Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4990CC433E2
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 21:05:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0DC31619D1
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 21:05:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233476AbhCWVFO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 17:05:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233516AbhCWVFD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 17:05:03 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3E45C061574;
        Tue, 23 Mar 2021 14:05:02 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id a198so28714402lfd.7;
        Tue, 23 Mar 2021 14:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fnjcv4Up4HTSxQccC9j/S+AozvLyqyH/WFTsWQTP7bg=;
        b=vbzJQX5nfBWys9Jg2MwbwsoPJElhVepO3+wIpkwhKUnh2KNiG+9jKpEtEAs5+9Gtry
         IlouPl2g3top8lXF3vGSjzfLyv9EkbIkzEXhJOjDE0fSsYXpgDmC2kQD8/U8Ndj3npxZ
         hlvM4edm3R0JrXU9XANM4fqQ5fzg13yu7w2ZIeOv/B3SWqcyk6o6uEQzq+PtO86ek4wl
         q8ROpivymVZ/eJEvSBH5ak+BLMfA+V3+YbhQPUiYe8xm2YA/FvdLWvVFiFh6nd8WgqjC
         WT1LSlMnidv7TIN03ZIGRSSUrMQAp2Yz9Xh7GRo6vAdjo/HXggaJnEgLRnlJDBXwFIyQ
         2PyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fnjcv4Up4HTSxQccC9j/S+AozvLyqyH/WFTsWQTP7bg=;
        b=g7W3IyuIl+JvXrvEXiwR+ETZu3nk0f8DJko/cl53WFMk8ggNTk15vmwNf3Y1gz7Ebj
         kqf20weXaWZOpjAoMa9If2wiXmrb1gaSKEmWxsxFEpDRVIU4blEAa8Ib8e1w2h/6cMvS
         v080P0H3bfo7PvCiKONwbkZjikcllNXL94x5Pa4aIeBxhn/Nab/xL7AeHdG0vYb1vAYk
         sqibkNL174q+2rj4leXEZGkW5Zhho7WbFBGZR2K0DxCaNlRckZ2ePVESsQpn/t0ROlnm
         Rv/hEnWyaBYomNN0spobJEmvyOCXVcbhue3xrD8md/3HQlPkO4SXMSoYzOlcXqEWMKV9
         OTJA==
X-Gm-Message-State: AOAM530O+hlo0cF2v9gCik3VeyR/L/b6X5aajxDytzDDlFLtWbLN4TCi
        sw4pcPUJtds++y2zbFNhnDfR0JatVrE=
X-Google-Smtp-Source: ABdhPJxIIa8gOLPAQJWNpgQd7ixypKeBXXr3gMWvOSh49/wjC2iP5alSa82aI/sn1fH+TdhpKBYEdw==
X-Received: by 2002:ac2:4309:: with SMTP id l9mr3401256lfh.226.1616533501232;
        Tue, 23 Mar 2021 14:05:01 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-60.dynamic.spd-mgts.ru. [109.252.193.60])
        by smtp.gmail.com with ESMTPSA id b28sm18394lfo.219.2021.03.23.14.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 14:05:00 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/2] memory: tegra20: Correct comment to MC_STAT registers writes
Date:   Wed, 24 Mar 2021 00:04:45 +0300
Message-Id: <20210323210446.24867-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The code was changed multiple times and the comment to MC_STAT
registers writes became slightly outdated. The MC_STAT programming
now isn't hardcoded to the "bandwidth" mode, let's clarify this in
the comment.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra20.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
index 14caf5b9324c..4659c0cea30d 100644
--- a/drivers/memory/tegra/tegra20.c
+++ b/drivers/memory/tegra/tegra20.c
@@ -451,9 +451,8 @@ static void tegra20_mc_stat_gather(struct tegra20_mc_stat *stat)
 	control_1 = tegra20_mc_stat_gather_control(&stat->gather1);
 
 	/*
-	 * Reset statistic gathers state, select bandwidth mode for the
-	 * statistics collection mode and set clocks counter saturation
-	 * limit to maximum.
+	 * Reset statistic gathers state, select statistics collection mode
+	 * and set clocks counter saturation limit to maximum.
 	 */
 	mc_writel(mc, 0x00000000, MC_STAT_CONTROL);
 	mc_writel(mc,  control_0, MC_STAT_EMC_CONTROL_0);
-- 
2.30.2

