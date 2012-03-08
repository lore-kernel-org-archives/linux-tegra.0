From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 09/11] ARM: tegra: Rewrite PCIe support as a driver
Date: Thu, 08 Mar 2012 13:09:04 -0700
Message-ID: <4F5911E0.6060802@wwwdotorg.org>
References: <1331218291-16119-1-git-send-email-thierry.reding@avionic-design.de> <1331218291-16119-10-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1331218291-16119-10-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/08/2012 07:51 AM, Thierry Reding wrote:
> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>

Patch description?

> diff --git a/arch/arm/mach-tegra/board-harmony-pcie.c b/arch/arm/mach-tegra/board-harmony-pcie.c
...
> -static int __init harmony_pcie_init(void)
> +static int tegra_pcie_init(struct platform_device *pdev)

That name should probably still be called harmony_something() since it's
still board-specific.

I wonder how having a per-board callback will integrate with device
tree. I guess I'll find out when I review patch 11:-)

> diff --git a/arch/arm/mach-tegra/board-trimslice.c b/arch/arm/mach-tegra/board-trimslice.c

> +static int __init trimslice_pci_init(void)
>  {
>  	if (!machine_is_trimslice())
>  		return 0;

You can remove that test now.

> diff --git a/arch/arm/mach-tegra/board.h b/arch/arm/mach-tegra/board.h

> +#define TEGRA_PCIE_MAX_PORTS 2
> +
> +struct tegra_pcie_pdata {
> +	int (*init)(struct platform_device *pdev);
> +	int (*exit)(struct platform_device *pdev);
> +	bool enable_ports[TEGRA_PCIE_MAX_PORTS];
> +};

That's a somewhat odd place to put the header; a dedicated
mach-tegra/include/mach/tegra_pcie_pdata.h or
include/linux/platform_data/tegra_pcie.h might make more sense.

Aside from those pretty minor issues, this all looks great. Thanks for
fixing our driver!
