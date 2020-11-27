Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE0DEC64E7A
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Nov 2020 14:43:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E07420B1F
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Nov 2020 14:43:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H9SqskTS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730908AbgK0Ong (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Nov 2020 09:43:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730899AbgK0Onf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Nov 2020 09:43:35 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CE6EC0613D1
        for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2020 06:43:35 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id 10so5320155wml.2
        for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2020 06:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kmILkMTyoFSh8KUN/oBiKweVuctrEgzCw8JtH2R1a8E=;
        b=H9SqskTS/zs6NgiGlTwctg9G3N+OwvL6AStD7fUJIVKzsPFM1iLkeHiFMb+Hts3hsJ
         sqT5kTKbrs5G6RYDT+I+LTZbyuXoI1MZojE7ieaTncG6jx+7sjCBoPNRoXIO71CwkG/b
         S/mMWl6821V5Wat2szh5VkYc8LI6SiMliC8jbrx+q6GiDF5dkoSKvisuqfmX4d42cZk6
         FEDutGX5atvyxpgZaGA2uTW5NP516NaCJDEs6882IJpLMSjKc+RC9hK5hB99Og5uBozA
         e5CFSNziK0Ufmwk+fo/7xzp5XoOVlGHcNfp2+T9c5jpnRohTBw34rQaS+WW3Kr83GiAK
         yaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kmILkMTyoFSh8KUN/oBiKweVuctrEgzCw8JtH2R1a8E=;
        b=j6XjOHKQs0Aa+cTcLOioIdLFUpTu8L9EEUN5EPJAeTOwPXaOIYKyaxo/5Ml65B3QsV
         ktLvTpNNOOcje2BKGYnIm21jxrtywA9T0u8gHPQdsM15vlkxCRiBU4dIIZYymA99iU79
         aExCM3SBzRGTLPac3OQBKX+bxJXvmO9iNsQAM5HATzl7pdFGd9esXvzx0A+O/1Z3s6al
         p2LcbzYi3oUI/T7Wnpem5OVJRZRVjvqtMFGjUB/PtCSRe+gTi5NCG8HXmGbXsvUJ9e0H
         tvXHIV8p0fUPAfAcWk584ctvvH4u6vqbSKRGAypIn9Hz4xvd3ggWvIfwNMHvkjoL8I7Y
         yqcQ==
X-Gm-Message-State: AOAM532iUMQKUdEoD5m8r/Xxy8k3J5gf0NYHHcDITpqaWkLwk3WIk2sP
        kFKMDfV9KQcvtFXYi3urZAQ=
X-Google-Smtp-Source: ABdhPJxq0c+uoa2BKNWyG9kqene0iZGI5CKPKW3iTmgscQI7KT4rOSfergEXR3rrSEhOOeNymtyvTg==
X-Received: by 2002:a05:600c:219a:: with SMTP id e26mr9667529wme.168.1606488214360;
        Fri, 27 Nov 2020 06:43:34 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id p11sm15368298wrj.14.2020.11.27.06.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 06:43:33 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/6] soc/tegra: Changes for v5.11-rc1
Date:   Fri, 27 Nov 2020 15:43:25 +0100
Message-Id: <20201127144329.124891-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127144329.124891-1-thierry.reding@gmail.com>
References: <20201127144329.124891-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.11-soc

for you to fetch changes up to b9ce9b0f83b536a4ac7de7567a265d28d13e5bea:

  soc/tegra: fuse: Fix index bug in get_process_id (2020-11-19 11:43:49 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v5.11-rc1

This contains a couple of warning fixes and a fix for a mostly harmless
bug in the process ID retrieval code.

----------------------------------------------------------------
Lee Jones (2):
      soc: tegra: fuse: speedo-tegra124: Remove some set but unused variables
      soc: tegra: fuse: speedo-tegra210: Remove a group of set but unused variables

Nicolin Chen (1):
      soc/tegra: fuse: Fix index bug in get_process_id

 drivers/soc/tegra/fuse/speedo-tegra124.c | 21 ++++++---------------
 drivers/soc/tegra/fuse/speedo-tegra210.c |  8 ++------
 2 files changed, 8 insertions(+), 21 deletions(-)
