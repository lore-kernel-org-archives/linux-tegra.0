From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v1 2/2] drm/panel-simple: Add missing BUS descriptions
 for some panels
Date: Sun, 28 Jun 2020 10:07:45 +0300
Message-ID: <20200628070745.GC6954@pendragon.ideasonboard.com>
References: <20200621222742.25695-1-digetx@gmail.com>
 <20200621222742.25695-3-digetx@gmail.com>
 <20200627204338.GL5966@pendragon.ideasonboard.com>
 <dd1c5972-bbac-c2d8-76e8-08997b951e52@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <dd1c5972-bbac-c2d8-76e8-08997b951e52-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dmitry,

On Sun, Jun 28, 2020 at 02:44:15AM +0300, Dmitry Osipenko wrote:
> 27.06.2020 23:43, Laurent Pinchart пишет:
> > On Mon, Jun 22, 2020 at 01:27:42AM +0300, Dmitry Osipenko wrote:
> >> This patch adds missing BUS fields to the display panel descriptions of
> >> the panels which are found on NVIDIA Tegra devices:
> >>
> >>   1. AUO B101AW03
> >>   2. Chunghwa CLAA070WP03XG
> >>   3. Chunghwa CLAA101WA01A
> >>   4. Chunghwa CLAA101WB01
> >>   5. Innolux N156BGE L21
> >>   6. Samsung LTN101NT05
> >>
> >> Suggested-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> >> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> ---
> >>  drivers/gpu/drm/panel/panel-simple.c | 12 ++++++++++++
> >>  1 file changed, 12 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> >> index 87edd2bdf09a..986df9937650 100644
> >> --- a/drivers/gpu/drm/panel/panel-simple.c
> >> +++ b/drivers/gpu/drm/panel/panel-simple.c
> >> @@ -698,6 +698,8 @@ static const struct panel_desc auo_b101aw03 = {
> >>  		.width = 223,
> >>  		.height = 125,
> >>  	},
> >> +	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> >> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> > 
> > Does DRM_BUS_FLAG_PIXDATA_DRIVE_* make sense for LVDS ?
> 
> To be honest I don't know whether it make sense or not for LVDS. I saw
> that other LVDS panels in panel-simple.c use the PIXDATA flag and then
> looked at what timing diagrams in the datasheets show.

I think we should drop DRM_BUS_FLAG_PIXDATA_DRIVE_* for LVDS panels.
I'll submit a patch.

> > The rest looks good, except the Samsung panel for which I haven't been
> > able to locate a datasheet.
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> 
> Thanks to you and Sam!

-- 
Regards,

Laurent Pinchart
