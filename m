Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 977ABC433EF
	for <linux-tegra@archiver.kernel.org>; Sat,  4 Dec 2021 15:00:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242929AbhLDPET (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 4 Dec 2021 10:04:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbhLDPET (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 4 Dec 2021 10:04:19 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18519C061751
        for <linux-tegra@vger.kernel.org>; Sat,  4 Dec 2021 07:00:53 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id r26so13874721lfn.8
        for <linux-tegra@vger.kernel.org>; Sat, 04 Dec 2021 07:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ETAflowsA15kKoaqCuu5WiBP3VN5nTWIEJDu/Mrms4I=;
        b=Um09SsRlWojymvZWb/yxjCx9ZfaQWkaSS4IIcONST7M2t0keriYTvJ1g6+f4vu8heK
         BEX5CrsZWn4bo+KoigUCdkY1tiGq3LeiDQ6SUczsrWZ3Tifn1TW5815nMdSa9ju+//E5
         74CEd+7j7BzYrLaWT1IdPuQNa8xbPmPvAZUDKnhWwE1BUyHEcTBLursndKX7ofbtLA51
         lAIPAmP6whu+VeHMRIw5SFF68hzp8xCalEfa0UhntR//jqzF0/VV8Gh1KxfcPrcicjpm
         L2DIdUr1Vrg0YLsHC2gUFEPbF2uaojlj27V+jZiZWBqDsIMiyHvxGWxERPA9POyTY9Rh
         rjDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ETAflowsA15kKoaqCuu5WiBP3VN5nTWIEJDu/Mrms4I=;
        b=yOj6Ev2+wlvX73vLhXJILh8/mU5xzsJUkC61OLW1Rjn+R36QUCDs0Uq6zFx1kdddpJ
         6Lb73+m3TbAqHxaSkvZzAasH3zp+fNFTlbMAJluPb1W/OaLOgNNULE4xJWEVWwO/71La
         hc4FcMdj10niu6z14+IORV0UUDCTH63y4mkkQGLgiDeWu9deIDFNkZiVP7THbJYkhmJf
         Rfldp4/F4BefkOoB/dfcbisdLDZ10cqZVVMlCk0C6iDzlng0DFmziCXkzFDmKgAvSfEN
         pCk5IXX5h6XdzItZph+7GzQDKm74W8SR6KjgStr7cfxUlYaimQVCdseqgVegavqGEeTV
         HuHA==
X-Gm-Message-State: AOAM5304yJT4/3Q3Zyjqw5CNbgd24JJNdWJeqg9zG0ZIT9mjhptOy326
        8DZQ/xBbWAvIq3G7N+jJy8o=
X-Google-Smtp-Source: ABdhPJz/8jwitQJfh/jI12U78QqY0xtz+vktaV7hEnQfMpou3Va97sCyj5vHEVm22k71JG7nLuD6kw==
X-Received: by 2002:a05:6512:b10:: with SMTP id w16mr25057836lfu.223.1638630051388;
        Sat, 04 Dec 2021 07:00:51 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.gmail.com with ESMTPSA id t4sm859185lfe.220.2021.12.04.07.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 07:00:51 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/2] Fix broken DRM and Host1x drivers when CONFIG_ARM_DMA_USE_IOMMU=y
Date:   Sat,  4 Dec 2021 17:58:47 +0300
Message-Id: <20211204145849.4034-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra DRM and Host1x don't work properly when CONFIG_ARM_DMA_USE_IOMMU=y,
i.e. in case of multiplatform ARM32 kernel. The simple workaround is to
detach devices from the offending IOMMU domain. This is a resend of
9 months old patches which we lost and forgotten. The problem still
persists. I rebased patches on top of recent linux-next and improved
commit messages.

Dmitry Osipenko (2):
  gpu: host1x: Add back arm_iommu_detach_device()
  drm/tegra: Add back arm_iommu_detach_device()

 drivers/gpu/drm/tegra/drm.c | 15 +++++++++++++++
 drivers/gpu/host1x/dev.c    | 15 +++++++++++++++
 2 files changed, 30 insertions(+)

-- 
2.33.1

