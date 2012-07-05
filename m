From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM: tegra: enable wireless in defconfig
Date: Thu, 05 Jul 2012 22:35:23 +0200
Message-ID: <2114579.sqTp7XiW3H@ax5200p>
References: <1341394488-13169-1-git-send-email-wni@nvidia.com> <1341394488-13169-6-git-send-email-wni@nvidia.com> <4FF5F20F.2050005@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FF5F20F.2050005-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thursday 05 July 2012 13:59:11 Stephen Warren wrote:
> On 07/04/2012 03:34 AM, Wei Ni wrote:
> > New options enabled:
> > * WIRELESS: (dependency)
> > * CFG80211: (dependency)
> > * WLAN: (dependency)
> > * BRCMFMAC: wlan driver, enable as module.
> > 
> > diff --git a/arch/arm/configs/tegra_defconfig
> > b/arch/arm/configs/tegra_defconfig
> > 
> > +CONFIG_BRCMFMAC=m
> 
> Why does this need to be a module? Everything else in tegra_defconfig is
> built-in, and it'd be nice to be consistent here. Built-in makes
> net-booting new kernels from U-Boot much easier, since there aren't any
> modules to copy.

network drivers (especially wifi) are often modules because they need firmwares. 
I'm not sure if the kernel can compile them in every case. Our RT2x00 is an 
example (which also needs a defconfig entry btw) but brcmfmac also needs it as 
modinfo shows. Beside that, I don't think you want to netboot using wifi and u-
boot because this needs a huge wireless framework which u-boot doesn't have.

Marc

> When I built a kernel with this series, I observed the following:
> 
> CONFIG_BRCMFMAC=m
> 
> * Neither Cardhu nor Ventana auto-load the module. When the module is
> manually modprobe'd, I still see no wireless device being created.
> 
> CONFIG_BRCMFMAC=y
> 
> * Cardhu: No wireless device created. I do see some kernel spew such as
> "mmc1: queuing unknown CIS tuple 0x80" which I believe is the SDIO
> device being probed, but I don't see any Linux device being created.
> 
> * Ventana: There's a 60s hang during boot, I believe related to the BRCM
> driver, since the hang doesn't occur without the series.
> 
> In summary, this series doesn't work at all for me. Can you please
> explain what you tested and how? Are there any differences between the
> various Cardhu and Ventana board revisions and/or the 2 different
> wireless cards possible on Cardhu that'd explain this?
> 
> Thanks.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
