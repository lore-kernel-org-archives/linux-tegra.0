From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: Re: [PATCH] GPU-DRM-Tegra: Delete an unnecessary check before the
 function call "vunmap"
Date: Wed, 8 Jul 2015 20:40:16 +0200
Message-ID: <559D6E90.1040005@users.sourceforge.net>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <54D335FA.6020101@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54D335FA.6020101@users.sourceforge.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>, David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>, =?UTF-8?Q?Terje_Bergstr=c3=b6m?= <tbergstrom@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>
List-Id: linux-tegra@vger.kernel.org

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 5 Feb 2015 10:12:51 +0100
> 
> The vunmap() function performs also input parameter validation.
> Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/tegra/fb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
> index e9c715d..803598e 100644
> --- a/drivers/gpu/drm/tegra/fb.c
> +++ b/drivers/gpu/drm/tegra/fb.c
> @@ -66,7 +66,7 @@ static void tegra_fb_destroy(struct drm_framebuffer *framebuffer)
>  		struct tegra_bo *bo = fb->planes[i];
>  
>  		if (bo) {
> -			if (bo->pages && bo->vaddr)
> +			if (bo->pages)
>  				vunmap(bo->vaddr);
>  
>  			drm_gem_object_unreference_unlocked(&bo->gem);
> 

Would you like to integrate this update suggestion
into another source code repository?

Regards,
Markus
