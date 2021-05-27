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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E165C4707F
	for <linux-tegra@archiver.kernel.org>; Thu, 27 May 2021 18:55:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C4E6613E2
	for <linux-tegra@archiver.kernel.org>; Thu, 27 May 2021 18:55:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235470AbhE0S5G (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 27 May 2021 14:57:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234553AbhE0S5F (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 May 2021 14:57:05 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EC3DC061574;
        Thu, 27 May 2021 11:55:30 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id r5so1600637lfr.5;
        Thu, 27 May 2021 11:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=prIWqm0qX1apyyRreQLe2vDKFQUK50Nuu3llPiwjrjk=;
        b=NjJl+5lsWY+hx+wQt/sAnmlHnk46mxtRQdMsgZF94ErSZfAAz47u9IexHk4BUPXPwK
         bYURbgAC7ctwtFFA5FoaK2AFITwSMvIyPWZTCVhBdb3mOUvvGezhK/LsQVPrHZE1jmmZ
         0HufmaJgR+r2rWgXQwB2tejsm29c8HVWzP0ztUiqwsG1izWh4704xhfkkgSe0YriNNCu
         JFyikH9auQXOEmFknxHG720Nou2H1q+NwLU2Ds5JgXy0dJSQRdjV22gPjjPrOdn1dgUM
         19wA4nvnHpd+CUSZTJPki9w/hU6KhXAMQS9oKkmUeEra/gmZJitnflVDkr7+ywHOqV0L
         OYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=prIWqm0qX1apyyRreQLe2vDKFQUK50Nuu3llPiwjrjk=;
        b=N7QHnSdrQgtoLg4gWHh8RuQRKcju0bgpyHq/yfgPVHfoabyU9rZGJg/ILqJL/X2IVD
         RkmB12nnVQajnw9tnIBns+O739biAllTSO1TYPHg5oToW1Zplo/fhBzADaaxeq49zAcs
         wtKD8uqiWGNM1T/YpQ8S919AzS1f+HGbaOJF2QcpD0VnNu+iaJsmFUKQPE5HMq7MOcIw
         TwxphMkg24HPHBuq36gAfySFncCGxsfPuT9BLrmLotNtjd5TPZP4474afyFLAf2NPD7A
         W6pQcCP9N+gq2vxPXYHQR+5emFj/jem3Z09/eEacaFd6QQjBuPxPqQTVf5q+l8DXoWBY
         XwCA==
X-Gm-Message-State: AOAM531Ay7r0pRbs9J3qVe2o+3AjbYN3TbEk+BSm3/FNXaqe56VKKZjD
        na50nrxtJbxeF6sL/pzKJJREspGPNys=
X-Google-Smtp-Source: ABdhPJwVWtdfi/RP6saas2p2ENxKBNBSbx70wytT9yzqXssJFFChMdhm1ciWIzljFn+pYkzHjG0OpQ==
X-Received: by 2002:ac2:46cd:: with SMTP id p13mr3159839lfo.564.1622141728867;
        Thu, 27 May 2021 11:55:28 -0700 (PDT)
Received: from localhost.localdomain (46-138-12-55.dynamic.spd-mgts.ru. [46.138.12.55])
        by smtp.gmail.com with ESMTPSA id p16sm265217lfc.113.2021.05.27.11.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 11:55:28 -0700 (PDT)
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
Subject: [PATCH v4 0/3] Unify NVIDIA Tegra ASoC machine drivers
Date:   Thu, 27 May 2021 21:51:22 +0300
Message-Id: <20210527185125.18720-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series squashes all the ASoC machine drivers into a single one,
this change was suggested by Jon Hunter. It also sets driver_name and
components string of each card, allowing userspace alsa-lib to find
UCMs at predictable path.

Changelog:

v4: - Moved out mclk_rate callback that is currently used only by WM8903
      machine driver from the common driver. This was suggested by Jon Hunter.

    - Dropped patch which was setting custom components string for Nexus 7.
      Jaroslav Kysela wants it to be specified in a device-tree, but the
      components string doesn't have a firm specification for today. It's
      better to drop this change for now since it's optional anyways.

    - Fixed compilation error that was reported by kernel robot for v3.

    - Jaroslav Kysela merged alsa-ucm-conf PR [1] which added UCMs for
      Nexus 7 and Acer A500. The UCMs are fully working using a combination
      of updated kernel + alsa-ucm-conf master + alsa-lib master, meaning
      that they will work with the next releases of kernel and ALSA userspace
      upstream packages.

    - Added ack from Jaroslav Kysela to the "Specify components string for
      each card" patch that he gave to v3.

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

Dmitry Osipenko (3):
  ASoC: tegra: Set driver_name=tegra for all machine drivers
  ASoC: tegra: Unify ASoC machine drivers
  ASoC: tegra: Specify components string for each card

 sound/soc/tegra/Kconfig              |  12 +
 sound/soc/tegra/Makefile             |  18 +-
 sound/soc/tegra/tegra_alc5632.c      | 259 ----------
 sound/soc/tegra/tegra_asoc_machine.c | 714 +++++++++++++++++++++++++++
 sound/soc/tegra/tegra_asoc_machine.h |  46 ++
 sound/soc/tegra/tegra_max98090.c     | 276 -----------
 sound/soc/tegra/tegra_rt5640.c       | 222 ---------
 sound/soc/tegra/tegra_rt5677.c       | 324 ------------
 sound/soc/tegra/tegra_sgtl5000.c     | 211 --------
 sound/soc/tegra/tegra_wm8753.c       | 185 -------
 sound/soc/tegra/tegra_wm8903.c       | 351 +++----------
 sound/soc/tegra/tegra_wm9712.c       | 166 -------
 sound/soc/tegra/trimslice.c          | 172 -------
 13 files changed, 853 insertions(+), 2103 deletions(-)
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

