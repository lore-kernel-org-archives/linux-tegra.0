Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC77C10F31
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Dec 2022 14:37:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238363AbiLNOhv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 14 Dec 2022 09:37:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238666AbiLNOht (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Dec 2022 09:37:49 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CB632181F
        for <linux-tegra@vger.kernel.org>; Wed, 14 Dec 2022 06:37:48 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id n9-20020a05600c3b8900b003d0944dba41so10888658wms.4
        for <linux-tegra@vger.kernel.org>; Wed, 14 Dec 2022 06:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t2XJM1BjNmCMgH/G0fBVGH4bStfXGZIoDxsB1bZq0mQ=;
        b=ccHeRQ7iudNH2CTygNE/tMhdIuxXDlLm7TaDUgXtcDtEq/qU2RsnoLkMQXd94QSah8
         E9CUUxjqmUom/K/eo8plBi57n4rLqcKrmXbO3TfQ2EFCxJwfefp28EYigB9F7SGfgQ8z
         vqRdz3zqmB0LHo5LFjLB3HlxFMfaP31GrVQfy/hWk5gUCG+EiVqdsH6nX2GMksTj/XYA
         TIX4Uy+KAiZD+JTwQcNTXbGbrw74ZHG1xKhGfVYHBN9Bwxlam/5hYmHW2zcT2xTWfy6v
         yH61Fhy/6houjn8pI3EISFnmraVKFUx/lR3RLrsyKBcCeibkuXJqCkRRRWrQkGYzsQj8
         ZARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t2XJM1BjNmCMgH/G0fBVGH4bStfXGZIoDxsB1bZq0mQ=;
        b=2lMBUw/k/VtWEKyMZH1FX8lH9qVXzyeEJz/97suTlqlG4MWH2CGXx5ep/P3hihRwIZ
         wrolWQvW0o3W6/w+6YCKpaw/zl8fjYP6v35emsyUHdyckyf8D0EPW40YgZ7I2OncHG9y
         qcBseRpPkXgt42wFSBb0+gG6/iZi5B0DMGc9EVNVl7A/MVDeJrzFRV3LXcJ8OcnMA3/j
         R1GCUELAslCxwY6C9u+E2JzMM4o81qhq6U2M4Ch6MGcOyUHQ+IXJNunOYI8Stv3bbwyT
         fIPT1ZSszuCP8aJ+/awrey/J37E9R0ebvx9PQuflmnQVEyGGfORHB3jobOATIeUTrVT7
         0wXg==
X-Gm-Message-State: ANoB5plqOtqVnDEOicjmckYxM5iPSNOwT4NkU4hn262c2LM8+mkXzN4X
        ypqURuEIJYOcPmI5YC8kwdn+GSJ0XmQoVtdF
X-Google-Smtp-Source: AA0mqf6rGNM3iD66PMCSzvUVjsWDd3eVZpyPQ8IakTm/dMjNK5jmsYKYAu8ZD5QeVfZZx64mqp9HEg==
X-Received: by 2002:a05:600c:1d09:b0:3c6:e63d:adb3 with SMTP id l9-20020a05600c1d0900b003c6e63dadb3mr18795774wms.35.1671028666084;
        Wed, 14 Dec 2022 06:37:46 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id l6-20020a05600c4f0600b003a3442f1229sm3321055wmq.29.2022.12.14.06.37.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 06:37:45 -0800 (PST)
Message-ID: <cc48a248-5dc1-eba8-d91b-ee24300bab52@linaro.org>
Date:   Wed, 14 Dec 2022 15:37:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/4] thermal: fix locking regressions in linux-next
Content-Language: en-US
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>
Cc:     Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
References: <20221214131617.2447-1-johan+linaro@kernel.org>
 <CAJZ5v0gY-Lhgf_1Kfg6P5O8s+YMkP4TxggxyS=LU9jVgJikAkg@mail.gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CAJZ5v0gY-Lhgf_1Kfg6P5O8s+YMkP4TxggxyS=LU9jVgJikAkg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 14/12/2022 15:02, Rafael J. Wysocki wrote:
> On Wed, Dec 14, 2022 at 2:18 PM Johan Hovold <johan+linaro@kernel.org> wrote:
>>
>> This series fixes some of the fallout after the thermal changes that
>> just landed in linux-next.
>>
>> Lockdep reported a lock inversion in one of the Qualcomm drivers and a
>> closer review revealed that the changes had also broken the sysfs
>> interface for at least three drivers.
>>
>> Note that a simple revert of the offending patches was not an option as
>> some of the infrastructure that the old implementation relied on has
>> also been removed.
> 
> I've dropped that material from my linux-next branch and Daniel,
> please also remove it from your branch that is pulled by linux-next so
> that it doesn't show up in there until 6.2-rc1 is out.
> 
> It clearly is not ready for merging in its current form.

I rebased a linux-next branch without the generic trip points rework.

It can be inverted with the other changes without conflicts.

I've pushed the branch in case you want to have a look. If you think it 
is acceptable in this form, I can send a tagged PR for 6.2-rc1 again.

> It is still present in my bleeding-edge branch, though, so please
> apply the patches from Johan on top of it and send a new PR to me, so
> I can add it back to my linux-next branch once 6.2-rc1 appears.
> 
> It would be good to check the code again too for any more similar fallout.

I've been through already, the exynos fix is not necessary. But anyway, 
I agree we should keep these changes for the next release, it is better.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

