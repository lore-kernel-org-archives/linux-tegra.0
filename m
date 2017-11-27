From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH 10/13] fbdev: allow apertures == NULL in
 remove_conflicting_framebuffers()
Date: Mon, 27 Nov 2017 11:29:18 +0100
Message-ID: <20171127102918.pgzjknl6bl2jsbyq@phenom.ffwll.local>
References: <cover.1511544782.git.mirq-linux@rere.qmqm.pl>
 <13240c59cafec988cdda37cc4d48252ff56f0d04.1511544782.git.mirq-linux@rere.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <13240c59cafec988cdda37cc4d48252ff56f0d04.1511544782.git.mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Nov 24, 2017 at 06:53:33PM +0100, Michał Mirosław wrote:
> Interpret (otherwise-invalid) NULL apertures argument to mean all-memory
> range. This will allow to remove several duplicates of this code from
> drivers in following patches.
> 
> Signed-off-by: Michał Mirosław <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
> ---
>  drivers/video/fbdev/core/fbmem.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 5ea980e5d3b7..927e016487e9 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1780,11 +1780,25 @@ int remove_conflicting_framebuffers(struct apertures_struct *a,
>  				    const char *name, bool primary)
>  {
>  	int ret;
> +	bool do_free = false;
> +
> +	if (!a) {
> +		a = alloc_apertures(1);
> +		if (!a)
> +			return -ENOMEM;
> +
> +		a->ranges[0].base = 0;
> +		a->ranges[0].size = ~0;
> +		do_free = true;
> +	}
>  
>  	mutex_lock(&registration_lock);
>  	ret = do_remove_conflicting_framebuffers(a, name, primary);
>  	mutex_unlock(&registration_lock);
>  
> +	if (do_free)
> +		kfree(a);
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL(remove_conflicting_framebuffers);

Please also update the kerneldoc for the varios drm wrappers and explain
that passing NULL means to remove all fbdev drivers.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
