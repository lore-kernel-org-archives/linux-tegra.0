From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] i2c: tegra: add I2C_FUNC_SMBUS_EMUL to adapter
 functionality
Date: Tue, 3 May 2011 12:57:18 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF0497F1B42C@HQMAIL01.nvidia.com>
References: <1302691521-19096-1-git-send-email-mike@compulab.co.il>
 <4DBFBEAD.2080103@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4DBFBEAD.2080103-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Cc: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Mike Rapoport wrote at Tuesday, May 03, 2011 2:37 AM:
> Hi Ben,
> Any comments on this?

Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

 (on TrimSlice, I tested the audio driver, and validated that this patch
Was necessary and worked correctly)

> On 04/13/11 13:45, Mike Rapoport wrote:
> > as there are a lot of i2c device drivers that require it.
> >
> > Signed-off-by: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
> > ---
> >  drivers/i2c/busses/i2c-tegra.c |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> > index b4ab39b..7e68f2c 100644
> > --- a/drivers/i2c/busses/i2c-tegra.c
> > +++ b/drivers/i2c/busses/i2c-tegra.c
> > @@ -495,7 +495,7 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
> >
> >  static u32 tegra_i2c_func(struct i2c_adapter *adap)
> >  {
> > -	return I2C_FUNC_I2C;
> > +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> >  }
> >
> >  static const struct i2c_algorithm tegra_i2c_algo = {

-- 
nvpublic
