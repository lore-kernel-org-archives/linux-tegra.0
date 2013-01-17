From: Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 2/2] pinctrl: tegra114: add pinctrl driver for NVIDIA's
 Tegra114 SoC
Date: Thu, 17 Jan 2013 14:33:29 +0530
Message-ID: <50F7BE61.2030700@nvidia.com>
References: <1357630357-7309-1-git-send-email-ldewangan@nvidia.com> <1357630357-7309-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1357630357-7309-2-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 08 January 2013 01:02 PM, Laxman Dewangan wrote:
> From: Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This adds a driver for the Tegra114 pinmux, and required
> parameterization data for Tegra114.
> 
> The driver uses the common Tegra pincontrol driver utility
> functions to implement the majority of the driver.
> 
> This driver is not compatible with the earlier NVIDIA's SoCs,
> hence add new compatibile as "nvidia,tegra114-pinmux".
> 
> Originally written by Pritesh.
> ldewangan:
>         - cleanup the patches,
>         - remove non-require tables.
>         - Use module_platform_driver() for driver registartion.
> 
> Signed-off-by: Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes from V1:
> - Converted arch_init() to module_platform_driver().
> - added Stephen in reviewed-by.

The series,

Acked-by: Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
