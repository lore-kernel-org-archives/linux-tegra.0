Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF4E3C433E0
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Mar 2021 15:45:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7CF964E89
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Mar 2021 15:45:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234065AbhCNPp1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 14 Mar 2021 11:45:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233103AbhCNPpW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Mar 2021 11:45:22 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB783C061574;
        Sun, 14 Mar 2021 08:45:21 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id j18so4452819wra.2;
        Sun, 14 Mar 2021 08:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PclIFcC2nS7Q4VorzCLkkkTGpzHU2Eq5kWVCvmuDhyI=;
        b=qAuWjcuklA/Y8Y441HfQKMy13BZlI5RX7assgoGjGpvXvlph3m7P5heS9rbqB5KQ/1
         pcjs6BAnCmJkatVXbT/DQ0liLAVUnBe0RfsvOeZI2iHG/HeOhuj852q1W+v3RNVYVBYW
         DFs9CDGu8jmEMnDwhjvQNRgdizpir1MEtdIxdybciDkUECp0AcWzCWpcu6q5OmxAAd7Y
         /lxCVi2MQKGF6YL5me0QlN1PSMMRB/QPOVXGHSxiT2bq/4p8mqbexgro0sFANTclYYMt
         myrNB6vzAqnmujVSpLVAeQYmeRR15+Ex7Ru19rZ7ezd1lPHe1Vk1/A9KJ7kOQqjCmLRh
         8IDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PclIFcC2nS7Q4VorzCLkkkTGpzHU2Eq5kWVCvmuDhyI=;
        b=d5FaSeRodLr6hQdseJwibswYv79c6OyNaMWkqv+4HOotQMnlPhvGPx03CWYI3BSEKc
         7errVYpieNtrYyAvkpHa5TRoYRPjzItnSFkqJYJYWYjMOjiZiH5VH6PsnhPEnhqOyKfN
         FGnCRhfFEq1HMCz/JBEbRmylZbDLxp4lIJ77qSFpd8BFQ+cobNFvwxL/n9LqunIBIWno
         09iXjidjG8hP7TVlmAo3ie9UrsPT8vGeGOfkuBDAqjAtGtgcwK+RPUH+15z4pXHIIW2Q
         oJMzARDqYFHGHyJK3WFVfLailYlB9c0VbSE9S8Q+N1AosUrDGlXf2EAZHEVH+CH0Zp8R
         ttPA==
X-Gm-Message-State: AOAM533Y7jkdLMkbn3MZLuHtiNlKRD3h5/NF6BKr/O+g84tp9ULzS4hr
        W/SsahTqOrtiuBC9S3e94WpGPiDdv6Q=
X-Google-Smtp-Source: ABdhPJwO1WyF3LJh32pYsIZEBoThmnPXPXjd76LixRiKKFWmeUv7A9UyngwsIPvIbamr5I/6VCpOYA==
X-Received: by 2002:adf:90c2:: with SMTP id i60mr23481723wri.75.1615736720372;
        Sun, 14 Mar 2021 08:45:20 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id f14sm9673507wmf.7.2021.03.14.08.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 08:45:19 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Fertser <fercerpav@gmail.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 00/17] Fix reset controls and RPM of NVIDIA Tegra ASoC drivers
Date:   Sun, 14 Mar 2021 18:44:42 +0300
Message-Id: <20210314154459.15375-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

This series adds missing hardware reset controls to I2S and AC97 drivers,
corrects runtime PM usage and drivers probe/remove order. Currently drivers
happen to work properly because reset is implicitly deasserted by tegra-clk
driver, but clk driver shouldn't touch the resets and we need to fix it
because this breaks other Tegra drivers. Previously we fixed the resets of
the AHUB and HDMI codec drivers, but turned out that we missed the I2C and
AC97 drivers.

Thanks to Paul Fertser for testing the pending clk patches and finding
that audio got broken on Tegra20 AC100 netbook because of the missing I2S
reset.

