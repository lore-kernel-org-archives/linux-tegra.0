From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH Resend 2/7] clk: tegra: Staticize
 tegra_clk_periph_nodiv_ops
Date: Mon, 23 Dec 2013 16:18:52 +0200
Message-ID: <20131223141852.GD3378@tbergstrom-lnx.Nvidia.com>
References: <1387443241-5694-1-git-send-email-sachin.kamat@linaro.org>
 <1387443241-5694-2-git-send-email-sachin.kamat@linaro.org>
 <52B3265F.8080901@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52B3265F.8080901-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Dec 19, 2013 at 06:01:19PM +0100, Stephen Warren wrote:
> On 12/19/2013 01:53 AM, Sachin Kamat wrote:
> > tegra_clk_periph_nodiv_ops is used only in this file. Make it static.
> 
> I believe that Peter De Schrijver is picking up patches for
> drivers/clk/tegra and sending pull requests to Mike. Hence, I'm CC'ing
> him in here.
> 

This seems to be already merged in next-20131223 as 4e100354e5b7c8982d1563dca134d375979a8ead

Cheers,

Peter.
