From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL 1/3] ARM: tegra: core SoC code changes for 3.18
Date: Thu, 25 Sep 2014 18:01:18 +0200
Message-ID: <201409251801.18466.arnd@arndb.de>
References: <1411062692-22338-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411062692-22338-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thursday 18 September 2014, Stephen Warren wrote:
> the primary change here gets its address information from DT rather than
> iomap.h. This removes one more user of iomap.h, and will help allow the
> code to move to a location that can be shared between arch/arm and
> arch/arm64.
> 
> An unused header file was also removed.
> 

Pulled all three into the respective soc, dt and defconfig branches.

The defconfig branch was based on -rc2 rather than -rc1, which is mildly
annoying since it means we are backmerging commits from upstream, please
try to avoid that in the future, or describe why it was done if you
had a good reason.

Also I noticed that your defconfig changes enable things in the tegra
defconfig that are not part of multi_v7_defconfig. Could you create
another patch to enable everything you need in terms of Tegra hardware
support in multi_v7_defconfig as well, preferably as loadable modules?

Thanks!

	Arnd
