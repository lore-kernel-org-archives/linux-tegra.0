Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB480C47096
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 19:51:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0652613F9
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 19:51:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbhFCTxM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 3 Jun 2021 15:53:12 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:49616 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhFCTxL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Jun 2021 15:53:11 -0400
Received: from mail-ed1-f70.google.com ([209.85.208.70])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lotNF-0007Hy-T8
        for linux-tegra@vger.kernel.org; Thu, 03 Jun 2021 19:51:25 +0000
Received: by mail-ed1-f70.google.com with SMTP id h23-20020aa7c5d70000b029038fed7b27d5so3732242eds.21
        for <linux-tegra@vger.kernel.org>; Thu, 03 Jun 2021 12:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rAwuaizKnHSw7jcySUWtMcrGLyhZKGyKa1FtaJiOZfU=;
        b=AyRVf/fMpiGGocIzvubaLEKAdHZGhmHzajCqbQXgSqVX87pjKREVuXCeaEURQMKurp
         Le8KqTwpbvSp1Shkz5WywUycB4oiwWuE3iKUVMO4GrCGzzpRsH4JeLEzi2pydCinHHFZ
         vzN/0VqiXB/sNOD7fL9y9SFRiMCaV9H8hBy2TE36Qy/GradlyH5Na/EYBp6ZbKNH2YO6
         vRT3cr1rp0RYdbXsNeb3/g6XgNZRUTO91Z5Y/ccc9Tb0geXXqoUSHRtsi/xNH9iqnFEq
         4B66dVJyTkV9MX14CzlDXjTcMhfiuOyaYM+EMC7ikEUN7HMCkFJUSRxERqr6bMYl25zJ
         NOyw==
X-Gm-Message-State: AOAM532bQCqiDtanY6MaApX2VySL2V6BQLxTBSUXbMb2qBXNRxyRdi0E
        iXVlrBTHtyhv+RLWCO4GznmIv+JqEVKFsdB8Wvg36VV+8m7YMVuLqhiboG7bNKHBk9r8Vgqgecj
        UGQxZJUGwM/FnpBj908ZRS4Too6y7EuMFhtBPZctO
X-Received: by 2002:a05:6402:2049:: with SMTP id bc9mr1079137edb.298.1622749885661;
        Thu, 03 Jun 2021 12:51:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGpjLMpzFvH8k37CeCu+cnPFQjbwuHwUA2BOWSCbzmr4SjSu2kiy1SAjeP25cSMH6cs/h+KQ==
X-Received: by 2002:a05:6402:2049:: with SMTP id bc9mr1079125edb.298.1622749885469;
        Thu, 03 Jun 2021 12:51:25 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id n15sm2185505eds.28.2021.06.03.12.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 12:51:25 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 00/12] memory: tegra: Driver unification
Date:   Thu,  3 Jun 2021 21:51:21 +0200
Message-Id: <162274987316.22918.9291045392269099802.b4-ty@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210602163302.120041-1-thierry.reding@gmail.com>
References: <20210602163302.120041-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 2 Jun 2021 18:32:50 +0200, Thierry Reding wrote:
> this set of patches converges the feature sets of the pre-Tegra186 and
> the post-Tegra186 memory controller drivers such that newer chips can
> take advantage of some features that were previously only implemented
> on earlier chips.
> 
> Note that this looks a bit daunting from a diffstat point of view but
> the bulk of this is in the first two patches that basically shuffle
> around where some of the per-memory-client register definitions are
> located, hence the big number of changed lines.
> 
> [...]

Applied, thanks!

[01/12] memory: tegra: Consolidate register fields
        commit: 4f1ac76e5ed9436ff3cd72e308527fd1e90b193a
[02/12] memory: tegra: Unify struct tegra_mc across SoC generations
        commit: e899993845e60cc24d8e667a312eaa03a05d21ec
[03/12] memory: tegra: Introduce struct tegra_mc_ops
        commit: 6cc884c1c7fe5ae9362180d4f7d4091774921a0c
[04/12] memory: tegra: Push suspend/resume into SoC drivers
        commit: 5c9016f0a8a3ba30c6593d2cb0d067164dd41846
[05/12] memory: tegra: Make per-SoC setup more generic
        commit: c64738e949940bea2bb426b104b4de0aa42a8f48
[06/12] memory: tegra: Extract setup code into callback
        commit: ddeceab0a959d199de776eaf5da977574b7c8f16
[07/12] memory: tegra: Parameterize interrupt handler
        commit: 1079a66bc32ff04eaab792152a9ed9c7585b5efc
[08/12] memory: tegra: Make IRQ support opitonal
        commit: e474b3a15db6023dca4424fd7ad941fe9de6d6d2
[09/12] memory: tegra: Only initialize reset controller if available
        commit: 0de93c698587cfaf1ec36d4c78fb9c6a76544390
[10/12] memory: tegra: Unify drivers
        commit: 7355c7b9ae0d45923bac088bc1faebd5e9a66164
[11/12] memory: tegra: Add memory client IDs to tables
        commit: 7191b623a238f8859f70defc227b85fa9bce18d4
[12/12] memory: tegra: Split Tegra194 data into separate file
        commit: 8fd9f632ba93c0291a73be25ddd3f22631cd1052

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
