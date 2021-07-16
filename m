Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C98C636CB
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Jul 2021 23:37:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03819613ED
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Jul 2021 23:37:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbhGPXj6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 16 Jul 2021 19:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbhGPXj5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 16 Jul 2021 19:39:57 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 165CCC06175F
        for <linux-tegra@vger.kernel.org>; Fri, 16 Jul 2021 16:37:01 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id f9so13811422wrq.11
        for <linux-tegra@vger.kernel.org>; Fri, 16 Jul 2021 16:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aFrqnuOxWnNghnHgreX5L4xNHEhiU0UDW3cJN11PLf8=;
        b=MvIuIMqjYumtbh44qjjRozsAAdYcITm/9s2p9OPQdA+GM2Ab66yw1p7V+Nl4ORdsLY
         xFqwMJIvGuB1AaMJ92DoSStF7ZM/UMZyl9Q76N0axfICJ7KsdTOXryahc4b83Cq/OScs
         xrml6AAI6H+uoZDRowqrQL1ZzVKY6wHlcH06/7iaimCIE4QNF3jNrAMWXWyCeMApMlFd
         vl1i+irnZ5haQtHWkY1PT3FpJjZBH/ll/x3G4EyQmedq5+S/tVsSo+LNgSurxWXqItJ9
         R9z4co1Pq34hmrXcIktMqTKQlkyT6i8jKsvlmTfds4yP47N2o65exVjdh3r2CTQCtlD8
         Obmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aFrqnuOxWnNghnHgreX5L4xNHEhiU0UDW3cJN11PLf8=;
        b=aNCmZ2o7cmIw9t4IbzuJwi0qggs9RMt8qTEj6VBHEKJpAMj3jxvq+pObl5lzFa3MJv
         W0Tg1cPs0MibMGQJ3Dzw6BP50UWyRwSmdz3QuxkzF88Q6E/6Gg4gLPFDGf64Q/Au0An8
         o9iZOW18oHH+68PFi6zltihJNCzbtIEJqqgoIU/JvFH9HgVlaAhrbyavvh4lm4hTRSkQ
         NZZCsfXb7E6BgNZRwwQh/KHT52RqUsoDRJ7rEyldlfs42HjtkdaMa3YsJLyLWhBHyHAN
         bsDeE4h+ed++QyZfy1kuRGnMA77cWUQclqpkbJCAVjeqfa+khZ6MhEScmjFG8aBefjom
         T99g==
X-Gm-Message-State: AOAM5300LNsjmSMTmrcaunZJFABimxbgZIo+/oFWP999qiGc4SmkHGjk
        C5UBlHcUjqsFg95wng0GckI=
X-Google-Smtp-Source: ABdhPJz4ustaG9g3xZy9RSyi5wlvAUtBExjgHaBvQOOm6zEhvFpT5mamVE8voUvEkbl79WTJlrq6Zw==
X-Received: by 2002:adf:f292:: with SMTP id k18mr15257499wro.265.1626478619581;
        Fri, 16 Jul 2021 16:36:59 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id o19sm260893wmr.18.2021.07.16.16.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 16:36:58 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: tegra: Device tree fixes for v5.14-rc3
Date:   Sat, 17 Jul 2021 01:38:58 +0200
Message-Id: <20210716233858.10096-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit c667dcd4dfcd515ad2c9b3953a33d742985a0b5e:

  arm64: tegra: Enable SMMU support for USB on Tegra194 (2021-07-09 16:50:44 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.14-rc3-arm64-dt

for you to fetch changes up to ba02920c51debb9198e72b3a8726a7c5ae4ffb41:

  arm64: tegra: Enable SMMU support for PCIe on Tegra194 (2021-07-17 01:27:10 +0200)

Here's another fix for SMMU support affecting PCIe that Vidya found. We
do have a lack of test coverage in this area that we're working to fix.

Thierry

----------------------------------------------------------------
arm64: tegra: Device tree fixes for v5.14-rc3

This contains one more fix for SMMU enablement on Tegra194, this time
for PCIe.

----------------------------------------------------------------
Vidya Sagar (1):
      arm64: tegra: Enable SMMU support for PCIe on Tegra194

 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 60 ++++++++++++++++++++++++++++----
 1 file changed, 54 insertions(+), 6 deletions(-)
