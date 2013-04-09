From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL 6/8] ARM: tegra: device tree changes
Date: Tue, 9 Apr 2013 17:04:08 +0200
Message-ID: <201304091704.08446.arnd@arndb.de>
References: <1365181426-11547-1-git-send-email-swarren@wwwdotorg.org> <1365181426-11547-6-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1365181426-11547-6-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Friday 05 April 2013, Stephen Warren wrote:
> Spam Status: Spamassassin 0% probability of being spam.
> 
> Full report:
> No, score=-4.2 required=5.0 tests=BAYES_00,RP_MATCHES_RCVD, UNPARSEABLE_RELAY autolearn=unavailable version=3.3.1  
> This branch contains the majority of the device tree changes for Tegra.
> Highlights include:
> 
> * Many changes for Tegra114, and the Dalmore board, to enable pinctrl,
>   SDHCI/MMC, PWM, DMA, I2C, KBC, SPI, battery, regulators.
> * Adding or enabling suspend wakeup sources on many boards, and adding
>   suspend timing parameters, to support the system suspend patches.
> * Adding clocks to the audio-related nodes, so that in 3.11, the audio
>   driver can pull these clocks from device tree rather than hard-coding
>   clock names.
> * Some small DT fixes/cleanup.
> 
> This branch is based on the previous clk pull request.

Hmm, I can't put this into the normal next/dt branch, since I really don't
want to add a dependency on the next/drivers branch there.

Can you send a replacement pull request that only contains the commits
that don't depend on that, and a separate request that can go on top
of next/drivers?

Alternatively, I could start a next/dt2 branch, but I'd like to avoid
that.

	Arnd
