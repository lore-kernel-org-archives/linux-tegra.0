From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: fix PCIe resource calculation
Date: Thu, 26 Jul 2012 07:57:51 -0500
Message-ID: <50113ECF.10209@gmail.com>
References: <1343239358-3239-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1343239358-3239-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/25/2012 01:02 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Commit 0acc43c "ARM: tegra: use fixed PCI i/o mapping" re-numbered the
> resource array entries that the driver used, but missed one location. This
> causes request_resource() to fail, and the driver to panic.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Rob, I'm not sure if you can squash this into your PCIE commit, or if
> we need to apply it on top?

I'm rebasing the branch and will incorporate it. Thanks for testing.

Rob

> 
>  arch/arm/mach-tegra/pcie.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-tegra/pcie.c b/arch/arm/mach-tegra/pcie.c
> index 576347a..3463fb5 100644
> --- a/arch/arm/mach-tegra/pcie.c
> +++ b/arch/arm/mach-tegra/pcie.c
> @@ -406,7 +406,7 @@ static int tegra_pcie_setup(int nr, struct pci_sys_data *sys)
>  	pp->res[1].name = pp->prefetch_space_name;
>  	if (pp->index == 0) {
>  		pp->res[1].start = PREFETCH_MEM_BASE_0;
> -		pp->res[1].end = pp->res[2].start + PREFETCH_MEM_SIZE_0 - 1;
> +		pp->res[1].end = pp->res[1].start + PREFETCH_MEM_SIZE_0 - 1;
>  	} else {
>  		pp->res[1].start = PREFETCH_MEM_BASE_1;
>  		pp->res[1].end = pp->res[1].start + PREFETCH_MEM_SIZE_1 - 1;
> 
