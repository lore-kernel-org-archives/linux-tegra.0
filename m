Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A843EC636CC
	for <linux-tegra@archiver.kernel.org>; Wed,  8 Feb 2023 02:11:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbjBHCLA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 7 Feb 2023 21:11:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbjBHCK7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 Feb 2023 21:10:59 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 356CD40BE4
        for <linux-tegra@vger.kernel.org>; Tue,  7 Feb 2023 18:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=AuTyDSrSjqaHZtVxnBwKuHAyQ6R0P+ssQyTf+RiDt24=; b=ZqjGyVa9C8gevk4DdJl9RIZ3Z/
        JhUhMdElBE4KCOSfvQ6kWk+fROA6xuLYbtFt1wqcEYaS/38nancZyGQE7K5mUEzQg0AXTDK3sqf1k
        gXP7VDbcT50A0h+xR43+n0Cab00vGpqb358gqLqkuOnW+gE4H2Ata+DvYiT6i4D3M5Mqr1sLfakUk
        5BOBj2Ez4fd2X4wIWSVbevBwCnVNRDEiy8VeubVqwY6z09mycaN0ECFoh/gx0dfDvgRiEqZcBDJO0
        1U43rm4nA+7N15ElcAb78D8f2eeBZaRtQ/bz0+1VbfUr7/xhZfwBCNaVSyAxvAockml9xHs2gpK9D
        U9q4HP1g==;
Received: from 108-90-42-56.lightspeed.sntcca.sbcglobal.net ([108.90.42.56] helo=[192.168.1.80])
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pPZuk-000mBb-Qa; Wed, 08 Feb 2023 02:10:27 +0000
Message-ID: <40b2139d-274f-10c5-e74a-3849c94475ae@infradead.org>
Date:   Tue, 7 Feb 2023 18:10:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/3] ALSA: core: Make snd_card_free() return void
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Cc:     Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        alsa-devel@alsa-project.org, kernel@pengutronix.de,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20230207191907.467756-1-u.kleine-koenig@pengutronix.de>
 <20230207191907.467756-4-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
From:   Geoff Levand <geoff@infradead.org>
In-Reply-To: <20230207191907.467756-4-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Uwe,

On 2/7/23 11:19, Uwe Kleine-König wrote:
> The function returns 0 unconditionally. Make it return void instead and
> simplify all callers accordingly.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  include/sound/core.h      | 2 +-
>  sound/core/init.c         | 6 ++----
>  sound/pci/hda/hda_tegra.c | 6 ++----
>  sound/ppc/snd_ps3.c       | 4 +---
>  4 files changed, 6 insertions(+), 12 deletions(-)

> --- a/sound/ppc/snd_ps3.c
> +++ b/sound/ppc/snd_ps3.c
> @@ -1053,9 +1053,7 @@ static void snd_ps3_driver_remove(struct ps3_system_bus_device *dev)
>  	 * ctl and preallocate buffer will be freed in
>  	 * snd_card_free
>  	 */
> -	ret = snd_card_free(the_card.card);
> -	if (ret)
> -		pr_info("%s: ctl freecard=%d\n", __func__, ret);
> +	snd_card_free(the_card.card);
>  
>  	dma_free_coherent(&dev->core,
>  			  PAGE_SIZE,

Looks OK for PS3.

Acked-by: Geoff Levand <geoff@infradead.org>

