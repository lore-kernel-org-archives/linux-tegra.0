Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C37C4338F
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Aug 2021 21:15:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87A1561053
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Aug 2021 21:15:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233075AbhHPVPd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Aug 2021 17:15:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231750AbhHPVPd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Aug 2021 17:15:33 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87428C061764;
        Mon, 16 Aug 2021 14:15:01 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id u15so6691811plg.13;
        Mon, 16 Aug 2021 14:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kTIbeouKJPHdAuznrwq0D4i093w3WXn0nhVYGisrNLM=;
        b=SXugE0cX6LQ2/w8x+cnMmQnCLRTZsKsqsydVR6i6J5pyFaG4u+ne6litBLPEqgjZZ9
         iQ3sGMWPAy8SJApSFdzxLiXGaU4LpmRkIrUlTU7RWGdD01d2TTevS9OIfefGoVgewALS
         4O/TrCM/BX8cXW5dJjB7yVWtZ1BUeggPK5R6dUcWTS8LkZfW1VUy4VrQp+W/UMleOmr1
         H/q+2a9av2u0qWtc33F5e8pLNsKW0UucGWuNr/z4SBOp5/HICi+DJxGMaLJJi6J0rL0/
         2aFwPenfPYYGCdy9ghNI80meLa60jIxfnUf0jh6GjfvYs/+zVJUjNw6xrwSWxAgTkq9P
         pdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kTIbeouKJPHdAuznrwq0D4i093w3WXn0nhVYGisrNLM=;
        b=IAmWygv68iW3ytd3TN4b90O1wu2IQEURl78a6YI2OIe+pjxv7JQnfpE+pqIS4y+XbM
         9HBc1yXG0y2ZrQG94ukazV96gjVKrYBqSQeBXuD2JjWW9z7rdogkwb2n0mINdSPW897O
         vYseUTmRY0OM9eK3l+vP8azcX/Nhvzoksk7ZMWCO8R9jN2HZkmaF9DN7O50Y85lB0da7
         yYkLf5/Re3ZsRvb+0KvYme3CM/Lh8kag4JI4A+vV1W8rMyNN1QjKh9mKELc+i7lvB9gD
         ZX4v0zfLQqFVyH60Ak/+jfSENQiBYsJuu+rpQj2Mkg8ixXcGCZ3SaI4H7DXtkfQDofIf
         xKAA==
X-Gm-Message-State: AOAM5313dMP+X8dZxcPOSKgR6YHFNpC8DwU3yVmesxqOAx6TOYw5RyvY
        Vy6w9482q4IeGmIV7a/cw4cA+50qAYJ7zw==
X-Google-Smtp-Source: ABdhPJwpdHWa60/DF1dYUxouwyIYCy6OM024ogmA763ik20oAiLDxJ1zWG72rU85swQyEzlq9WxbEA==
X-Received: by 2002:a65:6883:: with SMTP id e3mr76637pgt.90.1629148501070;
        Mon, 16 Aug 2021 14:15:01 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id b12sm103154pff.63.2021.08.16.14.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 14:15:00 -0700 (PDT)
From:   Aakash Hemadri <aakashhemadri123@gmail.com>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Bjorn Helgaas <bjorn@helgaas.com>
Subject: [PATCH 0/2] ASoC: tegra30: Fix use of of_device_get_match_data
Date:   Tue, 17 Aug 2021 02:44:50 +0530
Message-Id: <cover.1629148177.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,
This patchset fixes my previous incorrect patches.

356b94a32a75 ("ASoC: tegra30: i2s: Use of_device_get_match_data")
80165bb80433 ("ASoC: tegra30: ahub: Use of_device_get_match_data")

Aakash Hemadri (2):
  ASoC: tegra30: ahub: Fix incorrect usage of of_device_get_match_data
  ASoC: tegra30: i2s: Fix incorrect usage of of_device_get_match_data

 sound/soc/tegra/tegra30_ahub.c | 6 ++----
 sound/soc/tegra/tegra30_i2s.c  | 8 ++++----
 2 files changed, 6 insertions(+), 8 deletions(-)

-- 
2.32.0

