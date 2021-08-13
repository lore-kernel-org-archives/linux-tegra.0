Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5103EC4338F
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Aug 2021 16:22:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CA64610FD
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Aug 2021 16:22:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234436AbhHMQWa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 13 Aug 2021 12:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234309AbhHMQW3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Aug 2021 12:22:29 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4FAAC061756
        for <linux-tegra@vger.kernel.org>; Fri, 13 Aug 2021 09:22:02 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id r7so14109445wrs.0
        for <linux-tegra@vger.kernel.org>; Fri, 13 Aug 2021 09:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vu2kk2+ZSy2NLtNn5/uqEi9lhMnezhSZVswShT8ce2g=;
        b=Rld7Vvb9ZG4tAOM1XIDqx8C2J+r9MEFewhf8Y4n6MgbrByII00sJIlTmofYPxb6U6d
         PhLtXfccBAK078PbfN6ysepaxLB+g9Nf7bUwLis6Xvc+cPsLLl/0RMmYWdScimLqtwW1
         72guLKcLb1/ofF/AB6Pq/FYH9WxfRRHyCuBAP1Dx/0Obm00F6toV1lO7b/oI4A+YiY3i
         XA73VWPf4+6sPh6LFXWe5XkhYTpPxDWFgxP1oJ6tgbNaq9YbXdGswgRlJey7dICkwelF
         RhYiksX/WD32mb0PEcjozFG5bJCk2FXjlB+BaFjM2Ejvjl8XUZpUZkjcM/oacB3sAs17
         ZgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vu2kk2+ZSy2NLtNn5/uqEi9lhMnezhSZVswShT8ce2g=;
        b=XmuVlHOPEuh4nicOn2DbAAeeJe894GtFakyrgr15yzQBHpUrGVppGELAG1X26OXBsU
         xQYZnT3/hQ/BlbLa931nkZ9Q71B4QwF88rhhEzDSHu17fL7DBdFOrCrNtyUS/sGRdR6g
         3euw9z44LPJp8PP7L6HUTpB9GNQVfgxv3PP43OrtBKNaKc9jsK0IbGSSFe6gX+morsxT
         fCvnUYtFZaDAzYqOzWvFO8Waq7swGbuImNQtQy+gkqBPCqmY3B7VOjKCp/1EbpBJ8DVH
         kSk7OjhWoq0u29+27+l7wT7K+qfJmmz5w98nZKDQntxIFamdFasuPy2oHxtdxpk5mTbs
         KrHg==
X-Gm-Message-State: AOAM530V8Fg/LpInGGRaZVxbBVB1KuBooGQkiVCHXrYIoN/o5422avmU
        tKDpu9nXQ9zrqK74Lwyzt/Y=
X-Google-Smtp-Source: ABdhPJy1OK90uercdsSGG5Ae3o0Qo/i4GTUPe8bm4EuAq0uwal93ERQZ/MFwHkPnl0udGsTYDoUqSg==
X-Received: by 2002:adf:f141:: with SMTP id y1mr4096811wro.173.1628871721527;
        Fri, 13 Aug 2021 09:22:01 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id t1sm1925515wma.25.2021.08.13.09.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 09:22:00 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/6] firmware: tegra: Changes for v5.15-rc1
Date:   Fri, 13 Aug 2021 18:21:53 +0200
Message-Id: <20210813162157.2820913-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210813162157.2820913-1-thierry.reding@gmail.com>
References: <20210813162157.2820913-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.15-firmware

for you to fetch changes up to dd00d75007d27677158bf6e64000d2e266035294:

  firmware: tegra: Stop using seq_get_buf() (2021-08-11 12:17:18 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v5.15-rc1

This contains a single fix to stop a slight abuse of the seq_buf API.

----------------------------------------------------------------
Christoph Hellwig (1):
      firmware: tegra: Stop using seq_get_buf()

 drivers/firmware/tegra/bpmp-debugfs.c | 58 ++++++++++++++++++++++++++++-------
 1 file changed, 47 insertions(+), 11 deletions(-)
