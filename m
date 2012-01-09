From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH V1] TPS62360: Add tps62360 regulator driver
Date: Mon, 9 Jan 2012 14:17:17 +0530
Message-ID: <96C9D994977DD0439FB6D3FE3B13DD907DBDABA9D6@BGMAIL01.nvidia.com>
References: <20120105062919.GI11867@opensource.wolfsonmicro.com>
 <96C9D994977DD0439FB6D3FE3B13DD907DBD3A9E9B@BGMAIL01.nvidia.com>
 <20120106185755.GC2893@opensource.wolfsonmicro.com>
 <96C9D994977DD0439FB6D3FE3B13DD907DBD3AA0DE@BGMAIL01.nvidia.com>
 <20120107191047.GA3590@opensource.wolfsonmicro.com>
 <96C9D994977DD0439FB6D3FE3B13DD907DBD3AA0E4@BGMAIL01.nvidia.com>
 <20120108165819.GB29065@opensource.wolfsonmicro.com>
 <96C9D994977DD0439FB6D3FE3B13DD907DBDABA9A3@BGMAIL01.nvidia.com>
 <20120109071128.GA22134@opensource.wolfsonmicro.com>
 <96C9D994977DD0439FB6D3FE3B13DD907DBDABA9B6@BGMAIL01.nvidia.com>
 <20120109073859.GG22134@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120109073859.GG22134-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Laxman Dewangan <ldewangan.com-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



> On Monday, January 09, 2012 1:09 PM, Mark Brown wrote
> 
> > If I fix the voltage with each VSEL then only 4 voltages will be
> > possible but I want to have more than 4 different output.
> > How do I achieve this?
> 
> The driver can decide what voltages to set - like I said in a previous
> mail it could use something like LRU to decide which slot to use, or
> perhaps be clever with the upper end of the range it was given.

So we will change the gpios output also according to voltage register
slot from driver?

> 
> > > What I'd expect to see is nothing but the GPIOs and their default state
> > > (since sadly we can't read back from output GPIOs with gpiolib) being
> > > specified.
> 
> > I did not understand it correctly. Can you please elaborate how can we
> > pass the voltage with corresponding vsel?
> 
> For bootstrapping you can just read the values back.

So through platform data, I will pass the gpio nr for VSEL0, VSEL1 and
their default state. 
If these lines tied up with the  fixed logic, high or low then value
will be -1 and driver will not request for any gpios apis.
Default state will be the corresponding logic for this situation
which will be passed from platform data and driver will be use
corresponding slots for voltage configuration register always.

If valid gpios will be passed then driver will use the LRU mechanism
for getting desired configuration register for configuring the desired
voltage (passed through the regulator_setvoltage())and set the gpios
accordingly through gpio libs.
In this approach, because we need to set two different gpios for
desired logic, the output will not go in proper transition from
current to new one, for some time when we completed setting of
one gpio and setting second gpio.



> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
