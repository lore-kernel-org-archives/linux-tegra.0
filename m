From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RESEND] clk: flatten clk tree in debugfs
Date: Thu, 26 Jun 2014 14:36:45 -0700
Message-ID: <20140626213645.32686.26036@quantum>
References: <1401462237-14954-1-git-send-email-pdeschrijver@nvidia.com>
 <20140613080239.GO5961@tbergstrom-lnx.Nvidia.com>
 <20140626163906.GI3679@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140626163906.GI3679-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Quoting Peter De Schrijver (2014-06-26 09:39:06)
> On Fri, Jun 13, 2014 at 10:02:39AM +0200, Peter De Schrijver wrote:
> > On Fri, May 30, 2014 at 05:03:57PM +0200, Peter De Schrijver wrote:
> > > This patch flattens the clk tree in CCF debugfs. Instead of representing the
> > > clocks and their hierarchy as a directory structure under
> > > /sys/kernel/debug/clk, each clock gets a single directory directly under
> > > /sys/kernel/debug/clk. The orphans directory is replaced by a file called
> > > clk_orphan_summary.
> > 
> > Mike,
> > 
> > Any problems with this? What needs to be done to make this patch go forward?

Applied to clk-next.

Regards,
Mike

> > 
> 
> Do you think this could be merged for the 3.17?
> 
> Thanks,
> 
> Peter.
