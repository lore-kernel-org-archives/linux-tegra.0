From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL 8/8] ARM: tegra: defconfig changes
Date: Tue, 9 Apr 2013 17:16:35 +0200
Message-ID: <201304091716.36058.arnd@arndb.de>
References: <1365181426-11547-1-git-send-email-swarren@wwwdotorg.org> <1365181426-11547-8-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1365181426-11547-8-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Friday 05 April 2013, Stephen Warren wrote:
> Various new features are enabled:
> 
> * Tegra114 support.
> * Various PMICs and related options for Tegra114 platforms.
> * KEYBOARD_GPIO, mainly as a suspend wakeup source.
> * tegra_defconfig is rebuilt based on v3.9-rc1, which causes various
>   layout changes.
> 
> This branch is based on v3.9-rc1.

Pulled into next/soc.

I'm currently thinking about creating a next/defconfig branch after all,
since we have a couple of pull requests in next/soc that only do
defconfig changes. Olof, any opinion?

	Arnd
