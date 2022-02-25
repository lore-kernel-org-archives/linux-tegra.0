Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1083C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Feb 2022 16:47:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241400AbiBYQsZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Feb 2022 11:48:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243312AbiBYQsX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Feb 2022 11:48:23 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CAA71BBF6E
        for <linux-tegra@vger.kernel.org>; Fri, 25 Feb 2022 08:47:47 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id r10so5420964wrp.3
        for <linux-tegra@vger.kernel.org>; Fri, 25 Feb 2022 08:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jqez2ASWm8yfcVM64bGimZztQHH7JgrjZ5N5ycpQJ98=;
        b=dJ583PiDSsc0CTIFoORKzTJnFbabL/WJ3XAuT4T13ac5lop0E1FyKH6kmoaLErKT7y
         +lAF3f3T0vgxm8uitLDHVs+fS5l6/Fln8btcP7eNzIhssGtmTXGfIN3oHpMiixRZSMRT
         XrHwP0B6hXC3pAcz7KLhsonHNk3KMuKGoMFNNP1oo3vgKogKCTejLtowe2iOot8ReZjk
         r5DWMqt4RLfZmygi4TW+NcU2ppdEMxfd3d/3zrgG11G4oAIgtYJYt3EW0t9jG45rEcrS
         E0DOSN+5OuoUHVm0PNbbYGJ1shq2yIugkIvNbALS6TsJAlcIhUBWbnvS5whKPdum1PdL
         6iGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jqez2ASWm8yfcVM64bGimZztQHH7JgrjZ5N5ycpQJ98=;
        b=lKqUiPkw2QUNXEDwDQcRA8A7EMVFnjNNiDqN7Dv4ZC8lTwofsQ1HVLIH32bu35oK5Z
         8rIDfsfNB1LccgXB2wD1Tv8l3sGSvCkL/l85lvMoEPg0y3O+0M3Elv7UQjckINs0j/ci
         ZhtS0bMdYl4CLo11PpJahhXt2mEtHBjxCTnPJlCV3/sFwsieyeByalqqzuc+bE1jeYLX
         D/xXKeaoLXIATJRh5jfvqKAymKA26MvNGs5T/VtndhTrDr+ztjM3oAP4k1cS6Q7x6PXK
         OJFN1CnyqUKwVCYX5X8KQ3JaoPropMd6mt0ashi+5/ux53rCSMepsg2emY3sMcf+/VEH
         ZLZA==
X-Gm-Message-State: AOAM5335FMgovHjK0S/ejMBCRtBkj6I5gLzGl/An+NUrFvPO/kWzSwOU
        w5DxHMfrZBWa1kHpU3+evRytzL2nY8Q=
X-Google-Smtp-Source: ABdhPJxt4R2rH0g0wJNhaKs5g/tkqacC9iwePLzEU/roQ9c2kuVZC5CygKyYx4/H7yxxqlz9SpK8DQ==
X-Received: by 2002:adf:8067:0:b0:1ea:9c01:d8f3 with SMTP id 94-20020adf8067000000b001ea9c01d8f3mr6872706wrk.556.1645807665986;
        Fri, 25 Feb 2022 08:47:45 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id t14-20020a5d460e000000b001edc107e4f7sm4036873wrq.81.2022.02.25.08.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 08:47:45 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/5] soc/tegra: Changes for v5.18-rc1
Date:   Fri, 25 Feb 2022 17:47:37 +0100
Message-Id: <20220225164741.1064416-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.18-soc

for you to fetch changes up to fcfaff508b9fa9ad6d8a17d4855e3ec7382886ae:

  soc/tegra: bpmp: cleanup double word in comment (2022-02-25 14:10:09 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v5.18-rc1

This contains the final bit to enable advanced power management on
Tegra20 and Tegra30. It also contains some cleanups and wake event
support on Tegra234.

----------------------------------------------------------------
Dmitry Osipenko (1):
      soc/tegra: pmc: Enable core domain support for Tegra20 and Tegra30

Thierry Reding (1):
      soc/tegra: fuse: Explicitly cast to/from __iomem

Tom Rix (1):
      soc/tegra: bpmp: cleanup double word in comment

kartik (2):
      soc/tegra: fuse: Update nvmem cell list
      soc/tegra: pmc: Add Tegra234 wake events

 drivers/soc/tegra/fuse/fuse-tegra.c | 24 +++++++++++++++++++++---
 drivers/soc/tegra/pmc.c             | 16 +++++++++++-----
 include/soc/tegra/bpmp-abi.h        |  2 +-
 3 files changed, 33 insertions(+), 9 deletions(-)
