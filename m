From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v11 0/4] Panel rotation patches
Date: Fri, 17 Jul 2020 17:59:55 +0300
Message-ID: <848a586a-060c-1244-e057-99f5b56baf09@gmail.com>
References: <20200617231842.30671-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200617231842.30671-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>, Derek Basehore <dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

18.06.2020 02:18, Dmitry Osipenko пишет:
> Hello!
> 
> This series adds support for display panel's DT rotation property. It's a
> continuation of the work that was initially started by Derek Basehore for
> the panel driver that is used by some Mediatek device [1]. I picked up the
> Derek's patches and added my t-b and r-b tags to them, I also added
> rotation support to the panel-lvds and panel-simple drivers.
> 
> We need the rotation support for the Nexus 7 tablet device which is pending
> to become supported by upstream kernel, the device has display panel mounted
> upside-down and it uses panel-lvds [2].
> 
> [1] https://lkml.org/lkml/2020/3/5/1119
> [2] https://patchwork.ozlabs.org/project/linux-tegra/patch/20200607154327.18589-3-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org/
> 
> Changelog:
> 
> v11: - This series is factored out from this patchset [3] because these
>        patches do not have hard dependency on the Tegra DRM patches and
>        it should be nicer to review and apply the properly grouped patches.
> 
>      - Initially [3] only touched the panel-lvds driver and Emil Velikov
>        suggested that it will be better to support more panels in the review
>        comments to [3]. So I included the Derek's patch for the BOE panel
>        and added rotation support to the panel-simple driver. I tested that
>        panel-lvds and panel-simple work properly with the rotated panel using
>        the Opentegra Xorg driver [4] and Wayland Weston [5].
> 
>      - The panel-lvds driver now prints a error message if rotation property
>        fails to be parsed.
> 
> [3] https://lore.kernel.org/lkml/20200614200121.14147-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org/
> [4] https://github.com/grate-driver/xf86-video-opentegra/commit/28eb20a3959bbe5bc3a3b67e55977093fd5114ca
> [5] https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/315
> 
> Derek Basehore (2):
>   drm/panel: Add helper for reading DT rotation
>   drm/panel: Read panel orientation for BOE TV101WUM-NL6
> 
> Dmitry Osipenko (2):
>   drm/panel: lvds: Read panel orientation
>   drm/panel-simple: Read panel orientation
> 
>  drivers/gpu/drm/drm_panel.c                   | 43 +++++++++++++++++++
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    |  6 +++
>  drivers/gpu/drm/panel/panel-lvds.c            | 10 +++++
>  drivers/gpu/drm/panel/panel-simple.c          | 11 +++++
>  include/drm/drm_panel.h                       |  9 ++++
>  5 files changed, 79 insertions(+)
> 

Hi! Does anyone have any comments to this patchset? Will be nice if it
could get into 5.9 :) Thanks in advance!
