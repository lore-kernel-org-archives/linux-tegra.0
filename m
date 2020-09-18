Return-Path: <SRS0=kXk7=C3=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CEB6C43463
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Sep 2020 15:03:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E844623787
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Sep 2020 15:03:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ecmiKztU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgIRPDZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Sep 2020 11:03:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgIRPDZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Sep 2020 11:03:25 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36F1BC0613CE
        for <linux-tegra@vger.kernel.org>; Fri, 18 Sep 2020 08:03:25 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id e11so6896382wme.0
        for <linux-tegra@vger.kernel.org>; Fri, 18 Sep 2020 08:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uIFR4U/pBA9fiCFT31xH6Hot+hiWp7PS0mYTa46S0Xw=;
        b=ecmiKztUkUEDB2nvIpzaITUveyiUy+AanTGpHdgMBF6mbRw4MrbbwpLkmIv9QyUI7W
         qCqeCtWN1daKQVWR56+KuDl0fWSmwcFc0sQSvGg8Hgx9H6wR900UJuQT4IpfdGAQy40F
         baIugQzqalKBlHQ/GVP5+peoXUabDKlSwYYKHeBqBpcbyD3yInmDrMxtQfE50bgF9b4a
         LM9hiwrGV7o7oVAWyKaS4tvSX+Bz6Rt+X5Ka0gg0dwfP25Q1G4CXpvw4LOu7gOQU3UpR
         EwCIWupdcXDyi+RUt80pMovVeIxN27cjbcnfcOxgH6Z5kjxCm1jNE+uaqSF8je5+phXk
         R3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uIFR4U/pBA9fiCFT31xH6Hot+hiWp7PS0mYTa46S0Xw=;
        b=VVQTwu0Z2e4W+tbNZWbFZe7AtVAWJ6BlFhMJuF7O100bYl65NPuJa2PhcnN4vo1CcF
         R/da+C8dBt12g88xaSrFE37B2SwA06bCpOuXrEs32Rr2AAIaUOhy78z7LN57DW8v/s5L
         hvx2zG5h6WuG5ZFnrBMIuv2MlQMFfzdLhoqEAxt+R3dDtWY/Z7KoyZe8cGp8iBG7bXjM
         qCsY4By5s93/EAEhKLTW1sCJW/Tgq4hmi3Q6Wgxzd6AcCoqu4JRVD/N73Hoipt9O/UlL
         ZiXdz/xc1lFZtW1yHk+W9veLXPq88O3F6v7bnPI1y3Uqvyu7AYjYMI0B7keahCdayb9H
         vPMw==
X-Gm-Message-State: AOAM533cASL9VfF5sfGRYrrK/tFX0HQv7gUpsREcseYTzChEjHMLBUyJ
        kmXRAgNKN/1lvUKXQOF1Uy8=
X-Google-Smtp-Source: ABdhPJy1FF4NLMwj/XuXq33CGX7cdRPuNxTSyqVOa1k7/OWd4O21GJuQQ8j3Mbjh53Uq7tlercTKsg==
X-Received: by 2002:a05:600c:2246:: with SMTP id a6mr16712783wmm.38.1600441403832;
        Fri, 18 Sep 2020 08:03:23 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id u66sm20220846wme.1.2020.09.18.08.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 08:03:22 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] arm64: tegra: Default configuration updates for v5.10-rc1
Date:   Fri, 18 Sep 2020 17:03:03 +0200
Message-Id: <20200918150303.3938852-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200918150303.3938852-1-thierry.reding@gmail.com>
References: <20200918150303.3938852-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.10-arm64-defconfig

for you to fetch changes up to ff4c371d2bc0b4e5d3fe890b89a61ae049e613bf:

  arm64: defconfig: Build ADMA and ACONNECT driver (2020-09-02 11:38:48 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration updates for v5.10-rc1

This pair of patches enable the ADMA, ACONNECT and AHUB drivers that
are required for audio support on Tegra210 and later.

----------------------------------------------------------------
Sameer Pujar (2):
      arm64: defconfig: Build AHUB component drivers
      arm64: defconfig: Build ADMA and ACONNECT driver

 arch/arm64/configs/defconfig | 8 ++++++++
 1 file changed, 8 insertions(+)
