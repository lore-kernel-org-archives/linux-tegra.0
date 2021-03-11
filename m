Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C9DC433E6
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 15:17:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B70CA64FD6
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 15:17:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234005AbhCKPRV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 11 Mar 2021 10:17:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234042AbhCKPRA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 Mar 2021 10:17:00 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7BE3C061574;
        Thu, 11 Mar 2021 07:16:59 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id r3so32170938lfc.13;
        Thu, 11 Mar 2021 07:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n+CWL2eeNTaEvB0jQuPhLTAbsCLd3NsiBreGGzW2cpY=;
        b=uFfeVaXxKPI9mw9nMGWki7PhnUs62kQ+YxvX/xZCj2dbVar9p8vsGMdubO4u5mo7/4
         PfOf2ABVcmPPS579y0y04F/+wm98/+H4D3BErvV/XKqzJJtrZQ5CWBE2MoSBOeEayhlP
         In/ZGkV2cvvEP13xLNC1n5Ofs5PWh9mxR1r2qzUWuzP5iqo8qZUNpYQkm+o+CLMYhzLU
         AoOKaTncy/x42DyLS7rKnWhDwb7VZ+814LQ1B8scCe9y0nLEdk5uBPSKjgUf88wt1TpO
         KV11g9CzUyf9ngaqMlaSm1VAgTLS41LUTvDBSNczf9Z593jByI7sAXWS6hP8Zj7BzwbM
         4M7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n+CWL2eeNTaEvB0jQuPhLTAbsCLd3NsiBreGGzW2cpY=;
        b=KLMuB4n1MNwb5oBXYrYORECp+Q0e+CAi1P1hPdXbwjwPJzNYv2I+utTAFe84Lk9i7u
         lQyNiglpuV16MQQ3fbWQr86DwZ+RjaCgGkwwpaSxMXXJYm3RrBBw8e8EaXoPFjtTngut
         YZvaGcY8MwEyJCeQVux2EmGupXce3ejosHT2SXOVSVmqBo/Br8QLBU4FbtemT7r3DRSh
         qTzAlCkmlIMT3doZoW1fgQfNBAR/hEkOOwN8+vrRTcK+lHLferyRJORmGKyCRiN1SBjm
         6k3zfwpFuppTO9b+W8Fd1G7DWiCapHl8ITYdxvH1+RWwWjqDts0gNt+0bmGZrm/EtLNl
         dWMw==
X-Gm-Message-State: AOAM531ZxzKgv1FPg2Hq4qpmt6DpWcu29N9L3Bs7T9+Myul7SClz4PnO
        wSeHDHg6fZu1Bmq+EPiqaatzd1SUfOU=
X-Google-Smtp-Source: ABdhPJxSFPmw78X8rhBkudz4LZD992grPPJ+eluRXMRkArcbOBDeZxExkTV0P8S1FLdgnfKZo3LOaA==
X-Received: by 2002:a19:e08:: with SMTP id 8mr2476210lfo.199.1615475818193;
        Thu, 11 Mar 2021 07:16:58 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id m24sm923138lfq.184.2021.03.11.07.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 07:16:57 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Fertser <fercerpav@gmail.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] Add missing reset controls to NVIDIA Tegra ASoC drivers
Date:   Thu, 11 Mar 2021 18:15:49 +0300
Message-Id: <20210311151554.23982-1-digetx@gmail.com>
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

 drivers/reset/core.c           | 215 +++++++++++++++++++++++++
 include/linux/reset.h          | 279 +++++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra20_ac97.c |  21 +++
 sound/soc/tegra/tegra20_ac97.h |   1 +
 sound/soc/tegra/tegra20_i2s.c  |  31 ++++
 sound/soc/tegra/tegra20_i2s.h  |   1 +
 sound/soc/tegra/tegra30_ahub.c | 104 +++++-------
 sound/soc/tegra/tegra30_ahub.h |   5 +-
 sound/soc/tegra/tegra30_i2s.c  |  41 ++---
 9 files changed, 600 insertions(+), 98 deletions(-)

-- 
2.29.2

