Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F7BC433F5
	for <linux-tegra@archiver.kernel.org>; Tue,  7 Dec 2021 16:21:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234426AbhLGQYx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 7 Dec 2021 11:24:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232311AbhLGQYx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 Dec 2021 11:24:53 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80F72C061574
        for <linux-tegra@vger.kernel.org>; Tue,  7 Dec 2021 08:21:22 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id y196so11208060wmc.3
        for <linux-tegra@vger.kernel.org>; Tue, 07 Dec 2021 08:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j7ii81gvEv/XyGJMLeUrAHqpo7gd4t4eLbDbmhNoqw8=;
        b=eZ9sikbZ8a8IcF8BB6Y85oYexf8cgSR77yULf72M2chIjZwK9VQsEVjcCDCI0vGGjm
         wrruDYpOQNAxgBayL+f1V66yotjzPiTc5UF9D6eNjjbJOjQdBOoAJyrnSM/E2Bn9sYJO
         ptxmrVu7EtCojp9uadhoEzPhih2A0fz3c36a6GjwCD60gyinK0ArvYcjmItIJnybyF7R
         OsQuSoNjNl2zOjEwT+NSj/+fQSDaOjAjh8NuQ6knQWjth6LmrEF2owmW/ARwYQQYRg4N
         fL+cFyOBVuTYj5X/xZKmf1hqzvHO8eB8wjz/4ZkUwrPm5L184CfK9B1Qnwj13WnQ+bfH
         M1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j7ii81gvEv/XyGJMLeUrAHqpo7gd4t4eLbDbmhNoqw8=;
        b=154M/aKw1F+Ukww9ksYrvappLc5HSVIb/Gouw2O6ouyJ+hM0gTxVhBE4bWe5C+itye
         +/KFoq+9eUGKD49t6aEosA2r1poaSKU7VXy2GTGX4SmjZpA4o34ldASjqy2TpiMnn4L6
         ovfvM1SsfSwTBQTtsbzFtMsD7v0GubPLK91SNDqo/a9ZEaeukKXBoQ4+lIE1YSN7vz/L
         Qob1CIYsw0l1BeK1oNxB4QoG7dUJ7NMuuEs5fsgemkyz8drL4DMGLN+9/mLLLhuh2LMO
         W0bMI6qDiDZD+do/edwHM0rU5pTb6Ggpf7wn43IvF6LEdqx8/IQ9M5aYm7ElMmODRzM7
         r1vA==
X-Gm-Message-State: AOAM532e/iqIvGj6oOjpy3r1gLNW/IOWLNBjADV+CMMQ0yY0tStT9vEt
        LGZS23iTIr1hcd9bQVclh/Q=
X-Google-Smtp-Source: ABdhPJxKuXY92SDEEEZ3VxfFZcnbW7srW3w3hMbi7cTpybyEpqIy+Qpnecupjtt1kiP++ZF2eHpGIQ==
X-Received: by 2002:a7b:ce01:: with SMTP id m1mr8360269wmc.187.1638894081015;
        Tue, 07 Dec 2021 08:21:21 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id f7sm184210wri.74.2021.12.07.08.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 08:21:20 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] firmware: tegra: Fixes for v5.16-rc5
Date:   Tue,  7 Dec 2021 17:21:15 +0100
Message-Id: <20211207162115.450554-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit f11c34bddf8cd2a3107a7d11b6446c66deda9590:

  firmware: tegra: bpmp: Use devm_platform_ioremap_resource() (2021-10-07 20:52:24 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-firmware-fixes

for you to fetch changes up to 711e26c00e4c7b7cef0420c76a61e6d818e12687:

  firmware: tegra: Fix error application of sizeof() to pointer (2021-10-18 16:04:01 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: Fixes for v5.16-rc5

This contains a single fix for an incorrect usage of sizeof().

----------------------------------------------------------------
Lv Ruyi (1):
      firmware: tegra: Fix error application of sizeof() to pointer

 drivers/firmware/tegra/bpmp-debugfs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
