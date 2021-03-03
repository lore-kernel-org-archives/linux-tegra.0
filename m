Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F44C432C3
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 23:59:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF1B964F5B
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 23:59:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233992AbhCCX7x (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 3 Mar 2021 18:59:53 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:16409 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234938AbhCCLvw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 3 Mar 2021 06:51:52 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B603f78240001>; Wed, 03 Mar 2021 03:51:00 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 3 Mar
 2021 11:51:00 +0000
Received: from [10.26.49.13] (172.20.145.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 3 Mar 2021
 11:50:58 +0000
Subject: Re: [PATCH] ASoC: soc-core: Prevent warning if no DMI table is
 present
To:     Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
CC:     <linux-tegra@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        "Liam Girdwood" <lgirdwood@gmail.com>,
        <linux-kernel@vger.kernel.org>
References: <20210302092712.310705-1-jonathanh@nvidia.com>
 <20210302124913.GC4522@sirena.org.uk> <s5hr1kxeah4.wl-tiwai@suse.de>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <806466c4-4ef2-f4ba-3609-81b862810185@nvidia.com>
Date:   Wed, 3 Mar 2021 11:50:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <s5hr1kxeah4.wl-tiwai@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1614772260; bh=1AMVTuLDPdQruFXHSdhzo4SnKHhmVWXwXkkJpkM8YqE=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=aCzLDb7c2b3EmDwbw4yNcqOD0hSqFwNbIJIYrjf05IWPN5G/awnzNJUVdtSYFvU+3
         vgtOdOdL1MZxMxxglgcrUrdvoPn17q5bgxrkofNX8OrRWr92nteIhiyCUmixMxNX2C
         9cOYnu4mDd9POGHWj8gTLuIqfnwrpJb4WIShyqIzKjuQ26Kn/vszdjokcT3ZGrkM7F
         pga93684vDYKLw172v1UDsjM95syon9ibY2FE8DZR37NAAX3+GmI12vhccuM74GT9w
         BVL79B85Grq0G+s3YemvY6o9kd86dJsJhhmTQ7Fzu4a2PbAilflqNj57MHBMOkz9LZ
         h5/4m6J8NwLaQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 02/03/2021 17:23, Takashi Iwai wrote:
> On Tue, 02 Mar 2021 13:49:13 +0100,
> Mark Brown wrote:
>>
>> On Tue, Mar 02, 2021 at 09:27:12AM +0000, Jon Hunter wrote:
>>> Many systems do not provide a DMI table and on these systems a warning,
>>> such as the following, is printed on boot ...
>>>
>>>  WARNING KERN tegra-audio-graph-card sound: ASoC: no DMI vendor name!
>>>
>>> If DMI support is enabled in the kernel, there is no simple way to
>>> detect if a DMI table is table or not. Note that the variable
>>> 'dmi_available' is not exported and so cannot be used by kernel modules.
>>
>> We could fix that, or provide an accessor function?  Or only warn if
>> we're on an ACPI system (which we can check from a module).  This really
>> does feel like something we should be warning about on systems that are
>> supposed to have DMI information available as standard.
> 
> I had the same feeling when I took a look at the patch, but later
> changed mind, since the error will pop up also if a system has an
> unmatured BIOS with some bogus vendor DMI string, too.  That is, users
> of such a machine gets always an error message although this isn't any
> serious problem unless you need a dedicated UCM profile (which can't
> be used on such a system in anyway).
> 
> So, I agree that exporting dmi_avilable could improve the situation a
> bit, but the error level needs still reconsideration.


Thanks for the feedback. Yes it is probably better if we have a specific
test. I will send out a V2 for review.

Thanks
Jon

-- 
nvpublic
