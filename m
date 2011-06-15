From: Ben Dooks <ben-i2c-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: Assign unused slave address
Date: Wed, 15 Jun 2011 22:37:40 +0100
Message-ID: <20110615213740.GI15795@trinity.fluff.org>
References: <1307381119-26079-1-git-send-email-swarren@nvidia.com> <74CDBE0F657A3D45AFBB94109FB122FF04992C01A0@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04992C01A0-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bharat Nihalani <bnihalani-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jun 13, 2011 at 09:03:52AM -0700, Stephen Warren wrote:
> Stephen Warren wrote at Monday, June 06, 2011 11:25 AM:
> > On Tegra, we should always use the "new" I2C slave controller, to avoid
> > issues with the old controller. This was implemented in commit 65a1a0a
> > "i2c: tegra: Enable new slave mode."
> > 
> > There is currently no driver for the Tegra I2C slave controller upstream.
> > Additionally, the controller cannot be completely disabled. Instead, we
> > need to:
> > 
> > a) Set I2C_SL_CNFG_NACK to make the controller automatically NACK any
> > incoming transactions.
> > 
> > b) The controller's definition of NACK isn't identical to the I2C
> > protocol's definition. Specifically, it will perform a standard NACK, but
> > *also* continue to hold the clock line low in expectation of receiving
> > more data. This can hang the bus, or at least cause transaction timeouts,
> > if something starts a transaction that matches the controller's slave
> > address. Since the default address is 0x00, the general call address,
> > this does occur in practice.
> > 
> > To avoid this, we explicitly program a slave address that is reserved for
> > future expansion. For current boards, this guarantees the address will
> > never be used. If a future board ever needs to use this address, we can
> > add platform data to determine a board-specific safe address. 0xfc is
> > picked by this patch.
> 
> Ben,
> 
> Does this patch look OK? I'd categorize it as a bug-fix. Could it go into
> 3.0?

Ok, it looks small enough, will consider it for the next -rc
 
> Thanks.
> 
> > This patch is based on a change previously posted by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > http://www.spinics.net/lists/linux-i2c/msg05437.html
> > In turned based on internal changes by: Bharat Nihalani
> > <bnihalani-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > 
> > A semantically equivalent change has been contained in the various
> > ChromeOS kernels for a while.
> > 
> > I tested this change on top of 3.0-rc2 on Harmony, and interacted with
> > the WM8903 I2C-based audio codec.
> > 
> > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/i2c/busses/i2c-tegra.c |    8 +++++++-
> >  1 files changed, 7 insertions(+), 1 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-
> > tegra.c
> > index 4d93196..fb3b4f8 100644
> > --- a/drivers/i2c/busses/i2c-tegra.c
> > +++ b/drivers/i2c/busses/i2c-tegra.c
> > @@ -40,8 +40,10 @@
> >  #define I2C_CNFG_NEW_MASTER_FSM			(1<<11)
> >  #define I2C_STATUS				0x01C
> >  #define I2C_SL_CNFG				0x020
> > +#define I2C_SL_CNFG_NACK			(1<<1)
> >  #define I2C_SL_CNFG_NEWSL			(1<<2)
> >  #define I2C_SL_ADDR1				0x02c
> > +#define I2C_SL_ADDR2				0x030
> >  #define I2C_TX_FIFO				0x050
> >  #define I2C_RX_FIFO				0x054
> >  #define I2C_PACKET_TRANSFER_STATUS		0x058
> > @@ -337,7 +339,11 @@ static int tegra_i2c_init(struct tegra_i2c_dev
> > *i2c_dev)
> > 
> >  	if (!i2c_dev->is_dvc) {
> >  		u32 sl_cfg = i2c_readl(i2c_dev, I2C_SL_CNFG);
> > -		i2c_writel(i2c_dev, sl_cfg | I2C_SL_CNFG_NEWSL, I2C_SL_CNFG);
> > +		sl_cfg |= I2C_SL_CNFG_NACK | I2C_SL_CNFG_NEWSL;
> > +		i2c_writel(i2c_dev, sl_cfg, I2C_SL_CNFG);
> > +		i2c_writel(i2c_dev, 0xfc, I2C_SL_ADDR1);
> > +		i2c_writel(i2c_dev, 0x00, I2C_SL_ADDR2);
> > +
> >  	}
> > 
> >  	val = 7 << I2C_FIFO_CONTROL_TX_TRIG_SHIFT |
> > --
> > 1.7.0.4
> 
> -- 
> nvpublic
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-i2c" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Ben Dooks, ben-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, http://www.fluff.org/ben/

Large Hadron Colada: A large Pina Colada that makes the universe disappear.
