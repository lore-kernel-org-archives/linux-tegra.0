From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/2] debugfs entries for Tegra clocks
Date: Fri, 30 May 2014 16:12:26 +0300
Message-ID: <20140530131226.GR5961@tbergstrom-lnx.Nvidia.com>
References: <1401295868-18697-1-git-send-email-pdeschrijver@nvidia.com>
 <538773C0.30906@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <538773C0.30906-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, May 29, 2014 at 07:52:00PM +0200, Stephen Warren wrote:
> On 05/28/2014 10:51 AM, Peter De Schrijver wrote:
> > This patch set introduces the 'regs' debugfs entry which shows the
> > contents of all registers related to a clock.
> 
> Would it be better to create a regmap object for the entire clock module
> register space, and then get all the debugfs stuff for free?

Maybe. You wouldn't get the register names though.

Cheers,

Peter.
