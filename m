From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL 4/4] arm64: tegra: Device tree changes for v4.12-rc1
Date: Wed, 19 Apr 2017 06:19:05 -0700
Message-ID: <20170419131905.GD29219@localhost>
References: <20170406231020.32048-1-thierry.reding@gmail.com>
 <20170406231020.32048-4-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170406231020.32048-4-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 07, 2017 at 01:10:20AM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:
> 
>   Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.12-arm64-dt
> 
> for you to fetch changes up to 18236a14883b718ce973e4c090db6ecb49b38287:
> 
>   arm64: tegra: Update the Tegra132 flowctrl compatible string (2017-04-04 17:15:05 +0200)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> arm64: tegra: Device tree changes for v4.12-rc1
> 
> This adds a bunch of features for Tegra186, such as PMC, ethernet, I2C,
> SDHCI and GPIO. It also enables various features on the P2771 devkit.
> 
> A small fix is made to the compatible string list for the flow
> controller on Tegra132 and the IOMMU is enabled for host1x on Tegra210.

Nice, merged. Any chance we'll see Jetson TX2 support for 4.13?


Thanks,

-Olof
