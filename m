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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34522C4320A
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Aug 2021 16:22:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19167610FF
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Aug 2021 16:22:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbhHMQW3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 13 Aug 2021 12:22:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234367AbhHMQW1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Aug 2021 12:22:27 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BECD4C0617AD
        for <linux-tegra@vger.kernel.org>; Fri, 13 Aug 2021 09:22:00 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id o1-20020a05600c5101b02902e676fe1f04so7986874wms.1
        for <linux-tegra@vger.kernel.org>; Fri, 13 Aug 2021 09:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cvMCxY97+19NBnX/9se1xiPhL0qxZh2NAax8kyQ2dwo=;
        b=dUbSPwhvwSjHPMw92H/M1+w9GaV/wRo54rK6vfEWeNEM5Ajh2pCT2OG8xFbmxWMnCf
         2tUTRHwNcIfsApSO9jYxTE7E6gXiLGRYFWjlnYu4WdQs5OMNKQSDw8WLWlBfVVEOb7BF
         /pEnKizufa1clufaDdxhNJBqX9MgLmMuCB5x2Ky7b+u0Omw427lGZmx9BIiSeZio+/ZB
         yVFHvlBl53sEUpf9YmEcMx1xqOiURmTtm6T6sorfxt6fy7DuhZg9x20uJYeJ/gCdDvYV
         9gLZR2MFU9gr8zBntLqAuLjMewdKGHqjV18al/pUGEgRhn4wgYHuqKQkIN++hlLTXfaC
         mq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cvMCxY97+19NBnX/9se1xiPhL0qxZh2NAax8kyQ2dwo=;
        b=lNHayOa4WaFYLS3A5u6RUaJohw/RzIQzQFNSRb8A6mzM+n0fi6+xSMQ8Ky5o/Tdc0l
         DOklboWGY4T4w6Bh7LllGF4Ip7i9d1fqH0cCGNQZr9tFQqVjL7XB5ks+L6VOO2yFfjvT
         EJuKrxtGYVbN1p2rkcl8uLKK9Z0PpLgqM+1F4rqEJaW4fxw0iUdRyXzjRaqTG7f2aLvx
         4Lify97WqkDiF5fSZyqarclNBh0m0uD7d8eEz33S7kxrSGkSIXryfwCF7FtdnaAIVONP
         cTrLO+4SBEKJaoy19WWcgbd6fc25qt2rai/rx8urrsivnXUYSOtdJOFwLCTbb+IAsoXQ
         mkSg==
X-Gm-Message-State: AOAM531pTfilsV4Rr4nPXwqiyGUO5QpQhm5sw6x3jlwUsu/Bwx8Jx0Ct
        KCEPYbaf/X7EY/lOK0Yn+UQ=
X-Google-Smtp-Source: ABdhPJwn/ymZnHrGWDZ5iKAtYE+5ZRurgB6fOyOH3CXkBKWzIk2EWBxsfrai5X2NWibh+8KUsGe2mw==
X-Received: by 2002:a7b:cf0c:: with SMTP id l12mr3467826wmg.62.1628871719342;
        Fri, 13 Aug 2021 09:21:59 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id l38sm1769106wmp.15.2021.08.13.09.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 09:21:58 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] dt-bindings: Changes for v5.15-rc1
Date:   Fri, 13 Aug 2021 18:21:52 +0200
Message-Id: <20210813162157.2820913-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.15-dt-bindings

for you to fetch changes up to 900a486ac73dfdf9b1629e7e4df6eacc92da7578:

  dt-bindings: tegra: Document NVIDIA Jetson TX2 NX developer kit (2021-08-12 15:06:28 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v5.15-rc1

This contains a single patch that adds the compatible string for the
NVIDIA Jetson TX2 NX developer kit.

----------------------------------------------------------------
Thierry Reding (1):
      dt-bindings: tegra: Document NVIDIA Jetson TX2 NX developer kit

 Documentation/devicetree/bindings/arm/tegra.yaml | 1 +
 1 file changed, 1 insertion(+)
