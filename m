From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH V1] regulator: Enable supply regulator if child rail is
 enabled.
Date: Mon, 2 Jan 2012 13:24:03 +0000
Message-ID: <20120102132403.GM4300@opensource.wolfsonmicro.com>
References: <1325489925-5148-1-git-send-email-ldewangan@nvidia.com>
 <20120102113623.GC2899@opensource.wolfsonmicro.com>
 <96C9D994977DD0439FB6D3FE3B13DD907DBD3A9A78@BGMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <96C9D994977DD0439FB6D3FE3B13DD907DBD3A9A78-kdsAE/FnitNDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jan 02, 2012 at 05:37:04PM +0530, Laxman Dewangan wrote:

> > Why is this not in the changelog?

> I think this is in just different wording for explaining the change.

If something like this is worth saying it should be in the changelog so
that anyone finding the patch in git can see it too - in general stuff
after the --- should be things like differences from previous versions
of the patch or information about dependencies that need to be taken
care of when applying that don't matter once the patch is applied.
