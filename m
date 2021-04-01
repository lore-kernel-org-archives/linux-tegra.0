Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B245C433B4
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 20:03:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F8E061006
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 20:03:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234818AbhDAUDE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Apr 2021 16:03:04 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:45358 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234637AbhDAUDD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Apr 2021 16:03:03 -0400
Received: from mail-wr1-f70.google.com ([209.85.221.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lS1Wa-0004kI-Pv
        for linux-tegra@vger.kernel.org; Thu, 01 Apr 2021 17:54:32 +0000
Received: by mail-wr1-f70.google.com with SMTP id z6so3100181wrh.11
        for <linux-tegra@vger.kernel.org>; Thu, 01 Apr 2021 10:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5dMbR7wCBt/+xH/e8sgRUmjWpaig2muqZGSN778lIFA=;
        b=p9MuNujkrOd3iscOvHLbpdQeNFd8EfBvVO8g6aizAzg8Xyb85//OdCFFj4KLrXdXej
         OOUxU+uwqc7YqhHUN/zi00K/hfuagvGJCJ2tjXLQzkgr2IzS559MK9wZkMiZrZVBbNuP
         uv3BCmfrz+GjzAlt40LZZ3V1czUeo9jjZevmpeh0xgYvUJ3475ciP9/58bvkjaw6HTQl
         zEsZ+toL22iL8dQzSK3Gvt0UHQyAQW0EnHpck43bkXL98Auj3+yQH5wMepszaNJr9Zrq
         nc4R1NZh3s4/qnYZ46MEvJD4qL1bke+K5I9q5CQmbXfoaPb62YqcRKswf/nb968n5aNQ
         5WCQ==
X-Gm-Message-State: AOAM533WRt6RtrhKIzAfCM9rXcIWiYqdm/zwm3o0ILAj5r/YJSs/qVYv
        ynHd0E8zEc42E/Up/XEVM55U/xrwMpJIDTJuczVmYntDjKg6iJ4DlxiH9Qy0cYHUYOnN0r1Kw2d
        udeLlPNOtTCihe9bbbRKxgIDFpqKHosd4vmDyeIeR
X-Received: by 2002:adf:ec01:: with SMTP id x1mr8807888wrn.353.1617299672595;
        Thu, 01 Apr 2021 10:54:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbSdlZKPMXFL4nQftb0j/6maPjV/oqPt8S+RTK5Jj3mxkExo7AEjR5QNpmbun8G+weRTqHrQ==
X-Received: by 2002:adf:ec01:: with SMTP id x1mr8807876wrn.353.1617299672482;
        Thu, 01 Apr 2021 10:54:32 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id c9sm10481524wrr.78.2021.04.01.10.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 10:54:32 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/6] NVIDIA Tegra memory improvements
Date:   Thu,  1 Apr 2021 19:54:30 +0200
Message-Id: <161729966152.12691.6136048726737117285.b4-ty@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210330230445.26619-1-digetx@gmail.com>
References: <20210330230445.26619-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 31 Mar 2021 02:04:39 +0300, Dmitry Osipenko wrote:
> This series replaces the raw voltage regulator with a power domain that
> will be managing SoC core voltage. The core power domain patches are still
> under review, but it's clear at this point that this is the way we will
> implement the DVFS support.
> 
> The remaining Tegra20 memory bindings are converted to schema. I also
> made a small improvement to the memory drivers.
> 
> [...]

Applied, thanks!

[4/6] dt-bindings: memory: tegra20: mc: Convert to schema
      commit: 6553fa57cb1707396ad3a27dc78fa61e1750ab31

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
