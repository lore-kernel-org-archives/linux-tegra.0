Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9846C83003
	for <linux-tegra@archiver.kernel.org>; Tue, 13 Jun 2023 13:24:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240612AbjFMNYA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 13 Jun 2023 09:24:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240273AbjFMNX7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 13 Jun 2023 09:23:59 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 750AFE6
        for <linux-tegra@vger.kernel.org>; Tue, 13 Jun 2023 06:23:58 -0700 (PDT)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1q9401-00032v-61; Tue, 13 Jun 2023 15:23:53 +0200
Message-ID: <8f00c62e-7e9b-4b5b-c1a3-2562117795e9@leemhuis.info>
Date:   Tue, 13 Jun 2023 15:23:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: [PATCH] ASoC: tegra: Fix Master Volume Control
Content-Language: en-US, de-DE
To:     Jon Hunter <jonathanh@nvidia.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sameer Pujar <spujar@nvidia.com>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
        Linux kernel regressions list <regressions@lists.linux.dev>
References: <20230613093453.13927-1-jonathanh@nvidia.com>
From:   "Linux regression tracking #adding (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
In-Reply-To: <20230613093453.13927-1-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1686662638;25072e10;
X-HE-SMSGID: 1q9401-00032v-61
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 13.06.23 11:34, Jon Hunter wrote:
> Commit 3ed2b549b39f ("ALSA: pcm: fix wait_time calculations") corrected
> the PCM wait_time calculations and in doing so reduced the calculated
> wait_time. This exposed an issue with the Tegra Master Volume Control
> (MVC) device where the reduced wait_time caused the MVC to fail. For now
> fix this by setting the default wait_time for Tegra to be 500ms.
> 
> Fixes: 3ed2b549b39f ("ALSA: pcm: fix wait_time calculations")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> [...]

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced 3ed2b549b39f
#regzbot title ASoC: tegra: Master Volume Control broken
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (the parent of this mail). See page linked in footer for
details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
