Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6817DC433EF
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 22:47:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4ABC861037
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 22:47:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbhJFWtf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Oct 2021 18:49:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbhJFWte (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Oct 2021 18:49:34 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6079C061746;
        Wed,  6 Oct 2021 15:47:41 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id 11so2977133qvd.11;
        Wed, 06 Oct 2021 15:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fmfJZoiezKjhMS0yhUUOKnAp2o5kdgOEsznHl6hGCmE=;
        b=TkHp3IC60HiRu352jgGDC/aCYqkkjlIPU7AHzZ+bDXD1JuTpySdC2OZgfdjenfPNgY
         7e+tjgIkzq7/y3geLDMT/ypLVLYcyr+LehnXrx5qhMXEGMTptAieMBARQZwDBjNbZl5C
         voUnYX/H4vGtTF7XNSAturjLe5Ef9L2QebDtO12h3uBxYov1DNtuZFPm7L0qgEge6NCa
         +YVfzBIliGHy+Hu1CGbDZZLJiAZRQKr6xlPdIAOJR1bKU6AE8tg89Fx4QRYBp/gr1MH9
         gMwo39/ePh73WRcVt1CKaWuWkbyuHdcmf3nmQ/QLicxKds5jbgJRgEVr7sdXtrU0QJKH
         TCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fmfJZoiezKjhMS0yhUUOKnAp2o5kdgOEsznHl6hGCmE=;
        b=A2ge+3jW4v4114Zgw0dv5D3J2DKEVGGGXQlgLI5tsVPyiefORLlnXvEE022jLqTrZ5
         SQGXL+mm6L/Ck0007C821JyRnJU6k+bweE4fiKeUGjUez2mxSw4zrSjKCwO2ADHyfWZK
         dvYhrBWGetGmKt5iWYvvadUqR59BgrJ0CehPDJL2FesGQxoq9xxt/i8DVzB1E34IZsnC
         BQarLaykUm85OAVyoTQKSuXlBoyyP6vCyUXDfg0gxGjPaLrUG5E3HLOcwbFcoO0IiPPn
         RFHywFudUqGzR2SvpzNeNPod9JnbeXvjJkVLPOp+3+uciI3MSDzGQDd6AqnY4MLtNLi4
         GxHQ==
X-Gm-Message-State: AOAM530KRiPqxQupwKT2HSr8aERkh2OFIuXb1OyVJp76mGb6mwNT3KN/
        lodqTzeTe7m5uSpyMpmaeRo=
X-Google-Smtp-Source: ABdhPJwfvnOHVaScZfcSkaZziZZhKh7u3il2EXrq8/0ecMupIDB6otYdflFVdAQZAE9014HnUDF5vw==
X-Received: by 2002:a05:6214:ac8:: with SMTP id g8mr724034qvi.32.1633560461031;
        Wed, 06 Oct 2021 15:47:41 -0700 (PDT)
Received: from localhost.localdomain (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.gmail.com with ESMTPSA id n11sm14738166qtk.92.2021.10.06.15.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 15:47:40 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v5 0/9] tegra20-emc: Identify memory chip by LPDDR configuration
Date:   Thu,  7 Oct 2021 01:46:50 +0300
Message-Id: <20211006224659.21434-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Support memory chip identification by LPDDR2 configuration, which is
needed by ASUS Transformer TF101 tablet device that doesn't store RAMCODE
in Tegra's NVMEM.

Changelog:

v5: - Added new patch which adds vendor prefix for Elpida Inc.

    - Added new patch that updates existing device-tree to use proper
      lowercase "elpida," compatible prefix.

    - Changed Krzysztof's email address in the LPDDR2 binding.

    - Added uint32 types to the LPDDR2 binding, which was requested
      by Krzysztof Kozlowski.

v4: - Moved DDR bindings directory to memory-controllers/, like it
      was suggested by Krzysztof Kozlowski.

    - Converted existing LPDDR2 binding to schema and utilized it,
      like it was requested by Krzysztof Kozlowski.

    - Added Elpida B8132B2PB-6D-F compatible.

    - Made code changes that were requested by Krzysztof Kozlowski.

v3: - Corrected sub-node name in tegra20-emc.yaml.

v2: - Added separate binding for standard LPDDR2 properties, like it
      was suggested by Krzysztof Kozlowski.

    - Switched Tegra binding to use new lpddr2-configuration sub-node
      that contains the standard properties.

    - Extended commit message of the "emc: Document new LPDDR2 sub-node"
      patch, telling how the properties are supposed to be used, which
      was requested by Krzysztof Kozlowski.

    - Added new common helpers for parsing LPDDR2 properties and made
      tegra20-emc driver to use these helpers.

Dmitry Osipenko (9):
  dt-bindings: Relocate DDR bindings
  dt-bindings: memory: lpddr2: Convert to schema
  dt-bindings: memory: lpddr2: Add revision-id properties
  dt-bindings: memory: lpddr2: Document Elpida B8132B2PB-6D-F
  dt-bindings: Add vendor prefix for Elpida Memory
  ARM: dts: elpida_ecb240abacn: Change Elpida compatible
  dt-bindings: memory: tegra20: emc: Document new LPDDR2 sub-node
  memory: Add LPDDR2-info helpers
  memory: tegra20-emc: Support matching timings by LPDDR2 configuration

 .../devicetree/bindings/ddr/lpddr2.txt        | 102 --------
 .../memory-controllers/ddr/jedec,lpddr2.yaml  | 223 ++++++++++++++++++
 .../ddr/lpddr2-timings.txt                    |   0
 .../ddr/lpddr3-timings.txt                    |   0
 .../{ => memory-controllers}/ddr/lpddr3.txt   |   0
 .../nvidia,tegra20-emc.yaml                   |  23 +-
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/elpida_ecb240abacn.dtsi     |   2 +-
 drivers/memory/jedec_ddr.h                    |  47 ++++
 drivers/memory/jedec_ddr_data.c               |  41 ++++
 drivers/memory/of_memory.c                    |  87 +++++++
 drivers/memory/of_memory.h                    |   9 +
 drivers/memory/tegra/Kconfig                  |   1 +
 drivers/memory/tegra/tegra20-emc.c            | 199 ++++++++++++++--
 14 files changed, 617 insertions(+), 119 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/ddr/lpddr2.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
 rename Documentation/devicetree/bindings/{ => memory-controllers}/ddr/lpddr2-timings.txt (100%)
 rename Documentation/devicetree/bindings/{ => memory-controllers}/ddr/lpddr3-timings.txt (100%)
 rename Documentation/devicetree/bindings/{ => memory-controllers}/ddr/lpddr3.txt (100%)

-- 
2.32.0

