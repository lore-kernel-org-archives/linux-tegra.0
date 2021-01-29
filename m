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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D96C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 19:33:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DAB1364DE3
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 19:33:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232862AbhA2Tdl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Jan 2021 14:33:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232849AbhA2Tdj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Jan 2021 14:33:39 -0500
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F2D9C061573
        for <linux-tegra@vger.kernel.org>; Fri, 29 Jan 2021 11:32:59 -0800 (PST)
Received: by mail-qv1-xf34.google.com with SMTP id l14so5016114qvp.2
        for <linux-tegra@vger.kernel.org>; Fri, 29 Jan 2021 11:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r67InYHj7w0UwUs8Y72vPHBfu31eAHA0VGcwVWjNNEc=;
        b=EdUVY0bLdPbBA2FZrTNiX66oEskosYO2f/QYo+UziRqOcrODVKbpBf3Gl+VaTtfGiA
         niihmJAk00TDIqH52b4XL4ZDnJzQCIN1lUlsuY5QkdNTA5/c/aCPnfWDvzH7dBtoRN+o
         /vWQVRWq6gK52JeBDNAopenV5jEoHjTMMBkTiTS7JhJZWt2o6EJi+YsqBlRO2v7R49a2
         f0ySZXgQsXdaVs5Z4KKyJ4tnR3m6Of2uSN2fk613Q9d8HoOrjBTuKewjwRA2YodNOo9b
         U5QC0ab2pM3BKg8g7LMFHsggSFm1CFbh/l98i/aHUFzf5n7qgSiNkdYaSm/ORndxjuRS
         pxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r67InYHj7w0UwUs8Y72vPHBfu31eAHA0VGcwVWjNNEc=;
        b=XtlkFbM287OkvCyi19Tn1BjxEyWxa9Ib1qAfz2O/pi/NDgV+3Wv1g3xUTNqlLXnh8x
         igePfR3rlXy9BBvdHTP00TQALkiHpVZNafBXvdDXNrf4CB2OuzVyR5j0yPLwH9gCIxCu
         0PHQDrPI8gLzunmgxx2ZpVLcauylWr/20RGGGBei7bQd8IZcdVViJpRPHL5J2cEbDhIj
         h10DWJsuyf70GKui3dTwTedt8DYk2JAHVZBfQf+SGcv0IK6n14xkLNPkSToonPO9TAEk
         C9Wt7VaJwFcdPC6SRTH6HQBOcwSob1VJ7WKSZixxr8TpIm2GKers45fb/ylnzyIZ1L9N
         Am1A==
X-Gm-Message-State: AOAM532nqbfyAPW8V4rXcrG8StnjySj2ulGq9ChIoB/6mOuXlaF1XOvY
        wBb6CWA4/lsTMoUtZ/D5v9U=
X-Google-Smtp-Source: ABdhPJy+w1P0mfYDxPTKAsKLMxfdPnzKm1nQ1m/wfdbrlcGXGt5Vna74AeVZkCwDJts+0hKT8dUcLg==
X-Received: by 2002:a0c:e28c:: with SMTP id r12mr5539465qvl.34.1611948778317;
        Fri, 29 Jan 2021 11:32:58 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id v15sm5751291qkv.36.2021.01.29.11.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 11:32:57 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] ARM: tegra: Core changes for v5.12-rc1
Date:   Fri, 29 Jan 2021 20:32:49 +0100
Message-Id: <20210129193254.3610492-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.12-arm-core

for you to fetch changes up to 680ae44526ea9b656238ac768c8b6130961a0bdb:

  ARM: tegra: Don't enable unused PLLs on resume from suspend (2021-01-19 18:20:42 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Core changes for v5.12-rc1

This contains a single fix that helps properly track the enable state
for various PLLs during suspend/resume.

----------------------------------------------------------------
Dmitry Osipenko (1):
      ARM: tegra: Don't enable unused PLLs on resume from suspend

 arch/arm/mach-tegra/sleep-tegra20.S | 38 +++++++++++++--
 arch/arm/mach-tegra/sleep-tegra30.S | 94 +++++++++++++++++++++++++++++--------
 2 files changed, 108 insertions(+), 24 deletions(-)
