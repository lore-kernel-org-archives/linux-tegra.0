Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01AC9C43460
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 16:31:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7C4261074
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 16:31:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231772AbhEPQcS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 16 May 2021 12:32:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbhEPQcR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 16 May 2021 12:32:17 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B85DFC061573;
        Sun, 16 May 2021 09:31:00 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id c15so4327335ljr.7;
        Sun, 16 May 2021 09:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fxlBfjD9rrdff0l547dFdguKUyG+OHefR+tkmXlzxcQ=;
        b=NDeXlZayRPolYdbkFXX5VpsJnlg2CG0s7eQ1fOfYv3FdOBRki2jfachJ4bo2VatHxL
         cVtVkQwKjQB97s5c96i5RMoVwUltne2CIIdyMfqF5wt1lRCPBTRCTzM8WWtIr6PwC5df
         kDr4oH1HrWG+c86taJMmIcmyg/IGTmLwbk7IVK7pSMuFX315JM3DUkWQVBYO2yPFGBAP
         MY0C0nCT6oOUWD5VEejcpPqTmtz6RL4QD0XbHN/vYt+JqV7BirmtJhqwbCgblc7c+uCw
         jbjlFZ1RnQSBU/4rOtAQUBlvbyC2HJmwsEw6mt2lNwg40C+nOONaBtXhUGfrrnIZCH35
         R3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fxlBfjD9rrdff0l547dFdguKUyG+OHefR+tkmXlzxcQ=;
        b=eeTnWTrXjKMPRgSBe149em+Lsekc7tGW4YnN3YGNI9rQfLKw2KWbl4KHivLj3buEVU
         YmlwTddHyFQxvtoppFSv1DTk6lJvfXC0gdMtC0i/sObOUlI8uoWYJTQMfWRil266gr0D
         GTWuQIp8PVXk6pB7SmQhXuNFsLZc6IDzvXeVCSTLrjuD9PnV+/uP23q2Zw8I24TYwapE
         xL/68KjWXT5rOb6f/GgU+N7Yl5G5FpyxSyKug4TC07sJPxyEJqncWDzCVw/1n95OttOq
         y75Di4V08a1HUxaLdT8AEWRzPw//3HYu0gsUmAZK95tnVai6C/MEjMT5eWn0xTTNA88C
         6y6w==
X-Gm-Message-State: AOAM531ZqAKVHVX6R0kLkmoXwTqqZYP0osuAam3ur6FzE00Yx+O14h5S
        YY6yMe3fvcyzsYq6cZXndD8BbZkz0Ks=
X-Google-Smtp-Source: ABdhPJwxt36n5XUZKj5CYtPbyxnu327kHvYfLX0xMh5vFiUNUlg9/CwBjOcsK7JplH/dggSx6i4a1Q==
X-Received: by 2002:a2e:bc1e:: with SMTP id b30mr11912401ljf.6.1621182659290;
        Sun, 16 May 2021 09:30:59 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id m2sm1704548lfo.23.2021.05.16.09.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 09:30:59 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v8 0/9] Couple improvements for Tegra clk driver
Date:   Sun, 16 May 2021 19:30:32 +0300
Message-Id: <20210516163041.12818-1-digetx@gmail.com>
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

v8: - Replaced division with a shift, which was suggested by Michał Mirosław
      in a comment to "Handle thermal DIV2 CPU frequency throttling" v7 patch.
      Cortex A9 CPUs don't have hardware divider and shifting is a minor
      improvement here, nevertheless it's good to have it.

    - Added new patch "Don't deassert reset on enabling clocks", which I
      accidentally forgot to include in v7. Previously sound driver
      was a blocker for this patch, the sound is fixed now in v5.13. The
      patch itself is needed for maintaining proper clk/reset sequences
      by PMC and other drivers.

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

Dmitry Osipenko (9):
  clk: tegra30: Use 300MHz for video decoder by default
  clk: tegra: Fix refcounting of gate clocks
  clk: tegra: Ensure that PLLU configuration is applied properly
  clk: tegra: Halve SCLK rate on Tegra20
  clk: tegra: Don't allow zero clock rate for PLLs
  clk: tegra: cclk: Handle thermal DIV2 CPU frequency throttling
  clk: tegra: Mark external clocks as not having reset control
  clk: tegra: Don't deassert reset on enabling clocks
  dt-bindings: clock: tegra: Convert to schema

 .../bindings/clock/nvidia,tegra114-car.txt    |  63 ----------
 .../bindings/clock/nvidia,tegra124-car.txt    | 107 ----------------
 .../bindings/clock/nvidia,tegra124-car.yaml   | 115 ++++++++++++++++++
 .../bindings/clock/nvidia,tegra20-car.txt     |  63 ----------
 .../bindings/clock/nvidia,tegra20-car.yaml    |  69 +++++++++++
 .../bindings/clock/nvidia,tegra210-car.txt    |  56 ---------
 .../bindings/clock/nvidia,tegra30-car.txt     |  63 ----------
 drivers/clk/tegra/clk-periph-gate.c           |  80 +++++++-----
 drivers/clk/tegra/clk-periph.c                |  11 ++
 drivers/clk/tegra/clk-pll.c                   |  12 +-
 drivers/clk/tegra/clk-tegra-periph.c          |   6 +-
 drivers/clk/tegra/clk-tegra-super-cclk.c      |  16 ++-
 drivers/clk/tegra/clk-tegra20.c               |   6 +-
 drivers/clk/tegra/clk-tegra30.c               |   6 +-
 drivers/clk/tegra/clk.h                       |   4 -
 15 files changed, 272 insertions(+), 405 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra114-car.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
 create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
 create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra210-car.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt

-- 
2.30.2

