From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pinctrl: tegra: add suspend/resume support
Date: Fri, 02 Nov 2012 00:08:05 +0400
Message-ID: <5092D6A5.5010401@gmail.com>
References: <1351785186-11431-1-git-send-email-digetx@gmail.com> <5092B007.7050609@wwwdotorg.org>
Reply-To: 5092B007.7050609-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5092B007.7050609-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01.11.2012 21:23, Stephen Warren wrote:
> I'm curious how; in what environment. As far as I know, the Tegra
> support in the mainline kernel doesn't actually support suspend/resume.
> I assume you cherry-picked this pinctrl driver into some other kernel,
> and tested this patch there?

I added support for suspend/resume since 3.5-rc1, when actually started
updating kernel to mainline. The only differences from mainline 3.7 kernel now
are: custom clk framework from downstream's kernel with some modifications,
dvfs support, video, wifi and other specific drivers for my tablet. I will
continue posting patches in order to support suspending in mainline kernel.
Also will try to implement dvfs with common clk framework... have some thoughts
how better realise it.

> The one major different between this patch and the downstream patch I
> reviewed is how suspend/resume is triggered. This uses suspend_noirq,
> whereas the downstream patch registers the callbacks using
> register_syscore_ops(). Apparently the latter is required (at least in
> our downstream kernel) in order to ensure that pinctrl gets suspended
> after all other drivers.
> 
> I Cc'd Pritesh to comment on this.
> 
> Still, perhaps device probe ordering should ensure this upstream so
> using register_syscore_ops() might not be necessary, although that
> relies on drivers probing in the correct order, which they may not
> without explicitly pinctrl_get() calls... back to that same problem again!

I know about that difference. My first realisation used syscore_ops, but then
I thought that possibly may be more than one pinctrl device that uses tegra
driver and decided to use _noirq pm ops. From your msg I assume that we can
have only one device and besides current realisation needs some changes to
support more than one device. So should I send V2 or my patch will be useless
because Pritesh already realised it?
