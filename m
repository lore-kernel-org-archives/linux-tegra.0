From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH] gpu/host1x: Remove DRIVER_BUS_PLATFORM from driver_features
Date: Thu, 27 Jun 2013 11:09:39 +0200
Message-ID: <2786016.HggCTvYnMZ@avalon>
References: <1369806274-19046-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <20130529105039.GA30742@manwe>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130529105039.GA30742@manwe>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

On Wednesday 29 May 2013 12:50:40 Thierry Reding wrote:
> On Wed, May 29, 2013 at 07:44:34AM +0200, Laurent Pinchart wrote:
> > From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> > 
> > DRIVER_BUS_PLATFORM is not a DRM driver feature flag, it must not be set
> > in the driver's driver_features field.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> > ---
> > 
> >  drivers/gpu/host1x/drm/drm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Applied, thanks. I did modify the subject's prefix to "drm/tegra: " for
> consistency, though.

Do you plan to push the patch to v3.11 through Dave's tree ? I can't find it 
in drm-next.

-- 
Regards,

Laurent Pinchart
