Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E663C2BA83
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Mar 2021 19:32:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4067F64F4D
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Mar 2021 19:32:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233260AbhCQTbk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 17 Mar 2021 15:31:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233112AbhCQTbY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 Mar 2021 15:31:24 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E18AC06174A;
        Wed, 17 Mar 2021 12:31:23 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id m12so683381lfq.10;
        Wed, 17 Mar 2021 12:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=73TjCXjVrkI58MW+Nim3q1ayD1X0BXNWSG6Q1INh2NQ=;
        b=e/lOgyIE+jGT4cotYrNiAE+c+4C5ZYHt4ordarHogFxS99/5oUnB5b+XfsWV8VOqYn
         FGlbzgIwQzzjKCh+tI8FEEBeRUAuibv7OQGwBxUo6aYA9CEKROF75qKqIXqOVzQJ6tST
         LslAhdhuc1Rx71KCa1Fp6mEi6z/r72alvwzNd+EnKJTcR0w6QTKjveelq5j/ydwryZZI
         7kznsPz6GXVXIWpF/0ao4nl4wAwQaiPy5L6LT0EtqdEAfU8TTD3KONmpozF8UhnAD1Uw
         Ly45v+dsIxB8at6hf5TBcR+gEG5Df50ObdCYKkG2mQE+w1hVv8tO1xmSzio+tUtivB0W
         b++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=73TjCXjVrkI58MW+Nim3q1ayD1X0BXNWSG6Q1INh2NQ=;
        b=GeZiO+zCz/4uuT00aX5G8P6jL62zgLfqwkJKpRjWu9W1B+QCv0Sm76MAeqc1HDJhQp
         lNmVfS+Z9LfpKhpOpy/IUa2zhcBEv5XZGbQ1MdNu6hj61ANCOJftNPrqDj9n37sEh3sn
         yq6CeqxMqQu0qLy7wpGqktRe4ExXcBhpMfJNkiUeKbI83BckEUu1cfu2j8DtfErmDPuB
         1wni9eQ2vFKHk9ibcYWAhnuuGkC5pBf3Hi1j5Hb+qthNIl6g04baE/pwJWpBqYu3YAsr
         YkUmrjUfMkBtsiFrQqYNKcJYWowbw1AVqBZnXsq5RKCteJXzBa3u+ylSOrPf4WREEYaU
         a38Q==
X-Gm-Message-State: AOAM532kV70/wHnu7a+NkWM8EW2t/iK6MRmdnLzzQ6gFtrLgutWTQTos
        uedK/F4V+OXE3/khX8UHzt0=
X-Google-Smtp-Source: ABdhPJw570vvk63jmImjLYg9KSlx1saOpjJ0148MYcR6pgOd66+xlrMJNj57vGDtjOEU62JLasEjIA==
X-Received: by 2002:ac2:5c0a:: with SMTP id r10mr3013997lfp.47.1616009482197;
        Wed, 17 Mar 2021 12:31:22 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id q24sm3623098lji.40.2021.03.17.12.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 12:31:21 -0700 (PDT)
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
Subject: [PATCH v5 0/7] Couple improvements for Tegra clk driver
Date:   Wed, 17 Mar 2021 22:29:59 +0300
Message-Id: <20210317193006.29633-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series fixes couple minor standalone problems of the Tegra clk
driver.

Changelog:

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

