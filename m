Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19485C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 16:38:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E581064FE2
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 16:38:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232493AbhCLQhu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Mar 2021 11:37:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231789AbhCLQhY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Mar 2021 11:37:24 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4EDEC061574;
        Fri, 12 Mar 2021 08:37:23 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id 15so7540936ljj.0;
        Fri, 12 Mar 2021 08:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aMH/wfW4yjgJKNSy/oW2kbzV3PH21seubOZOK6KVyoQ=;
        b=SPBs1ceelgHNGGJmIQF6zJcRAzWshU7HO5lrtyridGrbdF0p7qWPgBAPIB5SO4WBpo
         2ZzyU5O0TD0wQIUpGwI9z0BUS0+COTAtJFd1QwrqrMpXSBsxMRdZeQhbqd84fvGB8q00
         sr3Qc2ntPr5rrEijqC7/sfBKctNZzAFeqDpjMk/5BYoFM4dq7fjbSBFGJxVjdgNMNajq
         q42YXd7GzxQwpVsv1oU21auTS6hjUvnm6v1g/UOw7PkEtbzsnNrcU/MPdH3CXuBjSM2p
         GszgkuzwojkiXdLbFeBXBR6tdhToZI3Oh1fo33/lUlcCEIgdN6btBtQrn6cbX3GF2N9v
         ZMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aMH/wfW4yjgJKNSy/oW2kbzV3PH21seubOZOK6KVyoQ=;
        b=jYLAfq4wfQYQWSIfsZOxUNroGLgRHKtvhqoO2gl6xTytCn+YhEMJRoLUhPCloHtH4r
         zqEJmEsz1UKVD2rkWTsKnFAspJjT/I9I2wN6antfrPOCglguc4o+tIAV80SUQ/9R+3IJ
         /KxGOBWsvo//KzljcewLu1zzKs209PN5Rr2HlJqvr8iz/H4j/Spm+UpBKb6nOXyR3Oz4
         GFvFIGZIkuqke8Mk4HAVjUtxJR/KlroRTbu2xmgCX6d7h1KNoRH1MwFOPXYXCz6NNuLf
         qLNsOv2DorwXTilAJpMz1cQD+qkVDDhKA9L1JR9kUpPv5LQrkPYyl8WkDfiW0Pd7sqt5
         bHFQ==
X-Gm-Message-State: AOAM5327HF9tNLbq3LbL3b7rYaU+6iVaGw4wi+Fs1vEBQltlpqL06hjD
        i2OHNTdaDRLY8Fh0SzRmpzE=
X-Google-Smtp-Source: ABdhPJyGzurPvbG3Wi2EbHBVL1dIM1EF6TZey71X8yBXxE1Cp6qL+b3x8KdndhVXqPXF/44C/T7vrg==
X-Received: by 2002:a2e:6c06:: with SMTP id h6mr2996728ljc.154.1615567042296;
        Fri, 12 Mar 2021 08:37:22 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id l21sm1771703lfg.300.2021.03.12.08.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 08:37:21 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4 0/7] Couple improvements for Tegra clk driver
Date:   Fri, 12 Mar 2021 19:36:25 +0300
Message-Id: <20210312163632.8861-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series fixes couple minor standalone problems of the Tegra clk
driver.

Changelog:

v4: - Added new patch that converts DT bindings to schema.

v3: - Added acks from Thierry Reding that he gave to v2.

    - Added new patch "clk: tegra: Don't allow zero clock rate for PLLs".

v2: - Added these new patches:

      clk: tegra: Halve SCLK rate on Tegra20
      MAINTAINERS: Hand Tegra clk driver to Jon and Thierry

v1: - Collected clk patches into a single series.

Dmitry Osipenko (7):
  clk: tegra30: Use 300MHz for video decoder by default
  clk: tegra: Fix refcounting of gate clocks
  clk: tegra: Ensure that PLLU configuration is applied properly
  clk: tegra: Halve SCLK rate on Tegra20
  MAINTAINERS: Hand Tegra clk driver to Jon and Thierry
  clk: tegra: Don't allow zero clock rate for PLLs
  dt-bindings: clock: tegra: Convert to schema

 CREDITS                                       |   6 +
 .../bindings/clock/nvidia,tegra-car.yaml      | 118 ++++++++++++++++++
 .../bindings/clock/nvidia,tegra114-car.txt    |  63 ----------
 .../bindings/clock/nvidia,tegra124-car.txt    | 107 ----------------
 .../bindings/clock/nvidia,tegra20-car.txt     |  63 ----------
 .../bindings/clock/nvidia,tegra210-car.txt    |  56 ---------
 .../bindings/clock/nvidia,tegra30-car.txt     |  63 ----------
 MAINTAINERS                                   |   4 +-
 drivers/clk/tegra/clk-periph-gate.c           |  72 +++++++----
 drivers/clk/tegra/clk-periph.c                |  11 ++
 drivers/clk/tegra/clk-pll.c                   |  12 +-
 drivers/clk/tegra/clk-tegra20.c               |   6 +-
 drivers/clk/tegra/clk-tegra30.c               |   2 +-
 13 files changed, 195 insertions(+), 388 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra-car.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra114-car.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra210-car.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt

-- 
2.29.2

