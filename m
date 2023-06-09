Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE8CC7EE2E
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jun 2023 19:36:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231865AbjFITgi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jun 2023 15:36:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjFITgd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jun 2023 15:36:33 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3158D2D7E
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jun 2023 12:36:32 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-977c89c47bdso376470866b.2
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jun 2023 12:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686339390; x=1688931390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//fMPuwqgicgJYD2VcCYnxPiHCQjVw0pVkKp3o+C86s=;
        b=kjwSXlwuiD4XqmbW2dKwkgUv6KHt4DtxpmdOlQmqRRla6R8377QtnhBt4Ea0o/5Li4
         oS9W7YgG9W24RgRba9qhce9ZTc9pmqmhbLKkOkmxqiWt9WZYcGTZCN+cSrRlhLjFXvBV
         MDWvnvnAk7s0iJ2hLH6zUglcfniWnfcGwoYa44MfSBxAHL6x8DL4Is2ywIA+nHlLXyCh
         07eIGieqQ0GiTztRDan33J+FcnuncQEA75l1Tvi0GLH8CxOjdjy7BgkrzFyw6Oo8SOlj
         O7gYlZKPrWU3yLXOBEU4lUxWsq67ar7LRs6anLohmhUnbbJ0HSxBwBAMruToh68pxD4y
         d0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686339390; x=1688931390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//fMPuwqgicgJYD2VcCYnxPiHCQjVw0pVkKp3o+C86s=;
        b=PuyK7NbyXRHwpk4TEV2pnf84kik93oQ3sMKBl14669+nhFgt6y2NkRg0LnJack21jB
         cGSoK1jKKcqfYbWpOOrIFQzRhazDx/W5BlNMkKMIGpKEdMkrCuYwPSIaTIUNvg+1DkYf
         DHVVQouKmm1bBzMruN3MbdbxgPipKbN8kzyFoRqlk5h/B+yUpazPa7lQj1H0QgTGUxbL
         S+d5QFq6n8DVhxMREu3xwuTSsMnYEoizZMM5hJCGcoy644gfUutMoFY7n7605+VE1FPT
         dRAMWUGERh9+/lQ/GflYor+cSdagJVwDjFcg1H2sjWFATR8lecBZnE1tOaI8VObF5Yzu
         OPEQ==
X-Gm-Message-State: AC+VfDw1KnkfURu+M8Ap2nesogYmRB6yYO588/gKTDEchyW+uMYsv+Jv
        jnbv66mUMvWweV9hvVTub9LPFTo6peE=
X-Google-Smtp-Source: ACHHUZ56oul+x4pRlkl+V77txndNBECJh8TI6NOKWtezxUPq0NKYvr2SNgEpODIR506s3AR+TYbfGQ==
X-Received: by 2002:a17:907:7b91:b0:977:d48f:97ad with SMTP id ne17-20020a1709077b9100b00977d48f97admr3173770ejc.75.1686339390425;
        Fri, 09 Jun 2023 12:36:30 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id gz18-20020a170906f2d200b009659ad1072fsm1646479ejb.113.2023.06.09.12.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 12:36:30 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/6] memory: tegra: Changes for v6.5-rc1
Date:   Fri,  9 Jun 2023 21:36:18 +0200
Message-Id: <20230609193620.2275240-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609193620.2275240-1-thierry.reding@gmail.com>
References: <20230609193620.2275240-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.5-memory

for you to fetch changes up to e852af72a7f21f4d25994365af86a92438d68014:

  memory: tegra: Make CPU cluster BW request a multiple of MC channels (2023-05-16 12:11:01 +0200)

Thanks,
Thierry

----------------------------------------------------------------
memory: tegra: Changes for v6.5-rc1

This introduces an interconnect provider for the memory controller and
external memory controller found on Tegra234 chips that will eventually
be used to dynamically scale the EMC frequency based on a device's
bandwidth needs.

----------------------------------------------------------------
Shubhi Garg (1):
      dt-bindings: tegra: Document compatible for IGX

Sumit Gupta (5):
      dt-bindings: tegra: Add ICC IDs for dummy memory clients
      memory: tegra: Add interconnect support for DRAM scaling in Tegra234
      memory: tegra: Add memory clients for Tegra234
      memory: tegra: Add software memory clients in Tegra234
      memory: tegra: Make CPU cluster BW request a multiple of MC channels

Thierry Reding (1):
      Merge branch 'for-6.5/dt-bindings' into for-6.5/memory

 Documentation/devicetree/bindings/arm/tegra.yaml |   5 +
 drivers/memory/tegra/mc.c                        |  24 +
 drivers/memory/tegra/mc.h                        |   1 +
 drivers/memory/tegra/tegra186-emc.c              | 133 +++++
 drivers/memory/tegra/tegra234.c                  | 595 ++++++++++++++++++++++-
 include/dt-bindings/memory/tegra234-mc.h         |   5 +
 include/linux/tegra-icc.h                        |  65 +++
 include/soc/tegra/mc.h                           |   8 +
 8 files changed, 835 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/tegra-icc.h
