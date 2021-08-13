Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F4AC4338F
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Aug 2021 16:22:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1BE1E610FA
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Aug 2021 16:22:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234309AbhHMQWf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 13 Aug 2021 12:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233593AbhHMQWe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Aug 2021 12:22:34 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF914C061756
        for <linux-tegra@vger.kernel.org>; Fri, 13 Aug 2021 09:22:06 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id h24-20020a1ccc180000b029022e0571d1a0so7254286wmb.5
        for <linux-tegra@vger.kernel.org>; Fri, 13 Aug 2021 09:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=na+WKuSW69ggX7scxHBH8lK2fDYI3JGQA48xr5ljTBg=;
        b=uAI8DEbf+fOWer1VlBt0DU6R9RoJXUdqwH+7FrhTJ2M3emj0lIdaQsVys7sYtZytv4
         4V+PaD8MqEk0+DOAUVnQLrRDmNXKC+UQl3KLKQJbK7zS6MAKiPs3+2HN8WHa6PBacvGl
         ig9tQL93P3ZTY+GisuEs9vJARu2WQS2WnCr8Jj2wRB6T+XlmrJldcZ4MOcfy0uKwKOnC
         OCEhpK2YRr/O8vfJ7AQWwOhQ1Ce9NyUzmgc3doU7NXQBPSo6m1MkOcj7q2SQ6VVfOETI
         Zgj/U/W+M2TQscUyOd4C51uuW9Nga25Bbtl37cVXKoETmpy5V7bycEDiZxn7I08fO+uc
         XVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=na+WKuSW69ggX7scxHBH8lK2fDYI3JGQA48xr5ljTBg=;
        b=AAGA+DouTlpPueDJmWeuRGCWuNs1luwfcNn7NIAfSk3AtpyY9+j5AsLE3KAOet1Bal
         hWmPYEH8zxh3wG/gLEP9yA89tO5ysFCFWzW1tQZ8Oa9sGr0wX4wUlFn8juHTGluPyY9/
         br6lj+Aa96H2mZnLeIVvVFO29oaLVcGQO8nrJg+IlkPyAPz9ymHhBye2OuugaEZH2VHk
         KTLs0piJTvbjBAJzeq4S7K0OZrO3npj3r7GpiofDfP7Mq/wu5PkGzO6eEevGnIjC+AQr
         Zm7rAX1j+BAB8Oct5++B8sIpiHwD9VlmCV67its8HI9VDiuxjG/J0QcEa1M3AK6I1QcQ
         cMig==
X-Gm-Message-State: AOAM531dY5u+uTuSp2cfxFtKf9GPoKtaGUlD2wcLrRzMCp8jeyFvM1er
        1QZhxDZ9K4zt9FxZryJMjJA=
X-Google-Smtp-Source: ABdhPJyR7mqyoJ/Ie3E1m/so/oG020CZ4raAk3ZnLRHH7Obbkp76F1v2zZNFWMVZkiXU2gCjnniS+w==
X-Received: by 2002:a05:600c:1ca7:: with SMTP id k39mr3650192wms.115.1628871725411;
        Fri, 13 Aug 2021 09:22:05 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id g9sm1812046wmk.34.2021.08.13.09.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 09:22:04 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/6] ARM: tegra: Device tree changes for v5.15-rc1
Date:   Fri, 13 Aug 2021 18:21:55 +0200
Message-Id: <20210813162157.2820913-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210813162157.2820913-1-thierry.reding@gmail.com>
References: <20210813162157.2820913-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.15-arm-dt

for you to fetch changes up to 2270ad2f4e123336af685ecedd1618701cb4ca1e:

  ARM: tegra: tamonten: Fix UART pad setting (2021-08-13 17:59:41 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v5.15-rc1

The majority of this is temperature sensor additions for various devices
and fixes to the trigger type of the thermal interrupts.

Other than that there are various minor fixes across the board.

----------------------------------------------------------------
Andreas Obergschwandtner (1):
      ARM: tegra: tamonten: Fix UART pad setting

Dmitry Osipenko (15):
      ARM: tegra: Add SoC thermal sensor to Tegra30 device-trees
      ARM: tegra: ouya: Add interrupt to temperature sensor node
      ARM: tegra: paz00: Add interrupt to temperature sensor node
      ARM: tegra: nexus7: Add interrupt to temperature sensor node
      ARM: tegra: acer-a500: Add interrupt to temperature sensor node
      ARM: tegra: nyan: Correct interrupt trigger type of temperature sensor
      ARM: tegra: apalis: Correct interrupt trigger type of temperature sensor
      ARM: tegra: cardhu: Correct interrupt trigger type of temperature sensor
      ARM: tegra: dalmore: Correct interrupt trigger type of temperature sensor
      ARM: tegra: jetson-tk1: Correct interrupt trigger type of temperature sensor
      ARM: tegra: acer-a500: Remove bogus USB VBUS regulators
      ARM: tegra: acer-a500: Add power supplies to accelerometer
      ARM: tegra: acer-a500: Use verbose variant of atmel,wakeup-method value
      ARM: tegra: acer-a500: Improve thermal zones
      ARM: tegra: nexus7: Improve thermal zones

 arch/arm/boot/dts/tegra114-dalmore.dts             |  2 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi        |  2 +-
 arch/arm/boot/dts/tegra124-apalis.dtsi             |  2 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts          |  2 +-
 arch/arm/boot/dts/tegra124-nyan.dtsi               |  2 +-
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts    | 90 ++++++++++++++--------
 arch/arm/boot/dts/tegra20-paz00.dts                |  4 +
 arch/arm/boot/dts/tegra20-tamonten.dtsi            | 14 ++--
 .../dts/tegra30-asus-nexus7-grouper-common.dtsi    | 60 ++++++++++++++-
 arch/arm/boot/dts/tegra30-cardhu.dtsi              |  2 +-
 arch/arm/boot/dts/tegra30-ouya.dts                 | 13 ++--
 arch/arm/boot/dts/tegra30.dtsi                     | 87 ++++++++++++++++++++-
 12 files changed, 218 insertions(+), 62 deletions(-)
