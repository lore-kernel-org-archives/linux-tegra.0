Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A74C4338F
	for <linux-tegra@archiver.kernel.org>; Sat, 14 Aug 2021 20:12:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 703A260F9F
	for <linux-tegra@archiver.kernel.org>; Sat, 14 Aug 2021 20:12:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232930AbhHNUNA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 14 Aug 2021 16:13:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232602AbhHNUM6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 14 Aug 2021 16:12:58 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E877DC061764;
        Sat, 14 Aug 2021 13:12:29 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id nt11so20455619pjb.2;
        Sat, 14 Aug 2021 13:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hsd/ckMYl0h9h4jIiEx92sH2iR7qjMVLa0hXRt73XIQ=;
        b=kmjgE7HU3T7J012XGbvMCrPkrv8tz31/1bn7xqZnje0fVFpSCSwkJfsTbUrMFvOtSV
         2OSh/1bQViMGnQnOORcR193kJ/eZa5J/YnM1HEkAEMya6chOXLYWYx+Au0X4i1oVDMlW
         XFxuYCLTSZ1vL0BXPTDgUTA42Mbf/p40tIk9kxtqm4GjvY2GzWTz6l/Hb0pHM32pfgKW
         Ftty0BCtKttobkgqnfoSKDZnEe1RCLCDWMUvuPWqDq7ueXb8x5l+ZEUOF92mAaFX4cbS
         UlYbKHKoanVm38K9TnHfk7bJxkyljmuJrenE1yqNg2EVYy4VeaK1TbCCe0IFK0yrgnHO
         ftrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hsd/ckMYl0h9h4jIiEx92sH2iR7qjMVLa0hXRt73XIQ=;
        b=HRAm2KsjrQFIbWuwGNg/jcNs1qs+QUQvWMMfdcU8xShNwJ9HGOBr+yR1larZi9NKBr
         +dXaUxkMq87tYjx1fq0lLIEhOTdG389mdtkcZC49xMu+vRzZ+nuXeia1KAlvWaTP/WjD
         AqAKWsJj2kJnf8yhwP6qVKR/1BBnqegUIBiJlHm2P5ZqkUU67ABaKs3a8mJfhrwxcgPY
         HLW5ei9WgNoZ/8HDf93amjhV+eZJIRc6mOAP3Sh38B18pGYEmA7Ba2fUWfKfIolDR32M
         2Id4GIuLnFsJQbmSG2j6A7PnuuqQ+VkgdSNDY2JBhcS4TkG/UF8JTbWabdbrnsW6/0Rj
         xcoQ==
X-Gm-Message-State: AOAM531/7itSX53DVqrVVIwVOJ0L3nVWC9dR5pwh9BRBcdYRXWLnk/Ak
        z4y07Wbs4s4O8dszOVb2a1Y=
X-Google-Smtp-Source: ABdhPJz4l8mdY/4NyQt+T0jscuDbRR0RflmAVmg27o5W1IKFkPgFSYkucKQaGdM4avAmmadZiZ8xSw==
X-Received: by 2002:a17:90b:104b:: with SMTP id gq11mr8722676pjb.64.1628971949451;
        Sat, 14 Aug 2021 13:12:29 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id u6sm7309420pgr.3.2021.08.14.13.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Aug 2021 13:12:28 -0700 (PDT)
From:   Aakash Hemadri <aakashhemadri123@gmail.com>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Takashi Iwai <tiwai@suse.com>, Jawoslav Kysela <perex@perex.cz>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Bjorn Helgaas <bjorn@helgaas.com>
Subject: [PATCH 0/2] ASoC: tegra: Use of_device_get_match_data
Date:   Sun, 15 Aug 2021 01:42:17 +0530
Message-Id: <cover.1628971397.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,
	Prefer `of_device_get_match_data` over `of_match_device`. This patch
replaces of_match_device with of_device_get_match_data.

This patch series will apply cleanly on for-next

Aakash Hemadri (2):
  ASoC: tegra30: ahub: Use of_device_get_match_data
  ASoC: tegra30: i2s: Use of_device_get_match_data

 sound/soc/tegra/tegra30_ahub.c | 2 +-
 sound/soc/tegra/tegra30_i2s.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.32.0

