Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94568C433FE
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Nov 2022 17:14:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231366AbiKUROZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Nov 2022 12:14:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231419AbiKURNp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Nov 2022 12:13:45 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53CB4D06F3
        for <linux-tegra@vger.kernel.org>; Mon, 21 Nov 2022 09:12:46 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id b8so6393911edf.11
        for <linux-tegra@vger.kernel.org>; Mon, 21 Nov 2022 09:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pY70Yev9QdiV3UD01epXVUTgE//iw8cadwhCJt+Sn+s=;
        b=DLZlZFu42apwdJHgOEo/yiU8+64XPQWVTmj+RggiQ3Jg00Z5Hype8GMW+DXcftyAc3
         ESFnati4U0N/v78cKN/0RAOhh9l8Kcf7qgNb89+vM0WR7Q3gTN/N+4+FAWtuc0dhcgt4
         yXEZ2x5e1eaMg9hmi/aUf5T3y9agOdlDENsIppQuO3/m/YbWOIBpgM0KJnpLLPQklYm8
         MeWKJzlOHK+1u5GU9zOydveppussejTzpxx39nUgKPpDGC9XMrb7LFP9ei3Fuh7xxx2B
         GSACM7orsYsn4g3YmyHzGvS+zWye5nu1VFQgFUjVLIqRT1KqXSVy2BwgK4mSGm+sfLlL
         MzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pY70Yev9QdiV3UD01epXVUTgE//iw8cadwhCJt+Sn+s=;
        b=ZdrhS8guz2FB+A1bv2yEPdPTFT+vbRMZozbbE4cg28jgvIpWR8WGHTlMWZyiDcM3fW
         alOGnK73+uvxoocGLCip8yXxf9sB4j8Gp44p88VeMCrGKYY1PLKhDpccjJrF85/dP94L
         2IYGpRRkRRrYKvi0wB0hQ/G/uV9a3syUUuRU6iR68gx+ILqz/XqjCchZb5YdmbnLF+NE
         gMV0KbuCEPIu0WXJdyPy+XWWRGk4ytlKn8wEsCPv1zZwhFes3cllarWlP6cJ+rzhmt7c
         Jtu34nr4aXX63k+kjrB1fLe1Zl/slCxB5htypF03W4czxUckqNhz0XBCcIjBogTHf0de
         wAWA==
X-Gm-Message-State: ANoB5pkQB7Du2/ufsWS7AlzRTGr83keJYwBfUFInz1k0zeVpKLDoPzpe
        UDEEGThsl3l+sBRpha7OjxDbDsFBhQU=
X-Google-Smtp-Source: AA0mqf6tRk51Lbhn8FiGeIXPSjfOadBGoIYut3ULUNNTA21nw4KAgxXV3F5WQDtUI6X6GJI9acoH6Q==
X-Received: by 2002:aa7:d94a:0:b0:463:6b8f:f203 with SMTP id l10-20020aa7d94a000000b004636b8ff203mr17139124eds.236.1669050764890;
        Mon, 21 Nov 2022 09:12:44 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id k19-20020aa7c053000000b00456c6b4b777sm5321535edo.69.2022.11.21.09.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 09:12:44 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2 2/7] firmware: tegra: Changes for v6.2-rc1
Date:   Mon, 21 Nov 2022 18:12:34 +0100
Message-Id: <20221121171239.2041835-2-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.2-firmware-v2

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
