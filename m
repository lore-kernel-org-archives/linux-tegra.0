From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL] ARM: tegra: dt2 branch
Date: Tue, 15 May 2012 19:15:25 +0000
Message-ID: <201205151915.25543.arnd@arndb.de>
References: <1337016017-30537-1-git-send-email-swarren@wwwdotorg.org> <201205151143.26008.arnd@arndb.de> <4FB2812F.1010500@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FB2812F.1010500-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tuesday 15 May 2012, Stephen Warren wrote:
> > I think we can't drop it from the driver because of existing powerpc machines
> > providing the property, but it would be ok if you drop it from your .dts
> > files.
> 
> support-8bit is parsed by the Tegra driver only, and only appears in
> tegra-*.dts across all arch/*/boot.dts. I assume you were talking about
> some other property, although I can't tell which from a very quick look
> at arch/powerpc/boot/dts/*.

Right, my mistake.

I guess we could have just removed it right away then.

	Arnd
