Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3754C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Feb 2022 16:47:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235062AbiBYQs0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Feb 2022 11:48:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238399AbiBYQsY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Feb 2022 11:48:24 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B6301C65CF
        for <linux-tegra@vger.kernel.org>; Fri, 25 Feb 2022 08:47:49 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id b5so5438603wrr.2
        for <linux-tegra@vger.kernel.org>; Fri, 25 Feb 2022 08:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sEAbzHBtsMRbbB0Qh6txLc9CyFxKn7iPshhwUtVfgHQ=;
        b=JDA4ZNE+ShzjxEoT7HCdrGSDHjmI4W53S9kDi82hQHtD1TB+0VeeJNszlJplwkiaLm
         XaAnydo8W5AfInN8JidJLp24J45DPfRObUUNFtPKXZAd9HTIcXra5wL/+MtDk+9DOdXC
         H36Gp4ELLLsPe2Fhaq/iK63MVgiqbmEeFNoR1YIWkAhcJ9zQ40gh/1MsCydWMzCpYkB3
         FqJNbYkoIrB6dfmRDqVFXpoHJy5ff3kvfnduw/LU5uev+BnXKmXWY1hBoBV8NxQnlgmR
         YsFBsMtxJ1KhZ7Rgr5SZBg9ODWRodMjbHfGGs8kuUOQOrfwPNaTjdtA5AkKAjmrnYyED
         NIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sEAbzHBtsMRbbB0Qh6txLc9CyFxKn7iPshhwUtVfgHQ=;
        b=E9GHLHSbcANrDp+waxc2XYNhG5OOhePpM9LB3qPvt8yVyyzq28Afilzx2SURqhL84N
         N80S8Xip3FJVexwCpnQCXuWOsBK+wBqjZ40dV+Vz9Bkr+SxRypJ+IlV9HAUN4M8e0Yi9
         NuwrAUh8M/uDZEKARBYhoq0oj59EQtNcjUz/X6V8XM3PghhayEdgRor6syIrBkKlFRV7
         T1enTT6svdE6svujh8KykVk1IcAYR5/AxBaM/Mwx3MLOqEUwqlAjsYpHKwCTWbwnjOc7
         1U9k1Q3um+oi502eZOzvj8Aiy6BduxJ5L7yyG/G8lxNyNRWHxpLGFlZF4M54LvjG4dkg
         XzHw==
X-Gm-Message-State: AOAM531Iv0L2cbzbMHmL41LIHyiiceoOX4yH3XkHHbt1hbbE5jOPlasZ
        OC/ZA0RidJTbt1pe1TbqD5A=
X-Google-Smtp-Source: ABdhPJwriQC0+MVdvf+aMvzIUfh6lPOimFqwgYYwA+ZqNrems5vinnQzgGzPvup8iSKetAwW57IoQg==
X-Received: by 2002:adf:9d84:0:b0:1ed:f546:bd8b with SMTP id p4-20020adf9d84000000b001edf546bd8bmr6442275wre.375.1645807668017;
        Fri, 25 Feb 2022 08:47:48 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id f10-20020a05600c154a00b0037bbbc15ca7sm11923744wmg.36.2022.02.25.08.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 08:47:47 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/5] dt-bindings: Changes for v5.18-rc1
Date:   Fri, 25 Feb 2022 17:47:38 +0100
Message-Id: <20220225164741.1064416-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225164741.1064416-1-thierry.reding@gmail.com>
References: <20220225164741.1064416-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.18-dt-bindings

for you to fetch changes up to a4ad66da3fccebdcbd53d55c035d5851b73f8bcb:

  dt-bindings: memory: Add Tegra234 PCIe memory (2022-02-24 20:00:25 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v5.18-rc1

This contains additions to various DT bindings includes (such as clocks,
resets, power domains, memory controller clients and SMMU stream IDs)
for Tegra234.

----------------------------------------------------------------
Akhil R (2):
      dt-bindings: Add headers for Tegra234 I2C
      dt-bindings: Add headers for Tegra234 PWM

Mohan Kumar (2):
      dt-bindings: Add HDA support for Tegra234
      dt-bindings: Document Tegra234 HDA support

Sameer Pujar (1):
      dt-bindings: Add Tegra234 APE support

Vidya Sagar (3):
      dt-bindings: Add Tegra234 PCIe clocks and resets
      dt-bindings: power: Add Tegra234 PCIe power domains
      dt-bindings: memory: Add Tegra234 PCIe memory

 .../bindings/sound/nvidia,tegra30-hda.yaml         |   3 +
 include/dt-bindings/clock/tegra234-clock.h         | 135 ++++++++++++++++++++-
 include/dt-bindings/memory/tegra234-mc.h           |  75 ++++++++++++
 include/dt-bindings/power/tegra234-powergate.h     |  22 ++++
 include/dt-bindings/reset/tegra234-reset.h         |  45 ++++++-
 5 files changed, 277 insertions(+), 3 deletions(-)
 create mode 100644 include/dt-bindings/power/tegra234-powergate.h
