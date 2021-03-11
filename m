Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE612C433DB
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 17:44:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70AFF64FE2
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 17:44:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbhCKRnd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 11 Mar 2021 12:43:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbhCKRnO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 Mar 2021 12:43:14 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94533C061574;
        Thu, 11 Mar 2021 09:43:13 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id f1so41175389lfu.3;
        Thu, 11 Mar 2021 09:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tV08/S8AYkOlggjIBuODj7Why8Z1+LlJ+V4vGmOX1RE=;
        b=ECDG4MRiMe5CStYYvkaKYV/dG6cxvGotcx4pATfKF5+buUVugq1PUOLDnIhnG8292C
         Bk8WZFFoHtcXvw0fBRsh3zQNR1ddjKewwsm7uHNtXPh9nMAMSKhjXEbJ53QUrUC5GvIf
         gVvZTMmfQjki/ucGrhTIVSFcCGuI+ux35MV3lBcpvl74jtHS8eYR0meRsdF7Xxbnwij0
         u4yjsAT5O2yBzcJe6STgyR+Jv37tRfcvmXragfxRP8pU/VtHw2YoU4oi/bmLAbGJlB+u
         +qCFDehB11KbuxefFr7zrSFjUkL9XpU2lxPZ1cGe9CN/SBEFBwZs0x5CAQ04j2cI8+/a
         5AUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tV08/S8AYkOlggjIBuODj7Why8Z1+LlJ+V4vGmOX1RE=;
        b=fYCkmUpKDKBH+69hnyAldzxrmG6cRj69WqV96XKMRWJ39Pr/C9GNr/iOIp8kkX+Iu6
         WrkGu7WHAHY4ZjiKSVh4sNQW3UYDU2T1ahiUkV7NGvCIEmfyb3fX6B2CNeeRbkWj3Q6v
         iakCrnX+Dq5lTDwNQsmivuiROqWgFqe12/zo0OkH+pLUvI+SHj/2sfPeuqOc7RbeeMKt
         QiGGxN9/np0oDnCqZ9qzluNlI9C1tgHIBSG9KC2RL0gYwW3eFEJiXfJAK1DZXq8IDVA6
         nJFLqGqw8p2hF3ZqRzN2WT20Gbk+o3DZeMgebwFQaZ3ebnZjVlfOZVa1fwtz2JJklASb
         J5dg==
X-Gm-Message-State: AOAM530HkhEd/8axCYwqWd9hFLdUh6Km2YFdjqQrUbAO2pSmz2lvbceA
        dN6Y8Zi2oRy+zC/uRqz+AFI=
X-Google-Smtp-Source: ABdhPJzZoVdzNWaBBpv/V2H46jX+HJmoeEWU1giXzXKNrzi0/bcW1oUOQs8EzXjuFa1ZQ7NacFM8vQ==
X-Received: by 2002:a19:520b:: with SMTP id m11mr2863398lfb.42.1615484592025;
        Thu, 11 Mar 2021 09:43:12 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id g10sm1021245lfe.90.2021.03.11.09.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 09:43:11 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Fertser <fercerpav@gmail.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] Add missing reset controls to NVIDIA Tegra ASoC drivers
Date:   Thu, 11 Mar 2021 20:42:57 +0300
Message-Id: <20210311174302.15430-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

This series adds missing hardware reset controls to I2S and AC97 drivers.
Currently drivers happen to work properly because reset is implicitly
deasserted by tegra-clk driver, but clk driver shouldn't touch the resets
and we need to fix it because this breaks other Tegra drivers. Previously
we fixed the resets of the AHUB and HDMI codec drivers, but turned out
that we missed the I2C and AC97 drivers.

Thanks to Paul Fertser for testing the pending clk patches and finding
that audio got broken on Tegra20 AC100 netbook because of the missing I2S
reset.

Changelog:

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

Dmitry Osipenko (4):
  ASoC: tegra20: ac97: Add reset control
  ASoC: tegra20: i2s: Add reset control
  ASoC: tegra30: i2s: Restore hardware state on runtime PM resume
  ASoC: tegra: ahub: Switch to use reset-bulk API

Philipp Zabel (1):
  reset: Add reset_control_bulk API

 drivers/reset/core.c           | 215 +++++++++++++++++++++++
 include/linux/reset.h          | 308 +++++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra20_ac97.c |  21 +++
 sound/soc/tegra/tegra20_ac97.h |   1 +
 sound/soc/tegra/tegra20_i2s.c  |  31 ++++
 sound/soc/tegra/tegra20_i2s.h  |   1 +
 sound/soc/tegra/tegra30_ahub.c | 104 ++++-------
 sound/soc/tegra/tegra30_ahub.h |   5 +-
 sound/soc/tegra/tegra30_i2s.c  |  41 ++---
 9 files changed, 629 insertions(+), 98 deletions(-)

-- 
2.29.2

