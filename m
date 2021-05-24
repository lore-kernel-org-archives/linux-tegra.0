Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB9CC04FF3
	for <linux-tegra@archiver.kernel.org>; Mon, 24 May 2021 10:55:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC9D4610C8
	for <linux-tegra@archiver.kernel.org>; Mon, 24 May 2021 10:55:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232630AbhEXK4g (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 24 May 2021 06:56:36 -0400
Received: from mail1.perex.cz ([77.48.224.245]:52898 "EHLO mail1.perex.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232397AbhEXK4g (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 May 2021 06:56:36 -0400
Received: from mail1.perex.cz (localhost [127.0.0.1])
        by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id E19A2A0040;
        Mon, 24 May 2021 12:55:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz E19A2A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
        t=1621853706; bh=SsQADfu4c/5DcA6Rxn7R2IhZKuoFdZKz0HMzZ/XLUd0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ySU4G582M9Vq5C4bhSHgjxixBUY2m0/V0CRlX3VSktSbDx34n6WyYeNLI6GRnfymJ
         zyR7KQqlgwI9cMgKf2CYrTHfCMZ9yLFozlp3mklMBoy0qNkGJYjBOQwODp/87iGptw
         GW8wzqdVhh+Dp1CGuTKxcwc84f0+PFrUmOEapvdc=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: perex)
        by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
        Mon, 24 May 2021 12:54:55 +0200 (CEST)
Subject: Re: [PATCH v3 3/4] ASoC: tegra: Specify components string for each
 card
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210523234437.25077-1-digetx@gmail.com>
 <20210523234437.25077-4-digetx@gmail.com>
From:   Jaroslav Kysela <perex@perex.cz>
Message-ID: <682a8978-a2fa-1a2d-e312-fc13ab3a843e@perex.cz>
Date:   Mon, 24 May 2021 12:54:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210523234437.25077-4-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Dne 24. 05. 21 v 1:44 Dmitry Osipenko napsal(a):
> Specify components string for each card of each supported device. It's
> a free form string that describes audio hardware configuration. This
> information is useful for ALSA UCM rules. It allows to generalize UCM
> rules, potentially removing a need to add new UCM rule for each device.
> 
> This patch also adds asoc->components hook that allows to specify
> components description per device.
> 
> Suggested-by: Jaroslav Kysela <perex@perex.cz>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Acked-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
