From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL 3/5] ARM: tegra: device tree updates
Date: Fri, 14 Jun 2013 18:11:00 -0700
Message-ID: <20130615011100.GQ18124@quad.lixom.net>
References: <1371227838-18764-1-git-send-email-swarren@wwwdotorg.org>
 <1371227838-18764-4-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1371227838-18764-4-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 14, 2013 at 10:37:16AM -0600, Stephen Warren wrote:
> This branch contains all device tree updates for Tegra boards.
> 
> The changes are:
> 
> * Converted all DT files to use the C pre-processor, to support the use
>   of named constants. This included use of defines for GPIO, IRQ, and
>   clock constants.
> * Enabling new features such as:
>   - SPI on Dalmore.
>   - Audio on Dalmore and Beaver.
>   - gpio-leds on Beaver.
>   - Power-supply/batter linkage on Dalmore.
> * A minor fix to the RAM size node on Beaver.
> 
> It is based on previous pull request tegra-for-3.11-deps-for-usb
> followed by a merge of tegra-for-3.11-deps-for-clk.
> 
> ----------------------------------------------------------------
> 
> The following changes since commit 220cf5fb5c9eeef49930ff6fca2943286ec075a4:
> 
>   Merge branch 'for-3.11/deps-for-clk' into for-3.11/dt
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git tegra-for-3.11-dt

Thanks, pulled. It was good to see the two previous broken out but I ended up
just pulling it all with this one.


-Olof
