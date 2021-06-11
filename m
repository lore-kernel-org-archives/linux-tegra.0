Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65257C48BE0
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 16:30:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D5F0613CD
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 16:30:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbhFKQcv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Jun 2021 12:32:51 -0400
Received: from mail-wm1-f52.google.com ([209.85.128.52]:43783 "EHLO
        mail-wm1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230425AbhFKQcv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Jun 2021 12:32:51 -0400
Received: by mail-wm1-f52.google.com with SMTP id 3-20020a05600c0243b029019f2f9b2b8aso8918930wmj.2;
        Fri, 11 Jun 2021 09:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G3J0KltuvW2EJuZnxDee5yWvvSDSls6rlNyeRO4m5mE=;
        b=hTXC7Hie1gRGarT55fC6mJx+T3VqGJkIwjx81Z8pmSncsd8hjBwagV5ntFXNadMgg8
         G45wOjIvr/gKKl93a4McKVNH/aTOVPsDjTKTuVS21aMLFuk4WYzLzH9n6UJbJRTRD85c
         9E0XNVlDFYcqxeAhXwCsxFH2zvB45v3vuhG9hBJ/epftpC9X9IdmtjVBlJ75TPW0tVc9
         BPTJUtSIovF6ovV+ouuW194/cVPH+afFSUgQppbWthxgBKKqWYbjSVpHacPPgKFcbrOd
         Si5Sr7Xcyb3G/+TT8FzbPAcgHIOO5Ehr9lbaXTeQaxp1tYOlScFgtn5DfigOG6pJjcrI
         rmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G3J0KltuvW2EJuZnxDee5yWvvSDSls6rlNyeRO4m5mE=;
        b=kSpdkSNgfU0gq3t6CLydl4bSXhDax6D6yBdOubDNSCgNdRDzQvL3GBxz7xF0E0OV/b
         BeskrtNNlTh5Bdh6o37BLSqaT9M5WPIhzUQKK3x6ej862WvARwVzadhyxWs4pxPWHQfu
         YjUYSWvCNRHso5n4+X2E6YDWrMPcTwFGKMzWdVp2j/eaDp7TfawkfZBlKiPK8WYuS3iQ
         SOa4cxnTI5Gez88RSc+qpe+5hpdMFd6iB6QH1rlkdoX7+SkFpoGHuv5KML7c/9kpD9oK
         gaZ2E0vCqSUX53VVVJ6mlCOMjPAJPrj/bL3n4UGOBeTAtfQD1tLxqkQT4e/tB4vkFSM3
         MnQw==
X-Gm-Message-State: AOAM532U7P8nVlZhZN5Toa+GIQdH8lKWbToIUsjlc4RzzqxWzo1IKjk0
        XjYOyGvqMPgaPJ84+u8MQLw=
X-Google-Smtp-Source: ABdhPJw+3dusjkCI0TJ8UjbL2moOvI7uUAjogH5hJt7P6l2UV05waVwV1DquOPcA3r4EDJ7VC2jDWA==
X-Received: by 2002:a1c:7313:: with SMTP id d19mr4825397wmb.14.1623428992151;
        Fri, 11 Jun 2021 09:29:52 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id h9sm6332809wmb.35.2021.06.11.09.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 09:29:51 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] clk: tegra: Changes for v5.14-rc1
Date:   Fri, 11 Jun 2021 18:31:24 +0200
Message-Id: <20210611163124.3566027-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Mike, Stephen,

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-5.14-clk

for you to fetch changes up to f13570e7e830ca4fbf4869015af8492b8918445e:

  clk: tegra: tegra124-emc: Fix clock imbalance in emc_set_timing() (2021-06-02 11:08:00 +0200)

Thanks,
Thierry

----------------------------------------------------------------
clk: tegra: Changes for v5.14-rc1

This contains a few fixes across the board and adds stubs to allow
certain drivers to be compile-tested. One other notable change added
here is that clock enabling no longer deasserts the reset. Drivers are
now supposed to do that explicitly because doing it implicitly can get
in the way of certain power-up sequences.

----------------------------------------------------------------
Dmitry Osipenko (9):
      clk: tegra30: Use 300MHz for video decoder by default
      clk: tegra: Fix refcounting of gate clocks
      clk: tegra: Ensure that PLLU configuration is applied properly
      clk: tegra: Halve SCLK rate on Tegra20
      clk: tegra: Don't allow zero clock rate for PLLs
      clk: tegra: cclk: Handle thermal DIV2 CPU frequency throttling
      clk: tegra: Mark external clocks as not having reset control
      clk: tegra: Don't deassert reset on enabling clocks
      clk: tegra: Add stubs needed for compile-testing

Yang Yingliang (1):
      clk: tegra: tegra124-emc: Fix clock imbalance in emc_set_timing()

 drivers/clk/tegra/clk-periph-gate.c      |  80 +++++++++++++++----------
 drivers/clk/tegra/clk-periph.c           |  11 ++++
 drivers/clk/tegra/clk-pll.c              |  12 ++--
 drivers/clk/tegra/clk-tegra-periph.c     |   6 +-
 drivers/clk/tegra/clk-tegra-super-cclk.c |  16 ++++-
 drivers/clk/tegra/clk-tegra124-emc.c     |   4 +-
 drivers/clk/tegra/clk-tegra20.c          |   6 +-
 drivers/clk/tegra/clk-tegra30.c          |   6 +-
 drivers/clk/tegra/clk.h                  |   4 --
 drivers/soc/tegra/pmc.c                  |   5 --
 include/linux/clk/tegra.h                | 100 ++++++++++++++++++++++++-------
 11 files changed, 170 insertions(+), 80 deletions(-)
