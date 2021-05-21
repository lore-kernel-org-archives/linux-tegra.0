Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37009C433B4
	for <linux-tegra@archiver.kernel.org>; Fri, 21 May 2021 08:54:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17475613B6
	for <linux-tegra@archiver.kernel.org>; Fri, 21 May 2021 08:54:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbhEUIzy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 May 2021 04:55:54 -0400
Received: from mail1.perex.cz ([77.48.224.245]:48698 "EHLO mail1.perex.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229726AbhEUIzx (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 May 2021 04:55:53 -0400
Received: from mail1.perex.cz (localhost [127.0.0.1])
        by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 285D9A0040;
        Fri, 21 May 2021 10:54:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 285D9A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
        t=1621587269; bh=zfQOEPjPu+MFDsM+IqxZDl7MiSDjj91oZwdBebRzDIQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=DDPeR/46pKs/zk1DUIE1Zu8prrZuYOrkN89aymRWN08vVY6WDxfIFgvyJhyGb6kc7
         kwSG5J7TKwAV8hr8jnLyqmhMYqTqQT/sRknV2IXmcd1W/1Fh/863M6inLMh0JvtTRe
         SLPBAszbW8C9UPwjsbQhtDvhvlOib1poPJBsiQgY=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: perex)
        by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
        Fri, 21 May 2021 10:54:18 +0200 (CEST)
Subject: Re: [PATCH v2 2/2] ASoC: tegra: Unify ASoC machine drivers
To:     Mark Brown <broonie@kernel.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Takashi Iwai <tiwai@suse.com>, Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210520175054.28308-1-digetx@gmail.com>
 <20210520175054.28308-3-digetx@gmail.com>
 <8e5d4442-00a4-460b-d37a-8962960dd7ff@perex.cz>
 <20210520190812.GF3962@sirena.org.uk>
From:   Jaroslav Kysela <perex@perex.cz>
Message-ID: <ef59dad1-b06e-1d90-5948-9bb6e79478a2@perex.cz>
Date:   Fri, 21 May 2021 10:54:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520190812.GF3962@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Dne 20. 05. 21 v 21:08 Mark Brown napsal(a):
> On Thu, May 20, 2021 at 09:02:49PM +0200, Jaroslav Kysela wrote:
>> Dne 20. 05. 21 v 19:50 Dmitry Osipenko napsal(a):
>>> Squash all machine drivers into a single-universal one. This reduces
>>> code duplication, eases addition of a new drivers and upgrades older
>>> code to a modern Linux kernel APIs.
> 
>>> +static struct snd_soc_card snd_soc_tegra_wm9712 = {
>>> +	.dai_link = &tegra_wm9712_dai,
>>> +	.num_links = 1,
>>> +	.fully_routed = true,
>>> +};
> 
>> Please, could you also initialize snd_soc_card->components? It may be useful
>> to pass the codec identification to the user space like:
> 
>> .components = "codec:wm9712"
> 
> Hrm, if this is important to userspace shouldn't the core be doing
> something by default given that it already knows all the components
> going into the card?

I don't think that we can pass the complex topology in the simple string (127
chars). For the time, it's better to pass only the vital information which the
user space requires for the fine-grained hw configuration detection and
description.

For the above example, the "codec:" prefix may be replaced by the purpose
string (like "hs:" - headset, "spk:" - speaker) etc. This information is not
available in the ASoC components (purpose / location / exact I/O config etc.).

>> The passed information should be consistent. You may look into the Intel ASoC
>> drivers for the examples (card->components initialization). There are also
>> hints about the number of connected microphones ("cfg-mic:2" - configuration
>> with 2 microphones) or the codec purpose ("hs:rt711" - headset codec is RT711)
>> etc.
> 
> This sort of stuff is more something that the card should layer on top.

It would be nice to have this layer with the topology description, but until
someone designs it, it's much easier to describe the configuration and hints
in the simple string passed to the user space.

Actually, for ACPI/PCI platforms, the information is gathered from the tables
or detected by PCI IDs. For the device tree. It may be worth to allow to pass
this string from the device tree, too. I believe that the DT config author has
enough information to describe the hardware.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
