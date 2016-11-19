From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL 1/10] mailbox: Add Tegra HSP driver
Date: Fri, 18 Nov 2016 18:27:42 -0800
Message-ID: <20161119022742.GK2543@localhost>
References: <20161118161719.24153-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161118161719.24153-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Fri, Nov 18, 2016 at 05:17:10PM +0100, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:
> 
>   Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.10-mailbox
> 
> for you to fetch changes up to 68050eb6c611527232fe5574c7306e97e47499ef:
> 
>   mailbox: tegra-hsp: Use after free in tegra_hsp_remove_doorbells() (2016-11-18 14:32:13 +0100)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> mailbox: Add Tegra HSP driver
> 
> This contains the device tree bindings and a driver for the Tegra HSP, a
> hardware block that provides hardware synchronization primitives and is
> the foundation for inter-processor communication between CPU and BPMP.
> 
> ----------------------------------------------------------------
> Dan Carpenter (1):
>       mailbox: tegra-hsp: Use after free in tegra_hsp_remove_doorbells()
> 
> Joseph Lo (2):
>       soc/tegra: Add Tegra186 support

I don't think you really needed to merge this in here, since all you need it
for is to fulfill the kconfig dependency and enable the driver, right? That'd
happen when the driver and soc branch is merged at the toplevel anyway.


Anyhow, no damage done, I've merged this in. I would say that it'd be a little
more logical to send the SoC branch before the driver branch given this
dependency though.


-Olof
