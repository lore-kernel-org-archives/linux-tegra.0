From: Emil Goode <emilgoode-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: Include header drm/drm.h
Date: Sat, 27 Apr 2013 11:49:22 +0200
Message-ID: <20130427094922.GA6348@debian>
References: <1366998591-8508-1-git-send-email-emilgoode@gmail.com>
 <20130426192208.GA2945@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130426192208.GA2945-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: airlied-cv59FeDIM0c@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

I don't know this code well but the drm/drm.h has an #if def so that
either linux/types.h is included or the __[us]* types are defined in
a different way with the comment "One of the BSDs".
Also I sent a patch last year to include linux/types.h in exynos_drm.h
but it now includes drm/drm.h instead.

Best regards,

Emil Goode


On Fri, Apr 26, 2013 at 09:22:08PM +0200, Thierry Reding wrote:
> On Fri, Apr 26, 2013 at 07:49:51PM +0200, Emil Goode wrote:
> > Include definitions of used types by including drm/drm.h
> > 
> > Sparse output:
> > /usr/include/drm/tegra_drm.h:21:
> > 	found __[us]{8,16,32,64} type without
> > 	#include <linux/types.h>
> > 
> > Signed-off-by: Emil Goode <emilgoode-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  include/uapi/drm/tegra_drm.h |    2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/include/uapi/drm/tegra_drm.h b/include/uapi/drm/tegra_drm.h
> > index 6e132a2..73bde4e 100644
> > --- a/include/uapi/drm/tegra_drm.h
> > +++ b/include/uapi/drm/tegra_drm.h
> > @@ -17,6 +17,8 @@
> >  #ifndef _UAPI_TEGRA_DRM_H_
> >  #define _UAPI_TEGRA_DRM_H_
> >  
> > +#include <drm/drm.h>
> > +
> 
> sparse complains about linux/types.h not being included, so I wonder if
> it makes more sense to include that instead of drm/drm.h. In fact I have
> a fix that does exactly that in a local branch and was going to put that
> into my fixes branch. It's a bit more lightweight.
> 
> On the other hand, some drivers already include drm/drm.h in the public
> header so I don't really have any objections to this patch.
> 
> Thierry
