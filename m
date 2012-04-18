From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/4] regulator: tps65910: update type for regmap
Date: Wed, 18 Apr 2012 13:19:31 -0700
Message-ID: <1334780371.32315.66.camel@rklein-linux>
References: <1334710829-22777-1-git-send-email-rklein@nvidia.com>
	 <1334710829-22777-2-git-send-email-rklein@nvidia.com>
	 <20120418092547.GE3021@opensource.wolfsonmicro.com>
	 <1334779402.32315.63.camel@rklein-linux>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1334779402.32315.63.camel@rklein-linux>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 2012-04-18 at 13:03 -0700, Rhyland Klein wrote:
> On Wed, 2012-04-18 at 02:25 -0700, Mark Brown wrote:
> > * PGP Signed by an unknown key
> > 
> > On Tue, Apr 17, 2012 at 06:00:26PM -0700, Rhyland Klein wrote:
> > > When accessing the regmap via the read/write functions, we need to use a
> > > unsigned int * instead of a u8 * otherwise corruption will occur.
> > > 
> > > Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > 
> > >  static inline int tps65910_read(struct tps65910_reg *pmic, u8 reg)
> > >  {
> > > -	u8 val;
> > > +	unsigned int val;
> > >  	int err;
> > >  
> > >  	err = pmic->mfd->read(pmic->mfd, reg, 1, &val);
> > 
> > Ugh, this interface is just broken all round - there's absolutely no
> > type safety here and all users of these functions will be broken (a
> > similar issue applies on write).  It's much better to fix this for 3.4
> > by converting the core code to use regmap_raw_ functions which take
> > native formatted data for the device like the function driver API
> > actually expects.
> 
> Which interface are you saying is broken? The regmap interface or the
> one internal to the tps65910 code? 
> 
> > 
> > Looking at the MFD code the fix for 3.5 should at the very least involve
> > making the functions take typed pointers, though given the way they're
> > implemented right now with direct references in the subdevices I'd also
> > consider just having the subdevices uses regmap directly as the wrappers
> > are just adding an opportunity for error (the bit operations could be
> > converted into static inlines in the header too).
> > 
> 
> So to be clear... Your recommendation is to change the tps65910 code to
> remove the common read/write callbacks and to use regmap directly in
> each component, and then when using regmap, do use the regmap raw
> functions instead of the bulkread/write?

Looking at the code, I would think it makes more sense use regmap_read
which enforces types since the tps65910 code only ever seems to use
regmap to access a single register at a time. Do you agree?

-rhyland
--- 
nvpublic
