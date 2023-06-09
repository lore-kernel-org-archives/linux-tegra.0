Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA4FC7EE29
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jun 2023 19:36:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231895AbjFITgh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jun 2023 15:36:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231865AbjFITgb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jun 2023 15:36:31 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90D412139
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jun 2023 12:36:30 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-970056276acso320994066b.2
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jun 2023 12:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686339389; x=1688931389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAtEPr9Ys387Pe4RYRZ8iJILAuFrQDNs1SzA9w6+Yyo=;
        b=k0cWRvpS5kSr8RZZFS5wFtvbidYOlyxT5MYwlyuryj1ZrDd8GlXKfHUluc8uOlxdXK
         gdwk9sBN0+Y6hHVLyeDBEP+LIyCmFPNFL9hVLiRihJzWvkDSJ2/RiXbrFA/r6KUky/8D
         QeyrDh5PvyMwhAzcuJt6tAz3snwokLlDyKOqLlAvDLYJiUNbo4Pj3GaDSivW7+Aqcl2R
         Xk69O8QopgncPqWq4uUujWjsIu8s4mgmRuHRYSBU1L/osCKA/pi+WMIMnI/3jyII6eBj
         V/YY6QnLIU2/d5YNtRj1AUH4/gEYJWe4axexIvCtMq6brC4fgKL4JIljqPBa1t3VxFY4
         odGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686339389; x=1688931389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SAtEPr9Ys387Pe4RYRZ8iJILAuFrQDNs1SzA9w6+Yyo=;
        b=ge8Xv02ugVk9ohODORfIMj6O79bVhWxn8TLHach8OkQGJQjs5WZ+hlLrHvflGkPA/c
         oLWDWtWAt+eNyT68Wmp+1a3i3yxQmLHZ3Q4nw8WAMUJKnrsIKY2ASovko7/NSSo5zm6V
         LFbYO9tvaVymF3pnpiog5DXPSQWqOiEtLjvfZ+gXlT/qhSWDWOaBlzw/VHAcdTK+DUW2
         +fIuCtBa+Gd99eHbIsAgH8prL23uvjX7ftwOGKIqplmlK2iuWAaZ+H0JeaTb+Xyx63N2
         GTU8ONftAuMRJOhbv8q0s7YgcGq8fv73Ygot6UcEcE5/8gfzNQ/8wbmIBR/bgZ+P0fi5
         zCcw==
X-Gm-Message-State: AC+VfDx7u7duIQuIeULLCGFd+EQV3+Of5reCDSyCw5XWS2xlIBdB3W/G
        i7Hhd0PNDYUYiSfvWgB/mu4=
X-Google-Smtp-Source: ACHHUZ7oOKplEQYw+eKt0I0zfBetbQxm7g/GHSDvca+tryCErcp39fy8REsaGXCCcnn9tHBYL7moWA==
X-Received: by 2002:a17:907:7e99:b0:967:5c5f:e45c with SMTP id qb25-20020a1709077e9900b009675c5fe45cmr2296589ejc.0.1686339388963;
        Fri, 09 Jun 2023 12:36:28 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id o20-20020a170906601400b00977d3fb2a7dsm1637378ejj.76.2023.06.09.12.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 12:36:28 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/6] dt-bindings: Changes for v6.5-rc1
Date:   Fri,  9 Jun 2023 21:36:17 +0200
Message-Id: <20230609193620.2275240-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609193620.2275240-1-thierry.reding@gmail.com>
References: <20230609193620.2275240-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.5-dt-bindings

for you to fetch changes up to 5f027147e4796e9fc11083b2ad50a91c1ac36ede:

  dt-bindings: tegra: Document Jetson Orin Nano Developer Kit (2023-06-06 14:39:20 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.5-rc1

Several new modules and devices are documented and fixes incorporated
for the Tegra234 GPIO controller pin mappings as well as the possible
Tegra XUDC PHY connections.

----------------------------------------------------------------
Prathamesh Shete (1):
      dt-bindings: gpio: Remove FSI domain ports on Tegra234

Shubhi Garg (1):
      dt-bindings: tegra: Document compatible for IGX

Sumit Gupta (1):
      dt-bindings: tegra: Add ICC IDs for dummy memory clients

Thierry Reding (3):
      dt-bindings: usb: tegra-xudc: Remove extraneous PHYs
      dt-bindings: tegra: Document Jetson Orin Nano
      dt-bindings: tegra: Document Jetson Orin Nano Developer Kit

 Documentation/devicetree/bindings/arm/tegra.yaml     | 14 ++++++++++++++
 .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml   |  7 +------
 include/dt-bindings/gpio/tegra234-gpio.h             | 20 ++++++++------------
 include/dt-bindings/memory/tegra234-mc.h             |  5 +++++
 4 files changed, 28 insertions(+), 18 deletions(-)
