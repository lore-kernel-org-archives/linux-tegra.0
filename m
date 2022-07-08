Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12E1C43334
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Jul 2022 18:56:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239307AbiGHS4T (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 8 Jul 2022 14:56:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238135AbiGHS4S (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Jul 2022 14:56:18 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0BB118376
        for <linux-tegra@vger.kernel.org>; Fri,  8 Jul 2022 11:56:17 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id u12so39100748eja.8
        for <linux-tegra@vger.kernel.org>; Fri, 08 Jul 2022 11:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r0JEUoJ9sLpu19V7f0ElwVX49+IBRyb0Lpv1dEzhHh8=;
        b=VmpweFDi+OafWV5aWSH9HtVEJYnuHfM44Efd6dSa2MkVwF4y+n7N0IsJkcu9M1Pc5y
         4nUvQ1dQ7aOijk6OX9eH78VewXu32I0X6bBZexP9WAWBt88Irzc0APifYxzs9wjvmV3Y
         P7BqO4ryIz1+S1yi42h/4G2/6J3455sxN9SuuByZAKMLz9W8cY+8GGuznIOiJ+M5Zj7v
         3vMEZYb1cnENSXKVSuzcVwpAyrug9eNwl5wi2qKIRwitFJ8e5PCAR5APDWN9AKzzoxeS
         TuHFEazUvj+Ueio/NFo421CLTv9oK8WZa/Bp7LYf6k5buGQp5FlQMuzlVGTZ/i47q6Nb
         LLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r0JEUoJ9sLpu19V7f0ElwVX49+IBRyb0Lpv1dEzhHh8=;
        b=PwNnYOjNkWptDfZXgkTjv4XDfZBzYqNOh035NDrqitnAa9pZdW9YhDBMrDDrM/YhFp
         Ox1USlNG6CkyMZdiFbfZIwHnOsK+Yuchd+NSh3yo+XolHtgE0UmAP8KSZczdl/n5dhwC
         uBoVBCLJxm9ZJ8vUaNwmB0tz6XUZKUPkN1Fs+F5Rc/XqlVed2dlf3PITY/16+avkEW3B
         9+YtIxmyJ6ViRvMY0TIGK6RvvLkmHJqNrtNLs27jF6GJl+AbalGi+N89zaL3SpVdzVaz
         dyjQEX/RRjy1qGExKVCvCtRWvbTAvhfT4vxlfq8ICi15uV7SbnQ5xEepjoqLS/1anifU
         Ap0A==
X-Gm-Message-State: AJIora/c7kvLW7uU/d/wuT/gXDTdAS7Sf0GE2Jpry8xF3OGHW9g2AQLG
        HPiOdXcBl1HRcZoEQwNvMd5UUllPwS0=
X-Google-Smtp-Source: AGRyM1uRj3lk2FdQ9Ud+l7xbThhBTVjVsoNCB5hV86Gzx8jafj4F/5EbmBtdiNCWfmXDjd86IW+Ugw==
X-Received: by 2002:a17:906:99c1:b0:6fe:b01d:134 with SMTP id s1-20020a17090699c100b006feb01d0134mr5093379ejn.598.1657306576430;
        Fri, 08 Jul 2022 11:56:16 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id d13-20020a170906304d00b0072b31123174sm350717ejd.62.2022.07.08.11.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 11:56:15 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/7] firmware: tegra: Changes for v5.20-rc1
Date:   Fri,  8 Jul 2022 20:56:03 +0200
Message-Id: <20220708185608.676474-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708185608.676474-1-thierry.reding@gmail.com>
References: <20220708185608.676474-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.20-firmware

for you to fetch changes up to afcdb8e55c91c6ff0700ab272fd0f74e899ab884:

  firmware: tegra: Fix error check return value of debugfs_create_file() (2022-07-08 17:56:03 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v5.20-rc1

Contains a fix that avoids unaligned accesses to IPC memory, which in
turn helps in suppressing speculative reads from out-of-bounds memory.

Another patch performs some minor cleanup around debugfs API usage.

----------------------------------------------------------------
Lv Ruyi (1):
      firmware: tegra: Fix error check return value of debugfs_create_file()

Timo Alho (1):
      firmware: tegra: bpmp: Do only aligned access to IPC memory area

 drivers/firmware/tegra/bpmp-debugfs.c | 10 +++++-----
 drivers/firmware/tegra/bpmp.c         |  6 +++---
 2 files changed, 8 insertions(+), 8 deletions(-)
