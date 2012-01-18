From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH V1 2/2] regulator: tps65910: Initialize n_voltages for
 rails.
Date: Wed, 18 Jan 2012 17:56:14 +0000
Message-ID: <20120118175613.GT8732@opensource.wolfsonmicro.com>
References: <1326899836-14470-1-git-send-email-ldewangan@nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF1780DAAE10@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF1780DAAE10-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 18, 2012 at 09:54:27AM -0800, Stephen Warren wrote:
> Laxman Dewangan wrote at Wednesday, January 18, 2012 8:17 AM:

> > +		.table_len = 73,
> >  	},

> Forgive me if these comments are bogus since I'm not familiar with
> regulators much, but:

> a) Don't you want to use ARRAY_SIZE() instead of hard-coding table_len's
> value?

> b) Don't you need to set .table to actually point at the table too? If not,
> isn't tps65910_list_voltage() going to dereference a NULL pointer, since
> it will dereference .table if .table_len is set?

It's not actually a table at all any more as the driver calculates the
values, table_len is misnamed and should be renamed as well as set.
