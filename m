Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E00FC433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Oct 2021 15:26:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50D2160F93
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Oct 2021 15:26:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbhJ2P3P (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Oct 2021 11:29:15 -0400
Received: from mail1.perex.cz ([77.48.224.245]:39126 "EHLO mail1.perex.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229868AbhJ2P3O (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Oct 2021 11:29:14 -0400
Received: from mail1.perex.cz (localhost [127.0.0.1])
        by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id F345FA0049;
        Fri, 29 Oct 2021 17:26:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz F345FA0049
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
        t=1635521204; bh=34OOJZeF7fIOonM6ercXMgmUTe4EfYzKs0a5zkCpoYc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=dXwLqXlpGfaHehXGmpIoYdksLlU+13fd773929LyRw7lINOI4EqkJa7kmapPRce49
         G61m9UNfn2srSKxqQNJOY5gNdaZPv0ne+/4n7smc1xjAHKe01G23CK+s+ibNH8s3y2
         EgBCWmtld7RksURsJu1cYNEWpOvVyU8/kRne/yts=
Received: from [192.168.100.98] (unknown [192.168.100.98])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: perex)
        by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
        Fri, 29 Oct 2021 17:26:34 +0200 (CEST)
Message-ID: <f709fcff-1bd4-1251-1471-aad01fdfdedd@perex.cz>
Date:   Fri, 29 Oct 2021 17:26:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] ASoC: tegra: Add master volume/mute control support
Content-Language: en-US
To:     Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org,
        lgirdwood@gmail.com, tiwai@suse.com
Cc:     jonathanh@nvidia.com, thierry.reding@gmail.com,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1635159976-17355-1-git-send-email-spujar@nvidia.com>
 <79541c76-2c2b-fd4b-60c8-67ee6b8ea3fa@perex.cz>
 <8cb777f9-b73b-136c-f560-de4c31af931e@nvidia.com>
 <18b61046-ac0b-0fb3-669c-6524a03eecf0@nvidia.com>
From:   Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <18b61046-ac0b-0fb3-669c-6524a03eecf0@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 29. 10. 21 17:08, Sameer Pujar wrote:
> 
> 
> On 10/26/2021 11:53 AM, Sameer Pujar wrote:
>>
>>
>> On 10/25/2021 6:28 PM, Jaroslav Kysela wrote:
>>> On 25. 10. 21 13:06, Sameer Pujar wrote:
>>>
>>>> @@ -150,11 +186,22 @@ static int tegra210_mvc_put_mute(struct
>>>> snd_kcontrol *kcontrol,
>>>
>>> ...
>>>>
>>>>        return 1;
>>>
>>> It's a bit unrelated comment to this change, but it may be worth to
>>> verify all
>>> kcontrol put callbacks in the tegra code. Ensure that value 1 is
>>> returned only
>>> when something was really changed in hardware.
> 
> There are cases when the mixer control update is not immediately written
> to HW, instead the update is ACKed (stored in variable) and writen to HW
> at a later point of time. Do these cases qualify for "return 1" as well?

Yes - assuming that the get callback returns the cached value. The get/put 
implementation should be consistent from the caller view. The driver 
implementation (delayed write) is a separate thing.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
