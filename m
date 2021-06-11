Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA9BC48BE0
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 16:44:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49F9C613BA
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 16:44:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbhFKQqW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Jun 2021 12:46:22 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:44749 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231384AbhFKQqR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Jun 2021 12:46:17 -0400
Received: by mail-wr1-f47.google.com with SMTP id f2so6739094wri.11
        for <linux-tegra@vger.kernel.org>; Fri, 11 Jun 2021 09:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yl+waXKY/FzeWxugRNcrGJPBmosE4XJtLVOq9NfoCdA=;
        b=HQ8jsuewe8HfyaOnNtZa8C5X/GJcV53S3VkxFu9yC8g9zTX4sEGzIyxPhFj+cPab3V
         Bc1Uy4NJVc/PK9rnWKkbAM8WwrY+v5Ka491sb1RZNjBm5xejxmK7Vl/0x7jNvQDogSDw
         HsjS1IKSBaKvR8YU3G8EJkPWZ/yNzuF4ckpDQbTl69fhWnZVpqTU1ae7022Cg0IFU/ed
         I2478B4vbcuO5l1mIB3jOqscm4O8u03IounH/FhRTjeeqhH8YYunXY8wyYPQSeCzETK9
         VCOodVoz5I7gq/43RNE1bJtFytMWu+twO9WRXgo2PpNjXP0GvLVK3Rbk/Ly942RzS2iD
         eDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yl+waXKY/FzeWxugRNcrGJPBmosE4XJtLVOq9NfoCdA=;
        b=UaZgDS8kD7XOxsX0a9uP/orK2obnz3SoBzXEfZrbwwECq75TqhYMY88KQceZdaxcdC
         0kxpj3jOmv2ooNBH/v1WziP83rNvEorsoblLTHMToxIwG78M3DB8lj9Nr5+xDNVG8a+I
         ayI9zB+Bvy4DB1hn54GYpNtH4AW7huj9pMOHspMobVVCcOzn7UG1gQ44it/t8I9FO/O9
         hMDh0/s4ouCUP6bOmjq0xi9eFAetIAWNGKE+Geenmvy011SxpMVXAhlhk1APAw0UOmvo
         SMz0Weded6DoV5olgqgc27SFfaB5LDX9/qrOcNcWv7PcGX3rmvLZKj9r6WdjkmmUDDAv
         lEmg==
X-Gm-Message-State: AOAM531mH6UH6HiwPcVa29M5YFnZH0AAXf2JeMyxeYlDsa6s6Kg57Wze
        9E9136zZ/AvVG/HXP9HDZtk=
X-Google-Smtp-Source: ABdhPJwpr82yBKai2lqfab3eosWyqwmbA9K9CMq+OT5UOv5auo2zvPeZCX49wZ5z9RhN8vfyvCX2MA==
X-Received: by 2002:a5d:5987:: with SMTP id n7mr5118102wri.293.1623429782907;
        Fri, 11 Jun 2021 09:43:02 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id r4sm8163109wre.84.2021.06.11.09.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 09:43:01 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] dt-bindings: Changes for v5.14-rc1
Date:   Fri, 11 Jun 2021 18:44:32 +0200
Message-Id: <20210611164437.3568059-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.14-dt-bindings

for you to fetch changes up to 5f459cb0d67d6df6f74eac253ea10de9e9986812:

  dt-bindings: soc: tegra-pmc: Document core power domain (2021-06-01 13:45:01 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v5.14-rc1

This contains a conversion of the Tegra clock and reset controller
device tree bindings to the new json-schema format and adds the core
power domain to the PMC device tree bindings.

----------------------------------------------------------------
Dmitry Osipenko (2):
      dt-bindings: clock: tegra: Convert to schema
      dt-bindings: soc: tegra-pmc: Document core power domain

 .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml     |  35 +++++++
 .../bindings/clock/nvidia,tegra114-car.txt         |  63 -----------
 .../bindings/clock/nvidia,tegra124-car.txt         | 107 -------------------
 .../bindings/clock/nvidia,tegra124-car.yaml        | 115 +++++++++++++++++++++
 .../bindings/clock/nvidia,tegra20-car.txt          |  63 -----------
 .../bindings/clock/nvidia,tegra20-car.yaml         |  69 +++++++++++++
 .../bindings/clock/nvidia,tegra210-car.txt         |  56 ----------
 .../bindings/clock/nvidia,tegra30-car.txt          |  63 -----------
 8 files changed, 219 insertions(+), 352 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra114-car.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
 create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
 create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra210-car.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt
