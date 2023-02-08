Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07835C636CC
	for <linux-tegra@archiver.kernel.org>; Wed,  8 Feb 2023 08:47:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbjBHIrX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 8 Feb 2023 03:47:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbjBHIrW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Feb 2023 03:47:22 -0500
X-Greylist: delayed 428 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 08 Feb 2023 00:47:20 PST
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21BCF457CF
        for <linux-tegra@vger.kernel.org>; Wed,  8 Feb 2023 00:47:19 -0800 (PST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
        by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 0D9C411C6;
        Wed,  8 Feb 2023 09:40:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 0D9C411C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
        t=1675845607; bh=sIWx84wjVedBalx3G6+LpCIVD21PqPaz8xE7PwJql8A=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=1mxnHyyPGwnXqK7JnEnHKmaGGaagS1qrgtLVrvArptHnK/6E72JKa3I6trY+Z7RL+
         JRoljUKbeoiROUzbg42OZugGhhrDfrc+4q1teOQIByi1yCv3uGOl53/0MDwog7hunN
         1RrCoS2iZHR8TwlqySW/JlCQ3808VN9tJTHutu2s=
Received: from [192.168.100.98] (unknown [192.168.100.98])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: perex)
        by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
        Wed,  8 Feb 2023 09:39:54 +0100 (CET)
Message-ID: <ae3efa77-0dde-4681-d68d-1f483ebd5d9e@perex.cz>
Date:   Wed, 8 Feb 2023 09:39:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/3] ALSA: core: Make some functions return void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Geoff Levand <geoff@infradead.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Cc:     alsa-devel@alsa-project.org, kernel@pengutronix.de,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20230207191907.467756-1-u.kleine-koenig@pengutronix.de>
From:   Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230207191907.467756-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 07. 02. 23 20:19, Uwe Kleine-König wrote:
> Hello,
> 
> while checking in which cases hda_tegra_remove() can return a non-zero value, I
> found that actually cannot happen. This series makes the involved functions
> return void to make this obvious.
> 
> This is a preparation for making platform_driver::remove return void, too.
> 
> Best regards
> Uwe
> 
> Uwe Kleine-König (3):
>    ALSA: core: Make snd_card_disconnect() return void
>    ALSA: core: Make snd_card_free_when_closed() return void
>    ALSA: core: Make snd_card_free() return void
> 
>   include/sound/core.h      |  6 +++---
>   sound/core/init.c         | 40 ++++++++++++++-------------------------
>   sound/pci/hda/hda_tegra.c |  6 ++----
>   sound/ppc/snd_ps3.c       |  4 +---
>   4 files changed, 20 insertions(+), 36 deletions(-)

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

