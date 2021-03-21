Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A08C433C1
	for <linux-tegra@archiver.kernel.org>; Sun, 21 Mar 2021 12:33:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B31161947
	for <linux-tegra@archiver.kernel.org>; Sun, 21 Mar 2021 12:33:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbhCUMdK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 21 Mar 2021 08:33:10 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:42189 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229979AbhCUMcu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 21 Mar 2021 08:32:50 -0400
Received: from mail-ed1-f69.google.com ([209.85.208.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lNxGC-0006Fg-Me
        for linux-tegra@vger.kernel.org; Sun, 21 Mar 2021 12:32:48 +0000
Received: by mail-ed1-f69.google.com with SMTP id f9so21447364edd.13
        for <linux-tegra@vger.kernel.org>; Sun, 21 Mar 2021 05:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DHDU1gpmqjBqzxNCjS84KWsrFmwDGuzbA71vwv0Ay9E=;
        b=qmvz20IAV/JlLblSORO5AXoAaFmEeh8ns1Mm0T6lgdfWUfMnb4r30I9e8WleoekhKn
         yDwKBRoZYKF6R6I4SBMIXF4KsnMYEsMqkzpg/xa2g65OPZmAEdPXQflxfkrLUr9lV3LA
         pUs0W2j3yW1l2bGmb9wy2iiZmMwd+JXR1e9YUY/Exg9Dpd9q/eYsyyGEUIENjbcfW5VZ
         JanFk9fMHe+oEWIo/VkWKMA7nLYpxFVSqgDzeNy0jY0QQVuiQNdZDNgbffe/TzjBYiq7
         vZ5ikIT6uXlDYsBktyzSLFu+zbpvbPiNAhKGSjjxmYrVBYgRzF4XX/mcVy4MRh96tiPe
         sCvg==
X-Gm-Message-State: AOAM532KNeAGmzg5As5dztuTDIApuQx/8PSFhw2Ji8SO2t85EZxF5MHY
        mxxCr7rTxSJVzlpec4L4PLF/Sak25y/G/V/nGj4Wfc/t8dWm1LZ/532O/lcmEkCVb3onUcalt8W
        YVavs8IxaK8gX5WO4k9JD/V1gtJqmaMLVEFX2aZ1K
X-Received: by 2002:a05:6402:c96:: with SMTP id cm22mr20348064edb.128.1616329968501;
        Sun, 21 Mar 2021 05:32:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxoIGalzy0JccsRimagJT0ACtL9Y8MX1mohERXbGYiACXa1JnGvXydxGnKMzL4DK1G1QP4Fw==
X-Received: by 2002:a05:6402:c96:: with SMTP id cm22mr20348048edb.128.1616329968354;
        Sun, 21 Mar 2021 05:32:48 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id p19sm8214849edr.57.2021.03.21.05.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 05:32:47 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] memory: tegra20: Add debug statistics
Date:   Sun, 21 Mar 2021 13:32:43 +0100
Message-Id: <161632995761.4145.7861266441612493358.b4-ty@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319130933.23261-1-digetx@gmail.com>
References: <20210319130933.23261-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 19 Mar 2021 16:09:33 +0300, Dmitry Osipenko wrote:
> Add debug statistics collection support. The statistics is available
> via debugfs in '/sys/kernel/debug/mc/stats', it shows percent of memory
> controller utilization for each memory client. This information is
> intended to help with debugging of memory performance issues, it already
> was proven to be useful by helping to improve memory bandwidth management
> of the display driver.

Applied, thanks!

[1/1] memory: tegra20: Add debug statistics
      commit: 1ca59ca0afde17b75adc519858ccc30375cfad1d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
