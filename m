From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] staging: nvec: remove include of <mach/iomap.h>
Date: Tue, 2 Oct 2012 15:24:35 -0700
Message-ID: <20121002222435.GA32288@kroah.com>
References: <1349216336-986-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1349216336-986-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Oct 02, 2012 at 04:18:56PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Nothing from this file is used, and the file will hopefully be deleted
> soon.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Greg, if this patch can get into 3.7 (it's late, I know) then that
> would be great. If not, may I please request an ack so I can take the
> change through the Tegra tree in 3.8, since I will probably have cleanup
> patches that depend on this change. Thanks.

I can apply this after 3.7-rc1 is out, so that it will be in the final
3.7, is that ok for you?  If not, feel free to take it in your tree as
well:

Acked-by: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>

thanks,

greg k-h
