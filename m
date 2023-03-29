Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8182DC6FD18
	for <linux-tegra@archiver.kernel.org>; Wed, 29 Mar 2023 15:07:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbjC2PHY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 29 Mar 2023 11:07:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230350AbjC2PHW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 29 Mar 2023 11:07:22 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B1F31BC1;
        Wed, 29 Mar 2023 08:07:16 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id er13so23628949edb.9;
        Wed, 29 Mar 2023 08:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680102435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YUaRoxoy/mAkwWz2HlijC5NpBR7GQ7Zq08lefa01oKY=;
        b=OBJSG982Qlt9bYB9ulPeZ27JYRQgjK2Q4S/AFpXsdvSfvdqp6K8TYKeBNkrOuHL4/u
         lAVuKlEbTyC4TjLXkrTO9u1Wvax0lJwAyHvHNdKhzRPtIXfj0AW47R2qlurq2M8Vrvcc
         tNmG0DjOICH0zcs1mSDmKnTmH+dZIR8bikyEwnRnbCQaWGxM+svLAK6Ud58NXuH6bC3q
         WTkAqkfO2DJNJZl6gb9luc7B37r4NSnWMSAcxxO9wWQwz8cOFD2igyIk2Ta5AatRNhkw
         +cYf3yxaQkF5+YP6ajawHB15F2g9+b3jHgi8u80pv9ocGt+/zOisJsSgGQL0zPehaZoe
         6yeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680102435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YUaRoxoy/mAkwWz2HlijC5NpBR7GQ7Zq08lefa01oKY=;
        b=xfwVrxDUyn8rL93ZefB5tFXViVA/qF6aN8zaFhwvrAUMUhJJQIdBEKku1g6q1khfiX
         e8LtbXKL77YDCGYHH7jemOz1d993IIgLdwVUJeajqURRWEaFBO5VsFjc0Rjf+WNjFQsj
         fKDZ9XEYuVkx3j1VTQWIuqetQBd+uZK0snlNm1/gH6w2TrT7vQWqjHZS8n9LjlKiFaCb
         +784ngPZ8EifO7Nh0D1AqzgipHvoTt8dGj5NF7bGirp9UVD8sSoDJJPqIfbT5HA51UtU
         7TuvALOgBzzREFFSIDTy5NigzraZTne5QtumO57IkvdEADKYxe9dwAyblXZ+ZQjucuRX
         65Zw==
X-Gm-Message-State: AAQBX9eFv0MnkWBzpxofhybYZPEO+uImBdPKX49/jg097ca4wPWM9lZC
        BtNzMI/tTS4GjIYxpYXFpn8=
X-Google-Smtp-Source: AKy350ZbAbqxheX2cvCQxM1gA5xPFlaM9mWYXQfOGA0pf1XIv8K+ZdHRoMPONR1Vc3v7j992XtaPww==
X-Received: by 2002:a05:6402:1002:b0:501:c547:2135 with SMTP id c2-20020a056402100200b00501c5472135mr17940872edu.36.1680102434716;
        Wed, 29 Mar 2023 08:07:14 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a18-20020a50c312000000b004c06f786602sm17162435edb.85.2023.03.29.08.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:07:14 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] arm64: tegra: Add Jetson Orin NX support
Date:   Wed, 29 Mar 2023 17:07:06 +0200
Message-Id: <20230329150710.773441-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

these patches introduce support for the Jetson Orin NX module (P3767)
and the corresponding internal reference carrier (P3768).

Changes in v2:
- add a few nodes that UEFI requires
- fix system EEPROM I2C address
- enable HDA

Thierry Reding (4):
  dt-bindings: tegra: Document Jetson Orin NX
  dt-bindings: tegra: Document P3768+P3767 reference platform
  arm64: tegra: Add Jetson Orin NX support
  arm64: tegra: Add support for P3768+P3767

 .../devicetree/bindings/arm/tegra.yaml        |   8 +
 arch/arm64/boot/dts/nvidia/Makefile           |   1 +
 .../boot/dts/nvidia/tegra234-p3767-0000.dtsi  | 193 ++++++++++++++++++
 .../nvidia/tegra234-p3768-0000+p3767-0000.dts | 133 ++++++++++++
 .../boot/dts/nvidia/tegra234-p3768-0000.dtsi  | 133 ++++++++++++
 5 files changed, 468 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3767-0000.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi

-- 
2.40.0

