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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF0CC433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 19:33:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D1C764D9A
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 19:33:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233005AbhA2Tdr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Jan 2021 14:33:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232849AbhA2Tdq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Jan 2021 14:33:46 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E95BC06174A
        for <linux-tegra@vger.kernel.org>; Fri, 29 Jan 2021 11:33:06 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id a19so9892708qka.2
        for <linux-tegra@vger.kernel.org>; Fri, 29 Jan 2021 11:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UF1FuT9xzOslp9BVbzccUgOHaBgiNbyOucfQV9Cc5yo=;
        b=p7Bxm9vXWp1Jsk7ePN8o05nMake6NtcSCHPOUp4IBM8uA6cRJMVtj/PQ2f8JT+w2yN
         S1zS0LbAiVE6LteP/hEaHXYE5QWLHzkZ66rOrOAc49BNUQ4UwtFqZbQjjI9a5fA7euvE
         tHj7f4UXx2/DEJzqcFdArsL+9FIk5PgrF4A/Goxznvjd4vvmeMprDgaruLqthn+2aSLY
         oeMnOzsTHqfZq7gi04uI+ugWd7+KqwJc9tLjf6d55wrqrRioHVz3JHcOGzGAcNZ7x8fD
         Ab6Ol8yUSisOuF7llSasEenm2TwZ52VvyEo4nhXrfOKubM84dLxMPOhMx6MPmXb/Qjif
         C4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UF1FuT9xzOslp9BVbzccUgOHaBgiNbyOucfQV9Cc5yo=;
        b=hPCmmjTNSJG4OjkUY8V/dLiWTtXg0V30RpGSz1ioqv/bdtdlG0MVzPqe/9CB5PyEIP
         kok5XyqhatxwM3iRl1MRL9fB2aczFzpu+V3Yxzz2kaM2/5ty71ekg3bH5h9G+yIR3TyU
         ZksRaZpOopeX3AqcfXHVvIw6qD4U/QQt1TGLhqd0vY19V7Ua0eX9cMstCo/0jB9sp3GM
         Axru5zMAK2aqeAawiBEYkNr2D1wnXEgK++xaRytFck7A5o5erL5kxIWpjIEUrEiWRZY0
         tfs/WYNRlO21D05+yVfurjwbffZYU8Dz8NfMW3O5Zg/AgBzzx1ExaBo+jJX3LquL7VRg
         Cn/Q==
X-Gm-Message-State: AOAM533cYw6KZQmoI6ro94uu5VV/6UuqdIzEOMUXRhxZ9JvNYPTzW5eS
        n8rlykW+c17HoiRZnRMgUII=
X-Google-Smtp-Source: ABdhPJzjSr3CRtJQQqcROceNY8YzqlkRQ25Fs6knj39dqXcwFByXRuKueo1b3ldP5TkneR94nG3FAw==
X-Received: by 2002:a37:67d6:: with SMTP id b205mr5464511qkc.69.1611948785521;
        Fri, 29 Jan 2021 11:33:05 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id h25sm6766606qkh.133.2021.01.29.11.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 11:33:04 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/6] ARM: tegra: Device tree changes for v5.12-rc1
Date:   Fri, 29 Jan 2021 20:32:51 +0100
Message-Id: <20210129193254.3610492-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210129193254.3610492-1-thierry.reding@gmail.com>
References: <20210129193254.3610492-1-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.12-arm-dt

for you to fetch changes up to 3029a563ac0ccd39b9dc53eadfb9c0e3fb57a449:

  ARM: tegra: ouya: Fix eMMC on specific bootloaders (2021-01-29 17:08:03 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v5.12-rc1

Fixes the pinmux configuration for the eMMC on the Ouya to fix issues
with certain bootloaders.

----------------------------------------------------------------
Peter Geis (1):
      ARM: tegra: ouya: Fix eMMC on specific bootloaders

 arch/arm/boot/dts/tegra30-ouya.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
