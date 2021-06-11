Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F04C48BD1
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 16:44:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E19D613D0
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 16:44:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231552AbhFKQql (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Jun 2021 12:46:41 -0400
Received: from mail-wr1-f48.google.com ([209.85.221.48]:35751 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231466AbhFKQq0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Jun 2021 12:46:26 -0400
Received: by mail-wr1-f48.google.com with SMTP id m18so6760587wrv.2
        for <linux-tegra@vger.kernel.org>; Fri, 11 Jun 2021 09:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V5XYrnY/xVnCPcibAwboKgHCmrwG1kEd9Tte7IqhonY=;
        b=AT2W/U1lava1Ca/zNFJ6uPGusersVIS6uHclYO2H/J6Qp1tt86eedRIFMioYpe8fqs
         yrD74cQCB7gTkJ/kRf4Fa2ZDARKHtlWEHK8gvqQBojB2HoPIRlTiyqeoAzLb31bjDOwU
         2fOqkJjuIv2s32Ktao44dlmqzx8n0MqHplzQKIo52w2TgS1YTFBc7LTxsz44LekNZlk4
         +/JNa06aUjBU2QjmyFo0UWIdMu4V0iRUcJJZY/duMgkHzvhbWsV1XwULSqhLiHm75T3K
         cG6DWTBPdfFjw8a2Jkvt7WvEfdmK4GqT3hWfjSP5PZJH7CTxPDGg2tMwz70xIRtgVOGt
         hLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V5XYrnY/xVnCPcibAwboKgHCmrwG1kEd9Tte7IqhonY=;
        b=M++R1apIJiELO3WARtRtWGiVXNKb0wJfXzDCJe11XTJOXEgbhnSS/Acx8Q/WpngRMt
         l0gvGQSbMJhaP/hqdmf+d8ogtRFq04Fi0FvvVH8tzTUlGc17/nMXMAnUpaTw5RVUdJGa
         ea4VwfkLQJLzMbDsdd8cHUgrRNJQIHhB9PYehrj/Sj1jZlwe1Td973gowZnTbvODMlZB
         hfcD8ScXvGIVduIsK3q9ZeTMWdNezc86gQPPcjqOJIX4dILslsF2oygEN62N+Z9qFOp9
         +syNUfhaXAo6jh9Wmychjflod47Sv1Ky/B6aKhf+UjNsw6dLeoOsYLd2vtia89mZ6Xiy
         +gtA==
X-Gm-Message-State: AOAM533TRZgB/NXbRMAGLJs420TwNXj38J1640fur6s+lqlMByJkZijt
        VMHpGUQU6xje0tg/2vF1oLs=
X-Google-Smtp-Source: ABdhPJxlsbAOLOU1i27Ibi/lz52sIQVKiBthECxJn+E7iF+bsBneHJrvzhZpxGhPpbWTOw5uSu00yw==
X-Received: by 2002:a5d:64c7:: with SMTP id f7mr5073620wri.36.1623429792242;
        Fri, 11 Jun 2021 09:43:12 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id p5sm8063831wrd.25.2021.06.11.09.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 09:43:11 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/6] ARM: tegra: Default configuration changes for v5.14-rc1
Date:   Fri, 11 Jun 2021 18:44:36 +0200
Message-Id: <20210611164437.3568059-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210611164437.3568059-1-thierry.reding@gmail.com>
References: <20210611164437.3568059-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.14-arm-defconfig

for you to fetch changes up to 4302331fdf4440b96dba583384a0e2b759cb13bd:

  ARM: tegra_defconfig: Enable CONFIG_DEVFREQ_THERMAL (2021-05-31 11:43:11 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Default configuration changes for v5.14-rc1

Enables the devfreq thermal support to allow using the devfreq device as
cooling device for the system.

----------------------------------------------------------------
Dmitry Osipenko (1):
      ARM: tegra_defconfig: Enable CONFIG_DEVFREQ_THERMAL

 arch/arm/configs/tegra_defconfig | 1 +
 1 file changed, 1 insertion(+)
