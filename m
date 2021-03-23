Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C986C433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 17:33:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 122CB600EF
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 17:33:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230227AbhCWRdN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 13:33:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230169AbhCWRcx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 13:32:53 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A6DEC061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 10:32:53 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id f3so19499071lfu.5
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 10:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fQt6xCmMqTbZa/RTqpTUck38Lk7jAmjj8bDIroCl9cY=;
        b=iKDKEABbhNUa0T1Pv7XQXNOm5HZy9Pwyhj5F3vHzHGTzl75hhZL8Df/7H1qyg3jaeB
         6LxKIXxa4+CKk4uVIObaNimrGISoiG8KAWOMmmoWROirht+FHkRbpmOs4mGn1GV4h5t2
         4v6HW0dCzJfL6PFe1amo1oul7Z9q+s++KyaEmuoiXBzbZEmSKk6mHlLzXqDDEj65p2Ae
         sZIshdo5hj+B6kV30U1e0JO2MYFQrdda0jiuZvnAuX45jA5GTBYu12K7t3CbxCh8w7pR
         UzxyCqRtrwo4EIJJP2Lg/zU9sc3PpHWBmTEQwlxajt4KZ5uhP3Bt0Ypxme+C4HEJmE7+
         yf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fQt6xCmMqTbZa/RTqpTUck38Lk7jAmjj8bDIroCl9cY=;
        b=UXm3XU5iZVLueJDzjTFU/eWvQYGxMbkk5nujOyiwPVCOw1Hm9qETsI92HZyz0TbIPs
         sLlI+VN55htR7ykOzJyWvmqy0jgtUE2FWUSDb/bbjiBm3uv1NeLeCQhy5cIoigDBEP7o
         un3sVyIc3UKCuyimC7pYTQqNvZm9Cw/M+r3mmYj9UjIg03bndhKBPKy3NVVCp4srYSPy
         qDiRAwlCbo/Qs4AyZAa5WrORU61ZimR4ZJ0ouwIvrQ9g+O09xp5Eic0KUqsB2bv1lCOF
         Rv1MlvpswrmlMAbY0IPQU17IN2Nud2hG4oPTCbFR5NUKaqI/doH7XF1GiYUYqXeVhCEy
         nbGQ==
X-Gm-Message-State: AOAM5332NUw2FAMt43c2H1Nt1WwL2jgWb1/JbFUavqHXmXR1N3tBrbtR
        G9CRYxAzilRpBLNdasI5yiU=
X-Google-Smtp-Source: ABdhPJwH6K3S4OE4JZag5tWk0lBSLFj34jgsxu40rASVwxlzsESceA1Rbwo6zW8Vb+GfbzbbZn9DQQ==
X-Received: by 2002:a19:ee13:: with SMTP id g19mr3168533lfb.657.1616520771923;
        Tue, 23 Mar 2021 10:32:51 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-60.dynamic.spd-mgts.ru. [109.252.193.60])
        by smtp.googlemail.com with ESMTPSA id f23sm1914441lfc.283.2021.03.23.10.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 10:32:51 -0700 (PDT)
Subject: Re: [PATCH v5 15/21] drm/tegra: Add new UAPI to header
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>, jonathanh@nvidia.com,
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
 <0cc2ec5c-f8aa-ed45-92b6-32f9eadbdc5a@gmail.com>
 <YFoa57HBFpDu119Y@orome.fritz.box>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c0c21556-1f98-4137-b9a0-568ef3a8c8ac@gmail.com>
Date:   Tue, 23 Mar 2021 20:32:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFoa57HBFpDu119Y@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

23.03.2021 19:44, Thierry Reding пишет:
> On Tue, Mar 23, 2021 at 05:00:30PM +0300, Dmitry Osipenko wrote:
>> 23.03.2021 15:30, Thierry Reding пишет:
>>> On Thu, Jan 14, 2021 at 12:34:22PM +0200, Mikko Perttunen wrote:
>>>> On 1/14/21 10:36 AM, Dmitry Osipenko wrote:
>>>>> 13.01.2021 21:56, Mikko Perttunen пишет:
>>>>>> On 1/13/21 8:14 PM, Dmitry Osipenko wrote:
>>>>>>> 11.01.2021 16:00, Mikko Perttunen пишет:
>>>>>>>> +struct drm_tegra_submit_buf {
>>>>>>>> +    /**
>>>>>>>> +     * @mapping_id: [in]
>>>>>>>> +     *
>>>>>>>> +     * Identifier of the mapping to use in the submission.
>>>>>>>> +     */
>>>>>>>> +    __u32 mapping_id;
>>>>>>>
>>>>>>> I'm now in process of trying out the UAPI using grate drivers and this
>>>>>>> becomes the first obstacle.
>>>>>>>
>>>>>>> Looks like this is not going to work well for older Tegra SoCs, in
>>>>>>> particular for T20, which has a small GART.
>>>>>>>
>>>>>>> Given that the usefulness of the partial mapping feature is very
>>>>>>> questionable until it will be proven with a real userspace, we should
>>>>>>> start with a dynamic mappings that are done at a time of job submission.
>>>>>>>
>>>>>>> DRM already should have everything necessary for creating and managing
>>>>>>> caches of mappings, grate kernel driver has been using drm_mm_scan for a
>>>>>>> long time now for that.
>>>>>>>
>>>>>>> It should be fine to support the static mapping feature, but it should
>>>>>>> be done separately with the drm_mm integration, IMO.
>>>>>>>
>>>>>>> What do think?
>>>>>>>
>>>>>>
>>>>>> Can you elaborate on the requirements to be able to use GART? Are there
>>>>>> any other reasons this would not work on older chips?
>>>>>
>>>>> We have all DRM devices in a single address space on T30+, hence having
>>>>> duplicated mappings for each device should be a bit wasteful.
>>>>
>>>> I guess this should be pretty easy to change to only keep one mapping per
>>>> GEM object.
>>>
>>> The important point here is the semantics: this IOCTL establishes a
>>> mapping for a given GEM object on a given channel. If the underlying
>>> implementation is such that the mapping doesn't fit into the GART, then
>>> that's an implementation detail that the driver needs to take care of.
>>> Similarly, if multiple devices share a single address space, that's
>>> something the driver already knows and can take advantage of by simply
>>> reusing an existing mapping if one already exists. In both cases the
>>> semantics would be correctly implemented and that's really all that
>>> matters.
>>>
>>> Overall this interface seems sound from a high-level point of view and
>>> allows these mappings to be properly created even for the cases we have
>>> where each channel may have a separate address space. It may not be the
>>> optimal interface for all use-cases or any one individual case, but the
>>> very nature of these interfaces is to abstract away certain differences
>>> in order to provide a unified interface to a common programming model.
>>> So there will always be certain tradeoffs.
>>
>> For now this IOCTL isn't useful from a userspace perspective of older
>> SoCs and I'll need to add a lot of code that won't do anything useful
>> just to conform to the specific needs of the newer SoCs. Trying to unify
>> everything into a single API doesn't sound like a good idea at this
>> point and I already suggested to Mikko to try out variant with a
>> separated per-SoC code paths in the next version, then the mappings
>> could be handled separately by the T186+ paths.
> 
> I'm not sure I understand what you're saying. Obviously the underlying
> implementation of this might have to differ depending on SoC generation.
> But it sounds like you're suggesting having different UAPIs depending on
> SoC generation.

I suggested that this IOCTL shouldn't be mandatory for older SoCs, which
we should to have anyways for preserving the older UAPI. Yes, this makes
UAPI different and I want to see how it will look like in the next
version since the current variant was sub-optimal.
