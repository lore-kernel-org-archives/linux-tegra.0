From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Allocate 64 MiB for CMA by default
Date: Mon, 03 Mar 2014 10:43:21 -0700
Message-ID: <5314BF39.6050707@wwwdotorg.org>
References: <1393860668-31996-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393860668-31996-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/03/2014 08:31 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The default size of 16 MiB reserved for CMA is not enough for the
> majority of use-cases, so set it to something more sensible.
> 
> Note that users can still override this via the cma kernel command-line
> argument, which takes precendence over the default specified in the
> kernel configuration file.

I've squashed this into Tegra's for-3.15/defconfig branch.

BTW, Tegra patches should probably be CC'd to the ARM kernel list as
well, just so people are aware.
