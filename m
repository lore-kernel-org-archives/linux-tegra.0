From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH V1 2/2] regulator: tps65910: Initialize n_voltages for
 rails.
Date: Wed, 18 Jan 2012 09:54:27 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF1780DAAE10@HQMAIL01.nvidia.com>
References: <1326899836-14470-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1326899836-14470-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Laxman Dewangan wrote at Wednesday, January 18, 2012 8:17 AM:
> Initializing the number of voltages supported by different
> rails of pmic device tps65911.
...
> diff --git a/drivers/regulator/tps65910-regulator.c b/drivers/regulator/tps65910-regulator.c
...
> @@ -188,56 +188,67 @@ static struct tps_info tps65911_regs[] = {
>  		.name = "VDD1",
>  		.min_uV = 600000,
>  		.max_uV = 4500000,
> +		.table_len = 73,
>  	},

Forgive me if these comments are bogus since I'm not familiar with
regulators much, but:

a) Don't you want to use ARRAY_SIZE() instead of hard-coding table_len's
value?

b) Don't you need to set .table to actually point at the table too? If not,
isn't tps65910_list_voltage() going to dereference a NULL pointer, since
it will dereference .table if .table_len is set?

-- 
nvpublic
