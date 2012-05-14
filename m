From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [v2 1/1] memory: tegra{20,30}-mc: Use dev_err_ratelimited()
Date: Mon, 14 May 2012 12:09:25 -0700
Message-ID: <20120514190925.GA4001@kroah.com>
References: <1336981680-15297-2-git-send-email-hdoyu@nvidia.com>
 <1336990031-15567-1-git-send-email-hdoyu@nvidia.com>
 <4FB14FDE.2080409@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FB14FDE.2080409-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, May 14, 2012 at 12:33:02PM -0600, Stephen Warren wrote:
> On 05/14/2012 04:07 AM, Hiroshi DOYU wrote:
> > Introduce a new dev_*_ratelimited() instead of pr_*_ratelimited() for
> > better info to print.
> > 
> > Signed-off-by: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> 
> But note that this relies on the following patch or a variant of it:
> 
> http://patchwork.ozlabs.org/patch/158899/
> 
> which isn't anywhere yet.
> 
> (A variant of that patch was patch 1/2 the first time this patch was
> posted, but v2 of this patch was posted separately without mentioning
> the dependency)

It was part of this thread, which I don't think you were copied on for
some reason.  Anyway, I applied it earlier today, thanks.

greg k-h
