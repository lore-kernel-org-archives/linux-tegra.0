Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F288EC433ED
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 20:52:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0B8561075
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 20:52:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233731AbhEPUx0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 16 May 2021 16:53:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233728AbhEPUx0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 16 May 2021 16:53:26 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1B99C061573;
        Sun, 16 May 2021 13:52:09 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id a2so5766187lfc.9;
        Sun, 16 May 2021 13:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uQoeo0NkInHZ/staS7oZ17XwdHbhzVHZOHdrx40TbJY=;
        b=HJExsAntph9f8t+YPQHPzO7eG6Y3QI8fwfITarryME5+cRK27eHlUrsWYVmVkFDy4L
         rqvNUHf1UV1TIUHSI0wCSd9szXug9LL7BEGINAFbLm+F/Wm2p5eo6SmXEm5w9YDSYw6D
         Dc6PvbT65VND4KQvdRYiR5kdu0L96JJn/23RiOcvTNpTKFvz/qfjmszHFtfi8scWDFrB
         Lpv0Qd3hZgxMAsJwnBSet4d7wJvEONtONBUTL+M68MbGKlvpq6lXI15d4K0AVL1ixhTJ
         ir1aQG+XU7U3Qx6NclCc2yMPQiaG+/ZXXot/N6svp+37/pRwYsC08GmwXhKPnDLQFTf2
         GtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uQoeo0NkInHZ/staS7oZ17XwdHbhzVHZOHdrx40TbJY=;
        b=DzTR5RQWvJewaKsA50LwR8C8eA5Jnbp/BALkctuMgat0HwxU1M6IFqg9r/sYlThJ2v
         86ggxdZkuSS1xaD3ZdD+ZASpMMH7A5a7E+I8g9DYsnSkL7YCxDztHvMi+6V6/Edqfz9r
         sq1CBVgkaZSfIyGDozEBxEYJnHNOGO5K95UXPM2CwwdDhYc9jvBYYlm/AGbFwH52rY/b
         chYDDvQlebMKHND2qCFV5JKIzyVaM4cuai09QZ4kPqGZywuK0mp2wMzD1Bnv7p8Kmpiw
         xsBKb30hyDHwmVA6K8fOBle+mkYmoUKP1OBKAYBITeiOVIVamJ+Xxp84+i3JYl8dacf6
         DHxw==
X-Gm-Message-State: AOAM532A6BaJUKg44n9v5Y8yj/90rCAfUnM8Qr+ZOLln5O4Uc86FAYwf
        ayU6HJe0h/alNKSUotZ0+DM=
X-Google-Smtp-Source: ABdhPJwisPM4lMrJHfnMz+ycT05nnIdVoEB9cXxAskdP5KvKECUO6VsqdYnvkmtpBj3zQh6bksTLug==
X-Received: by 2002:ac2:488f:: with SMTP id x15mr38691954lfc.413.1621198328284;
        Sun, 16 May 2021 13:52:08 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id b125sm1429570lfd.196.2021.05.16.13.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 13:52:08 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Paul Fertser <fercerpav@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] Add devm_tegra_core_dev_init_opp_table() helper
Date:   Sun, 16 May 2021 23:51:37 +0300
Message-Id: <20210516205138.22501-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello,

This patch adds a new devm_tegra_core_dev_init_opp_table() helper
which is specific to NVIDIA Tegra SoCs. The goal of this helper is to
remove code duplication from Tegra device drivers.

Previously this helper was a part of patchsets that added core power
domain support. Krzysztof Kozlowski suggested to separate patches into
smaller sets with explicit dependencies.

This helper is a mandatory prerequisite by a multiple patchsets that
will add more advanced power management to GPU/media/clk and etc drivers,
fixing overheating troubles of Tegra devices. It provides OPP support
for newer device-trees and preserves compatibility with the older DTBs.

Dmitry Osipenko (1):
  soc/tegra: Add devm_tegra_core_dev_init_opp_table()

 drivers/soc/tegra/common.c | 112 +++++++++++++++++++++++++++++++++++++
 include/soc/tegra/common.h |  30 ++++++++++
 2 files changed, 142 insertions(+)

-- 
2.30.2

