Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41941C04A94
	for <linux-tegra@archiver.kernel.org>; Fri, 28 Jul 2023 09:41:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233765AbjG1Jlh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 28 Jul 2023 05:41:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233520AbjG1Jlg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 28 Jul 2023 05:41:36 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5175E4F
        for <linux-tegra@vger.kernel.org>; Fri, 28 Jul 2023 02:41:35 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-98de21518fbso276483666b.0
        for <linux-tegra@vger.kernel.org>; Fri, 28 Jul 2023 02:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690537294; x=1691142094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHnrs0avNcz6B2UJJhrTanCpbWKAitcwJk0lhG8vNOI=;
        b=nq1j+cDmvvM/cFLkO2PCdUy0mCEorEoCUp7V75USc4JOSQiSHxc1JjQtzgjYFnYWsk
         hszYXM1VYE+Xb2h+L2S1nh81S9yiELuI6XSKrMbgBA3qjPuq7nHtDObJmQWX3waonvni
         Zm9YcpkEjlprJeooO246/Ite+MB9YRUDr2tmcDAXkix3wmWZ9LXySEehvT1VzhJ+GY2P
         duqqcRd2Su2GYvbHEL4nivbmhWGTANsj3G/eiQQMxsCxot2OKZv8/lfg1P2v3kKrxu3b
         AwGwpsSWIQiDaOLpc3pGGB90Q0k8cjT/Z/89aA88Li57+IuAimLnnNoHOULMesKsrl+O
         q0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690537294; x=1691142094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHnrs0avNcz6B2UJJhrTanCpbWKAitcwJk0lhG8vNOI=;
        b=YlLaXYgEL/xANT0F8JR9G+O3fuagRbJrFTxXibnpW6GX8Tg/rVGtsqian4u15dakut
         Zy58DS4MGVOBGtYs7aHO34VM/LJOPWBVP6XsNYj3+gSetBhP3vqaQBx7+pk48ukVDZ7u
         XZEHjVPcJIlRtKWeHY9PPuEx7D7HFMLW5OgMO+JNn4ME8bB0qqPSJnjTuDhJKqu0wcBL
         6/jSv0KIuyYeevZnXCwkchCQ5YQt2LLKDICiMZrjP0eOcLJx27LcQQozCUbBQlrXLBCU
         Rnhl8Y1EEaoApoUJiAfnrfszjYwxkdBfD9/4hL5Qz0an03dADLtfBS3c9olVynmiW2Kb
         8sEg==
X-Gm-Message-State: ABy/qLZ0mkMH7iaCB0BULbV4ZRgiJgP4t6i30ItSdBZVT71MVG09oF1T
        16JeYL6tNsdwNDpym+6fRGs=
X-Google-Smtp-Source: APBJJlHmr33LD+0DHO7wtjDs/BUKC7oFI9D+QfOf9EVlI4wBpHIEXMpgAed/LodvyY38WW4xeGoq6A==
X-Received: by 2002:a17:906:518c:b0:993:dd1d:8251 with SMTP id y12-20020a170906518c00b00993dd1d8251mr2239977ejk.28.1690537293992;
        Fri, 28 Jul 2023 02:41:33 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id u17-20020a1709060b1100b00992bea2e9d2sm1855588ejg.62.2023.07.28.02.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 02:41:33 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/4] dt-bindings: Changes for v6.6-rc1
Date:   Fri, 28 Jul 2023 11:41:26 +0200
Message-ID: <20230728094129.3587109-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230728094129.3587109-1-thierry.reding@gmail.com>
References: <20230728094129.3587109-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.6-dt-bindings

for you to fetch changes up to 72738fdeccd172210539a786e23b09b67565d509:

  dt-bindings: firmware: Add support for tegra186-bpmp DRAM MRQ GSCs (2023-07-26 18:23:42 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.6-rc1

A number of Tegra-specific bindings are converted to json-schema and the
reserved-memory and BPMP bindings get support for Tegra264.

----------------------------------------------------------------
Peter De Schrijver (2):
      dt-bindings: reserved-memory: Add support for DRAM MRQ GSCs
      dt-bindings: firmware: Add support for tegra186-bpmp DRAM MRQ GSCs

Thierry Reding (7):
      dt-bindings: arm: tegra: flowctrl: Convert to json-schema
      dt-bindings: arm: tegra: ahb: Convert to json-schema
      dt-bindings: serial: tegra-hsuart: Convert to json-schema
      dt-bindings: cpu: Document NVIDIA Tegra186 CCPLEX cluster
      dt-bindings: clock: tegra: Document Tegra132 compatible
      dt-bindings: arm: tegra: nvec: Convert to json-schema
      dt-bindings: thermal: tegra: Convert to json-schema

 .../devicetree/bindings/arm/tegra/nvidia,nvec.txt  |  21 --
 .../bindings/arm/tegra/nvidia,tegra20-ahb.txt      |  17 -
 .../bindings/arm/tegra/nvidia,tegra20-flowctrl.txt |  18 -
 .../bindings/clock/nvidia,tegra124-car.yaml        |   4 +-
 .../cpu/nvidia,tegra186-ccplex-cluster.yaml        |  37 ++
 .../bindings/firmware/nvidia,tegra186-bpmp.yaml    |  39 ++-
 .../nvidia,tegra264-bpmp-shmem.yaml                |  47 +++
 .../bindings/serial/nvidia,tegra20-hsuart.txt      |  73 ----
 .../bindings/serial/nvidia,tegra20-hsuart.yaml     | 125 +++++++
 .../devicetree/bindings/soc/tegra/nvidia,nvec.yaml |  84 +++++
 .../bindings/soc/tegra/nvidia,tegra20-ahb.yaml     |  40 +++
 .../soc/tegra/nvidia,tegra20-flowctrl.yaml         |  41 +++
 .../bindings/thermal/nvidia,tegra124-soctherm.txt  | 238 -------------
 .../bindings/thermal/nvidia,tegra124-soctherm.yaml | 380 +++++++++++++++++++++
 14 files changed, 791 insertions(+), 373 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,nvec.txt
 delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt
 delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-flowctrl.txt
 create mode 100644 Documentation/devicetree/bindings/cpu/nvidia,tegra186-ccplex-cluster.yaml
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/nvidia,tegra264-bpmp-shmem.yaml
 delete mode 100644 Documentation/devicetree/bindings/serial/nvidia,tegra20-hsuart.txt
 create mode 100644 Documentation/devicetree/bindings/serial/nvidia,tegra20-hsuart.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/tegra/nvidia,nvec.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-ahb.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-flowctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
