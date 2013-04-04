From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Use common of_clk_init() function
Date: Thu, 04 Apr 2013 12:20:35 -0600
Message-ID: <515DC473.8000104@wwwdotorg.org>
References: <1365066351-2395-1-git-send-email-pgaikwad@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1365066351-2395-1-git-send-email-pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/04/2013 03:05 AM, Prashant Gaikwad wrote:
> Use common of_clk_init() function for clocks initialization.
> 
> Signed-off-by: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> 
> Stephen, if T114 clock series is not going to make in 3.10 then I would
> like Mike to take this patch. If T114 clock series makes it then I have
> to rebase this patch on top of it.

I'm still just hopeful that it the Tegra114 support can get into 3.10;
all I'm waiting on is Mike's ack to apply it. Let's hold off on this
patch until after that. Thanks.
