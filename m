From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH V1 2/2] regulator: tps65910: Initialize n_voltages for
 rails.
Date: Thu, 19 Jan 2012 11:01:55 +0000
Message-ID: <20120119110154.GD3178@opensource.wolfsonmicro.com>
References: <1326899836-14470-1-git-send-email-ldewangan@nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF1780DAAE10@HQMAIL01.nvidia.com>
 <20120118175613.GT8732@opensource.wolfsonmicro.com>
 <96C9D994977DD0439FB6D3FE3B13DD907DC3DCC1C3@BGMAIL01.nvidia.com>
 <20120119104029.GA3178@opensource.wolfsonmicro.com>
 <96C9D994977DD0439FB6D3FE3B13DD907DC3DCC2B6@BGMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <96C9D994977DD0439FB6D3FE3B13DD907DC3DCC2B6-kdsAE/FnitNDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 19, 2012 at 04:25:17PM +0530, Laxman Dewangan wrote:
> On Thursday 19 January 2012 04:10 PM, Mark Brown wrote:

> The table_len is already used in some of entry i.e. for tps65910. I filled
> entry for another device tps65911. So I would like to go for separate patch
> for renaming the variables "table" to "voltage_table" and "table_len" to
> "n_voltages".
> Please let me know your opinion.

That's fine.  If in doubt and it doesn't introduce build breakage
splitting up into more patches is rarely a problem.
