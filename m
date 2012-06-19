From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: apbio access using dma for tegra20 only
Date: Tue, 19 Jun 2012 11:01:21 -0600
Message-ID: <4FE0B061.6070302@wwwdotorg.org>
References: <1340085974-9623-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1340085974-9623-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/19/2012 12:06 AM, Laxman Dewangan wrote:
> The Tegra20 HW issue with accessing APBIO registers (such
> as fuse registers) directly from the CPU concurrently with
> APB DMA accesses has been fixed in Tegra30 and later chips.
> 
> Access these registers directly from the CPU on Tegra30
> and later, and apply the workaround only for Tegra20.

> +void tegra_apb_io_init(void)
> +{
> +	/* Need to use dma only when it is Tegra20 based platform */
> +	if (of_machine_is_compatible("nvidia,tegra20")) {

That tests only works when the system is booted using device tree. Can
you change this to:

if (of_machine_is_compatible("nvidia,tegra20") ||
    !of_have_populated_dt()) {

... and make sure you get the expected result when booting using a board
file (e.g. Harmony). Thanks.

> +		apbio_read = tegra_apb_readl_using_dma;
> +		apbio_write = tegra_apb_writel_using_dma;
> +	} else {
> +		apbio_read = tegra_apb_readl_direct;
> +		apbio_write = tegra_apb_writel_direct;
> +	}
> +}
