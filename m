From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: RE: [PATCH V1] TPS62360: Add tps62360 regulator driver
Date: Mon, 9 Jan 2012 14:49:36 +0530
Message-ID: <96C9D994977DD0439FB6D3FE3B13DD907DBDABA9E2@BGMAIL01.nvidia.com>
References: <20120106185755.GC2893@opensource.wolfsonmicro.com>
 <96C9D994977DD0439FB6D3FE3B13DD907DBD3AA0DE@BGMAIL01.nvidia.com>
 <20120107191047.GA3590@opensource.wolfsonmicro.com>
 <96C9D994977DD0439FB6D3FE3B13DD907DBD3AA0E4@BGMAIL01.nvidia.com>
 <20120108165819.GB29065@opensource.wolfsonmicro.com>
 <96C9D994977DD0439FB6D3FE3B13DD907DBDABA9A3@BGMAIL01.nvidia.com>
 <20120109071128.GA22134@opensource.wolfsonmicro.com>
 <96C9D994977DD0439FB6D3FE3B13DD907DBDABA9B6@BGMAIL01.nvidia.com>
 <20120109073859.GG22134@opensource.wolfsonmicro.com>
 <96C9D994977DD0439FB6D3FE3B13DD907DBDABA9D6@BGMAIL01.nvidia.com>
 <20120109084845.GA15277@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120109084845.GA15277@opensource.wolfsonmicro.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Laxman Dewangan <ldewangan.com@nvidia.com>, "lrg@slimlogic.co.uk" <lrg@slimlogic.co.uk>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


> On Monday, January 09, 2012 2:19 PM, Mark Brown wrote
> > > On Monday, January 09, 2012 1:09 PM, Mark Brown wrote

> > If valid gpios will be passed then driver will use the LRU mechanism
> > for getting desired configuration register for configuring the desired
> > voltage (passed through the regulator_setvoltage())and set the gpios
> > accordingly through gpio libs.
> > In this approach, because we need to set two different gpios for
> > desired logic, the output will not go in proper transition from
> > current to new one, for some time when we completed setting of
> > one gpio and setting second gpio.
> 
> Isn't that an issue anyway?
If device is designed like this then I think this will not be an issue.

I am happy that I understand the design and in sync with you.
I will send the patch with having this change.
Thanks you very much for clearing and helping me on understanding
and design.
