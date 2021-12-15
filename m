Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38260C433FE
	for <linux-tegra@archiver.kernel.org>; Wed, 15 Dec 2021 16:26:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244588AbhLOQ0Z (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 15 Dec 2021 11:26:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235247AbhLOQ0Z (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Dec 2021 11:26:25 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBF49C061574
        for <linux-tegra@vger.kernel.org>; Wed, 15 Dec 2021 08:26:24 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id a18so39172039wrn.6
        for <linux-tegra@vger.kernel.org>; Wed, 15 Dec 2021 08:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i7wWXueumBpxvpt3CRkJLtH1idEzNW/GlYM9K5fnKu4=;
        b=k1rETn9HkIBex934GCnqta61OfsBUR7z4i6lwLcketY2a1OhrOXyyFlxybBMk2Tk6w
         iX6IkpwuUrGKaoHEKnXkvTrZn/ey5UMlrjcEjj1Tdp04ZKLrPOyQoUOQJbW1tZ7n858H
         cJqJSPdwCBbumYvVoEVZiCxrorFd8PwG48iOLLIfyLQ0pzP8TJtzMnP/jiI1og10pdM/
         /iXI2ZDfdCShqRC+UHcZhUi3ZjELjF7Myf76ZHcIjAKZkwdro6XHONojrX+gJzu9OP6i
         QUaBiC36PhZvgrkNO/d9Ga6FYUxPlMIFYAj0cTGLZH+gxE2togTySfPHi0ean7vY4P2O
         Gopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i7wWXueumBpxvpt3CRkJLtH1idEzNW/GlYM9K5fnKu4=;
        b=ieS45icOy7ouuNAEoLoraFtMhRBe7ycDjfyKR+kUbKR49QRSD6/mYVEjzok82AFscy
         FUc8Hz4jFkcuQ4/ZdlksL+FSj2EcnvF6T8uidunFCabxqos6LOoCiTKNgxjveBlCDR0r
         hR/b+myzCi2LHqnS1mFseR2DnLwqnlPZZhoyq8Jm6vaiUzggEIIAkEkdhejcDaCo+1AL
         IJys45IBP1aSPTzxAHwgXonzFVpHxFuRPszvsYwPF77r6yAHdUik0ED85QFlICWqbsEE
         nl4nW9eW4fbJ6zM223yfC/tacPGvR3wWCZ3MBNgWjHbxi2mw1Pluwsh5yVraT04+G9NS
         3Jtw==
X-Gm-Message-State: AOAM533pBPwmXZyD1tkV0aOoQ60bqEVWXNgo7kMX3GX6kex4jRbw0VLg
        IFtwmZvtaLC9rhAlvfjZsb4=
X-Google-Smtp-Source: ABdhPJyDN7900ndzWAS8GYNF/EXE9loh52/7cQL418PjO9H2GbjhCUu/JMKwaKr3/K8lzWKUC6bv+w==
X-Received: by 2002:a05:6000:89:: with SMTP id m9mr5147846wrx.427.1639585583545;
        Wed, 15 Dec 2021 08:26:23 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id j32sm2157957wms.40.2021.12.15.08.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 08:26:22 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] soc/tegra: Fixes for v5.16-rc6
Date:   Wed, 15 Dec 2021 17:26:18 +0100
Message-Id: <20211215162618.3568474-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 76d89474310e05d9c592a8beed2aefe4d3396d2d:

  soc/tegra: pmc: Use devm_platform_ioremap_resource() (2021-10-08 21:42:41 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-soc-fixes

for you to fetch changes up to a7083763619f7485ccdade160deb81737cf2732f:

  soc/tegra: fuse: Fix bitwise vs. logical OR warning (2021-12-15 17:19:06 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Fixes for v5.16-rc6

This contains a single build fix without which ARM allmodconfig builds
are broken if -Werror is enabled.

----------------------------------------------------------------
Nathan Chancellor (1):
      soc/tegra: fuse: Fix bitwise vs. logical OR warning

 drivers/soc/tegra/fuse/fuse-tegra.c | 2 +-
 drivers/soc/tegra/fuse/fuse.h       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
