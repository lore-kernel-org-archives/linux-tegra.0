From: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v1 2/2] drm/panel-simple: Add missing BUS descriptions
 for some panels
Date: Sun, 28 Jun 2020 10:53:30 +0200
Message-ID: <20200628085330.GA132428@ravnborg.org>
References: <20200621222742.25695-1-digetx@gmail.com>
 <20200621222742.25695-3-digetx@gmail.com>
 <20200627204338.GL5966@pendragon.ideasonboard.com>
 <dd1c5972-bbac-c2d8-76e8-08997b951e52@gmail.com>
 <20200628070745.GC6954@pendragon.ideasonboard.com>
 <20200628075245.GA128039@ravnborg.org>
 <20200628080253.GD6954@pendragon.ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200628080253.GD6954-N3hz7ZxfLydczECFQUw77jytWr6r+dGw0E9HWUfgJXw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sun, Jun 28, 2020 at 11:02:53AM +0300, Laurent Pinchart wrote:
> Hi Sam,
> 
> > We should also clean up all the DRM_BUS_FLAG_* one day.
> > No need for the deprecated values, so a few files needs an update.
> > And we could document what flags makes sense for LVDS etc.
> 
> Where would you add that documentation ? The hardest part is to find a
> place that will be noticed by developers :-)
I will try to extend drm_bus_flags documentation in drm_connector.h
And then add a few comments in panel-simple as well.

	Sam
> 
> I've just submitted a patch that adds a WARN_ON to catch similar issues
> in the panel-simple driver. It's not ideal as we really shouldn't have
> such code in the kernel, this is something that should be caught as part
> of the integration process.

> 
> > On the TODO list...
> >
> > >>> The rest looks good, except the Samsung panel for which I haven't been
> > >>> able to locate a datasheet.
> > >>> 
> > >>> Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> 
> -- 
> Regards,
> 
> Laurent Pinchart
