Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BEE2C43460
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Apr 2021 16:02:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4CDC76115A
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Apr 2021 16:02:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235649AbhDBQCj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Apr 2021 12:02:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235650AbhDBQCi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Apr 2021 12:02:38 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96F95C0613E6
        for <linux-tegra@vger.kernel.org>; Fri,  2 Apr 2021 09:02:35 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id y1so6016479ljm.10
        for <linux-tegra@vger.kernel.org>; Fri, 02 Apr 2021 09:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7LS9QMZtPYDSC3+ItKIFHS8bZQT3Z+oEzlDTiKOG5UU=;
        b=LJsfj5596jju+lIm1cpaVNsyCnnUvNtPfrsphvCWDG9WKXhAQE6dJvQiLXmWTQfEr2
         xgmY0WIl6O+zQy1ZqqrDWZyZxIrNP//9i6WhZ9TJ25ywiiE7o+BxWSnNDXfvrCi7LYHP
         jURQzWKFGkWQEvXMP1kdICj5dxzaZ6mWt1KJSpo2E6LBqWY42li6wAWCe4eJc75fEpVf
         Q7UJYNHwnZaNavhYuVyvSzMplwPTaz6+QCBRoJKOwz7lhy+tosMg4edQLW9FuneISqtI
         NwL1kmvTCIu3LBShypgTyXVcv5Kc3fHggOxHL4W/0wBo6qCduNhqfuFzQcKDCjFl1jiQ
         0nug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7LS9QMZtPYDSC3+ItKIFHS8bZQT3Z+oEzlDTiKOG5UU=;
        b=SUfdl/+TBzW3IheNBggJbZGoHUoHn05qHAtLKeIaMyxlY+WWeirx1x8Yqs86NIthLO
         XeyU5l9EtAPGp37hyWxFncffOmJi/mBBtG/EbUgx7J6zEV9ASZCPmuifbYVdJcMN15uG
         hzlpmkeBYbGif13J8h6Tt5BAUtyvgraHU3rDeq4Th0kAKvtbcLFmvSyRhbv3dzLKezq8
         7Ah24qQ6HIoxbEE48RX4yX/jLRdm8hb3UPcwQ5alpQJVW8Qjv7hq3NZU78uLfkDTdmIn
         7mr+2X8k8L9d5ed+yDMBkZXUcunddMZJGU8ovFRYWo0Qhxky1afuqZL71dO0gk32IgdD
         8Jiw==
X-Gm-Message-State: AOAM531fFLKTL+EuGOOHf1y3pa7HV51x04DCd6ThhHP25i2ukr2f4+Ld
        Yu8QEol6mywtYMw1IDh89J8=
X-Google-Smtp-Source: ABdhPJwFNWKRiTRgqWKMz0vNmB+o4wQzBgwHAYdkKEiQHbkbjtnJ34ZorbBoUyodH7Mer97dYyU/9Q==
X-Received: by 2002:a2e:9855:: with SMTP id e21mr8396252ljj.26.1617379354145;
        Fri, 02 Apr 2021 09:02:34 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-85.dynamic.spd-mgts.ru. [109.252.193.85])
        by smtp.googlemail.com with ESMTPSA id x4sm962500ljj.91.2021.04.02.09.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Apr 2021 09:02:33 -0700 (PDT)
Subject: Re: [PATCH v5 03/21] gpu: host1x: Show number of pending waiters in
 debugfs
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Mikko Perttunen <cyndis@kapsi.fi>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>, jonathanh@nvidia.com,
        airlied@linux.ie, daniel@ffwll.ch, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, talho@nvidia.com,
        bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-4-mperttunen@nvidia.com>
 <YFm/431gaaP6wY1A@orome.fritz.box>
 <1010683e-56c9-4b06-1540-d8c60a632c70@kapsi.fi>
 <20210401211949.GA25223@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7636618d-72f7-ee0f-df23-1f2ec96973b4@gmail.com>
Date:   Fri, 2 Apr 2021 19:02:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210401211949.GA25223@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

02.04.2021 00:19, Michał Mirosław пишет:
> On Fri, Mar 26, 2021 at 04:34:13PM +0200, Mikko Perttunen wrote:
>> On 3/23/21 12:16 PM, Thierry Reding wrote:
>>> On Mon, Jan 11, 2021 at 03:00:01PM +0200, Mikko Perttunen wrote:
>>>> Show the number of pending waiters in the debugfs status file.
>>>> This is useful for testing to verify that waiters do not leak
>>>> or accumulate incorrectly.
>>>>
>>>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>>>> ---
>>>>   drivers/gpu/host1x/debug.c | 14 +++++++++++---
>>>>   1 file changed, 11 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/host1x/debug.c b/drivers/gpu/host1x/debug.c
>>>> index 1b4997bda1c7..8a14880c61bb 100644
>>>> --- a/drivers/gpu/host1x/debug.c
>>>> +++ b/drivers/gpu/host1x/debug.c
>>>> @@ -69,6 +69,7 @@ static int show_channel(struct host1x_channel *ch, void *data, bool show_fifo)
>>>>   static void show_syncpts(struct host1x *m, struct output *o)
>>>>   {
>>>> +	struct list_head *pos;
>>>>   	unsigned int i;
>>>>   	host1x_debug_output(o, "---- syncpts ----\n");
>>>> @@ -76,12 +77,19 @@ static void show_syncpts(struct host1x *m, struct output *o)
>>>>   	for (i = 0; i < host1x_syncpt_nb_pts(m); i++) {
>>>>   		u32 max = host1x_syncpt_read_max(m->syncpt + i);
>>>>   		u32 min = host1x_syncpt_load(m->syncpt + i);
>>>> +		unsigned int waiters = 0;
>>>> -		if (!min && !max)
>>>> +		spin_lock(&m->syncpt[i].intr.lock);
>>>> +		list_for_each(pos, &m->syncpt[i].intr.wait_head)
>>>> +			waiters++;
>>>> +		spin_unlock(&m->syncpt[i].intr.lock);
>>>
>>> Would it make sense to keep a running count so that we don't have to
>>> compute it here?
>>
>> Considering this is just a debug facility, I think I prefer not adding a new
>> field just for it.
> 
> This looks like IRQ-disabled region, so unless only root can trigger
> this code, maybe the additional field could save a potential headache?
> How many waiters can there be in the worst case?

The host1x's IRQ handler runs in a workqueue, so it should be okay.

