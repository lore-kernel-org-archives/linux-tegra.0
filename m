From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH RESEND] clk: flatten clk tree in debugfs
Date: Fri, 13 Jun 2014 11:02:39 +0300
Message-ID: <20140613080239.GO5961@tbergstrom-lnx.Nvidia.com>
References: <1401462237-14954-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1401462237-14954-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, May 30, 2014 at 05:03:57PM +0200, Peter De Schrijver wrote:
> This patch flattens the clk tree in CCF debugfs. Instead of representing the
> clocks and their hierarchy as a directory structure under
> /sys/kernel/debug/clk, each clock gets a single directory directly under
> /sys/kernel/debug/clk. The orphans directory is replaced by a file called
> clk_orphan_summary.

Mike,

Any problems with this? What needs to be done to make this patch go forward?

Thanks!

Peter.
