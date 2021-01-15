Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82401C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 14:02:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 549AC23877
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 14:02:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729011AbhAOOCq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 15 Jan 2021 09:02:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726904AbhAOOCp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Jan 2021 09:02:45 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32456C061757;
        Fri, 15 Jan 2021 06:02:05 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id b26so13264576lff.9;
        Fri, 15 Jan 2021 06:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1NsOkp9iBw88H+ZIyGf5qHZeJSQo1CPXWCUE5H26Igg=;
        b=pIMnj0Ny2iVoIMGIgV4yaPUZg2T7Ozx6rPZDHqDTGpbe1qAB8ekyJzLZ8AEnr/HflK
         goWt8UIldM1V0kyzcRw12jZoCcpNtosEdpbMK7D8GXOR4klIOJGyjKm/CpYM339gE145
         hE2eVQBQOoYXc1jG3j1ykc02kMuyI+A4XnggEM7RxGsVNsIdlbdJVwQcxC7wWstoRSxa
         pyojsYO7VG9/pg73ufpCOipJV5dvIv8ET5uBHd9SD7AZCyvEiETu8wGzjxL3IzLw7/Tb
         A/Z6Xvr7ollvPvGk3591QRXFo9HCGK4IteUP+0W9TSu9JOF0jn8qEUSJmAc/FZ8GW0C6
         dGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1NsOkp9iBw88H+ZIyGf5qHZeJSQo1CPXWCUE5H26Igg=;
        b=TNaG08KqYQcAYj9vPQs7kyKut3FvkQkzgCXEsJMBEyfewm7u/uGAOebD5iAYi4xKYN
         a5nhaKean33PT0DZqTQAf8CHJFujvfMmjAGmOhvW6bMqSTAwHSgs7BdI0UmGzyh2Um9i
         i9sdsc0WBz2ETsM8gzYSl3hqmvl3KYmITotGMk+8oneQfVoU11W66RVMjXc0mxSqhEvt
         YNnXA3pyCuOhD/Jhqdwl9FXkds9lIoDH41mXx+GNl6ZmQE4Qs/mHdIc0voVSfbN6zfXp
         Ln3z6q4NHVQWOYuQuyoip1hV8EBu16MLIRPUMm6rop6ry12kS3XLeHGhIeTyoza3X9tT
         B5aw==
X-Gm-Message-State: AOAM531y6d1LXsWQ//COQ+21IbrcBFS/xiBdRcAJORep4BmorKWlKZIL
        HNhoV/GFBuqjyv0QHPK4MH4=
X-Google-Smtp-Source: ABdhPJwqZrKQFdE/ox4izOJ8DbpPJvYBRbch14yPMzyXPyscXCSPnW1yhdL5OpAsDMfD9AfHyiNGgA==
X-Received: by 2002:ac2:43a4:: with SMTP id t4mr5708194lfl.197.1610719323774;
        Fri, 15 Jan 2021 06:02:03 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id f132sm906852lfd.252.2021.01.15.06.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 06:02:03 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] Clock and reset improvements for Tegra ALSA drivers
Date:   Fri, 15 Jan 2021 17:01:40 +0300
Message-Id: <20210115140145.10668-1-digetx@gmail.com>
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

v2: - Added regcache_sync() to the "ahub: Reset hardware properly" patch,
      which was missed by accident in v1.

    - Corrected typo in the format of the error message in "ahub: Use
      of_reset_control_array_get_exclusive()" patch by s/%p/%pe/.

Dmitry Osipenko (5):
  ALSA: hda/tegra: Use clk_bulk helpers
  ALSA: hda/tegra: Reset hardware
  ASoC: tegra: ahub: Use of_reset_control_array_get_exclusive()
  ASoC: tegra: ahub: Use clk_bulk helpers
  ASoC: tegra: ahub: Reset hardware properly

 sound/pci/hda/hda_tegra.c      |  86 ++++++++-----------------
 sound/soc/tegra/tegra30_ahub.c | 113 +++++++++------------------------
 sound/soc/tegra/tegra30_ahub.h |   6 +-
 3 files changed, 59 insertions(+), 146 deletions(-)

-- 
2.29.2

