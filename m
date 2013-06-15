From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL 5/5] ARM: tegra: defconfig updates
Date: Fri, 14 Jun 2013 18:14:13 -0700
Message-ID: <20130615011413.GS18124@quad.lixom.net>
References: <1371227838-18764-1-git-send-email-swarren@wwwdotorg.org>
 <1371227838-18764-6-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1371227838-18764-6-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 14, 2013 at 10:37:18AM -0600, Stephen Warren wrote:
> Enable some new features:
> * The Tegra114 SPI controller, for Dalmore's SPI flash.
> * Set all the GPIO leds triggers to their "if you don't know, say X"
>   value, so there are some useful triggers for the gpio-leds support.
> * TPS65090 charger, for Dalmore.
> * ASoC RT5640 machine driver, for audio on Beaver and Dalmore.
> 
> Also, rebuild tegra_defconfig on top of linux-next. This should make it
> easier to create future defconfig patches, without extraneous diffs.
> 
> This branch is based on v3.10-rc3, in order not to conflict with a
> defconfig change first included there.


Pulled. Note that the last two lines aren't really valuable as part of the tag
text (but as part of the pull request they are)


-Olof
