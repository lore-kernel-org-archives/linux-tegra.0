From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH -next] drm/tegra: fix return value check
Date: Mon, 28 Oct 2013 15:51:32 -0600
Message-ID: <526EDC64.5050202@wwwdotorg.org>
References: <CAPgLHd_JqYS5DC4tmzgGVEYmJpeM96FAEDvmM3cUUep+1jj7mA@mail.gmail.com> <20131028085358.GC10718@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131028085358.GC10718-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/28/2013 02:53 AM, Thierry Reding wrote:
> On Mon, Oct 21, 2013 at 11:34:07AM +0800, Wei Yongjun wrote:
>> From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
>> 
>> In case of error, the function clk_get_parent() and
>> devm_ioremap_resource() returns ERR_PTR() and never returns NULL.
>> The NULL test in the return value check should be replaced with
>> IS_ERR().
>> 
>> Signed-off-by: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org> --- 
>> drivers/gpu/drm/tegra/dsi.c | 6 +++--- 1 file changed, 3
>> insertions(+), 3 deletions(-)
> 
> I've applied this, but with the first hunk removed, since looking
> at the implementation of clk_get_parent() it can actually return
> NULL. In fact it seems like it will never return ERR_PTR().
> 
> I've also updated the commit message to reflect that.

Hmm. The documentation for clk_get() says:

/**
 * clk_get - lookup and obtain a reference to a clock producer.
 * @dev: device for clock "consumer"
 * @id: clock consumer ID
 *
 * Returns a struct clk corresponding to the clock producer, or
 * valid IS_ERR() condition containing errno.  The implementation
 * uses @dev and @id to determine the clock consumer, and thereby
 * the clock producer.  (IOW, @id may be identical strings, but
 * clk_get may return different clock producers depending on @dev.)

If the implementation doesn't match that, then it's a bug, and a whole
slew of drivers will need changing... On the surface, it looks like
the hunk you dropped was correct.

NULL may be a perfectly legal return value from a function that
returns either valid data or an IS_ERR() value.
