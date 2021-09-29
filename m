Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB509C433EF
	for <linux-tegra@archiver.kernel.org>; Wed, 29 Sep 2021 22:28:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 942BE61425
	for <linux-tegra@archiver.kernel.org>; Wed, 29 Sep 2021 22:28:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346663AbhI2WaW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 29 Sep 2021 18:30:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233018AbhI2WaV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 29 Sep 2021 18:30:21 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CF16C06161C
        for <linux-tegra@vger.kernel.org>; Wed, 29 Sep 2021 15:28:40 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id i4so17102521lfv.4
        for <linux-tegra@vger.kernel.org>; Wed, 29 Sep 2021 15:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s5sTdJ8JKqsgJbxnEz9RKpMDTn4k9mcAGcN+lDKvBZ4=;
        b=NxBEz55jmzV1nXguvJUvMdN756MI83400cnyZN072rHeHNO2dvXY17+XOAwAW1f650
         IRpdbmJqjuLjTbUOr53d5VWR81T6UKGuF7G9VwnQ+Tq+fgwHuvpa1ujuHDicCyZgDMZU
         syQ3W5+rDhHSJ8KX+e6G3iltSJRQcBvRlUKNgo3Qf2DW4VECkBxNL+xmJjIP1KBiOofF
         DtI3UH6FPSzBxHnxHSpjgXrjRTid5VqIL/7Im2ji9fPTCC6lrd93tyEz24aqWff5Dxre
         qwZoH/1JcrvlqKTMPOMDmKpmeH8iY3Oc3oG6zIBatvHgpdwGBiNph71V/GCRC0V3OX/8
         zPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s5sTdJ8JKqsgJbxnEz9RKpMDTn4k9mcAGcN+lDKvBZ4=;
        b=1Lc1B6jFC3/G4IIDASVdXOnMEA39ZmcDdBvuzpyrzWwsfuersvLMpGooi1Jd3wttey
         7QScotDlXXo1ds8oZtpgi5u5EoRAZl3RcOk4gPwkVM6Ufp99FFV1VOk8BlqlM8Ig7Y5F
         lbzzbg7YXPX1EVYcRc37R2fEpPgaJtO0EjcYwBANAE8x9PsJnMyYq9M6g0h5RAGQ+6lp
         hJH9OEBTVs1pNHFT07ZTwr6Z8d5vreCDaDrSsp6hOAe82BTSzJGvlpj9+TnSYOM0adE3
         JjqqkHkooQKY0NXFsuihTKQbFMRCKiPxdnoTvW+cJqMQ/FMIBFRmaFrQUbhTe//caG9p
         QArw==
X-Gm-Message-State: AOAM531V78V2RQOG3+nDl4CSwOeSuazp277soMGcGu0pUA6JWevnwppm
        CCYIk9GS6jNfnxnriqt1ZFM=
X-Google-Smtp-Source: ABdhPJw+yaInYJQjq0bNQMNlQqDMSXq2759kVCyrXVuaJndz8EeuhODulDCQ/QNDGACqK7rdNkFHHQ==
X-Received: by 2002:a2e:9d88:: with SMTP id c8mr2439901ljj.189.1632954518583;
        Wed, 29 Sep 2021 15:28:38 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru. [46.138.80.108])
        by smtp.gmail.com with ESMTPSA id br40sm137782lfb.64.2021.09.29.15.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 15:28:38 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/2] NVIDIA Tegra display driver improvements
Date:   Thu, 30 Sep 2021 01:28:03 +0300
Message-Id: <20210929222805.16511-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Asus Transformer TF700T tablet requires couple minor changes to the
display driver in order to light up display panel, here they are.

Dmitry Osipenko (2):
  drm/tegra: dc: rgb: Move PCLK shifter programming to CRTC
  drm/tegra: dc: rgb: Allow changing PLLD rate on Tegra30+

 drivers/gpu/drm/tegra/dc.c  | 33 ++++++++++++++++-------
 drivers/gpu/drm/tegra/dc.h  |  1 +
 drivers/gpu/drm/tegra/rgb.c | 53 ++++++++++++++++++++++++++++++++-----
 3 files changed, 71 insertions(+), 16 deletions(-)

-- 
2.32.0

