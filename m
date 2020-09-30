Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C804C4727F
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 08:48:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B543520708
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 08:48:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tawEvSKl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727657AbgI3Ise (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 04:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbgI3Isd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 04:48:33 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2269C061755;
        Wed, 30 Sep 2020 01:48:33 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id x16so698140pgj.3;
        Wed, 30 Sep 2020 01:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=OeUNQJgXL6ADU3aSWn4q3FZBak46MGLmLY/1uCciSlU=;
        b=tawEvSKl8fLarJ1MeDSqmrrB/ZZe6NOzks0sfiE+mDFUB2q1PI8ELw4CMfK37xlB/v
         T7CrKPQCCmiF4B7QQo2pMjnsZnie39Dd68KkXI5D/SB5Hji+uS/WchCI55AqLMIX/8ho
         WF3dWY3NOSFG2wrauz2uncIiX6D1Z+lGsMQXUUHGPZsU5wZmKpgkTd5/0ymzw9aRXyOL
         qfnn//KXvnbALaAhVLxZzgoZppuWF7GDB7AaZyo0sF4ewSyJxMIfN7XXYYm+FHzUC+7I
         bEG2Cxp95EAuTKob8qMWY7p+ojNYO+BJ6kIBm0HNC5o8A4+4uD0ArOXBhWtKfqbQxoSW
         EHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=OeUNQJgXL6ADU3aSWn4q3FZBak46MGLmLY/1uCciSlU=;
        b=h9WPe4ZHJkyVDE+P12vbYuHaq9WFlEUqgdxTZoEXWjTWOv8TU24ygxsMA7IFtF8jBE
         8pzl2kme/B+WAbAiBjhgiCi5GIxjHmFU7KsSNG4Q0cvEid6b4UKMUFUjb2UABQAc7Q8Y
         QiazUxF8gnTgc3RnMul5ckk9qjXB39DYUg72eurg3usLeWTfwYh0MZWAmoaACMDMyqCz
         /KHLr5c+mRuflRJwjPBKis5347LmiZ7lzn9wcs8eIEB6yS1mZ5Pfhif1cfeNN4yv3d+R
         qJc2gvIaiFF1TniMqPldb2Mq4hYCihzUqVsVTdapXqpo9GVIHQ7arGQxOMrOCqBa8Is4
         9eEQ==
X-Gm-Message-State: AOAM533OLTAZlXiP2gXt8KrAjE7bGF+ujAMXAQ/UA/j3oQNPVQAs8wDm
        l9kHPL2lwEOcqBRfpQVdke4=
X-Google-Smtp-Source: ABdhPJybvq/YLDpzffptolcGtF/N5En8KDtDWjqMjJ0PrfoI6Iuyksm+pPyBWDUvgijpRC7zcN6x3Q==
X-Received: by 2002:a62:301:0:b029:13c:1611:6528 with SMTP id 1-20020a6203010000b029013c16116528mr1365997pfd.8.1601455713095;
        Wed, 30 Sep 2020 01:48:33 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id d17sm1505830pfq.157.2020.09.30.01.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 01:48:32 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org,
        digetx@gmail.com
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] iommu/tegra-smmu: Add PCI support
Date:   Wed, 30 Sep 2020 01:42:55 -0700
Message-Id: <20200930084258.25493-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series is to add PCI support with three changes:
PATCH-1 adds a helper function to get mc pointer
PATCH-2 adds support for clients that don't exist in DTB
PATCH-3 adds PCI support accordingly

Changelog (Detail in each patch)
v2->v3
 * Replaced with devm_tegra_get_memory_controller
 * Updated changes by following Dmitry's comments
v1->v2
 * Added PATCH-1 suggested by Dmitry
 * Reworked PATCH-2 to unify certain code

Dmitry Osipenko (1):
  memory: tegra: Add devm_tegra_get_memory_controller()

Nicolin Chen (2):
  iommu/tegra-smmu: Rework .probe_device and .attach_dev
  iommu/tegra-smmu: Add PCI support

 drivers/iommu/tegra-smmu.c | 179 +++++++++++++------------------------
 drivers/memory/tegra/mc.c  |  39 ++++++++
 include/soc/tegra/mc.h     |  17 ++++
 3 files changed, 118 insertions(+), 117 deletions(-)

-- 
2.17.1

