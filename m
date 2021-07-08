Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C4FC07E99
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Jul 2021 19:41:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 46EA66162D
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Jul 2021 19:41:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbhGHTnm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Jul 2021 15:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbhGHTnm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Jul 2021 15:43:42 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04737C061574
        for <linux-tegra@vger.kernel.org>; Thu,  8 Jul 2021 12:41:00 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id q4so4187159ljp.13
        for <linux-tegra@vger.kernel.org>; Thu, 08 Jul 2021 12:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5WdjjRpAMue8uF7sSO9E0Siqo0sZ/WULHAdm9QUKORI=;
        b=EGrLmVhGtDsK5gIkQ1dRW3hnP5sRCXX7MsMLv5/rYgCaWSd7gRu9B/t5vyFKj51nEU
         Fdo2XzZ0GJEoYRLov1LFInQbkRe20tXtQyewWoYGKf8AFZ0LPVEPYgznMz9HS7qUgbib
         ZqKmCYHt9oq0jfZ/fqUD3ZwfsttKATEzOHsA08Ik4zTbHjGVHFIfowV2BExu67YENAhh
         jyJQIZSJWoweewkTszrR3vMoWVjI8RLzSgiRd9+bYPsseBMq9Il3V5RON982hZrxw64q
         sjnHpK1syhTj4H6zUFkvVqg+Gg8WD7CBrNKGVKJoakhDkLKVVKUEgGlmp/4ykTe8gu2m
         jO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5WdjjRpAMue8uF7sSO9E0Siqo0sZ/WULHAdm9QUKORI=;
        b=rry06CFe7zkxSC+ocTu7005Yspd1bess05ARwHiqjfjqkQP2HtC8/6Nfz5xp74PkMn
         4r+js9DmpAzVEvlR+WwLkcQZYp4B6sJHQy6yY7aBoQmil/olwspy7YxtCF/YncgcXh0S
         ZqEQu2dYlAVBHBw5WPbZ6g7fzG+QE5bA4UJDrQVcnNIkT05U9BUJTXCcy+Wxyq5HTxXu
         3DnDzVlCVhKrB26neO68jT4V21x19Qt0Y85h5RcI0tFLWyginyVTsCNNVfZHZf3+Td7S
         pjHiTjqvcusp9nK4LEacrmfI/Cv2SuN9lBJIpp3QtDxyLxbnPOoCuWxOQ87rA8pEqYjP
         P0qg==
X-Gm-Message-State: AOAM531IFvnNBBNKqz6ViwZH9Oe+L3WJBVhqDkHoLSkDwjJkz+YS6JDw
        0aAm0NuJGuytVbkVKoGZ2pky7jZTF4o=
X-Google-Smtp-Source: ABdhPJx9xYrnl49sKD5gnueaXqwGpNEYhnzqHoNNeDP3kYgcSW17JJYHYI4BhtKZK+yAZ6sKW6G8kA==
X-Received: by 2002:a05:651c:b28:: with SMTP id b40mr21533150ljr.117.1625773258275;
        Thu, 08 Jul 2021 12:40:58 -0700 (PDT)
Received: from [192.168.2.145] (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.googlemail.com with ESMTPSA id q3sm275547lfg.178.2021.07.08.12.40.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jul 2021 12:40:57 -0700 (PDT)
Subject: Re: [PATCH] drm/tegra: gr2d: Explicitly control module reset
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20210708143736.2018135-1-thierry.reding@gmail.com>
 <d9112247-ce69-9281-75e6-6cb3296d19a7@gmail.com>
Message-ID: <2f9a6188-6e72-7353-2133-60230c02d6d2@gmail.com>
Date:   Thu, 8 Jul 2021 22:40:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d9112247-ce69-9281-75e6-6cb3296d19a7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

08.07.2021 18:13, Dmitry Osipenko пишет:
>> +assert_rst:
>> +	(void)reset_control_assert(gr2d->rst);
> (void)?

I forgot that the 2d reset shouldn't be asserted. See comment in
gr2d_runtime_suspend() [1].

[1] https://lore.kernel.org/lkml/20210701232728.23591-15-digetx@gmail.com/
