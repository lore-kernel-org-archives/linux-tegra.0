From: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 2/2] drm/tegra: output: rgb: Support LVDS encoder
 bridge
Date: Thu, 16 Apr 2020 22:37:49 +0200
Message-ID: <20200416203749.GA7104@ravnborg.org>
References: <20200416172405.5051-1-digetx@gmail.com>
 <20200416172405.5051-3-digetx@gmail.com>
 <20200416174112.GS4796@pendragon.ideasonboard.com>
 <6275bcd3-c0b2-4c1c-1817-9e713d3747c7@gmail.com>
 <7cf27640-4fdc-8617-01cb-85f4c5847bb8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7cf27640-4fdc-8617-01cb-85f4c5847bb8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dimitry.

On Thu, Apr 16, 2020 at 11:21:40PM +0300, Dmitry Osipenko wrote:
> 16.04.2020 21:52, Dmitry Osipenko пишет:
> ...
> >> May I also recommend switching to the DRM panel bridge helper ? It will
> >> simplify the code.
> > 
> > Could you please clarify what is the "DRM panel bridge helper"?
> > 
> > I think we won't need any additional helpers after switching to the
> > bridge connector helper, no?
> 
> Actually, I now see that the panel needs to be manually attached to the
> connector.
> 
> Still it's not apparent to me how to get panel out of the bridge. It
> looks like there is no such "panel helper" for the bridge API or I just
> can't find it.

Take a look in bridge/panel.c
I think devm_drm_panel_bridge_add() is what you are after.

	Sam
