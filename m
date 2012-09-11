From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 09/16] ARM: tegra: move platform_data definitions
Date: Tue, 11 Sep 2012 17:05:37 +0000
Message-ID: <201209111705.37490.arnd@arndb.de>
References: <1347368350-31212-1-git-send-email-arnd@arndb.de> <1347368390-31252-9-git-send-email-arnd@arndb.de> <871ui8y3at.fsf@octavius.laptop.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <871ui8y3at.fsf-DGHOrqG7t0YzNDMTQreKSUB+6BGkLq7r@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Ball <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tuesday 11 September 2012, Chris Ball wrote:
> On Tue, Sep 11 2012, Arnd Bergmann wrote:
> > diff --git a/arch/arm/mach-tegra/include/mach/sdhci.h
> > b/include/linux/platform_data/mmc-sdhci-tegra.h
> > similarity index 100%
> > rename from arch/arm/mach-tegra/include/mach/sdhci.h
> > rename to include/linux/platform_data/mmc-sdhci-tegra.h
> 
> Looks like you aren't renaming the idempotency guards, so e.g.
> include/linux/platform_data/mmc-sdhci-tegra.h will contain:
> 
> #ifndef __ASM_ARM_ARCH_TEGRA_SDHCI_H
> #define __ASM_ARM_ARCH_TEGRA_SDHCI_H
> 
> Is that intentional?  Thanks,
> 

No, it's not intentional. We actually have a lot of instances that
are already wrong. Do we care enough to change the ones I'm moving here?

	Arnd
