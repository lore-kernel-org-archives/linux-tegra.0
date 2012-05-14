From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [v2 1/1] memory: tegra{20,30}-mc: Use dev_err_ratelimited()
Date: Mon, 14 May 2012 20:57:07 +0200
Message-ID: <20120514.215707.1844280772142880591.hdoyu@nvidia.com>
References: <1336981680-15297-2-git-send-email-hdoyu@nvidia.com><1336990031-15567-1-git-send-email-hdoyu@nvidia.com><4FB14FDE.2080409@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FB14FDE.2080409-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Stepehn,

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote @ Mon, 14 May 2012 20:33:02 +0200:

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

Greg has put the dependee patch in:

http://git.kernel.org/?p=linux/kernel/git/gregkh/driver-core.git;a=commit;h=6ca045930338485a8cdef117e74372aa1678009d

Anyway, I should have described the above dependency in commit note in
the patch, sorry for confusion.
