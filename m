Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92767C433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 14:01:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66513619B2
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 14:01:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231924AbhCWOA7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 10:00:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231908AbhCWOAf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 10:00:35 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05A7EC061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 07:00:33 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id u4so25737403ljo.6
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 07:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6kMwyvk3PqnCYTAEX+fT1GEBQ4EBnaqGRGP9Fon/5iY=;
        b=Jp7zFpw0wiHpMHVIU0jDDV6ArGe1naCyxm8D+4T+MhHKHZRVcQoBHU7WJ2y8blRwFw
         wzK7UTetOk8/k8fFvgCaHvLNLIkwcoPFAoTTUFGtg5+0zqbpXnNUY4yHayZypaTmxJoy
         3GvKWGUQWTU6qkxxbSydC2p+ZasR2vHAiHLg+OCy5I4qw7+e41Tay5yFlIaH99/rJVi1
         U9ZuSHeG+zPfdXeOtks38o2t73XCemxHoSF2FzY1NUHqwd3qQ9QrGn+oWJnkvxW4pZRn
         QEInmhy0H5eqLxjSlqvkbNu97YzszUPhdXmzOAWbhvlV1wBG8O9KxbbysLxTM349VR4R
         9M+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6kMwyvk3PqnCYTAEX+fT1GEBQ4EBnaqGRGP9Fon/5iY=;
        b=bFDCkXSN/KEUOBmo/dq6NDct2VsjrKCG4HOlBxyIp2ULlSAip5gxIpZy3dpbejHeZp
         2vMZPDcocmAhZwKuqoooT8cT3Ic5fTLMkV54ugjtUvvIQMUXVYH+ojLE5NU8JSfFSQsE
         C5oGW7hI/hnIONGzL/sY4PALAKR6IHavI7bsn6Psg0Z+fJ0j4RfQx76Y57sQaHZlV9Re
         z1PZR/yQhWRXubcQ88KfYThHJseUnh1IpyDAGB0516p+yq1kX7eDWUEFtiRf03Xv9jEr
         M2vHPLP9MTRQOjyA+CHv4tVL14X6lCMLoQ7zT8b8s7smruFFZaxzRtRFdqpnU2B/e+ex
         ym7g==
X-Gm-Message-State: AOAM533XP6RgIpJpAI0Z7QPNhD75yOxEllfpkiGhViWE4QAmTY+UxsLr
        NtOuVl6Gj9nPozRzxQ7vS54=
X-Google-Smtp-Source: ABdhPJy7Ef0gPGVxmUmytvgXlLT6lRUG29YrcvOI+ibuQOkAtFJEuH9MFZfVY/ZOsCMtw03ynNdUjg==
X-Received: by 2002:a2e:508:: with SMTP id 8mr3269597ljf.207.1616508031506;
        Tue, 23 Mar 2021 07:00:31 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-60.dynamic.spd-mgts.ru. [109.252.193.60])
        by smtp.googlemail.com with ESMTPSA id b28sm1723988lfv.109.2021.03.23.07.00.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 07:00:30 -0700 (PDT)
Subject: Re: [PATCH v5 15/21] drm/tegra: Add new UAPI to header
To:     Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <cyndis@kapsi.fi>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>, jonathanh@nvidia.com,
        airlied@linux.ie, daniel@ffwll.ch, linux-tegra@vger.kernel.org,
        talho@nvidia.com, bhuntsman@nvidia.com,
        dri-devel@lists.freedesktop.org
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-16-mperttunen@nvidia.com>
 <a0fdac0d-88cf-6eda-6611-fca951253060@gmail.com>
 <cc746d91-e6b2-53d8-17ff-59cbc8bb522f@kapsi.fi>
 <a51f7552-cec6-efe1-25dd-76422ef7a3e4@gmail.com>
 <d76c465a-7f07-88c4-0dc3-4be3cb212fcf@kapsi.fi>
 <YFnfYsfYaKfSGhon@orome.fritz.box>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0cc2ec5c-f8aa-ed45-92b6-32f9eadbdc5a@gmail.com>
Date:   Tue, 23 Mar 2021 17:00:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFnfYsfYaKfSGhon@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

23.03.2021 15:30, Thierry Reding пишет:
> On Thu, Jan 14, 2021 at 12:34:22PM +0200, Mikko Perttunen wrote:
>> On 1/14/21 10:36 AM, Dmitry Osipenko wrote:
>>> 13.01.2021 21:56, Mikko Perttunen пишет:
>>>> On 1/13/21 8:14 PM, Dmitry Osipenko wrote:
>>>>> 11.01.2021 16:00, Mikko Perttunen пишет:
>>>>>> +struct drm_tegra_submit_buf {
>>>>>> +    /**
>>>>>> +     * @mapping_id: [in]
>>>>>> +     *
>>>>>> +     * Identifier of the mapping to use in the submission.
>>>>>> +     */
>>>>>> +    __u32 mapping_id;
>>>>>
>>>>> I'm now in process of trying out the UAPI using grate drivers and this
>>>>> becomes the first obstacle.
>>>>>
>>>>> Looks like this is not going to work well for older Tegra SoCs, in
>>>>> particular for T20, which has a small GART.
>>>>>
>>>>> Given that the usefulness of the partial mapping feature is very
>>>>> questionable until it will be proven with a real userspace, we should
>>>>> start with a dynamic mappings that are done at a time of job submission.
>>>>>
>>>>> DRM already should have everything necessary for creating and managing
>>>>> caches of mappings, grate kernel driver has been using drm_mm_scan for a
>>>>> long time now for that.
>>>>>
>>>>> It should be fine to support the static mapping feature, but it should
>>>>> be done separately with the drm_mm integration, IMO.
>>>>>
>>>>> What do think?
>>>>>
>>>>
>>>> Can you elaborate on the requirements to be able to use GART? Are there
>>>> any other reasons this would not work on older chips?
>>>
>>> We have all DRM devices in a single address space on T30+, hence having
>>> duplicated mappings for each device should be a bit wasteful.
>>
>> I guess this should be pretty easy to change to only keep one mapping per
>> GEM object.
> 
> The important point here is the semantics: this IOCTL establishes a
> mapping for a given GEM object on a given channel. If the underlying
> implementation is such that the mapping doesn't fit into the GART, then
> that's an implementation detail that the driver needs to take care of.
> Similarly, if multiple devices share a single address space, that's
> something the driver already knows and can take advantage of by simply
> reusing an existing mapping if one already exists. In both cases the
> semantics would be correctly implemented and that's really all that
> matters.
> 
> Overall this interface seems sound from a high-level point of view and
> allows these mappings to be properly created even for the cases we have
> where each channel may have a separate address space. It may not be the
> optimal interface for all use-cases or any one individual case, but the
> very nature of these interfaces is to abstract away certain differences
> in order to provide a unified interface to a common programming model.
> So there will always be certain tradeoffs.

For now this IOCTL isn't useful from a userspace perspective of older
SoCs and I'll need to add a lot of code that won't do anything useful
just to conform to the specific needs of the newer SoCs. Trying to unify
everything into a single API doesn't sound like a good idea at this
point and I already suggested to Mikko to try out variant with a
separated per-SoC code paths in the next version, then the mappings
could be handled separately by the T186+ paths.
