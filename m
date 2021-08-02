Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A06C4320A
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 22:13:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C609360EBC
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 22:13:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231944AbhHBWOA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 2 Aug 2021 18:14:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231827AbhHBWN7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Aug 2021 18:13:59 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8063DC06175F;
        Mon,  2 Aug 2021 15:13:49 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id y34so36406998lfa.8;
        Mon, 02 Aug 2021 15:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+LY1B0NtA0JK5a08N4iEr/UtsIVulJFgN2MwPHf+hzE=;
        b=W4o8h76qDEBZT08972HXsxiyJvUJs66TEj46yzF4P6vCXqcCaTdYTnvZ9tAPLrb7Xc
         EqC9AMGEXzC4bQRm9z4Cz+b5obOYTPJxOa4464ZB3lJTZtoVHXuFEqOTdFC48Ubwm77T
         yLf9KnvlVXcrQbiMQt0b8WMlSwjGR1ELBehR3ucuYEBhce2r9L3i59YaqQfdIexDlFTt
         KJ5ZNHM9MNzeZKUcrgdLfREcGILRM1T4sEbDUrgkhcIioUBP2abZS2t/Sjf0dFjg+96z
         NhMt1D5b1Me6pnmrZoYSweJKun9ye4xzd2pbKhTc0Yzttdlj7h11qJnsTK1bw0Mw2RJU
         iY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+LY1B0NtA0JK5a08N4iEr/UtsIVulJFgN2MwPHf+hzE=;
        b=piLUh5QkuDFFQjlkgETf3UIkC94ONl9kFeP8Rnri9eQ70y/yVyHjCL2GyLqIc5CHdL
         jm318oaH0xskVodLU9YuCf8yEL0L1I+V8ukLhOU14ROg62zulyroWBVoti8xnc5Jwl97
         E8bwkB7yzWFJrEM5eIDio5/836Iwc/YG7VmrsDA3oGqfMHZ2KP1ZUrw7V7TUIgC76V5W
         TzKYmrCIeSwfzZrgtf9sJNoTMZO+tkUVpQWLnbeqXFNb1opyeThXh+lZYsq9Pi/CYkLQ
         1gKN6foIfofwIp6zX59ihbLU1UCKFNcut9g8R/acDVNqwaoiw7MZjW7F80JwTB0GAXuo
         aqEQ==
X-Gm-Message-State: AOAM533JNckxVixUcwZMJXCgAha1SWTtBB7LSiCiUn105QpPATu4OaLS
        IY/7w+HZ7Odr9+W7lKIuWO8=
X-Google-Smtp-Source: ABdhPJyOe00fOlmprnifb2gQlZGYqeZyMI27H2Z6qrdIeJS+KLfDZvcsJ/u4X/ah51z/dC1pnMeNkg==
X-Received: by 2002:ac2:4c29:: with SMTP id u9mr4117887lfq.410.1627942427885;
        Mon, 02 Aug 2021 15:13:47 -0700 (PDT)
Received: from localhost.localdomain (94-29-22-96.dynamic.spd-mgts.ru. [94.29.22.96])
        by smtp.gmail.com with ESMTPSA id c10sm960167ljn.11.2021.08.02.15.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 15:13:47 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4] Tegra FUSE clock improvements for 5.15
Date:   Tue,  3 Aug 2021 01:13:32 +0300
Message-Id: <20210802221336.32016-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello,

This series improves handling of the FUSE clock by keeping it enabled only
when necessary.

Dmitry Osipenko (4):
  soc/tegra: fuse: Clear fuse->clk on driver probe failure
  soc/tegra: fuse: Add runtime PM support
  soc/tegra: fuse: Enable fuse clock on suspend for Tegra124
  clk: tegra: Remove CLK_IS_CRITICAL flag from fuse clock

 drivers/clk/tegra/clk-tegra-periph.c  |  6 +--
 drivers/soc/tegra/fuse/fuse-tegra.c   | 60 +++++++++++++++++++++++++++
 drivers/soc/tegra/fuse/fuse-tegra20.c | 11 +++--
 drivers/soc/tegra/fuse/fuse-tegra30.c | 16 ++++---
 drivers/soc/tegra/fuse/fuse.h         |  2 +
 5 files changed, 81 insertions(+), 14 deletions(-)

-- 
2.32.0

