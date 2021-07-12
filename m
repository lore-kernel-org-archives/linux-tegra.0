Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD2BAC07E96
	for <linux-tegra@archiver.kernel.org>; Mon, 12 Jul 2021 00:39:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1B4F60FF4
	for <linux-tegra@archiver.kernel.org>; Mon, 12 Jul 2021 00:39:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbhGLAmR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 11 Jul 2021 20:42:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbhGLAmR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 11 Jul 2021 20:42:17 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9003C0613DD;
        Sun, 11 Jul 2021 17:39:28 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id f30so39331041lfj.1;
        Sun, 11 Jul 2021 17:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=61+xx73wTFO0lW6riCG7quy16olfucwKxe3/aiVqHfU=;
        b=eDu52mTd38fMdQdbGFA05eudpvkr+4USIug9Y0XV2tG6mGNeszwQ04ffOm0iZRO1+s
         /84mQRM2YfJ7LF6lSRrmSZi1oOrbg+LkD48omsonuNAr1x1liuad562QfGJWQ4GmAMWk
         3F9NLdOYyGaldHC49xSDK4xHS89tqalDCr4tiOPRM2UPRDTJQNFgU8fbL2J4FaVNHTEm
         eX71/uynB0udOVqXD4zOltrV/2zvkH0OcVXCLOlv2zl32Utgx+qiYHPSDXBuwiTfYDcd
         C+C+CfHA7r0BtLU2q5H8rfDUtFoWBY3ksDu4pYbVzNJXb/qP976UhaL7wVPNqrsWSAZw
         fECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=61+xx73wTFO0lW6riCG7quy16olfucwKxe3/aiVqHfU=;
        b=gX4sOowklVzal9XNn5Ty/Ifx5A9uROP1D0ocD7oCyt76X0BWLm0V5lThF7XOl5tITQ
         dcuBCWI0wUrPwl73bAjhXBLlFmLxH5BuYYbafadd1t6yY5ykSMvAta8L61wkNFm5+env
         4MwuMCKn+MsV5jrak00JIFgKU305ASjJu5YoPj0t6iVjokUD629qFLRmnKqoGzQ2UT26
         yVURIqZiAQ8ItIpbohXsb7Xc42hYndCIwAQegkeQx3IV5aFCWMDo7iGF8gvXGidWJyLe
         OyGcc9UgymlosgeSBEiJw3fBSzytPpU05xOe6nKjsbx9dCy3/dURwF4IWaxmfKKMsIcy
         gCKQ==
X-Gm-Message-State: AOAM531KLZpa9RnZUoLmvZ0j09nEL5Juwa+V4QfS6qOjcYdPMtkbPRd7
        h/zcZrp76AuU3HJ8qagPNi4/EUJLkdo=
X-Google-Smtp-Source: ABdhPJz4SsFAxZHY6MbqeUWpHBpulOIpzY7R/0KttPzAnUs/IemURrELGQQqTUwSt4hxNpcPaM2FkQ==
X-Received: by 2002:a05:6512:2186:: with SMTP id b6mr37693873lft.490.1626050367019;
        Sun, 11 Jul 2021 17:39:27 -0700 (PDT)
Received: from [192.168.2.145] (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.googlemail.com with ESMTPSA id y7sm287169lfg.256.2021.07.11.17.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jul 2021 17:39:26 -0700 (PDT)
Subject: Re: [PATCH v1] soc/tegra: Make regulator couplers depend on
 CONFIG_REGULATOR
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20210621160739.22448-1-digetx@gmail.com>
Message-ID: <a690cb76-217f-91cf-0198-f232e3ce7536@gmail.com>
Date:   Mon, 12 Jul 2021 03:39:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210621160739.22448-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

21.06.2021 19:07, Dmitry Osipenko пишет:
> The regulator coupler drivers now use regulator-driver API function that
> isn't available during compile-testing. Make regulator coupler drivers
> depend on CONFIG_REGULATOR in Kconfig.
> 
> Fixes: 03978d42ed0d ("soc/tegra: regulators: Bump voltages on system reboot")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/soc/tegra/Kconfig | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Thierry, should this patch go into 5.14-rc2 fixes? Please take care of
it if yes.
