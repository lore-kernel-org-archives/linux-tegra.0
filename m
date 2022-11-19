Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD8A5C4332F
	for <linux-tegra@archiver.kernel.org>; Sat, 19 Nov 2022 01:48:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231645AbiKSBsV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Nov 2022 20:48:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231534AbiKSBsE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Nov 2022 20:48:04 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D633113D31
        for <linux-tegra@vger.kernel.org>; Fri, 18 Nov 2022 17:20:28 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id z20so7916693edc.13
        for <linux-tegra@vger.kernel.org>; Fri, 18 Nov 2022 17:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fv0PzlcVaQ/CTTukfY7VRJbJbSOMPXowRTFbtjysSwg=;
        b=ZC2O0lE+hjzh3BprparTmGNrHsKw6nIMx5gPBimEjmIwG+vxvXYRlXnBdSbn0r5TLo
         HfIK/AG1BcA2XBBufKBuwLYnvJiZ9lJjGdsuNt0Xw7sNtKR2uWG+qOgypV3Jbk/btvZ5
         N4cLLrf4w3WfjvjviECTM8B+utJsxDNzKnLaiGVvOCiec3K9B17XvF/OB7u8VHET1BW3
         wX0vVDxXN6mSFCuBBnA8etz2wRMbiiIpSlplQtGF4N9dKsjgTUTZQDjbyJkxJMAMX7gt
         ArJcHxKnJa3xI6aYN0t5TbUA4JUqoyRe1u/RmCuceLCsNzejc7pJpjPm+l52uXeEeLsN
         DrIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fv0PzlcVaQ/CTTukfY7VRJbJbSOMPXowRTFbtjysSwg=;
        b=Rm1YcjjtdUT17S7WhL1IAo2MWFEwW479rehx5m2b45OgBjVuope3Kr/v5LKMexpnPK
         7a20ZJtkju07rS9ViATIWNLjpr+8WS2CJH/xqxyTQPlVc/Pj1BuUVaN75Tb4tKOtsTq2
         OkDPkPUYbivQdAiIQXPeK3rkumgwfTs2u7ipQx+tFY4zBBqcsbPy5XhW4z5cmM/BqVF6
         l2p5snF1hCNQd2K1T641ulQDSDav/ALrnazd5xM0PAwglXgqVkPHYOsgiT+OqRGiPKtk
         nGtZJoQjS6uCFNY4n1u5jrrAWjAPgs11hGFpv+GGGDYN2C91kxQ8LKePoKqRxxdmfwIL
         mVOQ==
X-Gm-Message-State: ANoB5pkb4AEQQzJTYFh8fXCpmW4wNs2uD8oiKbe5pLEXsdWRZ04inL/S
        pm7e3uEN/uoOHM7oR4pAgR3Nqi+/b0k=
X-Google-Smtp-Source: AA0mqf6RDXtJ6Nw7/im4zwSUmPzxxG8bvUWvOjIAK6+jcFUufKf609PJ34Ob0oFxjbPyVUIqCUv+Bg==
X-Received: by 2002:a05:6402:530b:b0:461:f919:caa4 with SMTP id eo11-20020a056402530b00b00461f919caa4mr8302496edb.255.1668820827392;
        Fri, 18 Nov 2022 17:20:27 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id en20-20020a056402529400b00461bb7e7ef1sm2431853edb.30.2022.11.18.17.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 17:20:27 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/8] firmware: tegra: Changes for v6.2-rc1
Date:   Sat, 19 Nov 2022 02:20:19 +0100
Message-Id: <20221119012025.3968358-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221119012025.3968358-1-thierry.reding@gmail.com>
References: <20221119012025.3968358-1-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.2-firmware

for you to fetch changes up to 198d4649b0b813bc9fc1605cfb843b6624518f92:

  firmware: tegra: Remove surplus dev_err() when using platform_get_irq_byname() (2022-11-17 23:52:39 +0100)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v6.2-rc1

This adds new BPMP ABI so that newer features can be enabled.
Furthermore, the BPMP driver is updated to use iosys-map helpers to
allow working with shared memory regions that are located in system
memory.

Apart from that, several minor cleanups are included.

----------------------------------------------------------------
Peter De Schrijver (1):
      firmware: tegra: Update BPMP ABI

Thierry Reding (3):
      firmware: tegra: bpmp: Prefer u32 over uint32_t
      firmware: tegra: bpmp: Use iosys-map helpers
      firmware: tegra: bpmp: Do not support big-endian

Yang Li (1):
      firmware: tegra: Remove surplus dev_err() when using platform_get_irq_byname()

 drivers/firmware/tegra/bpmp-debugfs.c      |   62 +-
 drivers/firmware/tegra/bpmp-tegra186.c     |   36 +-
 drivers/firmware/tegra/bpmp-tegra210.c     |   15 +-
 drivers/firmware/tegra/bpmp.c              |   33 +-
 drivers/firmware/tegra/ivc.c               |  150 ++-
 drivers/thermal/tegra/tegra-bpmp-thermal.c |   15 +-
 include/soc/tegra/bpmp-abi.h               | 1796 +++++++++++++++++++++-------
 include/soc/tegra/bpmp.h                   |   17 +-
 include/soc/tegra/ivc.h                    |   11 +-
 9 files changed, 1545 insertions(+), 590 deletions(-)
