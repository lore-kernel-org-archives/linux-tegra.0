Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B83AFC43461
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 23:17:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8AC3261581
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 23:17:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbhEJXSv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 May 2021 19:18:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbhEJXSu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 May 2021 19:18:50 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DC15C061574;
        Mon, 10 May 2021 16:17:45 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id c3so25843567lfs.7;
        Mon, 10 May 2021 16:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5c45erSURxeCEHSKNhav6B+HVmEo5Q7GZQowAFugOAc=;
        b=NqZNRuu1HG9xlohcDS6IOK/kb9nJhKJYi3gD5p77/P/JE0OTKVAa0on/9BVLLZ1Tu8
         KefR1+tstfCQFGq3ozrLTCYuo6kwZvgoAOW4g+rkB1J6qI7cosr0EcPexCVrLpn2/qhD
         V18w0QYs7m5ujyQqDp9/5xck82JYKz/EpwQgEU1+UiYixVZhHOyNykvns0u3ekP9lqhE
         qOQMARzMB6qatxWJ/BvWxNYP28tMUZmeHPb6ItCM+a7dRFklUVBq8Foeu2kFXknrEg+q
         lG7Q+9Ohs73V5wfMoidyplpLYpeCAG3f5/qvQvMeVxHQ4HvRikHR2cS5YBDTB8HAqzzR
         oGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5c45erSURxeCEHSKNhav6B+HVmEo5Q7GZQowAFugOAc=;
        b=Mf3dN8WNq1jn+qtb5gJVJOAJibKgR7AfGSA/GSGcYHjrfZbiyKR0yBCOZ2LRc1l7cV
         VabPWms1W0OB4zn3H2ucf5UMQzqYz7b7rVi1qgi2XSSjQlTL1ztVad2ZKYjgL8KQBIOb
         2pZqHBFMmIZbWOp9XB2qUibhc+oj3Soi9lpO4v11aF+5U0X1jBazKd3pdXXumz3ImEvA
         zLuavSmWVEF/UoGgEtokX4oy/8W0s6axXnoxFBvyMtxs6p8QQuJkbmIc11VktMuizoPB
         JjIak4wKNyUP1ltuzSfJU9zUFZu4pWlpsVbMc0teRzhrZx2rjfDJ/tzjHqOY2QyrCB74
         V54g==
X-Gm-Message-State: AOAM531nh5Vtz6LorEXnD2Dp36+1zqsdADcv686Z/bq2asIQtaXp1mo8
        MAU3Jwd8hPwMOUVi87spXCs=
X-Google-Smtp-Source: ABdhPJxqUk7gPLV7h/f4yqGcGnIRgoOIA/snpb+clQSo+qHgKdWdSLWp0V69lNxZV2pw1vDzbbxfEw==
X-Received: by 2002:ac2:5f5b:: with SMTP id 27mr18580184lfz.571.1620688663420;
        Mon, 10 May 2021 16:17:43 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id k8sm2422254lfo.123.2021.05.10.16.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 16:17:43 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v7 0/8] Couple improvements for Tegra clk driver
Date:   Tue, 11 May 2021 02:17:29 +0300
Message-Id: <20210510231737.30313-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series fixes couple minor standalone problems of the Tegra clk
driver and adds new features.

Changelog:

v7: - Added r-b from Rob Herring to the schema patch which he gave to v6.

    - Dropped the MAINTAINERS-update patch. Previously Peter said on IRC
      that he doesn't have time on the tegra-clk driver anymore and approved
      the patch, but then he refused to ack the v6 patch, saying that he
      is not reading mailing lists. So I don't feel comfortable with that
      patch. Peter could send it by himself if will be necessary.

    - Added these new patches:

        clk: tegra: cclk: Handle thermal DIV2 CPU frequency throttling
        clk: tegra: Mark external clocks as not having reset control

      I sent out the new Tegra30 thermal sensor driver and now CPU clock
      could be throttled by the sensor hardware [1]. The first patch adds
      support for reporting of the throttled frequency properly.

      [1] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=243126

      During of debugging sound issues of Asus Transformer devices, I noticed
      that the external clocks are missing the no-reset flag. The second
      patch fixes it.

v6: - Made a small improvement and corrected a typo in patch
      "Fix refcounting of gate clocks" that were spotted by
      Michał Mirosław.

v5: - Corrected example in the schema binding to silence dt_binding_check
      warning.

    - The Tegra124 binding is factored out into standalone binding since
      Tegra124 has properties that aren't used by other SoCs and I couldn't
      figure out how to make them conditional in schema.

v4: - Added new patch that converts DT bindings to schema.

v3: - Added acks from Thierry Reding that he gave to v2.

    - Added new patch "clk: tegra: Don't allow zero clock rate for PLLs".

v2: - Added these new patches:

      clk: tegra: Halve SCLK rate on Tegra20
      MAINTAINERS: Hand Tegra clk driver to Jon and Thierry

v1: - Collected clk patches into a single series.

Dmitry Osipenko (8):
  clk: tegra30: Use 300MHz for video decoder by default
  clk: tegra: Fix refcounting of gate clocks
  clk: tegra: Ensure that PLLU configuration is applied properly
  clk: tegra: Halve SCLK rate on Tegra20
  clk: tegra: Don't allow zero clock rate for PLLs
  clk: tegra: cclk: Handle thermal DIV2 CPU frequency throttling
  clk: tegra: Mark external clocks as not having reset control
  dt-bindings: clock: tegra: Convert to schema

 .../bindings/clock/nvidia,tegra114-car.txt    |  63 ----------
 .../bindings/clock/nvidia,tegra124-car.txt    | 107 ----------------
 .../bindings/clock/nvidia,tegra124-car.yaml   | 115 ++++++++++++++++++
 .../bindings/clock/nvidia,tegra20-car.txt     |  63 ----------
 .../bindings/clock/nvidia,tegra20-car.yaml    |  69 +++++++++++
 .../bindings/clock/nvidia,tegra210-car.txt    |  56 ---------
 .../bindings/clock/nvidia,tegra30-car.txt     |  63 ----------
 drivers/clk/tegra/clk-periph-gate.c           |  72 +++++++----
 drivers/clk/tegra/clk-periph.c                |  11 ++
 drivers/clk/tegra/clk-pll.c                   |  12 +-
 drivers/clk/tegra/clk-tegra-periph.c          |   6 +-
 drivers/clk/tegra/clk-tegra-super-cclk.c      |  16 ++-
 drivers/clk/tegra/clk-tegra20.c               |   6 +-
 drivers/clk/tegra/clk-tegra30.c               |   4 +-
 14 files changed, 271 insertions(+), 392 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra114-car.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
 create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
 create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra210-car.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt

-- 
2.30.2

