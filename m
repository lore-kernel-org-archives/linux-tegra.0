Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3379C49EA6
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Jun 2021 00:29:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A21D061584
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Jun 2021 00:29:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231707AbhF1Abu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 27 Jun 2021 20:31:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231689AbhF1Abu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 27 Jun 2021 20:31:50 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BD06C061574;
        Sun, 27 Jun 2021 17:29:24 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id q4so14299037ljp.13;
        Sun, 27 Jun 2021 17:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=n7M28hFUwo0t3z3ukhVUpDX7Pqm41FdcERBzHJotZrA=;
        b=Vttc8PSDitkrqIejHH/KizML5yuFrK0gpCQ1idLH//0yA5+x/vWBFuF2I8j7GL1dds
         QPaXNmd72xs11JmBa7lleshBRWPP4XqBXrU+ngmWNCa0QTLXXoftp+1cyj11HnVQHJkX
         90Xjz6fmxkiZoaf8XdYXbCE+mJzD6bOl/uRHTsR5ol3qxS4VzGMVMxraoeDi1NfPx0gj
         KRpddqrbGes4BaKCLISP1tUjBwNQ56VWSvl1bJdKF7QNi0tew5Qd9GBLaCdQX1bL9/WA
         ydb9ngQrzeS8/8oXBkIN1bzTPogUt2qqRZWErQUk4ByTtPkoRk+gFoSVc+zxwlhD225Q
         lg1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n7M28hFUwo0t3z3ukhVUpDX7Pqm41FdcERBzHJotZrA=;
        b=HdHMCj1IL/gdiG/5NPeNdO3ryW1KSFZ2f6t0eL137N/BmoWE7iuB1j/o0yK69nYEJJ
         Z6lK7DH4yijwbnnchXDmaigQM6vfxyQaK1ub51DkA/HuovG9RPRVdqaNgtbL9LXmW4U2
         VGlU3b3ril9NktUFQcE4UFt8D2EDB4HBBPgXZNDI4qak8CvOZ54SyaxQkQ96oiGZwjxY
         /BhDNuzq5XmWYT0CakkStCl5Uv/eSMLh1B8W6Ux3kz2T8J8NjqhvwsHQ1XU4PTEpgosO
         9Bnl/CIcv6M3w6ZYlIw8jwCNDg7FugZrl62/Kv1a8cz0VnnhZfDsRm2gClzdim7aDcvs
         8CQg==
X-Gm-Message-State: AOAM533KWYymQyhVM6MCeVq9I0twA8L/iGTJc9gIbZC0DZS+x0ZLfU/5
        cxQiXqL+A9FRLXDodbkEHJTr9bvBn3w=
X-Google-Smtp-Source: ABdhPJyiM9tJi0jMtVF8k4COnwVGN8OxiZvDLTPWRkZxz8Z4165bsS52E5y7fFI5m+LKXb361VLQ3w==
X-Received: by 2002:a2e:b8ca:: with SMTP id s10mr8671391ljp.449.1624840161847;
        Sun, 27 Jun 2021 17:29:21 -0700 (PDT)
Received: from [192.168.2.145] (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.googlemail.com with ESMTPSA id z25sm1162708lfu.22.2021.06.27.17.29.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jun 2021 17:29:21 -0700 (PDT)
Subject: Re: [PATCH 1/1] clk: tegra: tegra124-emc: Fix possible memory leak
To:     Stephen Boyd <sboyd@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <20210617082759.1008-1-thunder.leizhen@huawei.com>
 <162466387362.3259633.2364843071785127818@swboyd.mtv.corp.google.com>
 <a6f88419-2cb9-0717-7737-e4666cdcc211@huawei.com>
 <162483744494.3259633.12565750309559171999@swboyd.mtv.corp.google.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5eb50fd9-1de9-cc61-6443-d84999e22803@gmail.com>
Date:   Mon, 28 Jun 2021 03:29:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <162483744494.3259633.12565750309559171999@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

28.06.2021 02:44, Stephen Boyd пишет:
> Quoting Leizhen (ThunderTown) (2021-06-25 18:32:46)
>>
>>
>> On 2021/6/26 7:31, Stephen Boyd wrote:
>>> Quoting Zhen Lei (2021-06-17 01:27:59)
>>>> When krealloc() fails to expand the memory and returns NULL, the original
>>>> memory is not released. In this case, the original "timings" scale should
>>>> be maintained.
>>>>
>>>> Fixes: 888ca40e2843 ("clk: tegra: emc: Support multiple RAM codes")

The memory is still not released on error and this is not the only one
place in that code which doesn't release memory on error.

All this code is executed only once during early kernel boot, perhaps
not really worthwhile fixing it or at least this should be done properly.

>>>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>>>> ---
>>>
>>> Looks correct, but when does krealloc() return NULL? My read of the
>>> kerneldoc is that it would return the original memory if the new
>>> allocation "failed".
>>
>> That must be the wrong description in the document. For example, the original
> 
> Can you fix the kernel doc then?
> 

The doc is clearly saying that it returns NULL, am I missing something?

* Return: pointer to the allocated memory or %NULL in case of error
