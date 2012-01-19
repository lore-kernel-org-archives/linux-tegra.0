From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH V1 2/2] regulator: tps65910: Initialize n_voltages for
 rails.
Date: Thu, 19 Jan 2012 17:53:20 +0530
Message-ID: <96C9D994977DD0439FB6D3FE3B13DD907DC3DCC2EC@BGMAIL01.nvidia.com>
References: <1326899836-14470-1-git-send-email-ldewangan@nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF1780DAAE10@HQMAIL01.nvidia.com>
 <20120118175613.GT8732@opensource.wolfsonmicro.com>
 <96C9D994977DD0439FB6D3FE3B13DD907DC3DCC1C3@BGMAIL01.nvidia.com>
 <20120119104029.GA3178@opensource.wolfsonmicro.com>
 <96C9D994977DD0439FB6D3FE3B13DD907DC3DCC2B6@BGMAIL01.nvidia.com>
 <20120119110154.GD3178@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120119110154.GD3178-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thursday 19 January 2012 04:31 PM, Mark Brown wrote:

> > The table_len is already used in some of entry i.e. for tps65910. I filled
> > entry for another device tps65911. So I would like to go for separate patch
> > for renaming the variables "table" to "voltage_table" and "table_len" to
> > "n_voltages".
> > Please let me know your opinion.
> 
> That's fine.  If in doubt and it doesn't introduce build breakage
> splitting up into more patches is rarely a problem.


Ok, So to avoid the mess-ups, I will fetch the code from your tree 
http://git.kernel.org/?p=linux/kernel/git/broonie/regulator.git;a=shortlog;h=refs/heads/for-next-next
once you apply this change and then push the variable name change in new patch.

Laxman
