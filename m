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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 992A4C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 19:34:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65F0064E08
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 19:34:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232848AbhA2Te2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Jan 2021 14:34:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231533AbhA2TeU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Jan 2021 14:34:20 -0500
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9376FC0613ED
        for <linux-tegra@vger.kernel.org>; Fri, 29 Jan 2021 11:33:15 -0800 (PST)
Received: by mail-qt1-x832.google.com with SMTP id o18so7522924qtp.10
        for <linux-tegra@vger.kernel.org>; Fri, 29 Jan 2021 11:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mFHRAjZ8nX69MCGQDYe4XhkLBjs/Z0Ct7NBrTC9cTMk=;
        b=bsNrcZEarZgW0Po0NAJPjZDjwEgxeYhgqV49HLA8UIqo4TrNfcY3FMx4UuoGtW+uTA
         8g/OuUHdkb+r7K7KqShnAyAgQtXLD9bSZmLqwQm4FjS2dVEEb49aZaCQ1eiKtPP6eD4a
         PC8AtCw1nyWgvw7rHE9gouTZuHZbLYVwnTQH2BL1P5SECkSRN+lAZwQ0dpR6GQ2Scr2f
         7+Xbbdnzy4A5D0dagPA64jm+a+rkMYX/Mykl0F6jdfPSZuKFGY1mmyJbagaJBmxGnZkw
         /6QoObUoaWKg7h/G8boaCME75ddAM7swmX1OScKPoDFXvloJP+QcsNx+qpWUP1CRZjs8
         rSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mFHRAjZ8nX69MCGQDYe4XhkLBjs/Z0Ct7NBrTC9cTMk=;
        b=Bczw/iotawKChH8+zUINMUIXodh/ekZfXBkeafTr+Sihc9ov0/1Zfnc9VAd8rjJ10V
         Cg3GvtJO3iHNbkoeEyTFUHXGPlyaHsQBxFqEUeEExc4cc/mimekZSQfpSv/eifpr+LD6
         g83Cx0+4YE7fuOuJelSINiuAeTGmBPRg+64xctUf0ZJKZ9giqKWCEEwbh6rs6QilNgRO
         MaYjIbgy7Vk32vRt0SIvscWuUyHSspJVghEHmv7R1ZZcgCiWkMewKZuEGb7cZ1T4/Bsn
         uCeqq5RX4ZYcmDVX7a2zWy/x59IksBjTczq/rWZqnUY8ajv+n5ISrpN6jiFTng6OxHO8
         Q4Rg==
X-Gm-Message-State: AOAM530oEbMvdvaJhajdsF/zJz/JBcdQtP/WpjvcfjCUf07WK+XxYe3l
        hcVoegrdkPFRQ1uYicGCRMc=
X-Google-Smtp-Source: ABdhPJyFqwSvYvuleJAmmspJ/vdcbX8JOeFxIZoJZmk92hjCw6EzB1LLylZKkUhkeU94woi0pswpOw==
X-Received: by 2002:ac8:747:: with SMTP id k7mr1352633qth.348.1611948794899;
        Fri, 29 Jan 2021 11:33:14 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id p23sm6813175qtu.4.2021.01.29.11.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 11:33:14 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] arm64: tegra: Default configuration changes for v5.12-rc1
Date:   Fri, 29 Jan 2021 20:32:54 +0100
Message-Id: <20210129193254.3610492-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210129193254.3610492-1-thierry.reding@gmail.com>
References: <20210129193254.3610492-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.12-arm64-defconfig

for you to fetch changes up to d93576c66c4b728c69920a2c25387d6e1fd4b902:

  arm64: defconfig: Enable Tegra audio graph card driver (2021-01-21 19:59:12 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration changes for v5.12-rc1

Enables the Tegra SoC thermal driver that is used on various Tegra132
and Tegra210 platforms, as well as the Tegra audio graph driver that can
be used to enable audio support on Tegra210, Tegra186 and Tegra194.

----------------------------------------------------------------
Jon Hunter (1):
      arm64: defconfig: Enable Tegra SoC Thermal driver

Sameer Pujar (1):
      arm64: defconfig: Enable Tegra audio graph card driver

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)
