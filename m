From: Hadar Gat <Hadar.Gat-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] of_device: removed #include that caused a
 recursion in included headers
Date: Tue, 21 Apr 2020 08:16:48 +0000
Message-ID: <DB6PR0802MB2533545239D9A51DC529F241E9D50@DB6PR0802MB2533.eurprd08.prod.outlook.com>
References: <1586784960-22692-1-git-send-email-hadar.gat@arm.com>
 <20200420203647.GA23189@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200420203647.GA23189@bogus>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, =?utf-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nd <nd-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Miquel Raynal <miquel.raynal-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, "netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-stm32-XDFAJ8BFU24N7RejjzZ/Li2xQDfSxrLKVpNB7YpNyf8@public.gmane.org" <linux-stm32-XDFAJ8BFU24N7RejjzZ/Li2xQDfSxrLKVpNB7YpNyf8@public.gmane.org>, Vignesh Raghavendra <vigneshr-l0cyMroinI0@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi@a>
List-Id: linux-tegra@vger.kernel.org


> -----Original Message-----
> From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Sent: Monday, 20 April 2020 23:37
> 
> On Mon, Apr 13, 2020 at 04:35:53PM +0300, Hadar Gat wrote:
> > Both of_platform.h and of_device.h were included each other.
> > In of_device.h, removed unneeded #include to of_platform.h and added
> > include to of_platform.h in the files that needs it.
> 
> Guess we forgot about that temporary comment!
> 
> Both of these headers have a lot of things we don't want 'normal'
> drivers calling. The most common thing needed from of_device.h is
> of_match_device/of_device_get_match_data. A good number are only for
> ibmebus. Maybe the header should be split or the former just moved to of.h.
> 
> For of_platform.h, it seems we have a bunch of unneeded includes:
> 
> $ git grep 'of_platform\.h' drivers/ | wc
>     560    1120   36049
> $ git grep -E 'of_(platform_(pop|def)|find_device)' drivers/ | wc
>     248    1215   20630
> 
> Would nice to drop those (or switch to of_device.h?) too.
> 
> Be sure to build on Sparc. It's the oddball.

Hi Rob and thanks for your inputs.
Unfortunately I cannot continue to work on this patch at the moment since it is not as small as I expected and I have limited resources for that.
So anyone can take it and continue from here.
Thanks,
Hadar

> > Signed-off-by: Hadar Gat <hadar.gat-5wv7dgnIgG8@public.gmane.org>
> > ---
> >  drivers/base/platform.c                           | 1 +
> >  drivers/bus/vexpress-config.c                     | 1 +
> >  drivers/dma/at_hdmac.c                            | 1 +
> >  drivers/dma/stm32-dmamux.c                        | 1 +
> >  drivers/dma/ti/dma-crossbar.c                     | 1 +
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c             | 1 +
> >  drivers/gpu/drm/msm/hdmi/hdmi.c                   | 1 +
> >  drivers/gpu/drm/msm/msm_drv.c                     | 1 +
> >  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 1 +
> >  drivers/gpu/drm/sun4i/sun4i_tcon.c                | 1 +
> >  drivers/iio/adc/stm32-adc-core.c                  | 1 +
> >  drivers/iio/adc/stm32-dfsdm-adc.c                 | 1 +
> >  drivers/iio/adc/stm32-dfsdm-core.c                | 1 +
> >  drivers/iommu/tegra-smmu.c                        | 1 +
> >  drivers/memory/atmel-ebi.c                        | 1 +
> >  drivers/mfd/palmas.c                              | 1 +
> >  drivers/mfd/ssbi.c                                | 1 +
> >  drivers/mtd/nand/raw/omap2.c                      | 1 +
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 1 +
> >  drivers/net/ethernet/ti/cpsw.c                    | 1 +
> >  drivers/phy/tegra/xusb.c                          | 1 +
> >  drivers/pinctrl/nomadik/pinctrl-nomadik.c         | 1 +
> >  drivers/soc/samsung/exynos-pmu.c                  | 1 +
> >  drivers/soc/sunxi/sunxi_sram.c                    | 1 +
> >  include/linux/of_device.h                         | 2 --
> >  lib/genalloc.c                                    | 1 +
> >  26 files changed, 25 insertions(+), 2 deletions(-)
