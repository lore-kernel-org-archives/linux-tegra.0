Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD1FC433E9
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 18:00:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2B3064FEB
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 18:00:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbhCKSAU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 11 Mar 2021 13:00:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbhCKSAK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 Mar 2021 13:00:10 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A08A9C061574;
        Thu, 11 Mar 2021 10:00:09 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id u4so3307742ljo.6;
        Thu, 11 Mar 2021 10:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d2kCpNgpV1Us1sS5Z/bRyvGx/S38Rce/udBRavO6Lf4=;
        b=pAiaQi/DOe5VI37J1WZL8wdDYnobnmoDkbM/rJIB6Ztvfpztzu5u+on735OxALpm74
         lWt92dxNoOmnMea7WIS36NrWzLz6dDBkAb7NPAL/Mzojw5e5iiQ8yC9u+DNzQtiCRfg4
         byXy7d/tQQ/M9iUFzLOE/DAevb9rfZyS5VkqQEUSAyIXYIXZIaOzvAxp6Jl8K/p8rKCS
         +LKFJlYZjgQ/JDY5oKYUiyaE6ocYouhSfEdA3bHQn/W8DlSpgfJPsM6lTaKKB6OGv4SV
         kzsejXu2xbtRRP90QJlOsA9yf8QK8x7ltDxKvH6JBo7bUqJcpng2xfdJENmV/NDy86Cj
         fxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d2kCpNgpV1Us1sS5Z/bRyvGx/S38Rce/udBRavO6Lf4=;
        b=aqtzNM4c8GuprrPuPyYFH3YE2u/rGPlzNolp1qdTo9flubKMDTa5f4uL7fgdiuslGS
         nrBr8MzuBjQvTmwDFyfa9SEHza8TS5LftjsOxor8VQKgkaWOnPPbGp5bB0VW+00h+mMq
         /HUemtC1WKrENtJCFrO8mhACcv+IcISslQdzHvcb5+Mw5b704mCDzrOc1njGBEF+7yJC
         QLq7LTRI0gcgwWF0JJ4CPLmqUpD/gWT2uhH0k044vyrdOxv+pCReBD3Eblnay5DYPXdc
         eCNoSx3ikoXWxQVXW8+5cwNhmz4NFr3yJqUgYqMBry5/r56ZdgF0qTViW7zqJFGq1XW9
         1KuA==
X-Gm-Message-State: AOAM532nScYTFxpLgcLypGxkJroccBdfzZUy3igc774SxCQikYn0K9yD
        nY5ZaWpRWEo1c3tttN6FSB4=
X-Google-Smtp-Source: ABdhPJzLaLYi8RU+Z9F3erPnTXSDwtmFGzk4dCQ3Rl1O/rGe/M9z0Ik7AAb0jXqDVL29+sci+i6S0A==
X-Received: by 2002:a2e:3818:: with SMTP id f24mr51543lja.466.1615485607955;
        Thu, 11 Mar 2021 10:00:07 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id k18sm1014075lfm.88.2021.03.11.10.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 10:00:07 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Fertser <fercerpav@gmail.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] Add missing reset controls to NVIDIA Tegra ASoC drivers
Date:   Thu, 11 Mar 2021 20:59:53 +0300
Message-Id: <20210311175958.7433-1-digetx@gmail.com>
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

Dmitry Osipenko (4):
  ASoC: tegra20: ac97: Add reset control
  ASoC: tegra20: i2s: Add reset control
  ASoC: tegra30: i2s: Restore hardware state on runtime PM resume
  ASoC: tegra: ahub: Switch to use reset-bulk API

Philipp Zabel (1):
  reset: Add reset_control_bulk API

 drivers/reset/core.c           | 215 ++++++++++++++++++++++
 include/linux/reset.h          | 315 +++++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra20_ac97.c |  21 +++
 sound/soc/tegra/tegra20_ac97.h |   1 +
 sound/soc/tegra/tegra20_i2s.c  |  31 ++++
 sound/soc/tegra/tegra20_i2s.h  |   1 +
 sound/soc/tegra/tegra30_ahub.c | 104 ++++-------
 sound/soc/tegra/tegra30_ahub.h |   5 +-
 sound/soc/tegra/tegra30_i2s.c  |  41 ++---
 9 files changed, 636 insertions(+), 98 deletions(-)

-- 
2.29.2

