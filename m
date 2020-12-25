Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94963C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Dec 2020 01:21:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57FDD2225E
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Dec 2020 01:21:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729021AbgLYBVi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Dec 2020 20:21:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729020AbgLYBVi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Dec 2020 20:21:38 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F381C061573;
        Thu, 24 Dec 2020 17:20:58 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id n142so3284306qkn.2;
        Thu, 24 Dec 2020 17:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eR/51XLp7HQCd5RWnkeAFXvnTVVeE+YelrG/OsehfgY=;
        b=hAn5MJD5rRItKlT/7Zl24e2BKZi0Ls8BZo0yfG0VHqNGbxZIImG5bj/Hw62Gu+mG/u
         QO7Mr9HJasfbcRh505O+zP9Cp22ZCzWUHrxmqVE9qhvWlELEdxNImMJDFxUDvwziQxI6
         NMUBe1UMHiSbY24xZSLCEC0gjY+JPmEyJJkyAQdan47NLcDaq2OjTXlOcu56PrZEf/Qj
         K3VfpTdZSMv/g56hpCEy1zR7HYWykU6U6oBzC6tznzZ8ClVF/vQitTc9y6DEuUMNcsQ3
         ql+bigyXHfDYne4ATahAJRh8V7qWXqutn0+s3hatv64QVfUd+i0A0z5k/VgcvxeTHRD+
         YW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eR/51XLp7HQCd5RWnkeAFXvnTVVeE+YelrG/OsehfgY=;
        b=sFSBicz8fxZ/rKW4Aec1+eMiDc/7B15kRObnjYyYIbRUbPvKsrq3Tc6zEkDlPZ62X4
         us720YvtPQcggOybTj4mIWhDxa9ExeqW99Xp1htcpTge/2UMfKMu8hlf5FTRt9Za0RsV
         V5oqE5HpFy1YbMeXsexyaMQTHXB3hfuN1uO8SCPeDzQnieoAYHqqtVVIiEGRfrtGOwHP
         QLXkVJdz0NkHiik8rK/4tVi//fsM8z6CtUwb/Hdcr9t2fmTkEEI7+XoUTpKLkHY2pDKG
         G9Z1Md3Yw1RbkGNXNjEYD2+HYeJ7JAIN2COQQKtVCAH4CVEyXs1q/JECAOVOJtMfYHq/
         tHOw==
X-Gm-Message-State: AOAM531sV/P6jr9k84mzNUhpRzCM2yO0guwxrN3FCF/d5cAwr7Za6uZD
        opEPEQRDuRwV5WqtNbTeZTg=
X-Google-Smtp-Source: ABdhPJyrNjeysbrlaGCYU+QBL1gUJ/O/dP/8CtbqfoqjVSeWYb5ZgSJ1J5pFIsmM63ClMqGEBprPBg==
X-Received: by 2002:a37:5a47:: with SMTP id o68mr21575955qkb.423.1608859257152;
        Thu, 24 Dec 2020 17:20:57 -0800 (PST)
Received: from rockpro64.hsd1.md.comcast.net ([2601:153:900:7730::20])
        by smtp.gmail.com with ESMTPSA id x47sm17583505qtb.86.2020.12.24.17.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Dec 2020 17:20:56 -0800 (PST)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Mohan Kumar <mkumard@nvidia.com>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
        Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH 0/2] fix tegra-hda on tegra30 devices
Date:   Fri, 25 Dec 2020 01:20:24 +0000
Message-Id: <20201225012025.507803-1-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The following patches fix tegra-hda on legacy tegra devices.
Two issues were discovered preventing tegra-hda from functioning:
The hda clocks on tegra30 were assigned to clk_m and running at too low of a rate to function.
The tegra-hda encounters an input/output error when opening a stream.

Since the only mainline device that used tegra-hda previously was the t124, it is unknown exactly when this was broken.
Fortunately a recent patch was submitted that fixed the issue only on t194 devices.
We can apply it universally to the tegra-hda device to resolve the issues across the board.
Note that downstream devices used the spdif device instead of hda for hdmi audio.
The spdif device lacks a driver on mainline.

Peter Geis (2):
  clk: tegra30: Add hda clock default rates to clock driver
  ALSA: hda/tegra: fix tegra-hda on tegra30 soc

 drivers/clk/tegra/clk-tegra30.c | 2 ++
 sound/pci/hda/hda_tegra.c       | 3 +--
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.25.1

