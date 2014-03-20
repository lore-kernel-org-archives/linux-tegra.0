From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL 4/5] ARM: tegra: device tree changes for 3.15
Date: Thu, 20 Mar 2014 14:41:13 -0700
Message-ID: <20140320214113.GD6649@quad.lixom.net>
References: <1394224088-28910-1-git-send-email-swarren@wwwdotorg.org>
 <1394224088-28910-4-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1394224088-28910-4-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Mar 07, 2014 at 01:28:07PM -0700, Stephen Warren wrote:
> This enables:
> * host1x and eDP support on Tegra124.
> * LCD panel support for a few Tegra20 devices and Venice2.
> * Enables power down, SPI flash, and USB on Venice2.
> * Documents which Dalmore revision is supported.
> * Adds an I2C bus mux to Cardhu.
> 
> Additionally, Tegra124 is converted to use #address-cells=<2> since the
> HW suports more than 32-bits of address space, and various cleanups are
> included.
> 
> ----------------------------------------------------------------
> 
> The following changes since commit 38dbfb59d1175ef458d006556061adeaa8751b72:
> 
>   Linus 3.14-rc1
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tegra-for-3.15-dt

Merged, thanks!


-Olof
