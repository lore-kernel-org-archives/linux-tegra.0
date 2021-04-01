Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 161C2C433ED
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 20:03:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E01516108F
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 20:03:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235444AbhDAUDM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Apr 2021 16:03:12 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:45358 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234637AbhDAUDM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Apr 2021 16:03:12 -0400
Received: from mail-ej1-f69.google.com ([209.85.218.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lS1T5-0004Iu-Eq
        for linux-tegra@vger.kernel.org; Thu, 01 Apr 2021 17:50:55 +0000
Received: by mail-ej1-f69.google.com with SMTP id au15so2567411ejc.8
        for <linux-tegra@vger.kernel.org>; Thu, 01 Apr 2021 10:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jI4Q1f6JmKvUhseU4uFtZHzreA5O97M1GFvewVTukcc=;
        b=lj6uFLoLHMUDXG94nILNsxHbearSULHc7GApjgMmHCXsdlrMOFAsCQT8Ums5VKsidX
         HRmJBydPdaydzv2W7ax3wQipcoNXpEPrD3eMZZmqFJK3IyktS5a1DL6ByuFkE+ippI6V
         D7/m/9EN/1q6fj/ToHwxtxmtTMZGbgSpyhbpgfQuc6lr/lPW1ZsEDfAI/tlqkQjqrXRg
         HlQI8ue0DT7k6j7sVCYPJJmoQoJpoGEbIq+0zZi7gcbgfeaFvOBQYT8v48hkpCq03LiM
         AkwcBSDPKVZOtNLkCZ3xnuAdCMA5wYIK+cJrL+FEb2dxYUzvcYfJ3O60PiSDU0abrnR9
         rd0w==
X-Gm-Message-State: AOAM531n5ayq6M5CLapC6gM/dJRrq9jd1Uhc7T1OASNbhrqKOJLJSKm2
        HKcd0/+MIgSyQjezQ4jLpzStfRhKRGojRPN10JmhyAnt1y63n6qzdvCoHQ0N1Kbb+UiMQQbrpxw
        05mx/AAcYq3NzwSrr8VMLFjIWBst2iPKB2MVY5aOc
X-Received: by 2002:a17:906:86c6:: with SMTP id j6mr10041944ejy.197.1617299454729;
        Thu, 01 Apr 2021 10:50:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDSkyQ6PuA/8iyU/VtM67QamGObdqG0BXSB2U5ohluI5HgA3wKWbFxOvwx6jhDgk/pg1SS7A==
X-Received: by 2002:a17:906:86c6:: with SMTP id j6mr10041932ejy.197.1617299454607;
        Thu, 01 Apr 2021 10:50:54 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id v24sm3137066ejw.17.2021.04.01.10.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 10:50:54 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 0/6] NVIDIA Tegra memory improvements
Date:   Thu,  1 Apr 2021 19:50:52 +0200
Message-Id: <161729942370.11933.4405261208235446764.b4-ty@canonical.com>
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

[1/6] dt-bindings: memory: tegra20: emc: Replace core regulator with power domain
      commit: d46cf7106c4979117e108336dfadcaf57d23f9ed
[2/6] dt-bindings: memory: tegra30: emc: Replace core regulator with power domain
      commit: c19137a97e39a9cdf24c9feb580af4564997c1f9
[3/6] dt-bindings: memory: tegra124: emc: Replace core regulator with power domain
      commit: 749d01cd0b796adb69d68e9079520f4f95b17cd2
[6/6] memory: tegra: Print out info-level once per driver probe
      commit: 06949d1d9accbc7d3a029536650162bbca30151b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
