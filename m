From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: convert to multi-platform
Date: Sat, 30 Mar 2013 14:16:45 +0000
Message-ID: <201303301416.45525.arnd@arndb.de>
References: <1364602790-10759-1-git-send-email-swarren@wwwdotorg.org> <1364602790-10759-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364602790-10759-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Saturday 30 March 2013, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This allows Tegra be included in a kernel build that supports multiple
> SoCs at once, which is useful for distro kernels.
> 
> This change:
> * Moves Tegra's Kconfig into its own directory, as seems typical for
>   multi-platform conversions.
> * Stops selecting some ARM errata that are incompatible with multi-
>   platform. This requires that you use a bootloader that enables the
>   workaround!
> * Deletes some headers and Makefile.boot that aren't needed now that we
>   support multi-platform.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Ok, very nice.

I already commented on patch 1 of the series, which I hope we can
replace with something better.

Another comment is that the EHCI driver is broken for Tegra if enabled
in combination with one of a few other platforms. Manjunath has an
experimental patch for this, but there are still problems with that
patch. I'll forward a private copy of the last version we had, and
you can try to get it working from there.

	Arnd
