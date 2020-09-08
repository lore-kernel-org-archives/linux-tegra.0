Return-Path: <SRS0=mK2W=CR=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6378C433E2
	for <linux-tegra@archiver.kernel.org>; Tue,  8 Sep 2020 23:45:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 571D8206DB
	for <linux-tegra@archiver.kernel.org>; Tue,  8 Sep 2020 23:45:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WEavzin2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727935AbgIHXp4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 8 Sep 2020 19:45:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726801AbgIHXpv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 8 Sep 2020 19:45:51 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 236AEC061573
        for <linux-tegra@vger.kernel.org>; Tue,  8 Sep 2020 16:45:50 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id y17so589543lfa.8
        for <linux-tegra@vger.kernel.org>; Tue, 08 Sep 2020 16:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nqlCz46v8uEccjihDR7hwRP+AvQ7XUetwVJ3dIAkBHs=;
        b=WEavzin2dbCwe3OR8nfls/ct+e+8t4vqn5qaOhGa+SaF7IhZTJZE0yw3KdwivEcs+D
         URkeQzxSD21GUX6RexWB4Jzh9cM7fjE7VBTZ5rMTYwz6rvH2qTZwvyjOubiORS+tWj6P
         3FRPiHJmAjWgB2LqUAdFJAaAyA4y+iKf+aQL6YF8TpOtLo2gCLirtMykVyJUlD+tyouJ
         kJLcT0lVs+BDjRaSUCF5GbQ3BJfovnBcVrv2w1DyuqUFxFdbydN6NR+hv7PP6tz9pbba
         pHKoRYlC6ekkDfpQdf9GwzOHM4dau6ziHaWAc4XcQ9mVnIN8HvxcDvk7SLQ2TMH6vHTB
         ef7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nqlCz46v8uEccjihDR7hwRP+AvQ7XUetwVJ3dIAkBHs=;
        b=rZ11///UBOKAq03bMA+rTrdz+xIxbPIjl/BzOfpzbbjozDJSOOl3IzGyTsgA8uFrFB
         1TNrC/FXOwAtzX5XyGHiPvnUZbZWzt26ZqRvCki5xlJzTqkrqZ7KtG05odlNuOV9hRB5
         r1WlGE2lNKxrv1WeKWfVOi59c/Z9kXF/qeey6ooZF056k9rnvK5pC+NUBUCLMylCK1Us
         gVGE8jsUeMHG8MkXrAeIvLVfI0fQfLTdduMbga7ZE/EJMKls6bcn8E+zDnyNZCakzcCY
         ENYykWUuZp7uy5Qqqi7UQFujmkNXI5J85LloknJMBcF8mpfakvtI+9hrZ5QIJffc8hqX
         1StQ==
X-Gm-Message-State: AOAM530w0nluHJ4Del7GHxySkrTcYrrlYmUHJM8B/4cz7hCcltiA5Y1Q
        avL8WA6X0xeQuKXsMI5Ldow=
X-Google-Smtp-Source: ABdhPJxo2Ga1dKmNB9jgq0d28QRcFB87v0Oc/CYACd2OyEX1sAaMhbJT2su4e8iz4Dwz4Kijd0DK/w==
X-Received: by 2002:ac2:4891:: with SMTP id x17mr637981lfc.28.1599608747417;
        Tue, 08 Sep 2020 16:45:47 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id q17sm200279lfd.37.2020.09.08.16.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 16:45:46 -0700 (PDT)
Subject: Re: DRM_TEGRA_SUBMIT_BUF_WRITE_RELOC
To:     Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-15-mperttunen@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <54aff7f1-86b2-6bd7-1e47-2078edcf94b3@gmail.com>
Date:   Wed, 9 Sep 2020 02:45:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905103420.3021852-15-mperttunen@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

05.09.2020 13:34, Mikko Perttunen пишет:
...
> +/* Submission */
> +
> +/** Patch address of the specified mapping in the submitted gather. */
> +#define DRM_TEGRA_SUBMIT_BUF_WRITE_RELOC		(1<<0)

Shouldn't the kernel driver be aware about what relocations need to be
patched? Could you please explain the purpose of this flag?
