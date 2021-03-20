Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2795DC433DB
	for <linux-tegra@archiver.kernel.org>; Sat, 20 Mar 2021 15:29:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE90361965
	for <linux-tegra@archiver.kernel.org>; Sat, 20 Mar 2021 15:29:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbhCTP2a (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 20 Mar 2021 11:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbhCTP2K (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 20 Mar 2021 11:28:10 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0723EC061574;
        Sat, 20 Mar 2021 08:28:09 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 16so15578918ljc.11;
        Sat, 20 Mar 2021 08:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9/KQ9Nz77BITHR/q03SiK8zs6X/wFqQ1ANkKak0oJY4=;
        b=SbVMGOg/pCtGqir+JDjgkw3QDU56t5fxM+DRy1Sp5zlZvGWbyCXpZlmj8v7hLyLJg1
         86yDh/VYvFlR3Ml7xKGfs5EHrfcKxygoSqYuQGbgzwbEJWxX6MqBdjCfAdMQeJAgDZxc
         B377wozlBokFl6GpL6WviA99T3b8rdJ8IfsNu7/0JFeTMPbFXx2JoSSQLWHGbk6CVldB
         3fDkzF9oWyNX1zX3f0h/Ydct7FKbSihAMYJo3+8cWyPesfkjrXIPabzZFB2RR1cvrDWw
         8aKPXGYvv2k+6Gb/MifAqR9qjwo7TYbzYgYh+deLHFEuZaRM4btjg5P+XQEJUz1faFGM
         mvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9/KQ9Nz77BITHR/q03SiK8zs6X/wFqQ1ANkKak0oJY4=;
        b=A2hoN65R1cUJIYY5df7lR1l3hxWTHg5Unv4g9XWFzFAMAFwTxanTB8hwSx3fz/PZaL
         DHAMB/Reh4FpPrk4XGsLGoWZnyV5GwDuUeyOqi6Y++tr7NFdO2ZtjbxEhLIfTXi4T/zM
         tBKFSp1wCQ7jR5dZfOzLxnSeJkBLc6SRNHT5F1zvB4P/bJuKjAojgRNeWg692LubZKTg
         P1HHSbEQnhxEpu0CWruPqirUL+j4AtRQZxuaWBFWJANxR9a/uzkrrmbYlu7zFbBrhXgd
         YwwdHKytd5LDAb1/rCZZRO1XIoCTldXSr1Mp3IgPkWkVChUD0wUILvSRMI5JYmb0szg4
         pZew==
X-Gm-Message-State: AOAM531GxIzyFm6f0vhmkCZZcexRf4ZQB//sTMccVw5fRj07F1MkEQnr
        +YTMq6+VR0pLqokfTY4tajc=
X-Google-Smtp-Source: ABdhPJzH2wpiMG7vfL6uqd8rrIqjbzijUUpK0Tjx6ddP8vENkTGtDvnCAMAXdckxtPwg2t7US6Oomg==
X-Received: by 2002:a2e:98d2:: with SMTP id s18mr4041153ljj.412.1616254088468;
        Sat, 20 Mar 2021 08:28:08 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id t17sm957024lft.224.2021.03.20.08.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Mar 2021 08:28:08 -0700 (PDT)
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
Subject: [PATCH v6 0/7] Couple improvements for Tegra clk driver
Date:   Sat, 20 Mar 2021 18:26:41 +0300
Message-Id: <20210320152648.8389-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series fixes couple minor standalone problems of the Tegra clk
driver.

Changelog:

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

Dmitry Osipenko (7):
  clk: tegra30: Use 300MHz for video decoder by default
  clk: tegra: Fix refcounting of gate clocks
  clk: tegra: Ensure that PLLU configuration is applied properly
  clk: tegra: Halve SCLK rate on Tegra20
  MAINTAINERS: Hand Tegra clk driver to Jon and Thierry
  clk: tegra: Don't allow zero clock rate for PLLs
  dt-bindings: clock: tegra: Convert to schema

 CREDITS                                       |   6 +
 .../bindings/clock/nvidia,tegra114-car.txt    |  63 ----------
 .../bindings/clock/nvidia,tegra124-car.txt    | 107 ----------------
 .../bindings/clock/nvidia,tegra124-car.yaml   | 115 ++++++++++++++++++
 .../bindings/clock/nvidia,tegra20-car.txt     |  63 ----------
 .../bindings/clock/nvidia,tegra20-car.yaml    |  69 +++++++++++
 .../bindings/clock/nvidia,tegra210-car.txt    |  56 ---------
 .../bindings/clock/nvidia,tegra30-car.txt     |  63 ----------
 MAINTAINERS                                   |   4 +-
 drivers/clk/tegra/clk-periph-gate.c           |  72 +++++++----
 drivers/clk/tegra/clk-periph.c                |  11 ++
 drivers/clk/tegra/clk-pll.c                   |  12 +-
 drivers/clk/tegra/clk-tegra20.c               |   6 +-
 drivers/clk/tegra/clk-tegra30.c               |   2 +-
 14 files changed, 261 insertions(+), 388 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra114-car.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
 create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
 create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra210-car.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt

-- 
2.30.2

