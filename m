Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E2CC433C1
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 13:25:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBD9A6191E
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 13:25:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbhCWNZP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 09:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbhCWNZF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 09:25:05 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93BF7C061764
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 06:25:04 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id g8so19484875lfv.12
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 06:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2fvU8g8FZ+pWQ8+xisQgBdUFaE3PI9xWKuCuHFrhelw=;
        b=lAP9yE52rMzH022EukemJdb0L8hc5shqMj26/U6KyGoPlcLbZYdrMTweocgjqq0K2k
         Zp3Jte03uRa7cT8IP74VsCKZ0vcULwGx+5F+P7DAGhZjZp7YMMuwDeIMvfS35y53fUuC
         md+p/QMJGaQineJYO4W/E+pH8wbGsRTDo0p0l9zF9hrY97KHV+sYdUoAn/V2KbnMYwWG
         jt7Xb7f+Z+0vCXdCmnuv4IqGI0w/gRHi9bVPhQrRRcICfjSme1SEKE4EndFe7W7YXA8J
         ch/u7LLnS4M4jEyBPhqgYTHhdw3mqmUSBL06SwETYXOYLTqT/hQXTdk7ItqHA22w3wLw
         k27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2fvU8g8FZ+pWQ8+xisQgBdUFaE3PI9xWKuCuHFrhelw=;
        b=joPCBVj0C/Pnzn4Q724sMrHAKSIvWuu/IE5jG6CaEbeFVHPYFSbz6sHPeqmPEWPi8z
         CkBLmEV57ymDQ5TidwpUcvbUC9txkPK5grjNMneaV8ygbbEcU7RFmg86tYQKcB4SD4/w
         dxFbCHuCHpoYERREMylYiRVFOebO9MAqdyy8tz1fOHVaMl+rmVg6CvNQLmfitF9UHSlt
         qxa+bOMHW2t118Plpbf5QJQEyJvrea8H+/dQ1fKMrSBEBA4XnRx7XsKl9K+NL42I2Dud
         kciSMlUyMzMIKhFZi27Z0/beRPmE5+CNlzRhWaO6nlSLS/saDHCbCDbsxslQ/uuaaxwv
         z39A==
X-Gm-Message-State: AOAM532fGJCqhxOPYW2N9vFvVyHMDgCimOE41ZHEPPGxyXY/2TDkuzJ5
        4Av4j644N6102oJuSLvS9GA=
X-Google-Smtp-Source: ABdhPJzVDxNo3t5cd+AXEWslovHMAxTGuWHteBcxtagcsTZqrv+ZYSn3NWYVJsojToTzRSjyr1G0MA==
X-Received: by 2002:a19:c14c:: with SMTP id r73mr2678763lff.581.1616505903009;
        Tue, 23 Mar 2021 06:25:03 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-60.dynamic.spd-mgts.ru. [109.252.193.60])
        by smtp.googlemail.com with ESMTPSA id o1sm1844780lfu.299.2021.03.23.06.25.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 06:25:02 -0700 (PDT)
Subject: Re: [PATCH v5 01/21] gpu: host1x: Use different lock classes for each
 client
To:     Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch,
        linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-2-mperttunen@nvidia.com>
 <YFitsk3I2l7IBnLR@orome.fritz.box>
 <6615105f-ccf1-7833-512c-090817c47952@gmail.com>
 <645366c2-c500-efcc-f44c-b933f6f470c4@nvidia.com>
 <6dec95ac-bd92-9434-76ba-eb7fcb316f49@gmail.com>
 <YFnA2HW4EuxaN6Kn@orome.fritz.box>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <302ce6b9-8bb1-db6f-929b-c103a29435cc@gmail.com>
Date:   Tue, 23 Mar 2021 16:25:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFnA2HW4EuxaN6Kn@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

23.03.2021 13:20, Thierry Reding пишет:
> On Mon, Mar 22, 2021 at 07:01:34PM +0300, Dmitry Osipenko wrote:
>> 22.03.2021 18:19, Mikko Perttunen пишет:
>>> On 22.3.2021 16.48, Dmitry Osipenko wrote:
>>>> 22.03.2021 17:46, Thierry Reding пишет:
>>>>> On Mon, Jan 11, 2021 at 02:59:59PM +0200, Mikko Perttunen wrote:
>>>>>> To avoid false lockdep warnings, give each client lock a different
>>>>>> lock class, passed from the initialization site by macro.
>>>>>>
>>>>>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>>>>>> ---
>>>>>>   drivers/gpu/host1x/bus.c | 7 ++++---
>>>>>>   include/linux/host1x.h   | 9 ++++++++-
>>>>>>   2 files changed, 12 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
>>>>>> index 347fb962b6c9..8fc79e9cb652 100644
>>>>>> --- a/drivers/gpu/host1x/bus.c
>>>>>> +++ b/drivers/gpu/host1x/bus.c
>>>>>> @@ -715,13 +715,14 @@ EXPORT_SYMBOL(host1x_driver_unregister);
>>>>>>    * device and call host1x_device_init(), which will in turn call
>>>>>> each client's
>>>>>>    * &host1x_client_ops.init implementation.
>>>>>>    */
>>>>>> -int host1x_client_register(struct host1x_client *client)
>>>>>> +int __host1x_client_register(struct host1x_client *client,
>>>>>> +               struct lock_class_key *key)
>>>>>
>>>>> I've seen the kbuild robot warn about this because the kerneldoc is now
>>>>> out of date.
>>>>>
>>>>>>   {
>>>>>>       struct host1x *host1x;
>>>>>>       int err;
>>>>>>         INIT_LIST_HEAD(&client->list);
>>>>>> -    mutex_init(&client->lock);
>>>>>> +    __mutex_init(&client->lock, "host1x client lock", key);
>>>>>
>>>>> Should we maybe attempt to make this unique? Could we use something like
>>>>> dev_name(client->dev) for this?
>>>>
>>>> I'm curious who the lockdep warning could be triggered at all, I don't
>>>> recall ever seeing it. Mikko, could you please clarify how to reproduce
>>>> the warning?
>>>>
>>>
>>> This is pretty difficult to read but I guess it's some interaction
>>> related to the delayed initialization of host1x clients? In any case, I
>>> consistently get it at boot (though it may be triggered by vic probe
>>> instead of nvdec).
>>>
>>> I'll fix the kbuild robot warnings and see if I can add a
>>> client-specific lock name for v6.
>>
>> Thank you for the clarification! We now actually have a similar problem on Tegra20 after fixing the coupling of display controllers using the dc1_client->parent=dc0_client and I see the same warning when DC1 is enabled.
>>
...
> Sounds like we should decouple this from the series and fast-track this
> for v5.13, or perhaps even v5.12 along with the DC coupling fix?

Agree that the patch should be decoupled since it fixes a standalone
problem that isn't related to the rest of the patches.

It also should be good to have it backported, although this is optional.
If there are no merge conflicts with stable kernels for this patch, then
I'd add a stable tag to it.

Mikko, please update this patch and send it separately.
