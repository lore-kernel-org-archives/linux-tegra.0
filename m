Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BEC3C47082
	for <linux-tegra@archiver.kernel.org>; Sun, 23 May 2021 23:45:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 143446115C
	for <linux-tegra@archiver.kernel.org>; Sun, 23 May 2021 23:45:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232050AbhEWXqb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 23 May 2021 19:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232037AbhEWXqb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 23 May 2021 19:46:31 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1516C061756;
        Sun, 23 May 2021 16:45:01 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id c15so31171811ljr.7;
        Sun, 23 May 2021 16:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=odIUAzVpSvIL7IIcBvAsTMdmbOsZaWug4GlMmmm0+sI=;
        b=fkGG6opg4zBrpQJQyrI6xpQMXkeqAD12j2ubkEyWxo5Ai/p6UaH1OUtD/thK1AjfPh
         Of39n9ioUdZ9f7gwPRTPm1fCD8frSaVYb8KhZE64AH5GGaWhYl/RarYfAmbiM0FvuMxB
         Ez6aT6wanG9uYm6170p34R38fn7GiuQ+CXn30ESlx7+LYTJKok4yI+muKBLzicqcFIjG
         Cu/p5BWvbaq/aalwfR4Ahs6HKMHmKpory6VAhP7xvngU/nnF+xq4KX5sXe+7Pq791Th/
         ZoAeKSftIii96aNMYalr77qABpmguSW7ku21nofIWYp0rzRsvxJKVF0x8TV8vqKJWGAC
         PoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=odIUAzVpSvIL7IIcBvAsTMdmbOsZaWug4GlMmmm0+sI=;
        b=hdHsXe27PHDpH78HMHmirkUTudz0zMfQQgX3bysvhCaXAmSRCA5xLa5EY5PlrKTeoR
         hSHXNnQZCw9d72pa8w2KjD0R/bVrj0gD/NoWsFqHhsb0FZJY5uA7th9RrvPRS3cxcDg9
         52DvH9w0yTEckkfruQhaWAgpUu8EzUPZX7xrvUElbDJKIZTB6y47kxacOs0ullLXHXZV
         nsxVZbUiuC2rYKDXWFQd4gMk3dyIgLx5PuN+aKf9BB7H6PhVOvjfVAxP24vayJICFAW3
         xTX3xLH6Zd83b6mDfd9+4Xr/dt0l7xodMpqYgVaXNEarmV97/7jVF8fDSLetDp8zdQRF
         G8jg==
X-Gm-Message-State: AOAM5301W7VcL6xgzX6AuaDtvGJ8Kr8kVKJuQrFyxI2Ql6PP6nBrjqeH
        QAv8vHrd1UkQG5t5T7CuV+c=
X-Google-Smtp-Source: ABdhPJwVceG0+0umOv9SNyyBo1gvXhoraPQ9T1uXF38hPuanB5j+SHkkhqXxJyRuyMe4M2teqzkd/A==
X-Received: by 2002:a2e:a585:: with SMTP id m5mr15119059ljp.51.1621813499361;
        Sun, 23 May 2021 16:44:59 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-110.dynamic.spd-mgts.ru. [109.252.193.110])
        by smtp.gmail.com with ESMTPSA id u11sm1269054lfg.243.2021.05.23.16.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 16:44:59 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] Unify NVIDIA Tegra ASoC machine drivers
Date:   Mon, 24 May 2021 02:44:33 +0300
Message-Id: <20210523234437.25077-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

During review of the RT5631 machine driver, Jon Hunter suggested that
it will be better to squash all the current ASoC machine drivers into
a single one. This suggestion is implemented by this patchset. The
RT5631 support will come later with the ASUS Transformer changes.

This series needs to be approved by Jaroslav Kysela before it can be
merged.

Changelog:

v3: - Added components string as was suggested by Jaroslav Kysela to v2.

    - Renamed MCLK rate function that is used by max98090 and other codecs
      to make it look more generic. Added option for specifying CLK ID per
      device. This all was suggested by Jon Hunter to v2.

v2: - Dropped use of of_device_compatible_match(), like it was suggested
      by Rob Herring in a review comment to v1.

    - Added patch that sets card's driver_name of as Tegra ASoC drivers.
      In a comment to v1 Jaroslav Kysela suggested that the Tegra drivers
      don't set the card name properly and he was right.

      I opened pull request with the new Tegra UCMs and updated lookup paths
      for older UCMs [1].

      [1] https://github.com/alsa-project/alsa-ucm-conf/pull/92

Dmitry Osipenko (4):
  ASoC: tegra: Set driver_name=tegra for all machine drivers
  ASoC: tegra: Unify ASoC machine drivers
  ASoC: tegra: Specify components string for each card
  ASoC: tegra: Specify components string for Nexus 7

 sound/soc/tegra/Kconfig              |  12 +
 sound/soc/tegra/Makefile             |  18 +-
 sound/soc/tegra/tegra_alc5632.c      | 259 ---------
 sound/soc/tegra/tegra_asoc_machine.c | 761 +++++++++++++++++++++++++++
 sound/soc/tegra/tegra_asoc_machine.h |  47 ++
 sound/soc/tegra/tegra_max98090.c     | 276 ----------
 sound/soc/tegra/tegra_rt5640.c       | 222 --------
 sound/soc/tegra/tegra_rt5677.c       | 324 ------------
 sound/soc/tegra/tegra_sgtl5000.c     | 211 --------
 sound/soc/tegra/tegra_wm8753.c       | 185 -------
 sound/soc/tegra/tegra_wm8903.c       | 358 +++----------
 sound/soc/tegra/tegra_wm9712.c       | 166 ------
 sound/soc/tegra/trimslice.c          | 172 ------
 13 files changed, 894 insertions(+), 2117 deletions(-)
 delete mode 100644 sound/soc/tegra/tegra_alc5632.c
 create mode 100644 sound/soc/tegra/tegra_asoc_machine.c
 create mode 100644 sound/soc/tegra/tegra_asoc_machine.h
 delete mode 100644 sound/soc/tegra/tegra_max98090.c
 delete mode 100644 sound/soc/tegra/tegra_rt5640.c
 delete mode 100644 sound/soc/tegra/tegra_rt5677.c
 delete mode 100644 sound/soc/tegra/tegra_sgtl5000.c
 delete mode 100644 sound/soc/tegra/tegra_wm8753.c
 delete mode 100644 sound/soc/tegra/tegra_wm9712.c
 delete mode 100644 sound/soc/tegra/trimslice.c

-- 
2.30.2

