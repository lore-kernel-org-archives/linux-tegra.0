Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A681C433EF
	for <linux-tegra@archiver.kernel.org>; Wed, 22 Dec 2021 03:02:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238411AbhLVDCB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Dec 2021 22:02:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235520AbhLVDCB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Dec 2021 22:02:01 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E563BC061574
        for <linux-tegra@vger.kernel.org>; Tue, 21 Dec 2021 19:02:00 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id z8so1422769ljz.9
        for <linux-tegra@vger.kernel.org>; Tue, 21 Dec 2021 19:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wm8Yrjopy492NzBpwSLQqPTvQKvPN3l++wypA+HZ4RM=;
        b=bHDnYR/sWzK8MlejMHmG8ZP3MQw94YJocF0LJxZDftfxzek6egth5iHoPAfvzP1jn6
         5kFjdSmOp/5zVsngRvIbOsM3wKNVDLZK6vOQ93D0beEwusrIb0uMx8rXfWx/Z9GXpgL6
         Uhfu9nmYOz3GE8+PKrRpLuFhjTy4w3uMbyrA2DILtI1N4G6DP80OFeBQuS7PaoiVVpJ8
         IfyTudE+hinFjZOjTLwV91Y9cm2bw4kl32BJpIzuBoW9llB3S5NOlxFCeaPkRW8NGR3r
         g6vOpgS4Z/Q0CsxW3Lu6ucoa6FM8AtuDa/CS6nN7dCz0qhNV3ZsRNx/IDNjAQMsXpaDF
         Ou6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wm8Yrjopy492NzBpwSLQqPTvQKvPN3l++wypA+HZ4RM=;
        b=vmfAFMayVwFVnNl05/d7i/SZD72QNAhVPzhV8a1TrfyOOQS+mu0Z9DiAtQXmS95Uu6
         eOAhCAb/ZvvKQnuvzMzucQ5z3hQh9J/Eqid6DSMrnrv/oeicXbUxoy6d8fvHmIAwdHv7
         5yX4s4unFBqwoU2kprr58ijhy14K+0PmSfIDExOLmR9V2Vt/8IvAcZmv1ruFKJDBmsh1
         q+FdeNCAyPSnd9i0TVcpkJXICFFGx7/X9c2N9MPwF0AYHn0tb+gNigjBCjP3fTN+wWXR
         cy3yNQin9KXYiOKtXW+V7SiLK+XwxDf0AfCr0j5KxiVaUBUrAxfd0DuCW7L7VULnJdUi
         j4GQ==
X-Gm-Message-State: AOAM531mRSuBcaz/5hFiwKW+YMCpyVjFFdWD3jw1oktBmsOhZ31imyip
        BZF8DIHiF3KR0kQno+aiTAaBuey0h+g=
X-Google-Smtp-Source: ABdhPJxCT//IyPAiErDmM1GSo+PvEhwRPRkyQCnsGkSIqFHRx2PINwIgMXpkXffBhnscqmnudZfvQw==
X-Received: by 2002:a2e:3304:: with SMTP id d4mr820939ljc.377.1640142118858;
        Tue, 21 Dec 2021 19:01:58 -0800 (PST)
Received: from [192.168.2.145] (46-138-43-24.dynamic.spd-mgts.ru. [46.138.43.24])
        by smtp.googlemail.com with ESMTPSA id g22sm71912lfr.237.2021.12.21.19.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Dec 2021 19:01:58 -0800 (PST)
Subject: Re: [PATCH 0/2] drm/tegra: Fix panel support on Venice 2 and Nyan
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Thomas Graichen <thomas.graichen@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20211220104855.428290-1-thierry.reding@gmail.com>
 <dd7a2f23-00d6-9160-1e09-1d4ea5b1f5e1@gmail.com> <YcCg/xktJ2uShFRf@orome>
 <e27bd5e0-51d2-875b-aa41-f198230880ac@gmail.com> <YcGzO0A/iWzhFjvE@orome>
 <c2d2e5a1-7f44-a190-2ab1-84125fbe9f65@gmail.com> <YcH+Fw9sCzCIzFIx@orome>
 <1bac3b32-ad9b-4d10-c7fb-6aafd353cdd4@gmail.com> <YcIWlOoER16wUyQ/@orome>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f8c50f22-ddeb-1805-bfcd-410aa46f869a@gmail.com>
Date:   Wed, 22 Dec 2021 06:01:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YcIWlOoER16wUyQ/@orome>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

21.12.2021 21:01, Thierry Reding пишет:
> On Tue, Dec 21, 2021 at 07:45:31PM +0300, Dmitry Osipenko wrote:
>> 21.12.2021 19:17, Thierry Reding пишет:
>>> On Tue, Dec 21, 2021 at 06:47:31PM +0300, Dmitry Osipenko wrote:
>>>> 21.12.2021 13:58, Thierry Reding пишет:
>>>> ..
>>>>>>>> The panel->ddc isn't used by the new panel-edp driver unless panel is
>>>>>>>> compatible with "edp-panel". Hence the generic_edp_panel_probe() should
>>>>>>>> either fail or crash for a such "edp-panel" since panel->ddc isn't fully
>>>>>>>> instantiated, AFAICS.
>>>>>>>
>>>>>>> I've tested this and it works fine on Venice 2. Since that was the
>>>>>>> reference design for Nyan, I suspect that Nyan's will also work.
>>>>>>>
>>>>>>> It'd be great if Thomas or anyone else with access to a Nyan could
>>>>>>> test this to verify that.
>>>>>>
>>>>>> There is no panel-edp driver in the v5.15. The EOL of v5.15 is Oct,
>>>>>> 2023, hence we need to either use:
>>>>>
>>>>> All the (at least relevant) functionality that is in panel-edp was in
>>>>> panel-simple before it was moved to panel-edp. I've backported this set
>>>>> of patches to v5.15 and it works just fine there.
>>>>
>>>> Will we be able to add patch to bypass the panel's DT ddc-i2c-bus on
>>>> Nyan to keep the older DTBs working?
>>>
>>> I don't see why we would want to do that. It's quite clear that the DTB
>>> is buggy in this case and we have a more accurate way to describe what's
>>> really there in hardware. In addition that more accurate representation
>>> also gets rid of a bug. Obviously because the bug is caused by the
>>> previous representation that was not accurate.
>>>
>>> Given that we can easily replace the DTBs on these devices there's no
>>> reason to make this any more complicated than it has to be.
>>
>> Don't you care about normal people at all? Do you assume that everyone
>> must to be a kernel developer to be able to use Tegra devices? :/
> 
> If you know how to install a custom kernel you also know how to replace
> the DTB on these devices.
> 
> For everyone else, once these patches are merged upstream and
> distributions start shipping the new version, they will get this
> automatically by updating their kernel package since most distributions
> actually ship the DTB files as part of that.
> 
>> It's not a problem for you to figure out why display is broken, for
>> other people it's a problem. Usually nobody will update DTB without a
>> well known reason, instead device will be dusted on a shelf. In the end
>> you won't have any users at all.
> 
> Most "normal" people aren't even going to notice that their DTB is going
> to be updated. They would actually have to do extra work *not* to update
> it.

My past experience tells that your assumption is incorrect. There are
quite a lot of people who will update kernel, but not DTB.

ARM devices have endless variations of bootloaders and individual quirks
required for a successful installation of a kernel. Kernel update by
distro usually isn't a thing on ARM.
