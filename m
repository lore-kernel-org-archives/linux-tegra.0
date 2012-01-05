From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: RE: [PATCH V1] TPS62360: Add tps62360 regulator driver
Date: Thu, 5 Jan 2012 19:18:25 +0530
Message-ID: <96C9D994977DD0439FB6D3FE3B13DD907DBD3A9E9B@BGMAIL01.nvidia.com>
References: <1325668818-1096-1-git-send-email-ldewangan@nvidia.com>
 <20120105062919.GI11867@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120105062919.GI11867@opensource.wolfsonmicro.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>, Laxman Dewangan <ldewangan.com@nvidia.com>
Cc: "lrg@slimlogic.co.uk" <lrg@slimlogic.co.uk>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


> From: Mark Brown [mailto:broonie@opensource.wolfsonmicro.com]
> Sent: Thursday, January 05, 2012 11:59 AM

Thanks for feedback. I have taken care of all your feedback and send
the patch V2.

> > +	/* Configure the output discharge path */
> > +	st = tps62360_reg_modify_bits(tps, REG_RAMPCTRL, BIT(2), BIT(2));
> > +	if (st < 0)
> > +		dev_err(tps->dev, "%s() fails in updating reg %d\n",
> > +			__func__, REG_RAMPCTRL);
> > +}
> 
> I rather suspect that if this is worth doing it's also worth doing over
> suspend...

The discharge path should be only enabled when the output voltage will go to 0.
If it stay in non-zero voltage and enabling discharge path  will consume more power.
In suspend, it is not necessarily that voltage output will be 0 and hence it should not
be enabled. In shutdown all power goes off from pmu and hence it is worth to enable
discharge path for quick fall of output voltage.

> 
> > + * @vsel: Select the voltage id register.
> 
> What's this?
There is 4 sets of voltage configuration register for voltage output. The power
on reset values for this registers are different and selection of the voltage
configuration register is done by 2 pins of the pmu chip which is board dependent.
Based on board connection, it need to be program the desired voltage configuration
Register to achieve the desired output.
