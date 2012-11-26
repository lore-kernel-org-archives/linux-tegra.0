From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 1/1] memory: tegra30: Fix warning w/o PM_SLEEP
Date: Mon, 26 Nov 2012 15:47:29 -0800
Message-ID: <20121126234729.GA19416@kroah.com>
References: <1353501740-25420-1-git-send-email-hdoyu@nvidia.com>
 <50B3C426.4020605@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50B3C426.4020605-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Axel Lin <axel.lin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 26, 2012 at 12:33:58PM -0700, Stephen Warren wrote:
> On 11/21/2012 05:42 AM, Hiroshi Doyu wrote:
> > Fix build warning w/o PM_SLEEP.
> 
> Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> I assume Greg will take this through his tree.

If so, someone better resend it...

> > Change-Id: I713f7dd697f1ad9fb1fee56b389b0d6c45bb540c
> 
> But that shouldn't be there though...

Agreed, that's not ok.
