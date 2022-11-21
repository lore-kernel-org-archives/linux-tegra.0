Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 643D2C433FE
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Nov 2022 17:14:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231440AbiKUROe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Nov 2022 12:14:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230522AbiKURN5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Nov 2022 12:13:57 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9B48D14F5
        for <linux-tegra@vger.kernel.org>; Mon, 21 Nov 2022 09:12:49 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id m22so29998946eji.10
        for <linux-tegra@vger.kernel.org>; Mon, 21 Nov 2022 09:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/I/hLJg7MJV1bbkW493eGQbSidaKR60YPeJkn7lTWxA=;
        b=nIHs6uEOvd7f5zoJ/R87pVZth0gXsB7ILmkvMmacJfaAUVc5N8SgC/SlkavakiyKZD
         xGJptgWdBt+Z2g8a9p6nBheyfoSHPuELey76LK+xxYaH2SFkCCueBErlQpOSREBrHwYP
         ddqjjJr7gx/poxH2aFHrjPb2lo04E1VnJNIVOX27PpZjh3GwKrjTg+J2zgq+0vs982mT
         b57b+5W4sLMW9uUepW8LTrhdw5F0NkaMT4NlXaTf2Fi374CKtn0dvZZ32oQJFXgp1TTQ
         PGcsE+fjxgD9ojKcjjqanrK1yF0I3AsOCrt8x+4etRl/tEPe2XjYWzg+nY8K9LxJ+awj
         /wtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/I/hLJg7MJV1bbkW493eGQbSidaKR60YPeJkn7lTWxA=;
        b=J+rBCySzZauMavPvbnniGTgpImKiBQMhIViyAV6Dyzbw3U7A1raAcb9qN0ZY/Qz07N
         c1UfbVOcPVlDd28hfnvY4gKO23o+G+NguC9QoQliB3n1qGBP+iVrLTKWOIj4t7dmzA6N
         yIU6ybWacWFt4ZbyvPajT7+p4fNESSaEVT4KZ+6EGnweC6CQ7UOvp7QO7DOlIzo0zt99
         LfHVlBeEYZ0dJPHAojiZh77pXn8jM6acp9lmgAHRJpQ9YNxLcnI0LKG/8GdCjF7SQ4pl
         1sy1WQQZ/2R7SE9tpM00F7nK2SX3cfiU2qfhhyDTEywFG5odV6YO4SRoueI0lCgS8mNQ
         eKRg==
X-Gm-Message-State: ANoB5plvXA6KROByzt8LaaW4q9+rSYCY0Qu5smpj/93kjIGYAzYBgbNB
        sUspnbpv8dDBB/CdXTTtutk=
X-Google-Smtp-Source: AA0mqf6HMYgi3IGidZEidg91nwrgrNnZLuWMZJvTXyr05gfMwwYYCVXlUSm6yayBL2u+IVsE5gfb+g==
X-Received: by 2002:a17:907:d60c:b0:7ae:e592:6d83 with SMTP id wd12-20020a170907d60c00b007aee5926d83mr15462529ejc.699.1669050767943;
        Mon, 21 Nov 2022 09:12:47 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id w18-20020a056402129200b00467c3cbab6fsm1354462edv.77.2022.11.21.09.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 09:12:47 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2 5/7] memory: tegra: Changes for v6.2-rc1
Date:   Mon, 21 Nov 2022 18:12:37 +0100
Message-Id: <20221121171239.2041835-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121171239.2041835-1-thierry.reding@gmail.com>
References: <20221121171239.2041835-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.2-memory-v2

for you to fetch changes up to 5cd24ca0985f2dfb5628354fb63ede67b1dd993d:

  memory: tegra: Add DLA clients for Tegra234 (2022-11-21 13:29:02 +0100)

Thanks,
Thierry

----------------------------------------------------------------
memory: tegra: Changes for v6.2-rc1

Some cleanups replace open-coded debugfs attributes and memory client
IDs are added for the DLA IP found on Tegra234 SoCs.

----------------------------------------------------------------
Jon Hunter (2):
      dt-bindings: tegra: Update headers for Tegra234
      memory: tegra: Add DLA clients for Tegra234

Liu Shixin (4):
      memory: tegra20-emc: Use DEFINE_SHOW_ATTRIBUTE to simplify code
      memory: tegra30-emc: Use DEFINE_SHOW_ATTRIBUTE to simplify code
      memory: tegra210-emc: Use DEFINE_SHOW_ATTRIBUTE to simplify code
      memory: tegra186-emc: Use DEFINE_SHOW_ATTRIBUTE to simplify code

Mikko Perttunen (1):
      dt-bindings: Add headers for NVDEC on Tegra234

Thierry Reding (1):
      Merge branch for-6.2/dt-bindings into for-6.2/memory

 drivers/memory/tegra/tegra186-emc.c            |  15 +-
 drivers/memory/tegra/tegra20-emc.c             |  15 +-
 drivers/memory/tegra/tegra210-emc-core.c       |  15 +-
 drivers/memory/tegra/tegra234.c                | 160 +++++++
 drivers/memory/tegra/tegra30-emc.c             |  15 +-
 include/dt-bindings/clock/tegra234-clock.h     | 639 ++++++++++++++++++++++++-
 include/dt-bindings/memory/tegra234-mc.h       | 440 ++++++++++++++++-
 include/dt-bindings/power/tegra234-powergate.h |  15 +
 include/dt-bindings/reset/tegra234-reset.h     | 111 ++++-
 9 files changed, 1339 insertions(+), 86 deletions(-)
