Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA9B1C433EF
	for <linux-tegra@archiver.kernel.org>; Fri,  6 May 2022 14:24:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442186AbiEFO2d (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 6 May 2022 10:28:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238749AbiEFO2c (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 6 May 2022 10:28:32 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D784F5A2C5;
        Fri,  6 May 2022 07:24:49 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 129so4544021wmz.0;
        Fri, 06 May 2022 07:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v9QFW8lEAcAc37/kSGN+IO3Rwvec+cKN6keocfAmI4U=;
        b=AM6Z6yzv5nlnPFtE1bs+Ov9mOHM0Yts7qIa2xb3HhzIPnvTAzFiBG3FlPQCB3n0ko7
         J70mp+5ko9rWI96F/c8hyfAeYGhl/yJFI0RKYxeCkCKLfDF7a5NgQybT6t/gPqx43LS+
         5iCV9bAQ7Do1Th73/jaxgDB3eKDV+3nwV232ADRGNN/x9rhv8AtoYE20CYzTc1zYwoi3
         JWugHRkSWINhKQA/9UhUZY5Yu+KnA7F84z+pDVFxz24SjHVEL4QXWAe7j6nQVS7Q23pE
         wdoX6knitzklFaaZFo6a8W8+aAsNDjZCX8w/e50Hsk6Z6WUuMnN21tKd6FO3hqZZt9XL
         SSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v9QFW8lEAcAc37/kSGN+IO3Rwvec+cKN6keocfAmI4U=;
        b=QJwrLgn8AEIOulAx5ambbnN9OBLjR5+Wtr0RCtB0WGYJguf2zZt4PxdpLA9HqaKr7O
         krjAlLHscsFX3mt7XohFe6BLZn15SwSQQjR7V7zRV75jT4FVltk1fd7DH5IiYR9v5WlI
         ois+ARg73frbURSsx3Q8T2x93Xctn+9zKHoYEiUyt8Ho80cET78cyEskRSSU6q9Spasm
         kdPIkKu6ejTEEZ4A2GBY+KYjp9zY2qSMZK+XwtOcEDLcuERHlmeTOA/DYZP3F2IDIU+k
         KI/fldC8m6C1mzLLwHRrWfOXVw1jUbU4s8xu75Q2Qae2bb5/6BzT+Q/+/cp3NHAbPj7b
         4eOQ==
X-Gm-Message-State: AOAM533WxE9/NFznEX7b3IJ8DsaQKzNGlobIuyyM5KwZ2PvziRfujSPU
        eDbeIWmw87LRoBthVltPeow=
X-Google-Smtp-Source: ABdhPJwq0amedt6KUoh+1+gyIBIBnF+9/rLFxuWXcPIQXpq67UcIl50WDCxGIuut1R5O5IrjtxBrPw==
X-Received: by 2002:a05:600c:1908:b0:393:e7f1:855f with SMTP id j8-20020a05600c190800b00393e7f1855fmr3591850wmq.125.1651847088220;
        Fri, 06 May 2022 07:24:48 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id p11-20020a1c544b000000b003942a244f30sm10190063wmi.9.2022.05.06.07.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 07:24:47 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] clk: tegra: Changes for v5.19-rc1
Date:   Fri,  6 May 2022 16:24:46 +0200
Message-Id: <20220506142446.3916142-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Mike, Stephen,

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-5.19-clk

for you to fetch changes up to 6f6baf690c3b8c41083d7443ab6a5645b96ff91b:

  clk: tegra: Update kerneldoc to match prototypes (2022-05-06 10:56:00 +0200)

Thanks,
Thierry

----------------------------------------------------------------
clk: tegra: Changes for v5.19-rc1

This contains a boot time optimization for Tegra chips with BPMP and a
switch from .round_rate() to .determine_rate() to take into account any
maximum rate that might have been set.

Other than that this contains a fix for a DFLL regression on Tegra210
and kerneldoc fixups to avoid build warnings.

----------------------------------------------------------------
Diogo Ivo (1):
      clk: tegra: Add missing reset deassertion

Rajkumar Kasirajan (1):
      clk: tegra: Replace .round_rate() with .determine_rate()

Thierry Reding (1):
      clk: tegra: Update kerneldoc to match prototypes

Timo Alho (1):
      clk: tegra: Register clocks from root to leaf

 drivers/clk/tegra/clk-bpmp.c | 87 +++++++++++++++++++++++++++++++++-----------
 drivers/clk/tegra/clk-dfll.c | 20 ++++++++--
 2 files changed, 82 insertions(+), 25 deletions(-)
