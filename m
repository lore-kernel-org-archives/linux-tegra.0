From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Combine VBUS enable pins into one node
Date: Tue, 25 Feb 2014 11:01:19 -0700
Message-ID: <530CDA6F.8010207@wwwdotorg.org>
References: <1393343104-2647-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393343104-2647-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/25/2014 08:45 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Both USB_VBUS_EN0 and USB_VBUS_EN1 are configured the same way, so they
> can be combined into a single node. While at it, don't configure them as
> pull-up since they already have external pull-ups. Also U-Boot doesn't
> configure them as pull-up either.

I have applied this to Tegra's for-3.15/dt branch.
