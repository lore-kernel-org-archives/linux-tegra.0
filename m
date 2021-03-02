Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6EB4C28E80
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B775064E6B
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377820AbhCCDbJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:31:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350096AbhCBLyB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 06:54:01 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B8F8C06178C;
        Tue,  2 Mar 2021 03:51:42 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id f1so30840688lfu.3;
        Tue, 02 Mar 2021 03:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PmzRd7ne9yP74dYg3lDIMJ/jrvhsKEQVEGvRcfpnvR0=;
        b=DCQX8jLGEIrXvqbGyWJTaR0MHS/tIYyw50B+/ULFgox6dbfww7qwR50ulh0OGziijW
         CUXAvJm9dkkr+uXga9CpjSB3QnMcdNYl5YlH6+hFMN47BRVVq+WVlk3J59PyFeO/FTkI
         iYhceT3qDe2VF/SxY/GEDMH55uYr/GHaIhJz5rQBO3BnFpgJPI8DTbsxY59HhF1alolM
         BoG3wyu54qf2nTpEDdHMDI+qrD38j2sz8H90uy0XdMjje2Q/xobGrdvJwQvXX9igWlOw
         WnwdQniFduJMd7gkSviN9zHrBVZuXphSyzjn+P+3jeOFP5A58tDUZNp1ryuDS2+cBbTX
         +AMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PmzRd7ne9yP74dYg3lDIMJ/jrvhsKEQVEGvRcfpnvR0=;
        b=UK43ckXcPomfqtRWteX8Amg3TRaDgwuWfdqWIDkDGuNpP+1cYXhyvVFjmKoO25gNEo
         5IsQ07dZrAlMleKus+Qzyxs98JknkalhgthtQtMtFzGa6vkGunBr44DCjzBVDO6OEVfx
         4z+xmtWpNBzyzmNH4ZLgU04/i2rRjffsAfNqI5lframtkAWyC4V75EaD6Dz++23WPxLo
         gBJZtGC+Xm2Rp16BgIh+eujNnpqV8CYSobr+vW7qGDqGYfYVGaIbZhaeYY9lVwZD8wax
         ceaXtgQmJidKW8+K5uRTXWnZVIpmPHM2eqwLW/1KwQ5H1TKQZv1MgIRBe/VI1boRXxbY
         pKBg==
X-Gm-Message-State: AOAM531a6MN4Ai/M6CKZ417nBNTb/qnkdzpVcVmBUYysDS3ZSh1Iaf9e
        4qnx5xPhoUP8hQ93TiTCh2M=
X-Google-Smtp-Source: ABdhPJzcvY41ZqULKyhqNo9CbbjMJVxagadNnyAQMOTeRMSXApWYGM3qO/jLueLjZbvJ0+dxOPTRvA==
X-Received: by 2002:ac2:4e04:: with SMTP id e4mr11764215lfr.39.1614685900913;
        Tue, 02 Mar 2021 03:51:40 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id f4sm2720151lja.69.2021.03.02.03.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 03:51:40 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] Couple improvements for Tegra clk driver
Date:   Tue,  2 Mar 2021 14:51:11 +0300
Message-Id: <20210302115117.9375-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series fixes couple minor standalone problems of the Tegra clk
driver.

Changelog:

v3: - Added acks from Thierry Reding that he gave to v2.

    - Added new patch "clk: tegra: Don't allow zero clock rate for PLLs".

v2: - Added these new patches:

      clk: tegra: Halve SCLK rate on Tegra20
      MAINTAINERS: Hand Tegra clk driver to Jon and Thierry

v1: - Collected clk patches into a single series.

Dmitry Osipenko (6):
  clk: tegra30: Use 300MHz for video decoder by default
  clk: tegra: Fix refcounting of gate clocks
  clk: tegra: Ensure that PLLU configuration is applied properly
  clk: tegra: Halve SCLK rate on Tegra20
  MAINTAINERS: Hand Tegra clk driver to Jon and Thierry
  clk: tegra: Don't allow zero clock rate for PLLs

 CREDITS                             |  6 +++
 MAINTAINERS                         |  4 +-
 drivers/clk/tegra/clk-periph-gate.c | 72 +++++++++++++++++++----------
 drivers/clk/tegra/clk-periph.c      | 11 +++++
 drivers/clk/tegra/clk-pll.c         | 12 +++--
 drivers/clk/tegra/clk-tegra20.c     |  6 +--
 drivers/clk/tegra/clk-tegra30.c     |  2 +-
 7 files changed, 77 insertions(+), 36 deletions(-)

-- 
2.29.2

