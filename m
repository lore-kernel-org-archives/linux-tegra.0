From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 09/16] ARM: tegra: move platform_data definitions
Date: Tue, 11 Sep 2012 09:35:45 -0600
Message-ID: <504F5A51.9000506@wwwdotorg.org>
References: <1347368350-31212-1-git-send-email-arnd@arndb.de> <1347368390-31252-1-git-send-email-arnd@arndb.de> <1347368390-31252-9-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1347368390-31252-9-git-send-email-arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Chris Ball <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 09/11/2012 06:59 AM, Arnd Bergmann wrote:
> Platform data for device drivers should be defined in
> include/linux/platform_data/*.h, not in the architecture
> and platform specific directories.
> 
> This moves such data out of the tegra include directories

I have already submitted patches for some of these:

>  .../linux/platform_data/asoc-tegra_wm8903.h                        |    0

03f6743 ASoC: tegra: move platform data header

This moves the file to include/sound/tegra_wm8903.h, which seems
consistent with other sound-related platform data.

>  .../mach/kbc.h => include/linux/platform_data/keyboard-tegra-kbc.h |    0

a85442a Input: tegra - move platform data header

This moves the file to include/linux/input/tegra_kbc.h, which seems
consistent with other input-related platform data.

>  .../mach/sdhci.h => include/linux/platform_data/mmc-sdhci-tegra.h  |    0

I have a not-yet-applied (but ack'd by Chris Ball) patch to move this to
include/linux/mmc/tegra_sdhci.h. I believe all the dependencies are
staged in the Tegra tree now, so I can apply it if you want. I'm fine
with you apply this patch though; just let me know. If you want to take
your patch, then this part:

Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
