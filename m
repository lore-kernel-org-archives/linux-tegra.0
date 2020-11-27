Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F39C2D0E4
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Nov 2020 14:43:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2B27221EB
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Nov 2020 14:43:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="koz+rTEI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730903AbgK0One (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Nov 2020 09:43:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730899AbgK0Ond (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Nov 2020 09:43:33 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C756C0613D1
        for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2020 06:43:33 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id f190so3730715wme.1
        for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2020 06:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bf87zhRXj1rB+Q0/Jbp6kaz21nB1VmzfJGAWcV08pV8=;
        b=koz+rTEItqetq/eUpUIOGTf2gtphqXfcldhFP2SUliEtfI7lCgdq+qyTToo6numRV0
         WJ2arQnN9Re2cT+qH9lNEyrHML0BE2fScIK/IBGHfwiBYNXvSsRALvgOy56dmB/Mxc8Z
         4w8ctPmgmAyDo4wvcG5VDA6TX42dwy1afOWoQwSosT7lP3CaajIPkTadWCcH6mFfCsJY
         9hN/Zpb5zjavnOFdRX10EOCrP9dKiDsAVReXQaCWMzxtrZCVHMzCPbGvYhOeukD9txKL
         1n49WYVCxBlCdtrh/RVDBkY7BvMpCvmkc2Mq5BHgEl/nlQEDRzcEpMknSYV9dP5g0mqo
         z1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bf87zhRXj1rB+Q0/Jbp6kaz21nB1VmzfJGAWcV08pV8=;
        b=fC54JFyD7gK3jZozebVFLbk6twxdrAoJiNgI64joD7UaPFoCQZ5fdOdCf+/wvCFTYs
         yJJaB6w1TL1VsWu8WHeI2Jem6/+KGOnb+ro3Q13FrDHsHkkDb1hUUPj6EcWDe/MTUOmH
         j3sOW7XI8rHlQWP6p4eQTKG3bsXCt8tRZ0LWuY4RLPCAOCcC73kp1qzZbwRjpCMkl6CM
         wb8+5UK8jX6WlpofW+2Zl5RbwN9wPxNiSHTnRIsJXkwmktLpMw97vB49nRUmCNwD9wWY
         QMgcrZWWfEB+5s6l423627c5fwg8aC0rg9gprzO1DH3dChrSymugQw52pv2Bxw4RnlWd
         RmLw==
X-Gm-Message-State: AOAM533eaOnAi3p15WkXSYn+mxZpxblyAWUS26sKEn41/4VFMbuoOpCY
        HkhhrXgkunPVR/Gq+LjYHys=
X-Google-Smtp-Source: ABdhPJzzWo2ewKAb9VDawTiZppvz/xBeR51gfT45me7w/214qIt65/PViSk/oq+lk89ZZDcaDkisUA==
X-Received: by 2002:a1c:7f81:: with SMTP id a123mr9635757wmd.6.1606488212258;
        Fri, 27 Nov 2020 06:43:32 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id i16sm15265995wru.92.2020.11.27.06.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 06:43:31 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] dt-bindings: Changes for v5.11-rc1
Date:   Fri, 27 Nov 2020 15:43:24 +0100
Message-Id: <20201127144329.124891-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.11-dt-bindings

for you to fetch changes up to e36f9381420b28e1785d7900d4c1d9db6149cbcd:

  dt-bindings: bus: Convert ACONNECT doc to json-schema (2020-11-26 19:05:17 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v5.11-rc1

This contains a couple of conversions of bindings to json-schema, as
well as symbolic names for the various memory clients on Tegra20,
Tegra30 and Tegra124. There's also a couple of fixes for Tegra194
pinmux and ARM GIC bindings. Finally, a new vendor prefix is added
for Ouya and the Ouya game console compatible string is defined.

----------------------------------------------------------------
Dmitry Osipenko (3):
      dt-bindings: memory: tegra20: Add memory client IDs
      dt-bindings: memory: tegra30: Add memory client IDs
      dt-bindings: memory: tegra124: Add memory client IDs

Peter Geis (2):
      dt-bindings: Add vendor prefix for Ouya Inc.
      dt-bindings: ARM: tegra: Add Ouya game console

Sameer Pujar (3):
      dt-bindings: dma: Convert ADMA doc to json-schema
      dt-bindings: interrupt-controller: arm,gic: Update Tegra compatibles
      dt-bindings: bus: Convert ACONNECT doc to json-schema

Vidya Sagar (1):
      dt-bindings: Fix entry name for I/O High Voltage property

 Documentation/devicetree/bindings/arm/tegra.yaml   |  3 +
 .../bindings/bus/nvidia,tegra210-aconnect.txt      | 44 ----------
 .../bindings/bus/nvidia,tegra210-aconnect.yaml     | 82 ++++++++++++++++++
 .../bindings/dma/nvidia,tegra210-adma.txt          | 56 ------------
 .../bindings/dma/nvidia,tegra210-adma.yaml         | 99 ++++++++++++++++++++++
 .../bindings/interrupt-controller/arm,gic.yaml     |  9 +-
 .../bindings/pinctrl/nvidia,tegra194-pinmux.txt    |  2 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
 include/dt-bindings/memory/tegra124-mc.h           | 68 +++++++++++++++
 include/dt-bindings/memory/tegra20-mc.h            | 53 ++++++++++++
 include/dt-bindings/memory/tegra30-mc.h            | 67 +++++++++++++++
 11 files changed, 383 insertions(+), 102 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.txt
 create mode 100644 Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.yaml
 delete mode 100644 Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.txt
 create mode 100644 Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.yaml
