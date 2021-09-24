Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 173A8C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 11:21:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 010FD61211
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 11:21:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245365AbhIXLWq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Sep 2021 07:22:46 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:54924
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S245092AbhIXLWp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Sep 2021 07:22:45 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F1014401A9
        for <linux-tegra@vger.kernel.org>; Fri, 24 Sep 2021 11:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632482471;
        bh=qTTRq/cF6M6VkeBluJMjAjm+Uf6cMUMQZt/uJUhnSPk=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=nMk0iBI6i4TvsxZBYRzaHPBwwEUot54xwqiBATfnjFRKuvwj05j92qszH4IikRkwb
         5zj5udAkdlCCbrj8Jp7Lmk/P5Y9huFGOQi+dryUY2piPHGV2q9OdRKJu0tC402zWIR
         mreyGHVP3Uemx6Yv6JxBjJcWod15c7oDd1eXfJfSUZkIRlNbOVe+7/SCD8IkX8/CqP
         5H0K70Y+YaY0XAflYrURa5OgSvr0sjUCrC/YYasL3dpmIhWGjYBet3CqvB8DF2piYt
         OzdRHBin9CwTW46Lc9EpxD6fsYUDaFPdFB92zqof8CvPLvarNr/HaUQacl6Twg4hC5
         yYczGgNlp9Jdg==
Received: by mail-wr1-f72.google.com with SMTP id f7-20020a5d50c7000000b0015e288741a4so7780523wrt.9
        for <linux-tegra@vger.kernel.org>; Fri, 24 Sep 2021 04:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qTTRq/cF6M6VkeBluJMjAjm+Uf6cMUMQZt/uJUhnSPk=;
        b=VMoLYUgg5Kg75CtA16y33aR3k8LKJ4JyV/cv0rmoi63mJhKqL+OKofkSoEB98s2Ewg
         sdEe5XzROeC3DeCwJ4A1pbImLyfYKRmLvchP33Nh3xvwkOp5cK+3IOflZTMkslm7P8Jb
         GG0GC7NTx3P5cMxND0cnFqxskkQsZYuNNnTThNQp/Zw8gDuNWDoa8mlXklC+CvnR1+ky
         a8pIk8xih7g97ky1qpN2vxQSZCN97WELiTDgwHbWR03hDZNKo2jT8soLaiP8f8t33DBy
         h6nArBgTumKLz+bLN3KR0aYUGnvkCO+D0IbM8hfFRt/W3Nv7tSB5uWqJ3T3+CpH/sYWb
         NXCQ==
X-Gm-Message-State: AOAM533Sk6TxToOSLiQtIcYsF+hBlMFJ7xbuwXOrZQCnL3w9efjhy1xP
        fqDbUnQfnEnmqxgQlYfhRwTAIkdBimX1Mu0Z1AeZ1Go6RD2Ro/guoSKERz/twnUHksxlbgei+mR
        3IwIFbKX81y80auLGE/rVqJYWBeT/GMEWZ+emPrnz
X-Received: by 2002:a5d:6c6e:: with SMTP id r14mr10457390wrz.319.1632482471696;
        Fri, 24 Sep 2021 04:21:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgaaL4O++/B8KXnrTWwkZY7SeSfSOlTkgSIyuaQJFk5An9tksPtF9/mV0VQ+s/IPzXcKTlLg==
X-Received: by 2002:a5d:6c6e:: with SMTP id r14mr10457371wrz.319.1632482471530;
        Fri, 24 Sep 2021 04:21:11 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id b7sm9881473wrm.9.2021.09.24.04.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 04:21:11 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] memory: tegra: Make use of the helper function devm_add_action_or_reset()
Date:   Fri, 24 Sep 2021 13:20:36 +0200
Message-Id: <163248239878.48775.4100179078920031712.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210922130002.586-1-caihuoqing@baidu.com>
References: <20210922130002.586-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 22 Sep 2021 21:00:01 +0800, Cai Huoqing wrote:
> The helper function devm_add_action_or_reset() will internally
> call devm_add_action(), and if devm_add_action() fails then it will
> execute the action mentioned and return the error code. So
> use devm_add_action_or_reset() instead of devm_add_action()
> to simplify the error handling, reduce the code.
> 
> 
> [...]

Applied, with simplified commit msg (no need to write too much for such simple
change), thanks!

[1/1] memory: tegra: Make use of the helper function devm_add_action_or_reset()
      commit: 1d8e0223bb52071ffc59391f0ebefa06ce5643d7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
