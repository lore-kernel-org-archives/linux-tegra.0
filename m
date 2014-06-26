From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] clk: define and export __clk_get_debug for providers
Date: Thu, 26 Jun 2014 18:00:33 +0300
Message-ID: <20140626150033.GH3679@tbergstrom-lnx.Nvidia.com>
References: <1403788921-7963-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1403788921-7963-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jun 26, 2014 at 03:22:01PM +0200, Peter De Schrijver wrote:
> Define and export a new function __clk_get_debug which returns the debugfs
> directory entry pointer. This can be used by clock providers to add debugfs
> entries which are not related to a specific clock type. Examples include the
> ability to measure the rate of a clock. It can also be used by modules to
> create new debugfs entries. This is useful if you want to expose features
> for testing which can potentially cause system instability such as allowing
> to change a clock's rate from userspace.

Oops. Ignore this :)
