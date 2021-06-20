Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D4B1C48BDF
	for <linux-tegra@archiver.kernel.org>; Sun, 20 Jun 2021 19:23:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F31B6113E
	for <linux-tegra@archiver.kernel.org>; Sun, 20 Jun 2021 19:23:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbhFTTZu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 20 Jun 2021 15:25:50 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:52998 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbhFTTZu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 20 Jun 2021 15:25:50 -0400
Received: from mail-ed1-f71.google.com ([209.85.208.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lv32d-00046F-Vd
        for linux-tegra@vger.kernel.org; Sun, 20 Jun 2021 19:23:36 +0000
Received: by mail-ed1-f71.google.com with SMTP id p23-20020aa7cc970000b02903948bc39fd5so4740439edt.13
        for <linux-tegra@vger.kernel.org>; Sun, 20 Jun 2021 12:23:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BmZlovYj9V7HeNkUQ5CcyPSAtuKZ8O3DexqZJGr+wKE=;
        b=QUhcV6wgSMUfzNWjhJ1/NAapOkYEhM9JL3umfEkZ2e/2EdtVc2K4f9FQR7dJdDQ58G
         VJyOv3gwrjbohXsmsFbzvXjb89pJA86TlYjcPpxCkMQjwKEBRIZEpNyzWl4ORZkYmRqk
         d/pYnUhg2NFQ5OEf24K9FTQnpwcr70Jf7iNhqmkdlgItntXjPAyP5AP+dGS9/e6XeEXo
         XmupPA+DkZ/soGlLD5peHNqu2sWdugMFdw5velZL1GQtJlGi+lpJ4F/rMWqDGAZ1dags
         KLb9mGhQhN+JzG+8zN9Na/uBnoKiTAmysgBYvdEIlnlrnhxDvoc45TE5Xc8kBE+5FUt+
         c2MQ==
X-Gm-Message-State: AOAM532qyQdocHUia7SViNDSoOO2boMBFbpbHnfgzSBYUDLf8PdEWRbQ
        /4v8WoVvyiY01GX2W2ybbMALisPB84EdRD47B1bvCoLN39dkRoBVz5fMpKnnebyF4KYxlj+9OFf
        d5XRIGfQR/uS/1YCFDmI4Ht4qC+v9l/+Eot3SeHpt
X-Received: by 2002:aa7:c997:: with SMTP id c23mr2730222edt.42.1624217015737;
        Sun, 20 Jun 2021 12:23:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEKmBjMwrWngqyo2C63u/7m5RV3LUtyPVC4cbCnhq2yZlx93BaiZjSA6UeNtixI5+0aCWU8g==
X-Received: by 2002:aa7:c997:: with SMTP id c23mr2730211edt.42.1624217015613;
        Sun, 20 Jun 2021 12:23:35 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id gz2sm3863690ejc.32.2021.06.20.12.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jun 2021 12:23:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm@kernel.org
Subject: Re: [PATCH] memory: tegra: Add compile-test stub for tegra_mc_probe_device()
Date:   Sun, 20 Jun 2021 21:23:33 +0200
Message-Id: <162421700960.5053.12970820617415249488.b4-ty@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210618111846.1286166-1-thierry.reding@gmail.com>
References: <20210618111846.1286166-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 18 Jun 2021 13:18:46 +0200, Thierry Reding wrote:
> The tegra_mc_probe_device() symbol is only available when the TEGRA_MC
> Kconfig option is enabled. Provide a stub if that's not the case so that
> the driver can be compile-tested.

Applied, thanks!

[1/1] memory: tegra: Add compile-test stub for tegra_mc_probe_device()
      commit: 47661ee1821fc3a6b5ae07aac37410d6ccada976

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
