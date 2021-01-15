Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7433CC433E9
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 11:24:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 46F0F23358
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 11:24:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727478AbhAOLY0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 15 Jan 2021 06:24:26 -0500
Received: from imap3.hz.codethink.co.uk ([176.9.8.87]:54744 "EHLO
        imap3.hz.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726918AbhAOLYY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Jan 2021 06:24:24 -0500
X-Greylist: delayed 1850 seconds by postgrey-1.27 at vger.kernel.org; Fri, 15 Jan 2021 06:24:23 EST
Received: from cpc79921-stkp12-2-0-cust288.10-2.cable.virginm.net ([86.16.139.33] helo=[192.168.0.18])
        by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1l0Mip-0006Wd-Ec; Fri, 15 Jan 2021 10:52:51 +0000
Subject: Re: [PATCH v1 0/5] Clock and reset improvements for Tegra ALSA
 drivers
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210112125834.21545-1-digetx@gmail.com>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <d09b6953-fc74-9fbc-e66d-556df4674746@codethink.co.uk>
Date:   Fri, 15 Jan 2021 10:52:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112125834.21545-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 12/01/2021 12:58, Dmitry Osipenko wrote:
> This series improves the handling of clock and reset controls of
> NVIDA Tegra ALSA drivers. Tegra HDA and AHUB drivers aren't handling
> resets properly, which needs to be fixed in order to unblock other patches
> related to fixes on the reset controller driver since HDA/AHUB are bound
> to fail once reset controller driver will be corrected. In particular ALSA
> drivers are relying on implicit de-assertion of resets which is done by the
> tegra-clk driver. It's not the business of the clk driver to touch resets
> and we need to fix this because it breaks reset/clk programming sequences
> of other Tegra drivers.
> 
> Dmitry Osipenko (5):
>    ALSA: hda/tegra: Use clk_bulk helpers
>    ALSA: hda/tegra: Reset hardware
>    ASoC: tegra: ahub: Use of_reset_control_array_get_exclusive()
>    ASoC: tegra: ahub: Use clk_bulk helpers
>    ASoC: tegra: ahub: Reset hardware properly
> 
>   sound/pci/hda/hda_tegra.c      |  86 +++++++++------------------
>   sound/soc/tegra/tegra30_ahub.c | 103 ++++++---------------------------
>   sound/soc/tegra/tegra30_ahub.h |   6 +-
>   3 files changed, 49 insertions(+), 146 deletions(-)

I wonder if this will help with the issues we saw when the tegra is
the i2s clock slave.


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
