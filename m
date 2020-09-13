Return-Path: <SRS0=sMWC=CW=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 933B3C43461
	for <linux-tegra@archiver.kernel.org>; Sun, 13 Sep 2020 18:37:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4CF4D2098B
	for <linux-tegra@archiver.kernel.org>; Sun, 13 Sep 2020 18:37:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MNKBG4qd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbgIMShU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 13 Sep 2020 14:37:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbgIMShL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 13 Sep 2020 14:37:11 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D55FC06174A
        for <linux-tegra@vger.kernel.org>; Sun, 13 Sep 2020 11:37:10 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id z19so11045291lfr.4
        for <linux-tegra@vger.kernel.org>; Sun, 13 Sep 2020 11:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6JrXgrGcuM/lh+9ydycjop/vKpXIRF8pxi41i/Mqj7w=;
        b=MNKBG4qd8al4yLawWk9ma3/zvVcEMdhlM1BlJzg220J/cBrV+EIgrUHb065fBXSQMp
         ZE6pX5R+Nxm9bLVMYSpU0hM0ZdYl0qXvn3SGMaL8i9/O1x3xqaREWiI/oBgBSYRTaDZZ
         Oe38mbEVcNU0/13hIeERDjW6lBJVyHeBLiRrTmPNGA9jSbk0hdyBbsG+TmmTUkt6NnMM
         2P+Cy7Q5rhvIF75IUs32prVImc7YzefKZTG3oO96rkxO9vRrgCLK+GnlbcsI1B8Xc87P
         V1Ho08Y/RYeqaxkUQ7kwdWLqX0EeikremwLfg3AqAcDsM8hQnKArh72mhtJYY4w4OxaH
         SM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6JrXgrGcuM/lh+9ydycjop/vKpXIRF8pxi41i/Mqj7w=;
        b=uk+5Lf0LfAqoHwt4gIaIAPFiVv25kU4kp/gXjntj++TWWVkBqIf7CgArNqW5Anbqhu
         F7KWn7D/hb3ByRKtS0wwV4hkB+5PLXU9Li8XPc1xvYWH2Q9ODQoe2V9cs0lohlkZwt15
         /TS9QirY1NNooyOtmmrVg6KmuN9o56QDc66koyY2JN1sAn1JE7rzX58LpBi1gQYeAQ0i
         TUZNgvKobaEcEbDQHJg8pTlwtHl7qeMNI3gvk55PolWFd8cJihmW+E9C7Fym2JMgU4wJ
         QtSkme8QbZIV+BtKiB8+2CzvVRZ6RWttvFehmhLGkn8L8eDw5EgN8/uDhlfPauadoFuW
         LASA==
X-Gm-Message-State: AOAM532QEK1gqLJTcrH64qWbJjiBHOpvidMvnWLH1xpbQH2/cdzy5WrX
        JUB1NHJo0Dpc6fEp3R9dFtw=
X-Google-Smtp-Source: ABdhPJxs164zhRlgTtqXXKJS7zgNaFJvvgayhPykK1yIaRI6ZEZNIDIxoK3B7+n43mCQz/US8XyBTQ==
X-Received: by 2002:a19:a406:: with SMTP id q6mr3452621lfc.556.1600022224641;
        Sun, 13 Sep 2020 11:37:04 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id y4sm3322747ljk.61.2020.09.13.11.37.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2020 11:37:03 -0700 (PDT)
Subject: Re: [RFC PATCH v2 10/17] WIP: gpu: host1x: Add no-recovery mode
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-11-mperttunen@nvidia.com>
 <7d7a29e8-3151-12ea-da66-d8a479edda84@gmail.com>
 <c2498218-e107-4df4-41ce-c60da65ceaf7@kapsi.fi>
 <07f933b3-10d9-0318-e2f3-6dfd5b4903ac@gmail.com>
 <28f18a23-b588-004d-4945-91b7a593607a@kapsi.fi>
 <3f80aff2-23ce-9b1f-d242-e46e974fbeed@gmail.com>
 <56c956a3-af14-559b-8022-2228a65e82a6@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fe626343-6f10-96bd-171c-7876917d570b@gmail.com>
Date:   Sun, 13 Sep 2020 21:37:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <56c956a3-af14-559b-8022-2228a65e82a6@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

13.09.2020 12:51, Mikko Perttunen пишет:
...
>> All waits that are internal to a job should only wait for relative sync
>> point increments. >
>> In the grate-kernel every job uses unique-and-clean sync point (which is
>> also internal to the kernel driver) and a relative wait [1] is used for
>> the job's internal sync point increments [2][3][4], and thus, kernel
>> driver simply jumps over a hung job by updating DMAGET to point at the
>> start of a next job.
> 
> Issues I have with this approach:
> 
> * Both this and my approach have the requirement for userspace, that if
> a job hangs, the userspace must ensure all external waiters have timed
> out / been stopped before the syncpoint can be freed, as if the
> syncpoint gets reused before then, false waiter completions can happen.
> 
> So freeing the syncpoint must be exposed to userspace. The kernel cannot
> do this since there may be waiters that the kernel is not aware of. My
> proposal only has one syncpoint, which I feel makes this part simpler, too.
> 
> * I believe this proposal requires allocating a syncpoint for each
> externally visible syncpoint increment that the job does. This can use
> up quite a few syncpoints, and it makes syncpoints a dynamically
> allocated resource with unbounded allocation latency. This is a problem
> for safety-related systems.

Maybe we could have a special type of a "shared" sync point that is
allocated per-hardware engine? Then shared SP won't be a scarce resource
and job won't depend on it. The kernel or userspace driver may take care
of recovering the counter value of a shared SP when job hangs or do
whatever else is needed without affecting the job's sync point.

Primarily I'm not feeling very happy about retaining the job's sync
point recovery code because it was broken the last time I touched it and
grate-kernel works fine without it.

> * If a job fails on a "virtual channel" (userctx), I think it's a
> reasonable expectation that further jobs on that "virtual channel" will
> not execute, and I think implementing that model is simpler than doing
> recovery.

Couldn't jobs just use explicit fencing? Then a second job won't be
executed if first job hangs and explicit dependency is expressed. I'm
not sure that concept of a "virtual channel" is applicable to drm-scheduler.

I'll need to see a full-featured driver implementation and the test
cases that cover all the problems that you're worried about because I'm
not aware about all the T124+ needs and seeing code should help. Maybe
in the end yours approach will be the best, but for now it's not clear :)
