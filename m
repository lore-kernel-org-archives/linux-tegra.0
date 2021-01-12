Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 351F2C433E6
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 12:28:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0DA7021D93
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 12:28:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731642AbhALM2p (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Jan 2021 07:28:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729535AbhALM2o (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jan 2021 07:28:44 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD806C061786;
        Tue, 12 Jan 2021 04:28:03 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id a12so3084345lfl.6;
        Tue, 12 Jan 2021 04:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=13vFVfHprz64p3jGmqBB9uc45iwvcILQt4QpP3QO64c=;
        b=dvcnF2fQxug645CS8WvU2+3tMjTkJs3pzKB+TLxr+5UkLScuQ8Di/DlGqZeCbRPxbs
         VsRaYoG6zWLlMhXnTUVPXxFDnlBX+VeceSL0TAQX3sF7NhyYG8P/kCl3zHlbsaj/MpWa
         3W8JAaQ8HgO7dMKtIH9kFdzXv//o3QWUTqhZbZxgu6QypCMMGWxIsu8mAXEPlYSNA+2G
         R6hDtwDxaWJu62TZq4HyUruD7UFQqWjMB4sXRXkNROHUpIipQv6seD+Urwf7EyrbVsSt
         0jBgF6WBrAnTsH88DqunQ5kv4OHAHSbAqrUqgi50E91xqP/An/PPdwg2PzUHJdvjziio
         1YmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=13vFVfHprz64p3jGmqBB9uc45iwvcILQt4QpP3QO64c=;
        b=dAUbXO39jtu0U3Yml7O4WLf40/uR5IwqwJ+uel2q2Z3B9iik+QQ4MVO3eRRriWEQvs
         dO6wM01jl0GYg2xzbebiDpd8iwrn35/SUyeK83R/IQ8jYt6JT9ulEDNkQNV5e4CJusul
         gch1d7GImnQi5Rrj+EUsoKGScTcrq+m1j9L1ME70SqEqkjdK606tVLTjh9g7pZRdwEk5
         jdM05Ao60uA5uuUUZdGBuHB2HNlql9VNS24t7gPOYJfcCPEFAUgQk4SaR+X1vpdK9bOQ
         i0k/vEOffeVM0qjKUR0ILjtpKd/5gtTN4WKwEDqGTSL9PXU6gtHkC+mYKnJU9Prcl2bD
         xNtg==
X-Gm-Message-State: AOAM5308JDy50JBwtXetjtHs1Fyq9VotFYma6fM5qsF7oBg3ckUOJcDd
        1A0E+hKk1/vTgb0yeR1N7uE=
X-Google-Smtp-Source: ABdhPJzdAm5GUbH1ypwRJUZUbxxcqPwQcfBcTwDXucoOQ4WbYRKC0NSuVVVD7//A30rvzJKIUkLT6A==
X-Received: by 2002:a05:6512:4d9:: with SMTP id w25mr1973313lfq.199.1610454482341;
        Tue, 12 Jan 2021 04:28:02 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id c3sm330136ljk.88.2021.01.12.04.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 04:28:01 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] Couple improvements for Tegra clk driver
Date:   Tue, 12 Jan 2021 15:27:19 +0300
Message-Id: <20210112122724.1712-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series fixes couple minor problems of the Tegra clk driver.
Please review and apply.

Changelog:

v2: - Added these new patches:

      clk: tegra: Halve SCLK rate on Tegra20
      MAINTAINERS: Hand Tegra clk driver to Jon and Thierry

v1: - Collected clk patches into a single series.

Dmitry Osipenko (5):
  clk: tegra30: Use 300MHz for video decoder by default
  clk: tegra: Fix refcounting of gate clocks
  clk: tegra: Ensure that PLLU configuration is applied properly
  clk: tegra: Halve SCLK rate on Tegra20
  MAINTAINERS: Hand Tegra clk driver to Jon and Thierry

 CREDITS                             |  6 +++
 MAINTAINERS                         |  4 +-
 drivers/clk/tegra/clk-periph-gate.c | 72 +++++++++++++++++++----------
 drivers/clk/tegra/clk-periph.c      | 11 +++++
 drivers/clk/tegra/clk-pll.c         |  9 ++--
 drivers/clk/tegra/clk-tegra20.c     |  6 +--
 drivers/clk/tegra/clk-tegra30.c     |  2 +-
 7 files changed, 74 insertions(+), 36 deletions(-)

-- 
2.29.2

