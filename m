Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95970C4338F
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 21:20:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76DD860F4B
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 21:20:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231730AbhHBVUr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 2 Aug 2021 17:20:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231675AbhHBVUr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Aug 2021 17:20:47 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18C18C06175F;
        Mon,  2 Aug 2021 14:20:37 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id l4so25651540ljq.4;
        Mon, 02 Aug 2021 14:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y5HDwcPgFO0wIL6EDiNp4UExa/hSrgV/KUielM+lB70=;
        b=NkZ7fYBaE9n0IXzNOS3qlCvM5o82ewlJh+lSYQ3AMpYr2fWIvSiEqPbemGMEKAeus/
         ryVMMMsGT8d2SVAHYFge2gUQcEM7yiTRp05cJxvJ4e++xoz1pLhWVbMlaOZdqBIerB+Z
         a+4lzupKwfQ5h5QwMQRcjKEC+AnAX4VQVzyBJFRspUGYdaVGru+NlzKsJdsSX/Qq5j3h
         It5NO7Shqlqw3TOy9lzbHO1raXvvmDErX7JDhQqXSYYkZDdsvYX2Emnet+1NIaF6/eVn
         0N3wpnX7/Upr+YZQcSePBBqCvkkdyMQXu/VB/RIP6/X+w8DFurd4Tey3lg3XRj5Qyojg
         xwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y5HDwcPgFO0wIL6EDiNp4UExa/hSrgV/KUielM+lB70=;
        b=YDjOWvF3xE7gdAZgoOBMib+1vNeAx3zCwG1RwrXLWI+G0ivnrCzPmqVeQGHLINQ5ab
         w5i2nsHdfPC0Vy3M+UKEIFOE8hY6N/5fR+9z1azq4BflgwBFMkp6yA5VtJ25CFVofU/S
         U0vYNfBgOmSOeFuzQ6b8ge6BZaOt/liHR+FY/QlVULzkacaQH3ykvMj8PRXtjfHFu6jB
         nQTJG+dPqKYnVx4anN/YPo2uyDWVXMfUNVa0XuUB/XapyzJQEuWSIv/qdL1raWphZTVT
         haYoOicZAvI7wvdJWn7EjaeH32VRUt5uzw0QOOnGBrYbBbPwxDbE8e4h1x9mAARArNyp
         1rbA==
X-Gm-Message-State: AOAM532II87L9PVqpwYN+Y38Wh8PNMk8UlGiT7OlnCuQT667DCmXhXI3
        S3LzRMbe2B628+SWBLdYFxcBAdnHRcY=
X-Google-Smtp-Source: ABdhPJxz6GR2DBrKxSEb8jADdnaAMave3FPgC0Xe/Kl63jvfnxlKrmevs8xiDm+VM8OTF/0ffp3/og==
X-Received: by 2002:a2e:98d1:: with SMTP id s17mr12043645ljj.457.1627939235458;
        Mon, 02 Aug 2021 14:20:35 -0700 (PDT)
Received: from localhost.localdomain (94-29-22-96.dynamic.spd-mgts.ru. [94.29.22.96])
        by smtp.gmail.com with ESMTPSA id p14sm764942lfa.117.2021.08.02.14.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 14:20:35 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 00/15] Tegra ARM32 device-tree improvements for 5.15
Date:   Tue,  3 Aug 2021 00:19:32 +0300
Message-Id: <20210802211947.19715-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series:

  - adds SoC thermal sensor node
  - adds interrupt for LM90 to Ouya, AC100, Nexus 7 and A500 devices
  - fixes interrupt of LM90 sensor for all boards
  - removes bogus VBUS regulators from A500 device-tree
  - improves thermal zones of Nexus 7 and A500 devices based on previous
    discussion with Daniel Lezcano [1]

[1] https://lore.kernel.org/lkml/1abadc69-1dd1-5939-c089-37a84be4781b@linaro.org/

Changelog:

v2: - Added these new minor patches:

  ARM: tegra: acer-a500: Add power supplies to accelerometer
  ARM: tegra: acer-a500: Use verbose variant of atmel,wakeup-method

Dmitry Osipenko (15):
  ARM: tegra: Add SoC thermal sensor to Tegra30 device-trees
  ARM: tegra: ouya: Add interrupt to temperature sensor node
  ARM: tegra: paz00: Add interrupt to temperature sensor node
  ARM: tegra: nexus7: Add interrupt to temperature sensor node
  ARM: tegra: acer-a500: Add interrupt to temperature sensor node
  ARM: tegra: nyan: Correct interrupt trigger type of temperature sensor
  ARM: tegra: apalis: Correct interrupt trigger type of temperature
    sensor
  ARM: tegra: cardhu: Correct interrupt trigger type of temperature
    sensor
  ARM: tegra: dalmore: Correct interrupt trigger type of temperature
    sensor
  ARM: tegra: jetson-tk1: Correct interrupt trigger type of temperature
    sensor
  ARM: tegra: acer-a500: Remove bogus USB VBUS regulators
  ARM: tegra: acer-a500: Add power supplies to accelerometer
  ARM: tegra: acer-a500: Use verbose variant of atmel,wakeup-method
    value
  ARM: tegra: acer-a500: Improve thermal zones
  ARM: tegra: nexus7: Improve thermal zones

 arch/arm/boot/dts/tegra114-dalmore.dts        |  2 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi   |  2 +-
 arch/arm/boot/dts/tegra124-apalis.dtsi        |  2 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts     |  2 +-
 arch/arm/boot/dts/tegra124-nyan.dtsi          |  2 +-
 .../boot/dts/tegra20-acer-a500-picasso.dts    | 90 ++++++++++++-------
 arch/arm/boot/dts/tegra20-paz00.dts           |  4 +
 .../tegra30-asus-nexus7-grouper-common.dtsi   | 60 ++++++++++++-
 arch/arm/boot/dts/tegra30-cardhu.dtsi         |  2 +-
 arch/arm/boot/dts/tegra30-ouya.dts            | 13 ++-
 arch/arm/boot/dts/tegra30.dtsi                | 87 +++++++++++++++++-
 11 files changed, 211 insertions(+), 55 deletions(-)

-- 
2.32.0

