Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 054A4C433ED
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 21:37:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D99E161465
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 21:37:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231923AbhEJVio (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 May 2021 17:38:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231738AbhEJVio (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 May 2021 17:38:44 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED5E5C061574;
        Mon, 10 May 2021 14:37:38 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id a2so4559921lfc.9;
        Mon, 10 May 2021 14:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZZ3dIYF17xs8rq6AigAREJS41sYYsN6ajt+jO0WIUAc=;
        b=k/mSGpy7Gn7gaeUqTmgUQEuWeKxEgzZQP3ejR1LjntRPIlqLl1DmXvGc6SIjSp4UTx
         MtwjXBDzIXP+h4/VpqZU/yPDXhLwPqFnCx0pemFoFC1xSNJiVICLKkGQu9v7YImlCOxb
         rKagTKMb8h7/DD/yywIOPuCykf3/u0hSYVzsh+yWSMqSjOs592qBMrdW0OP1rcOrpyWo
         e4UxkpHCNblUdNYKp5hvVb7FkWrL1mKCwlqoXSs/EI6rqojJT163tOVg3a5oYDEvOu5C
         Aih4+bGxDQ+pZfPKYOHo3F8fNqONwK7tE0DBnWYZ5rNnyItu4JBGlw9fHxMKesNcv0UI
         BqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZZ3dIYF17xs8rq6AigAREJS41sYYsN6ajt+jO0WIUAc=;
        b=KO+uQ7FDOcuK60EdiQRVxUkwU5gJvRzJJI3uGSFi0QAbZto7rl4ohThZ8tg/EcOfbe
         VaWPuKJeuAfSEXmmzwJSe1rXZEBiOgfACDY0ZSlElWGVBZlzf/S2mqJlmZn08kQaHu9Z
         RPsCgB9K+2I78o/3DKCVBadScB4T7ah51khfCoCi+IHvJLM7mHVCSnZfLzOwFsgPdT0B
         q2YKw2hzIuSywWvbVQiQ06vdRLQFvR5WIHKjoagtSzb6F3V9+Y7X+MayzqKaWh4PNr0/
         EbcAYZ+StNSjaqJwTe2hX7BAJScz9+rGTKe3FLdhYb2OJdl7Ye0GgygkYheCwqGOivhV
         soDg==
X-Gm-Message-State: AOAM532ousPDeM4pB8UTl2jh+worOIdm5fBmjkArI2ilAUPfYqO+3ORk
        anvTwOUvZXCRrCSA/9DW3R4=
X-Google-Smtp-Source: ABdhPJwg5ANjLJgEc7KYzBaudAUgK5jdtvLRcMzuf9jtf0GuypbXJBgTxrD5Iyrd55W8ym2F3lwZFg==
X-Received: by 2002:a05:6512:114e:: with SMTP id m14mr19377348lfg.385.1620682657547;
        Mon, 10 May 2021 14:37:37 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id 9sm431315lfm.271.2021.05.10.14.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 14:37:37 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/2] Enable compile-testing for Tegra memory drivers
Date:   Tue, 11 May 2021 00:37:27 +0300
Message-Id: <20210510213729.7095-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

This small series enables compile-testing for all of NVIDIA Tegra memory
drivers.

Dmitry Osipenko (2):
  soc/tegra: fuse: Add missing stubs
  memory: tegra: Enable compile testing for all drivers

 drivers/memory/tegra/Kconfig | 10 +++++-----
 include/soc/tegra/fuse.h     | 20 +++++++++++++++++---
 2 files changed, 22 insertions(+), 8 deletions(-)

-- 
2.30.2

