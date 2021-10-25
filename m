Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5395DC433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 25 Oct 2021 13:04:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32D2A6023E
	for <linux-tegra@archiver.kernel.org>; Mon, 25 Oct 2021 13:04:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233438AbhJYNHL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 25 Oct 2021 09:07:11 -0400
Received: from mail1.perex.cz ([77.48.224.245]:35534 "EHLO mail1.perex.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233391AbhJYNHK (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 25 Oct 2021 09:07:10 -0400
X-Greylist: delayed 383 seconds by postgrey-1.27 at vger.kernel.org; Mon, 25 Oct 2021 09:07:10 EDT
Received: from mail1.perex.cz (localhost [127.0.0.1])
        by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 5B1D5A003F;
        Mon, 25 Oct 2021 14:58:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 5B1D5A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
        t=1635166702; bh=2eZ26/VaEzftwu3ZmYsfOCPTwZ9yZoE3hgkj1VEFB+I=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=BHt3MaR/tnH1YLlX0CxYPQLb0TApnFbI0kfh54oCDK9UYHer4A5PCYcG7fNDlI9Wl
         l/rAVmzVS+aGmJ4bJnEpVBj4S8+Ub5Xqkq1fW4Tar5TF0/zuRCsbSOMsJdgCWNlEhi
         hZMMBpuIDsoRSFlTW5nddFWLYAwb1aOChP6N3TgM=
Received: from [192.168.100.98] (unknown [192.168.100.98])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: perex)
        by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
        Mon, 25 Oct 2021 14:58:13 +0200 (CEST)
Message-ID: <79541c76-2c2b-fd4b-60c8-67ee6b8ea3fa@perex.cz>
Date:   Mon, 25 Oct 2021 14:58:13 +0200
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
From:   Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <1635159976-17355-1-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 25. 10. 21 13:06, Sameer Pujar wrote:

> @@ -150,11 +186,22 @@ static int tegra210_mvc_put_mute(struct snd_kcontrol *kcontrol,

...
>   
>   	return 1;

It's a bit unrelated comment to this change, but it may be worth to verify all 
kcontrol put callbacks in the tegra code. Ensure that value 1 is returned only 
when something was really changed in hardware.

The tegra210_i2s_put_control() has opposite problem for example - returns 
always 0 which means that the change notifications are not send to subscribed 
applications.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
