From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH V1 2/2] regulator: tps65910: Initialize n_voltages for
 rails.
Date: Thu, 19 Jan 2012 08:54:19 +0530
Message-ID: <96C9D994977DD0439FB6D3FE3B13DD907DC3DCC1C3@BGMAIL01.nvidia.com>
References: <1326899836-14470-1-git-send-email-ldewangan@nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF1780DAAE10@HQMAIL01.nvidia.com>
 <20120118175613.GT8732@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120118175613.GT8732-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> On Wednesday, January 18, 2012 11:26 PM, Mark Brown wrote:
> 
> > > +		.table_len = 73,
> > >  	},
> 
> > Forgive me if these comments are bogus since I'm not familiar with
> > regulators much, but:
> 
> > a) Don't you want to use ARRAY_SIZE() instead of hard-coding table_len's
> > value?
> 
> > b) Don't you need to set .table to actually point at the table too? If not,
> > isn't tps65910_list_voltage() going to dereference a NULL pointer, since
> > it will dereference .table if .table_len is set?
> 
> It's not actually a table at all any more as the driver calculates the
> values, table_len is misnamed and should be renamed as well as set.


Do you want to rename the variable in this patch or in separate patch?
In place of table_len, I will say n_voltages as this is most common name
in regulator world.


> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
