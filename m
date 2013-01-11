From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 0/2] ARM: tegra: Add cpu node in device tree
Date: Fri, 11 Jan 2013 14:44:49 +0000
Message-ID: <20130111144449.GF30538@e102568-lin.cambridge.arm.com>
References: <1357909914-28994-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1357909914-28994-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jan 11, 2013 at 01:11:52PM +0000, Hiroshi Doyu wrote:
> Hi,
> 
> From the discussion(*1) of CPU core# detection, DT cpu node will be
> the only way to do it right. So we need to add cpu nodes on the
> existing Tegra SoCs(T20/T30) first in order to remove the existing A9
> SCU detection later, where DT cpu# detection fails, we would consider
> a single cpu core avalable.
> 
> Tested only with T30.
> 
> Hiroshi Doyu (2):
>   ARM: tegra20: Add cpu node
>   ARM: tegra30: Add cpu node
> 
>  arch/arm/boot/dts/tegra20.dtsi |   29 +++++++++++++++++++++++++++++
>  arch/arm/boot/dts/tegra30.dtsi |   29 +++++++++++++++++++++++++++++
>  2 files changed, 58 insertions(+)
> 
> *1:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2013-January/140209.html
Looks ok, but you should copy devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org for
any set DT related.

FWIW on the series:

Reviewed-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
