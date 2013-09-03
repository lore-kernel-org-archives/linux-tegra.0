From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Enable DMA CMA support
Date: Tue, 03 Sep 2013 11:51:32 -0600
Message-ID: <522621A4.1040308@wwwdotorg.org>
References: <1378195505-28753-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378195505-28753-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/03/2013 02:05 AM, Thierry Reding wrote:
> Commit f825c73 ("mm/cma: Move dma contiguous changes into a seperate
> config") renamed the CMA option to DMA_CMA but didn't update any default
> configurations.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Note that this should be applied after 3.12-rc1, since the above patch
> will presumably go into 3.12 during the merge window.
> 
> Ideally this would've gone into the original commit and in fact digging
> through some archives it turns out that an initial version of the patch
> did modify the default configurations, but the hunks were dropped when
> the patch was applied because of the potential for merge conflicts...

I think you should take this up with the original author/committer of
the problematic patch. If they rename something, they have to deal with
the fallout of the rename. If this causes merge conflicts, this is
something Linus wants to see.

If not, feel free to forward this to arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org with my ack below at
the appropriate time.
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
