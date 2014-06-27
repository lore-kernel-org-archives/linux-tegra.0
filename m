From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH RESEND] clk: flatten clk tree in debugfs
Date: Fri, 27 Jun 2014 10:31:40 +0300
Message-ID: <20140627073140.GK3679@tbergstrom-lnx.Nvidia.com>
References: <1401462237-14954-1-git-send-email-pdeschrijver@nvidia.com>
 <20140613080239.GO5961@tbergstrom-lnx.Nvidia.com>
 <20140626163906.GI3679@tbergstrom-lnx.Nvidia.com>
 <20140626213645.32686.26036@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140626213645.32686.26036@quantum>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jun 26, 2014 at 11:36:45PM +0200, Mike Turquette wrote:
> Quoting Peter De Schrijver (2014-06-26 09:39:06)
> > On Fri, Jun 13, 2014 at 10:02:39AM +0200, Peter De Schrijver wrote:
> > > On Fri, May 30, 2014 at 05:03:57PM +0200, Peter De Schrijver wrote:
> > > > This patch flattens the clk tree in CCF debugfs. Instead of representing the
> > > > clocks and their hierarchy as a directory structure under
> > > > /sys/kernel/debug/clk, each clock gets a single directory directly under
> > > > /sys/kernel/debug/clk. The orphans directory is replaced by a file called
> > > > clk_orphan_summary.
> > > 
> > > Mike,
> > > 
> > > Any problems with this? What needs to be done to make this patch go forward?
> 
> Applied to clk-next.
> 

Thanks!

Peter.
