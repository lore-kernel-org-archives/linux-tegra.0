From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] regulator: Rail is said to be enable only if this and
	supply rails are enabled.
Date: Thu, 5 Jan 2012 19:42:10 +0530
Message-ID: <96C9D994977DD0439FB6D3FE3B13DD907DBD3A9EA9@BGMAIL01.nvidia.com>
References: <1325570983-3700-1-git-send-email-ldewangan@nvidia.com>
 <20120103201624.GC2843@opensource.wolfsonmicro.com>
 <96C9D994977DD0439FB6D3FE3B13DD907DBD3A9C2E@BGMAIL01.nvidia.com>
 <20120105060646.GG11867@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120105060646.GG11867-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Laxman Dewangan <ldewangan.com-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> From: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:linux-tegra-
> owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org] On Behalf Of Mark Brown
> Sent: Thursday, January 05, 2012 11:37 AM


> > returns true but actually the rail is not enabled because supply rail was
> not enabled.
> > Although it is fixed in other patch but such checks help more.
> 
> You're not quite getting my point here - we should be treating this as
> an error and complaining about it when we notice it, your patch will
> silently mask the condition which seems likely to just cause the bug to
> manifest elsewhere.

Agree with you. Thanks for such details.

Thanks,
Laxman
