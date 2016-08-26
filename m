From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Correct polarity for Tegra114 PMIC interrupt
Date: Thu, 25 Aug 2016 17:31:44 -0700
Message-ID: <20160826003144.GD8515@localhost>
References: <20160824131438.4437-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160824131438.4437-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Aug 24, 2016 at 03:14:38PM +0200, Thierry Reding wrote:
> From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The ARM GIC only supports interrupts with either level-high or
> rising-edge types for SPIs. The interrupt type for the Palmas PMIC used
> for Tegra114 boards is specified as level-low which is invalid for the
> GIC. This has gone undetected because until recently, failures to set
> the interrupt type when the interrupts are mapped via firmware (such as
> device-tree) have not been reported. Since commits 4b357daed698
> ("genirq: Look-up trigger type if not specified by caller") and
> 1e2a7d78499e ("irqdomain: Don't set type when mapping an IRQ"), failure
> to set the interrupt type will cause the requesting of the interrupt to
> fail and exposing incorrectly configured interrupts.
> 
> Please note that although the interrupt type was never being set for the
> Palmas PMIC, it was still working fine, because the default type setting
> for the interrupt, 'level-high', happen to match the correct type for
> the interrupt.
> 
> Finally, it should be noted that the Palmas interrupt from the PMIC is
> actually 'level-low', however, this interrupt signal is inverted by the
> Tegra PMC and so the GIC actually sees a 'level-high' interrupt which is
> what should be specified in the device-tree interrupt specifier.
> 
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Hi ARM-SoC maintainers,
> 
> this is a fix required for v4.8, or else the PMIC won't work on various
> Tegra114 boards.

Applied to fixes.


Thanks,


-Olof
