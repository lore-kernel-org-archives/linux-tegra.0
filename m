Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A70C4332F
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Nov 2022 17:14:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230497AbiKUROZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Nov 2022 12:14:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231368AbiKURNq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Nov 2022 12:13:46 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DAE1D089B
        for <linux-tegra@vger.kernel.org>; Mon, 21 Nov 2022 09:12:47 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id kt23so30032581ejc.7
        for <linux-tegra@vger.kernel.org>; Mon, 21 Nov 2022 09:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emJ3NrA9d0nlU40thOmFMMbBHA6ADDLelJJHapryhgo=;
        b=BLDYHEFbvZGps61TbCU1onH+Mgsiwvg0svbbt/Puk+Q4t1W+bGPPQk9vdaoQ39JLFx
         SVS5+C60Z18zWkgHZlZ7Oz3MAqIjJ1mAkIO4Ekuin+rulR9z+rGRw3uX6eBk9vmk6zdf
         VN29e204Fa6iqa8vMTpkpqaLNeT6hWIq4Thqqw1VpHmacF8FXwTLqO2wX0n04vPDNojE
         b4lYt6eHESCSw9o2T+yB1teT2OzDZ5gUW0nJBt+QG8kb2etJnbwCwfu9wPJeziL+4WkV
         X/QVJPvPOdSGAFgynHAeSzQTwj/lBkckQkhbWZgCvooOm+7jO6WG6v78yGgm/j6aqsRW
         aCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=emJ3NrA9d0nlU40thOmFMMbBHA6ADDLelJJHapryhgo=;
        b=bjDoV7KEYdlEvU3RBBndnPFFvGLrp1t8FbXP9Ub/xOMHVMrfDKIHxxOSVbhxrkvjol
         kdpwHSB3FGejszxnGX7V8lPWaA1j79sGemrixS0cb0Mjz9lHACPgJrhUcrVsBCOQpoNY
         iiWM4bTPZZEcQAghYwuQOvFUcuO3nJytr0nm8fjExdKy4C5uqGdicT8HFaIopFe2jXVu
         BnCXHEBX90UL6PqCos6/Q9X8XpuEIyC5dfrtlwNXfVd4F9tV8c7YvnTU849KJjfM1KLn
         FTXEYHGtBLteNXXHvQ3JNxdl+7/xcRI//LbnIuyNy2AXP6F3jIjZscvGhmcnCT0TrcfF
         ZwMw==
X-Gm-Message-State: ANoB5plIy1vWJA7Kh6WpaZ85jGC7ScVks/LG4mxxUoAGafULaWJDTV2L
        HyGO+9+HanAdDhIKMy9fkDmSf5D/y6U=
X-Google-Smtp-Source: AA0mqf5FZEJ5WTMN/LfB5Fh3lc6+ZRiUjmOXEKpS7D+rD6sptk9O2S1FTpDlcNq+7AAow2m52yaerA==
X-Received: by 2002:a17:906:edb0:b0:7a0:948d:80ae with SMTP id sa16-20020a170906edb000b007a0948d80aemr538372ejb.658.1669050765933;
        Mon, 21 Nov 2022 09:12:45 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id h5-20020a0564020e8500b00458a03203b1sm5439056eda.31.2022.11.21.09.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 09:12:45 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2 3/7] clk: tegra: Changes for v6.2-rc1
Date:   Mon, 21 Nov 2022 18:12:35 +0100
Message-Id: <20221121171239.2041835-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121171239.2041835-1-thierry.reding@gmail.com>
References: <20221121171239.2041835-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.2-clk-v2

for you to fetch changes up to 1d9e77b644d2e5c49e6d35f77684bd260ad98557:

  clk: tegra: Support BPMP-FW ABI deny flags (2022-11-19 02:00:32 +0100)

Thanks,
Thierry

----------------------------------------------------------------
clk: tegra: Changes for v6.2-rc1

Implements new ABI flags for certain clocks for which the parent rate
or clock state cannot be changed.

----------------------------------------------------------------
Peter De Schrijver (2):
      firmware: tegra: Update BPMP ABI
      clk: tegra: Support BPMP-FW ABI deny flags

Thierry Reding (4):
      firmware: tegra: bpmp: Prefer u32 over uint32_t
      firmware: tegra: bpmp: Use iosys-map helpers
      firmware: tegra: bpmp: Do not support big-endian
      Merge branch 'for-6.2/firmware' into for-6.2/clk

 drivers/clk/tegra/clk-bpmp.c               |   37 +-
 drivers/firmware/tegra/bpmp-debugfs.c      |   62 +-
 drivers/firmware/tegra/bpmp-tegra186.c     |   36 +-
 drivers/firmware/tegra/bpmp-tegra210.c     |    7 +-
 drivers/firmware/tegra/bpmp.c              |   33 +-
 drivers/firmware/tegra/ivc.c               |  150 ++-
 drivers/thermal/tegra/tegra-bpmp-thermal.c |   15 +-
 include/soc/tegra/bpmp-abi.h               | 1796 +++++++++++++++++++++-------
 include/soc/tegra/bpmp.h                   |   17 +-
 include/soc/tegra/ivc.h                    |   11 +-
 10 files changed, 1577 insertions(+), 587 deletions(-)
