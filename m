Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC92C2D0A8
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 06:33:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE8E32076E
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 06:33:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCNo5Ppl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725440AbgI3Gdk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 02:33:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgI3Gdk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 02:33:40 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDCF2C061755;
        Tue, 29 Sep 2020 23:33:39 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id u8so774975lff.1;
        Tue, 29 Sep 2020 23:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cTva/fInjcmUyKGUHD5UOEzgklOiXw7AjHa/QF4Vx2o=;
        b=CCNo5PplUtPPi6hvkBl6F9bub4USTbO5JvgHVgT1X5BVj3LGff7Dfx0zVE36yF6jsk
         EevUSHH76pmO9GHACimTSPiepjdECfbF+FSph4NY4SsWItrN3mMq/E3ISASD8YqB7mes
         bfBPJoYq9jnKrJ5topoPVjTcVDFvIn67JgvNKBsTDjWwoZtqrNIZBS4dkr7f2hKvgT1l
         Vh3eX2twDk6BoYYdJO2bf2CR96XuspruFSnno5A5Rw0pgL710/ULvgtl6EqlwHFMSotf
         7Kf87PN001Cys7rpolS5q6notSIu4yz/07tReFBJsWdZ/vyRpfaLJj4IImLV6sKnB3tp
         3nlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cTva/fInjcmUyKGUHD5UOEzgklOiXw7AjHa/QF4Vx2o=;
        b=RyaR496f1qmG2789PW4wcI587CmWApVfzlpikp+A63L4OuL1wNtMOGN1bZn4ve1gAa
         TAiDJNOWEsK+DgKmbfLXgT3dLKZQKCYrKRkWxllCHEw/hh4jmXtIdXl3LWR+lDm7Zda4
         WMj34OVK2pdp9kXN48IUW+U1FXaBrFS8DNn5JR6Ths2JOh8PTv3qmqg/+OJWF9M8XvpW
         tLwwHeGp8VMp4KL0c3Qi7xIp5LtVOtKWJpRTHQs9pVnkdQ0hSMQ3J5FMJheQuRETs5hT
         vV1q0q6iM+UN6IYAMHJnGL6koqIsMhIO+StUH8k/+k9rELJgP8szrqWWVVKjaxfiHzN2
         b/AA==
X-Gm-Message-State: AOAM533j/b6Lf32yTvoKmPwe5iC+3CRiiHVE9rjvqTEdp+80/mFCIO+B
        +wv6dgzzeNI/Yi8xTRQQXGIgTYcCtRI=
X-Google-Smtp-Source: ABdhPJyGj5pQos1peHaz/TXt7sAbZCOpMQN/7F0sL/YA0v9CsfRem6gaONh+yqpGtmMVtcROh44VZg==
X-Received: by 2002:ac2:5dd4:: with SMTP id x20mr304525lfq.593.1601447618031;
        Tue, 29 Sep 2020 23:33:38 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id m13sm73838lfl.269.2020.09.29.23.33.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 23:33:37 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-3-nicoleotsuka@gmail.com>
 <75514da5-e63a-9e51-8376-abbd12c324d1@gmail.com>
 <20200930054900.GG31821@Asurada-Nvidia>
 <b74f96cf-0edc-c7f2-3a0e-2a4fe51e3b2e@gmail.com>
 <20200930061351.GA16460@Asurada-Nvidia>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9a1ec0bf-3020-2045-229c-a350c9c9fc2e@gmail.com>
Date:   Wed, 30 Sep 2020 09:33:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930061351.GA16460@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.09.2020 09:13, Nicolin Chen пишет:
> On Wed, Sep 30, 2020 at 09:10:38AM +0300, Dmitry Osipenko wrote:
>> 30.09.2020 08:49, Nicolin Chen пишет:
>>> On Wed, Sep 30, 2020 at 08:11:52AM +0300, Dmitry Osipenko wrote:
>>>> 30.09.2020 03:30, Nicolin Chen пишет:
>>>>> +	/* An invalid mc pointer means mc and smmu drivers are not ready */
>>>>> +	if (IS_ERR_OR_NULL(mc))
>>>>
>>>> tegra_get_memory_controller() doesn't return NULL.
>>>
>>> Well, I don't want to assume that it'd do that forever, and the
>>> NULL check of IS_ERR_OR_NULL is marked "unlikely" so it doesn't
>>> hurt to have.
>>>
>>
>> I don't see any reasons why it won't do that forever.
>>
>> Secondly, public function can't be changed randomly without updating all
>> the callers.
>>
>> Hence there is no need to handle cases that can't ever happen and it
>> hurts readability of the code + original error code is missed.
> 
> I don't quite understand why an extra "_OR_NULL" would hurt
> readability....but I'd take a step back and use IS_ERR().
> 

The tegra_get_memory_controller() doesn't return NULL, hence the
NULL-check is misleading.

If I was reading that code for the first time and notice such a thing,
then instantly I'd have a much lower credibility to the whole code.
