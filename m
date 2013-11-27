From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Do not print errors for clk_round_rate()
Date: Wed, 27 Nov 2013 23:52:36 +0100
Message-ID: <20131127225236.GA9255@luegisland.agner.local>
References: <1385569563-25408-1-git-send-email-treding@nvidia.com>
 <20131127163442.GA25458@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131127163442.GA25458-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Nov 27, 2013 at 05:34:43PM +0100, Thierry Reding wrote:
> Cc'ing Stefan, since he reported this error or IRC. Stefan, can you
> check whether this fixes the issue you were seeing? In case you're not
> subscribed, please let me know and I'll resend the patch.
> 
> Peter, if you're fine with applying as-is, can you add this:
> 
> 	Reported-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> 
> to give proper credit?
> 

Looks good to me, no more warning stacktraces on my setup.

Reported-and-tested-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
