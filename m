Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70FE3CCA47B
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Jul 2022 18:56:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239323AbiGHS41 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 8 Jul 2022 14:56:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239341AbiGHS40 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Jul 2022 14:56:26 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A50418E06
        for <linux-tegra@vger.kernel.org>; Fri,  8 Jul 2022 11:56:25 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id r6so16469963edd.7
        for <linux-tegra@vger.kernel.org>; Fri, 08 Jul 2022 11:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M3EJ6Gj4vVE4K1X+nxefRXGxbrM3uP5m6QimMo2Ol5c=;
        b=M05Kls/ZSYTqihjh74UetxGWN0qyA4jL08gG1oYhLxFsUWIzOqfYUZQ5i5quYBQdBF
         c9jIuwvPra5XiEMj0U6oIFIHRfHmcNbw62Gg0xayUqkCrLXWTaXuziRbWJBpW22psFzK
         l+9IDRqMp268qXsIqT3vP1bp3NJmYWVDArEHRIjsawXB48IpnpLCd7THhijz/aiOW+9C
         leEsBEGACgx6V7ViIljmKrqZyuXhYfFuqtmGq3XWnMHX64t86UMGMn6PVzOw/dA5Uu1W
         rAcG5UHASrK0aa/dqMBaCbShqVxnuUaNeY2hzHd7IjIeLDWuAuUyH1bAuDGEhNsJ8Xxg
         Gfmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M3EJ6Gj4vVE4K1X+nxefRXGxbrM3uP5m6QimMo2Ol5c=;
        b=Nqa3k4XurWtbmR11WSnp3qLPjiSwZc8kMHB4jSQnuOr1BfQFDM5dShs68qWrXPRFem
         YGCKmoY2gHwlmTPTbRjZP/XX+Um3RheVXBExtQk7M7P+9fmC43m7/DNJkFSVUWrQAVgV
         +FUNoSlCx/qPCo7BR1bp0hly2Y1nXT9l4+aE/0aUVyHVoUsdOr5UkmtfvfmElxMm5dXA
         EfmTWr57c9z+hatGkFDw1V0mpP3F/5iUGuUxuekfy6FtMNhjQqK6CFcqeA3GI+LyMmQT
         taj+sQwHHxu0SOPnkxwLvSGlK3pyCBOEVPfhGjQXU5PeeCbdvGvFLCq/yRbxljYuxY79
         gX8g==
X-Gm-Message-State: AJIora9RLPGiYZ2kh6b46m+rf5BSLUCo9xfjlEdvzkLUR37nzDzZmgVR
        P5xf24dPjxF1NhGylvqnEX8=
X-Google-Smtp-Source: AGRyM1sd37Zllw8SQbn2PN0x+8QLjIIKEpkF+CZiwqpavJ5y3nyVuL1GGFEGnVNM299qJOTG+EJnGw==
X-Received: by 2002:a05:6402:5112:b0:436:c857:7a76 with SMTP id m18-20020a056402511200b00436c8577a76mr6953006edd.263.1657306584153;
        Fri, 08 Jul 2022 11:56:24 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id kx9-20020a170907774900b0072aebe7b64asm5417550ejc.222.2022.07.08.11.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 11:56:23 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 7/7] arm64: tegra: Default configuration updates for v5.20-rc1
Date:   Fri,  8 Jul 2022 20:56:08 +0200
Message-Id: <20220708185608.676474-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708185608.676474-1-thierry.reding@gmail.com>
References: <20220708185608.676474-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.20-arm64-defconfig

for you to fetch changes up to 28b4dcc8f0108e2c430b63b0325c61ae97d6dc79:

  arm64: defconfig: Build Tegra OPE module (2022-06-08 15:39:04 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration updates for v5.20-rc1

Updates the arm64 default configuration to enable the OPE driver as a
module.

----------------------------------------------------------------
Sameer Pujar (1):
      arm64: defconfig: Build Tegra OPE module

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
