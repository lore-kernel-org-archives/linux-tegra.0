From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL 9/10] arm64: tegra: Device tree changes for v4.10-rc1
Date: Fri, 18 Nov 2016 18:40:21 -0800
Message-ID: <20161119024021.GT2543@localhost>
References: <20161118161719.24153-1-thierry.reding@gmail.com>
 <20161118161719.24153-9-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161118161719.24153-9-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Nov 18, 2016 at 05:17:18PM +0100, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:
> 
>   Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.10-arm64-dt
> 
> for you to fetch changes up to cc13b4fa4ac780cec6c21b64a39ab2950e95e8f6:
> 
>   arm64: tegra: Add NVIDIA P2771 board support (2016-11-18 14:35:53 +0100)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> arm64: tegra: Device tree changes for v4.10-rc1
> 
> This adds initial support for Tegra186, the P3310 processor module as
> well as the P2771 development board. Not much is functional, but there
> is enough to boot to an initial ramdisk with debug serial output.
> 
> ----------------------------------------------------------------
> Dan Carpenter (1):
>       mailbox: tegra-hsp: Use after free in tegra_hsp_remove_doorbells()
> 
> Joseph Lo (6):
>       soc/tegra: Add Tegra186 support
>       dt-bindings: mailbox: Add Tegra HSP binding
>       dt-bindings: firmware: Add bindings for Tegra BPMP
>       arm64: tegra: Add Tegra186 support
>       arm64: tegra: Add NVIDIA P3310 processor module support
>       arm64: tegra: Add NVIDIA P2771 board support
> 
> Stephen Warren (2):
>       dt-bindings: Add power domains to Tegra BPMP firmware
>       dt-bindings: firmware: Allow child nodes inside the Tegra BPMP
> 
> Thierry Reding (12):
>       Merge branch 'for-4.10/soc' into for-4.10/mailbox
>       mailbox: Add Tegra HSP driver
>       Merge branch 'for-4.10/mailbox' into for-4.10/firmware
>       firmware: tegra: Add IVC library
>       firmware: tegra: Add BPMP support
>       Merge branch 'for-4.10/firmware' into for-4.10/arm64/dt
>       arm64: tegra: Add CPU nodes for Tegra186
>       arm64: tegra: Add serial ports on Tegra186
>       arm64: tegra: Add I2C controllers on Tegra186
>       arm64: tegra: Add SDHCI controllers on Tegra186
>       arm64: tegra: Add GPIO controllers on Tegra186
>       arm64: tegra: Enable PSCI on P3310

The drivers->dt dependency here is annoying. Any chance you can respin without
it?

We've been encouraging people to consider using numerical clock/gpio/reset
numbers on initial submission to avoid these dependencies on dt-bindings
includes, and then follow up with a move to the symbolic names between -rc1 and
-rc2. Mind doing the same here?


Thanks!


-Olof
