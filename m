Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B63DC433EF
	for <linux-tegra@archiver.kernel.org>; Wed, 15 Sep 2021 07:37:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B2CF60F6F
	for <linux-tegra@archiver.kernel.org>; Wed, 15 Sep 2021 07:37:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231425AbhIOHiw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 15 Sep 2021 03:38:52 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:44390
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231382AbhIOHiw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Sep 2021 03:38:52 -0400
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5CAA54025A
        for <linux-tegra@vger.kernel.org>; Wed, 15 Sep 2021 07:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631691453;
        bh=9Jsg/Zb9vOxmr47H6Dck9hmK7mt/XUSoX3CVPDrTxZw=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=m6YsJANSRk0dr2my2IPIyexXMfu4iOEjS4AI0vbzeyugKwlCRtssnfvR/VOUejA7d
         NtznAp0yg99gWqUJG9Zg/VCpYGa49eNhmEm4+2QQflzyPDRlpP6QRb6xOO4ieaHgIG
         abZ7TmV7HsEB9U5XZr2Cz/JTrg2A57YcRgR+lliyJ9DwjB2Q+SNe7sKucrbcWLxbsB
         a22NFdHtVIJDw3ANzkx4hALiyI2UbpLr7vFc06ZhF8CIsVNnjqVFYOx9GG/JFN/vin
         xh4kPTL+DScCFsekr57InpDuYGGHBS8lHB36fWdSg1M/TBpJE80kUvXHKau818Q57l
         o6MdP/2EDnvRQ==
Received: by mail-ej1-f69.google.com with SMTP id dt18-20020a170907729200b005c701c9b87cso1039599ejc.8
        for <linux-tegra@vger.kernel.org>; Wed, 15 Sep 2021 00:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9Jsg/Zb9vOxmr47H6Dck9hmK7mt/XUSoX3CVPDrTxZw=;
        b=u2ei1+r6p/OgSEY+/aMMM9oh5ZzPHTGJG+pZ0lVztQQ8L6Cl04bzylZbB6R0mNT8GI
         aNDN5CIKWALo4eN0l/Ur7CPYURA3Hanoiu/ImwDeP0q2Pwtwsj54GFP5H++MvGw5rUgi
         Cx9PWZmKVN0HgQFKzowYfW9tp7/XEjyqiCgL7BVECZ7wKgoeCX/1iOTf/lkuQKLgeVuV
         ocPrNc8tuNxy+G23j9ZlXpIVKWArHNH+ofblwwS0pDAkv9yMskN5k2l55cugZs5ZSs0N
         KRmVqK+bmuqUgPb8czDFEgaMKGQEQipyeJUIa9KY7HGNF/4M8WsgSEdlDggYeC7njCfP
         blpw==
X-Gm-Message-State: AOAM5318J6F4KNi5LoGxMx3ApyZJ+FinUPK140wl2jzB+EUF08jak7GL
        WVXfWW1M0ENaUohmHX7l/cOKd4WykKWOKpbOKCjSY1vlOiI3WWe1afMrYJ3s7QK1eWwP6/oTGcM
        HyMjlPT2ofncwD3fsaeBtc1SYBxwhl2EJFeOeUvws
X-Received: by 2002:a05:6402:2da:: with SMTP id b26mr23729106edx.160.1631691453112;
        Wed, 15 Sep 2021 00:37:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9KNnHVSLzmWN5khTacRj2yNehERLh21SPyQ+lDhUrMrfW6xrVidKaH9YbxB7KxkhxkN1q5Q==
X-Received: by 2002:a05:6402:2da:: with SMTP id b26mr23729082edx.160.1631691452928;
        Wed, 15 Sep 2021 00:37:32 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id d22sm5871832ejk.5.2021.09.15.00.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 00:37:32 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     CGEL <cgel.zte@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Jing Yangyang <jing.yangyang@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH linux-next] memory:tegra210-emc-core: replace DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE
Date:   Wed, 15 Sep 2021 09:37:24 +0200
Message-Id: <163169144170.13297.3862081658679258253.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825063739.70260-1-deng.changcheng@zte.com.cn>
References: <20210825063739.70260-1-deng.changcheng@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 24 Aug 2021 23:37:39 -0700, CGEL wrote:
> From: Jing Yangyang <jing.yangyang@zte.com.cn>
> 
> Fix the following coccicheck warning:
> ./drivers/memory/tegra/tegra210-emc-core.c:1665:0-23:WARNING
> tegra210_emc_debug_min_rate_fops should be defined
>  with DEFINE_DEBUGFS_ATTRIBUTE
> ./drivers/memory/tegra/tegra210-emc-core.c:1726:0-23:WARNING
> tegra210_emc_debug_temperature_fops should be defined
>  with DEFINE_DEBUGFS_ATTRIBUTE
> 
> [...]

Applied, thanks!

[1/1] memory:tegra210-emc-core: replace DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE
      commit: 6fc5f1adf5a11422d748aa71e43e7c979208b8f2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
