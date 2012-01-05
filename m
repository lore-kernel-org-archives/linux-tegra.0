From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH] regulator: Rail is said to be enable only if this and
	supply rails are enabled.
Date: Thu, 5 Jan 2012 06:06:46 +0000
Message-ID: <20120105060646.GG11867@opensource.wolfsonmicro.com>
References: <1325570983-3700-1-git-send-email-ldewangan@nvidia.com> <20120103201624.GC2843@opensource.wolfsonmicro.com> <96C9D994977DD0439FB6D3FE3B13DD907DBD3A9C2E@BGMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <96C9D994977DD0439FB6D3FE3B13DD907DBD3A9C2E-kdsAE/FnitNDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan.com-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 04, 2012 at 11:49:14AM +0530, Laxman Dewangan wrote:

> > This feels wrong - the code in general assumes that the parents will all
> > be enabled for an enabled child (and does the required stuff on enable
> > and disable).  Doing the check isn't unreasonable but if it fails we
> > really ought to be complaining loudly as we're probably confused and
> > things might be going wrong elsewhere.

> returns true but actually the rail is not enabled because supply rail was not enabled.
> Although it is fixed in other patch but such checks help more.

You're not quite getting my point here - we should be treating this as
an error and complaining about it when we notice it, your patch will
silently mask the condition which seems likely to just cause the bug to
manifest elsewhere.
