Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B8A8C4338F
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Jul 2021 06:27:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5542A60EE6
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Jul 2021 06:27:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233935AbhGWFqy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 23 Jul 2021 01:46:54 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:52404
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233835AbhGWFqw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 23 Jul 2021 01:46:52 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 5A3273F343
        for <linux-tegra@vger.kernel.org>; Fri, 23 Jul 2021 06:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627021645;
        bh=BVfxHW5e0txMWNeBpenkIfYlW9+/vHPUxzadxmisj2M=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=ZrnFRL0GfkWrskmb3/CFK89YlQ08WG+8vPLS1bmowGdzTdW+xJAjKbV62gIyv9ho2
         Mgk4BQj3KGuZj4iCHdGmS3xUc3icnqrnH6daO7n7i/EozYAw6s7n6FNXAsC3dUZiqJ
         CHn8Dtg+o7/a5415rTycOc92K2V+C3uQQhL6pR3TMB6CBXVMm2igknPfTLaIWPp8gc
         y0VlRo8N5qa9PlG100s0njrByt24ir2DUkXpzWm3X1/1HZ4Nm7vmb4fO2kAZY5ANFS
         9seE225FGDn+8nibd1pnXK2LYIQVH602qi76gvqPgb09oBl2fEMisv4Y/Uvy6kQN4W
         cPKwcmCJqCi0Q==
Received: by mail-ed1-f71.google.com with SMTP id n10-20020a05640206cab02903a4b3e93e15so233407edy.2
        for <linux-tegra@vger.kernel.org>; Thu, 22 Jul 2021 23:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BVfxHW5e0txMWNeBpenkIfYlW9+/vHPUxzadxmisj2M=;
        b=HSQJ/CJXyM+EF8smufVIaGrkJVIcQeOtdFzZmEOklSPv27mQ4EHhMw9iCQkYhVe74d
         SUF6D4PBCq4lr0EZJgUGbM+Z3Sy9L6azITivuvMNYJkW2broncXrzCflt74yPhX8wqG/
         nUqxL9Cb3hrMZ1kb0ycBt/Jwp5+LNS38/DvFXBKZ0efkCMw8JFUW8Bgt7WKO6TwjHfKS
         /B4GVSadzUNA8hjjF/5to561iRXx3QBsA0Ur+wGmAUvvNM1ntbui3a0Zl4noGeLe7Sdb
         wbXqLM2Hq8pspopK9PY/TrWPyJhp+X3wpeVb3/q/m8B7yRpF4kSUiBlyDVFMXPrnqLrF
         CV6w==
X-Gm-Message-State: AOAM531GrFyeEOmR2ylQ3Kf7fuMO7lZiMqoqPAN144ztnp8TyVF5wzqt
        dAtquQ9tdokcFSj9VA0Hc1TJs2OLG/cvdhH+HMkUJ6HBtMXP7ixXWF/mB3LyQAjgNWXjZU7v5VB
        llp1TGdEkrDNsVmWFDQcLeohz5UYGAzpm+/UZQyB1
X-Received: by 2002:a05:6402:14c7:: with SMTP id f7mr3836124edx.84.1627021645157;
        Thu, 22 Jul 2021 23:27:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7YBaLklYdx8pMyrPGwqRyW3BrTXsuwbNayQmX95MvMBycvj7QgE68fkUlanxy0AVX3tZvBw==
X-Received: by 2002:a05:6402:14c7:: with SMTP id f7mr3836115edx.84.1627021645050;
        Thu, 22 Jul 2021 23:27:25 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id u5sm13449844edv.64.2021.07.22.23.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 23:27:24 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Jonathan Hunter <jonathanh@nvidia.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-tegra@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] memory: tegra: fix unused-function warning
Date:   Fri, 23 Jul 2021 08:27:17 +0200
Message-Id: <162702163037.6229.205743572149857743.b4-ty@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210722090748.1157470-1-arnd@kernel.org>
References: <20210722090748.1157470-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 22 Jul 2021 11:07:43 +0200, Arnd Bergmann wrote:
> The tegra186_mc_client_sid_override() is only called from
> an #ifdef block:
> 
> drivers/memory/tegra/tegra186.c:74:13: error: 'tegra186_mc_client_sid_override' defined but not used [-Werror=unused-function]
>    74 | static void tegra186_mc_client_sid_override(struct tegra_mc *mc,
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied, thanks!

[1/1] memory: tegra: fix unused-function warning
      commit: eaf89f1cd38cf7256ab64424fe94014632044d57

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
