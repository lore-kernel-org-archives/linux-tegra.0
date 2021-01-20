Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2785C43381
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 00:33:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7802A23109
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 00:33:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728099AbhATAcq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 19:32:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbhATAcp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 19:32:45 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7275EC061573;
        Tue, 19 Jan 2021 16:32:04 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id e7so24063811ljg.10;
        Tue, 19 Jan 2021 16:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p54YQoU5PizD2PvnEMTwxf/6TaphLrTilvpQINsaj5A=;
        b=Ryn+Eyy0tLq1AjpZ4wzZH7b0j6lALNZPqet/IMumjZlW2dsWaSXYePzJaTT6e57hwD
         /ob9Om+q8TptVqjyyT3rEaRRQGEa9Fz7sV6oJMrvBm0GS67UlLppeWr4c9gsCq6gHK9w
         94rK6lI9y2CBl1bOb3Jotr+YgQWC80w6QIuVO11yPtkWq3qR6/LKVeshPtZd/o+BXV+o
         ENMd/FwAy6AMBfXQymSUAkJXpBx+BjcOBO3y+8cO73y2R5ThNKYZJObKcmVp2dluxDM2
         qKFckARILDrxWMdDWIJuOjnEFxs5SDksmqSocvrnN7NPQHb3zgGqyYmtvtXTJxCQ7yQx
         6htA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p54YQoU5PizD2PvnEMTwxf/6TaphLrTilvpQINsaj5A=;
        b=jc4cLhex5KWwSV5MwwWIBstNYoZn2wqfpiGVyfYY4/Rw1T5taJSwdhdvH65Kdwd80W
         LQQ5tckkWZyJyGp7j56CiT9H9WQjVoaVhT6khs3cMy6wq5N2fWwtW+ztLzQQDCO90k8a
         7CRjFxxtNrnzIaH7gWuvqvT7Wm7mWgJqst6F1UCpwXLnyAIfKN0yZs/HCuTsDA42l6No
         vrGhEL/rLTT1NLB/MgqacBnDMFnzEkCv7fW1y4WT56OUm8aYZCRifVd4ci/20sHIZkRm
         0pIfytl8utvSaQ6yTOC8AwBG0P6UCxypZlteGosLmPQ9nxNo9NategdeRb4s5/Y0Q9Yv
         wa7Q==
X-Gm-Message-State: AOAM530FIkog4Wht+1gwvh6My+wHWh3JOgkCQhnnGL3h+C1R9Rbyf7G/
        EInErd6p/D8wWc7AsWB40hY=
X-Google-Smtp-Source: ABdhPJz/Sh6TR8pIQalIBKw2XVT4nunPLsNMc0btmpwvvB7qqB+d4SskIRT7YO+0DLfnTdZZxEeW7g==
X-Received: by 2002:a2e:5844:: with SMTP id x4mr3097356ljd.336.1611102723039;
        Tue, 19 Jan 2021 16:32:03 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id s27sm17710ljd.25.2021.01.19.16.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 16:32:02 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Jaroslav Kysela <perex@perex.cz>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] Clock and reset improvements for Tegra ALSA drivers
Date:   Wed, 20 Jan 2021 03:31:48 +0300
Message-Id: <20210120003154.26749-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series improves the handling of clock and reset controls of
NVIDA Tegra ALSA drivers. Tegra HDA and AHUB drivers aren't handling
resets properly, which needs to be fixed in order to unblock other patches
related to fixes of the reset controller driver since HDA/AHUB are bound
to fail once reset controller driver will be corrected. In particular ALSA
drivers are relying on implicit de-assertion of resets which is done by the
tegra-clk driver. It's not the business of the clk driver to touch resets
and we need to fix this because it breaks reset/clk programming sequences
of other Tegra drivers.

Changelog:

v3: - Reworked "hda/tegra: Reset hardware" and "ahub: Reset hardware properly"
      patches, they now use usleep + reset_deassert() instead of reset_reset().
      Suggested by Thierry Reding.

    - Added new patch "hda/tegra: Remove unnecessary null-check from
      hda_tegra_runtime_resume()". Suggested by Thierry Reding.

    - Replaced "ahub: Reset hardware properly" patch with "ahub: Add missing
      resets". Suggested by Thierry Reding.

    - Slightly improved commit messages.

    - Added acks from Thierry Reding.

v2: - Added regcache_sync() to the "ahub: Reset hardware properly" patch,
      which was missed by accident in v1.

    - Corrected typo in the format of the error message in "ahub: Use
      of_reset_control_array_get_exclusive()" patch by s/%p/%pe/.

Dmitry Osipenko (6):
  ALSA: hda/tegra: Use clk_bulk helpers
  ALSA: hda/tegra: Reset hardware
  ALSA: hda/tegra: Remove unnecessary null-check from
    hda_tegra_runtime_resume()
  ASoC: tegra: ahub: Add missing resets
  ASoC: tegra: ahub: Use clk_bulk helpers
  ASoC: tegra: ahub: Reset hardware properly

 sound/pci/hda/hda_tegra.c      | 90 ++++++++++++----------------------
 sound/soc/tegra/tegra30_ahub.c | 64 ++++++++++++++----------
 sound/soc/tegra/tegra30_ahub.h |  5 +-
 3 files changed, 72 insertions(+), 87 deletions(-)

-- 
2.29.2

