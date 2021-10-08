Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B28D7C433EF
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Oct 2021 20:02:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9256260F57
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Oct 2021 20:02:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231584AbhJHUEU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 8 Oct 2021 16:04:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231408AbhJHUEU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Oct 2021 16:04:20 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66C71C061570;
        Fri,  8 Oct 2021 13:02:24 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id m22so33122556wrb.0;
        Fri, 08 Oct 2021 13:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WHL6Fc9zKQ3IFaJYhe+ZjgZ/nPG2vGZVGPKI/G9l69s=;
        b=VE46TrkxSpus5vfSZsHh4+GygXMvH2u0kIuGA7OhQpE0uGFhbk/FSMmeyGYJN8U0Lq
         h8bJRE4OieG1Ll7e+UBJBkGSFJ4YQMVQirPvAjSrypq0UlQnfTX716IMika7xAxVQIOV
         h3gXyGAHKFvZKSsyMxipmLTEV9go0Qye8g2uw4zTLPQOiMii0GKP0j/x4XmgRG1AApu/
         3I9uLWe/AYYxx+Lf8ESRdYiadfmmEIcOCWi/AzcWMk1QdBwBpf/RN9Vm1ienvDR3I6q5
         T1dJbRZpeubL2g6jpz/NTgo1odx2SD46h0k3Kmoogpvp0z0AsMvmz7yQE1HvrTAN/lD/
         Mj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WHL6Fc9zKQ3IFaJYhe+ZjgZ/nPG2vGZVGPKI/G9l69s=;
        b=uMDBWBmGWhlxE4OSCnuaCPpiu452NjPcwS1RnlAmyYvy6mRLrGtrsq8NoqCSLRWSXU
         zv6KZb9IQphOJW6PguYsIxznGjlPPu9EDa7YHFaRtQlUmxUHvIU1KG00c48sDrfzC7sZ
         0NBBufN/QhVEWXLGjgnaDIrKnvAOPk7TE6mML6ccfE3CAX0Zskjh5Qj9P4xBd2+2To3a
         9HJ5XAHPHYATO1O/fKxsCK7XQcRwWPZCqY5gNNySmTRhSYZsw79yDGSb3Wcf815kG0yo
         nF5Qi1I9rKH95vFENq2h+KGbsnuv1af7SSuZOMJPBY1bo6U1pRJaXXKbGAQjHCugvK/h
         Criw==
X-Gm-Message-State: AOAM533/D4bD9ZzR5rRIPLMbHqYSxjAjOSQgA8QV9yr4uj51nI6NGe7d
        ukFHAtU5PafSdNLjV8VgPz4=
X-Google-Smtp-Source: ABdhPJx2ZUY2c0wqoekHC81grisuK+n/7y2O6wZIjmYneXZYC+X+82obnDhc6+Oz+ynb1TKHZI84og==
X-Received: by 2002:a1c:7dc8:: with SMTP id y191mr5373278wmc.181.1633723343000;
        Fri, 08 Oct 2021 13:02:23 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id w5sm252191wrq.86.2021.10.08.13.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 13:02:22 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] clk: tegra: Changes for v5.16-rc1
Date:   Fri,  8 Oct 2021 22:02:21 +0200
Message-Id: <20211008200221.1678412-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Mike, Stephen,

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-5.16-clk

for you to fetch changes up to 4ad81f6ef89b62434f1d2ed26e9bec9d0e3d9dfe:

  clk: tegra: Add stubs needed for compile testing (2021-10-05 19:08:11 +0200)

Technically you don't need to pull this because it will go in via the
ARM SoC tree as a dependency anyway. However, I'm sending this out for
visibility and in case you need this for conflict resolution.

Thanks,
Thierry

----------------------------------------------------------------
clk: tegra: Changes for v5.16-rc1

This contains a single change that adds dummy implementations for some
functions to enable compile-testing for some drivers depending on them.

----------------------------------------------------------------
Thierry Reding (1):
      clk: tegra: Add stubs needed for compile testing

 include/linux/clk/tegra.h | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)
