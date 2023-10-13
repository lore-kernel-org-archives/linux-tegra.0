Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65428C41513
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Oct 2023 15:37:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232433AbjJMPhd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 13 Oct 2023 11:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232374AbjJMPhb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Oct 2023 11:37:31 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC68BD6
        for <linux-tegra@vger.kernel.org>; Fri, 13 Oct 2023 08:37:26 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-53da80ada57so4044971a12.0
        for <linux-tegra@vger.kernel.org>; Fri, 13 Oct 2023 08:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697211445; x=1697816245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7RR80S9VVoI26pp6PPSfkckIvUSInMqHwCFYPrN8cEo=;
        b=HKNS2/LCC+a+QHcGHiwHypEPSJPVWEIhfglf+K2nUp5gpoTTR4WTW3NpE5DJjKnwtG
         yG0PbAZjfDTZo29MM53r2JehbzgvUFx7DMmEsh/+/dd6AUxq3xZv3PiZBCC2SrmqLeor
         Gm1DsURsDxp7yktobswlR1XUMbST80zAxQJeGqQBKZZa8iogOutnNflymc4mg2UjWkqu
         e7ZBctLm/SzG5quqoUIkxNtN3uVq0ljREoiJuEM2ExUIc/eLVu62IXiQvhsD5CEbR6+4
         FR445da7/t2eb6wugu5AZzkikRaqWL+ZZQxbp32r94DoRKEwYRBOihk0Gj0WN+0eCmXy
         K81Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697211445; x=1697816245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7RR80S9VVoI26pp6PPSfkckIvUSInMqHwCFYPrN8cEo=;
        b=AHxuQvp3SKE0WkmwDVaqMNjgKb22J0BfDzd8MzUXC0sHcJDKAh9XAcc/snzNMO3coC
         QTZgTIjAyoFjSr94Y9nUCld8zHwForxYQn0IKjB+iLF4fBp3nkihDHv4LRaCAZ/jCTG8
         WCbJ7Q0+GfX1BvdFUjL3es0Zn8ibBok0E34jAExgyloF+rSL4eo1ApS64v+M3n+DCPIH
         ZFIe1nmcnPvx4GU/qgOPPXLrfuFhhlzPYRjUJ8a7P9RfYd1ml9khEt5Xt/QZqPe7CXwk
         BRmDFuBXRkti+YkEkKvG/Kcgdv8nmWg7xLGYuFBWK47/q+iteETR4rtZoJ92enTK2qCw
         btXA==
X-Gm-Message-State: AOJu0Ywaou8CQI9fopgkh7vjY+0gnrc+Wyl3xwmfvRYYrDEyEot3E6Ij
        KaOXiZeJ7+sqq/xNcVQVuvk=
X-Google-Smtp-Source: AGHT+IG5PxYwOsDh+FYajoOlxlehnSCwwf3OTVC3VUnLrvW1x5jPaopvsu6MPB+7CANkPirBN9MyDg==
X-Received: by 2002:a05:6402:f25:b0:53d:d4e7:af5f with SMTP id i37-20020a0564020f2500b0053dd4e7af5fmr8435837eda.13.1697211444873;
        Fri, 13 Oct 2023 08:37:24 -0700 (PDT)
Received: from localhost (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id c25-20020aa7d619000000b0053622a35665sm11456083edr.66.2023.10.13.08.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 08:37:24 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] soc/tegra: Changes for v6.7-rc1
Date:   Fri, 13 Oct 2023 17:37:17 +0200
Message-ID: <20231013153723.1729109-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.42.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.7-soc

for you to fetch changes up to cda263907a6f88c75fb97cf7adecffaafb6237ec:

  soc/tegra: pmc: Drop the ->opp_to_performance_state() callback (2023-10-13 13:58:36 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.7-rc1

This contains a few minor cleanups for PMC and CBB.

----------------------------------------------------------------
Ulf Hansson (1):
      soc/tegra: pmc: Drop the ->opp_to_performance_state() callback

Uwe Kleine-König (1):
      soc/tegra: cbb: tegra194-cbb: Convert to platform remove callback returning void

 drivers/soc/tegra/cbb/tegra194-cbb.c | 6 ++----
 drivers/soc/tegra/pmc.c              | 8 --------
 2 files changed, 2 insertions(+), 12 deletions(-)
