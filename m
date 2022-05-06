Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCAB2C433EF
	for <linux-tegra@archiver.kernel.org>; Fri,  6 May 2022 14:30:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442212AbiEFOeM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 6 May 2022 10:34:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442210AbiEFOeE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 6 May 2022 10:34:04 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D047DB9
        for <linux-tegra@vger.kernel.org>; Fri,  6 May 2022 07:30:17 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id k126-20020a1ca184000000b003943fd07180so4483165wme.3
        for <linux-tegra@vger.kernel.org>; Fri, 06 May 2022 07:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qj8VvfvNLf5X/XXAEqMgbERZ6Sf7ST2uQfq1vXcwhpI=;
        b=NVqgU+o7fiPGaCVuxDtU40bjPMu6PjKZOa/GRG9U1vFjE8HFjkCINfQNB6heayiSDV
         DHEsW5MGwLMzZTwTK8tni9SJkrUoOteY6+qxBOI6bcj8ttzJavTQY1/D3GQPQzqlwWke
         ICbgJPbCvMIG3hF/bfdD26ZAB0POTg1MT6pffqJzCD6X/W/vr8F0AdalO/ZQzuEtwV9C
         KDUM+FZJZs+cPYP9AUsng7AIFILS/Gu42uCfyHor1YpXsD+qUu1uDbf9y10FW55mDK3w
         h//UnuVyESMvsDgIjUZFgX0Gk0nR4xUZst5zXsOLf0o/apllyM8Cq/exwA6X6qiMcq5w
         52HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qj8VvfvNLf5X/XXAEqMgbERZ6Sf7ST2uQfq1vXcwhpI=;
        b=uphOLcQYxZDZde5wNR1LdzKTFycMQESleSHVgmjKzDaOxO8u0CVLncSs1qy0S1+Cmk
         VDk28DzFwAaKXuEKW9XlyH8P8lr/yp1JkNOOMtmbi5GbAJi7k1AqNvBVeJzy04AMUe9E
         78It+yZN4F+n3fsQiDywO0LrpFolCX/ytrcbR9D788IoCnb+3lx/hcGXTXRfI8ZxbODH
         6OFLxuIWvgwQ9ga7hb0/9apbJBxGk00V6Kwwh3Ol1HY5q8jqPd3d5ojet7pvqwXIlGDH
         PHieGBRKfCLeN551Bt6smRoV7ygtTTnKC8LV341vrNAEqi+0CmC6yjgyLBVkInlq/JcC
         1a5A==
X-Gm-Message-State: AOAM530pDN9vnTizK+Yro30iuFjjXcH9M3pCmq5d96BgWVEGZ+nwe9TK
        kl++PAVbWkNl4KavPZFwykNM7sV9kSI=
X-Google-Smtp-Source: ABdhPJzZZ6NlmG3qpIn0vOksUwxltxK41NOzqCYn3QdHEdm6Ii8AyQZCqO1fdsplbWsFIJ5TnL870A==
X-Received: by 2002:a05:600c:a42:b0:393:d831:bf05 with SMTP id c2-20020a05600c0a4200b00393d831bf05mr3556821wmq.187.1651847416293;
        Fri, 06 May 2022 07:30:16 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id b9-20020a5d6349000000b0020c5253d8c3sm3786285wrw.15.2022.05.06.07.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 07:30:15 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/6] arm64: tegra: Device tree changes for v5.19-rc1
Date:   Fri,  6 May 2022 16:30:04 +0200
Message-Id: <20220506143005.3916655-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220506143005.3916655-1-thierry.reding@gmail.com>
References: <20220506143005.3916655-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.19-arm64-dt

for you to fetch changes up to 0017f2c856e21bb900be88469e15dac4f41f4065:

  arm64: tegra: Add missing DFLL reset on Tegra210 (2022-05-04 11:22:43 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.19-rc1

This adds some improvements on Tegra234 (QSPI, CCPLEX), improves the
SDMMC clock speed on Tegra194 and adds the ASRC audio block on various
chip generations. Memory controller channels are also added on Tegra186
and later and the missing DFLL reset is added for Tegra210.

----------------------------------------------------------------
Aniruddha Rao (1):
      arm64: tegra: Update SDMMC1/3 clock source for Tegra194

Ashish Mhetre (1):
      arm64: tegra: Add memory controller channels

Ashish Singhal (1):
      arm64: tegra: Add QSPI controllers on Tegra234

Diogo Ivo (1):
      arm64: tegra: Add missing DFLL reset on Tegra210

Jon Hunter (1):
      arm64: tegra: Update PWM fan node name

Sameer Pujar (2):
      arm64: tegra: Add ASRC device on Tegra186 and later
      arm64: tegra: Enable ASRC on various platforms

Sumit Gupta (1):
      arm64: tegra: Add node for Tegra234 CCPLEX cluster

 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 223 ++++++++++++++++++++
 .../dts/nvidia/tegra186-p3509-0000+p3636-0001.dts  |   2 +-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  15 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 225 ++++++++++++++++++++-
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi | 225 ++++++++++++++++++++-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  42 +++-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |   2 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   5 +-
 .../arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi |  12 ++
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  | 223 ++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |  67 +++++-
 include/dt-bindings/clock/tegra234-clock.h         |   8 +
 include/dt-bindings/reset/tegra234-reset.h         |   2 +
 13 files changed, 1038 insertions(+), 13 deletions(-)