Changelog:

v5: - After taking another look at the drivers I noticed couple more
      things that could be improved. These new patches correct runtime PM
      and probe/remove order of the drivers:

        ASoC: tegra20: spdif: Correct driver removal order
        ASoC: tegra20: spdif: Remove handing of disabled runtime PM
        ASoC: tegra20: i2s: Add system level suspend-resume callbacks
        ASoC: tegra20: i2s: Correct driver removal order
        ASoC: tegra20: i2s: Use devm_clk_get()
        ASoC: tegra20: i2s: Remove handing of disabled runtime PM
        ASoC: tegra30: i2s: Correct driver removal order
        ASoC: tegra30: i2s: Use devm_clk_get()
        ASoC: tegra30: i2s: Remove handing of disabled runtime PM
        ASoC: tegra30: ahub: Reset global variable
        ASoC: tegra30: ahub: Correct suspend-resume callbacks
        ASoC: tegra30: ahub: Remove handing of disabled runtime PM

v4: - Added missing prototype for reset_control_bulk_put().

v3: - Fixed reset stubs for !CONFIG_RESET_CONTROLLER.

v2: - After some more testing I found that I2S control logic doesn't require
      I2S clock to be enabled for resetting. Hence it's fine to have I2S to
      be reset by parent AHUB driver, so I dropped "tegra30: i2s: Add reset
      control" patch.

    - While I was double-checking resets on Tegra30, I found that that
      Tegra30 I2S driver has a broken runtime PM which doesn't restore
      hardware state on resume and it's lost after AHUB RPM-resume.
      Thus, added this new patch "tegra30: i2s: Restore hardware state
      on runtime PM resume".

    - Added new patches which switch AHUB driver to use reset-bulk API.
      I took the RFC patch from Philipp Zabel, fixed it and added
      devm_reset_control_bulk_optional_get_exclusive_released() that
      will be useful for further Tegra GPU patches. This is a minor
      improvement which makes code cleaner.

Dmitry Osipenko (16):
  ASoC: tegra20: ac97: Add reset control
  ASoC: tegra20: i2s: Add reset control
  ASoC: tegra30: i2s: Restore hardware state on runtime PM resume
  ASoC: tegra30: ahub: Switch to use reset-bulk API
  ASoC: tegra20: spdif: Correct driver removal order
  ASoC: tegra20: spdif: Remove handing of disabled runtime PM
  ASoC: tegra20: i2s: Add system level suspend-resume callbacks
  ASoC: tegra20: i2s: Correct driver removal order
  ASoC: tegra20: i2s: Use devm_clk_get()
  ASoC: tegra20: i2s: Remove handing of disabled runtime PM
  ASoC: tegra30: i2s: Correct driver removal order
  ASoC: tegra30: i2s: Use devm_clk_get()
  ASoC: tegra30: i2s: Remove handing of disabled runtime PM
  ASoC: tegra30: ahub: Reset global variable
  ASoC: tegra30: ahub: Correct suspend-resume callbacks
  ASoC: tegra30: ahub: Remove handing of disabled runtime PM

Philipp Zabel (1):
  reset: Add reset_control_bulk API

 drivers/reset/core.c            | 215 ++++++++++++++++++++++
 include/linux/reset.h           | 315 ++++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra20_ac97.c  |  21 +++
 sound/soc/tegra/tegra20_ac97.h  |   1 +
 sound/soc/tegra/tegra20_i2s.c   |  60 +++---
 sound/soc/tegra/tegra20_i2s.h   |   1 +
 sound/soc/tegra/tegra20_spdif.c |  16 +-
 sound/soc/tegra/tegra30_ahub.c  | 168 ++++++-----------
 sound/soc/tegra/tegra30_ahub.h  |   5 +-
 sound/soc/tegra/tegra30_i2s.c   |  65 ++-----
 10 files changed, 667 insertions(+), 200 deletions(-)

-- 
2.30.2

