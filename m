From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] [cbootimage-configs] Add support for norrin board
Date: Wed, 2 Jul 2014 10:58:07 -0700
Message-ID: <20140702175807.GA30613@nvidia.com>
References: <1404160939-10555-1-git-send-email-amartin@nvidia.com>
 <53B1D5D1.9060606@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53B1D5D1.9060606-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jun 30, 2014 at 02:25:37PM -0700, Stephen Warren wrote:
> On 06/30/2014 02:42 PM, Allen Martin wrote:
> > Norrin (PM370) is an NVIDIA Tegra124 Chromebook reference platform.
> > It is also called "nyan" in the ChromeOS tree.
> 
> I thought only some versions/revisions of Nyan were actually Norrin?
> Isn't nyan-rev0 Venice2, but nyan-rev1 Norrin?

Yes, although nyan-rev0 is pretty much orphaned at this point in the
ChromeOS trees, so any place you see "nyan" without the -rev specifier
you can assume Tegra124 Norrin FFD.

> 
> When we have Norrins with Tegra132 (which I thought was actually the
> more common version, but perhaps not), what is the plan for naming them;
> perhaps norrin-t132?

In the ChromeOS tree Tegra132 Norrin is called "rush", internally
we've been calling them norrin-t132 (or t132-norrin, , or norrin64, or
just "norrin" to make it confusing and you figure it out by context :)

-Allen

nvpublic
