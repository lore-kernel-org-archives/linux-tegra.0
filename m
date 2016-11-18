From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] soc/tegra: Implement Tegra186 PMC support
Date: Fri, 18 Nov 2016 08:53:21 -0600
Message-ID: <20161118145321.nu6f4rpdqwunzhgd@rob-hp-laptop>
References: <20161117171636.20580-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161117171636.20580-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Nov 17, 2016 at 06:16:36PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The power management controller on Tegra186 has changed in backwards-
> incompatible ways with respect to earlier generations. This implements a
> new driver that supports inversion of the PMU interrupt as well as the
> "recovery", "bootloader" and "forced-recovery" reboot commands.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../bindings/arm/tegra/nvidia,tegra186-pmc.txt     |  34 +++++

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/soc/tegra/Makefile                         |   2 +-
>  drivers/soc/tegra/pmc-tegra186.c                   | 169 +++++++++++++++++++++
>  3 files changed, 204 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt
>  create mode 100644 drivers/soc/tegra/pmc-tegra186.c
