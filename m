From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/5] 180 degrees rotation support for NVIDIA Tegra DRM
Date: Mon, 15 Jun 2020 23:26:29 +0100
Message-ID: <CACvgo51QuXMgWhFk4C=3rGvUZDX1_W0RZtVb5RtRPiHTpMebWQ@mail.gmail.com>
References: <20200614200121.14147-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200614200121.14147-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>, Derek Basehore <dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Dmitry,

On Mon, 15 Jun 2020 at 08:28, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> Hello!
>
> This series adds 180=C2=B0 display plane rotation support to the NVIDIA T=
egra
> DRM driver which is needed for devices that have display panel physically
> mounted upside-down, like Nexus 7 tablet device for example [1]. Since
> DRM panel rotation is a new thing for a userspace, currently only
> Opentegra Xorg driver handles the rotated display panel [2], but this
> is good enough for the start.
>
> Note that later on it should be possible to implement a transparent 180=
=C2=B0
> display rotation for Tegra DRM driver which will remove the need to have
> a bleeding edge userspace that knows how to rotate display planes and I'm
> slowly working on it. For the starter we can go with the minimal rotation
> support, so it's not a blocker.
>
> This series is based on the work that was made by Derek Basehore for the
> Mediatek driver [3], his patch is included into this patchset. I added
> my tested-by tag to the Derek's patch.
>
> Please review and apply, thanks in advance!
>
> [1] https://patchwork.ozlabs.org/project/linux-tegra/patch/20200607154327=
.18589-3-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org/
> [2] https://github.com/grate-driver/xf86-video-opentegra/commit/28eb20a39=
59bbe5bc3a3b67e55977093fd5114ca
> [3] https://lkml.org/lkml/2020/3/5/1119
>
> Changelog:
>
> v2: - Dropped "drm/panel: Set display info in panel attach" patch, which
>       turned out to be obsolete now.
>
>     - Renamed the cover-latter, hopefully this will fix the bouncing emai=
ls.
>
> Derek Basehore (1):
>   drm/panel: Add helper for reading DT rotation
>
> Dmitry Osipenko (4):
>   drm/panel: lvds: Set up panel orientation

IMHO it's perfectly reasonable to report the panel orientation to
userspace, which can apply plane rotation as needed.

Although I see that this series, alike Derek's, has a couple of issues:
 - only a single panel driver is updated
 - rotation is _not_ listed as supported property, in said panel
driver device-tree bindings

My personal inclination is that we should aim for a comprehensive solution:
 - wire all panel drivers, as currently documented (quick grep list below)
 - document and wire-up the lvds and boe panels - as proposed by you
and Derek respectively

HTH
Emil

Documentation/devicetree/bindings/display/himax,hx8357d.txt:2
Documentation/devicetree/bindings/display/ilitek,ili9225.txt:2
Documentation/devicetree/bindings/display/ilitek,ili9341.txt:2
Documentation/devicetree/bindings/display/ilitek,ili9486.yaml:2
Documentation/devicetree/bindings/display/multi-inno,mi0283qt.txt:2
Documentation/devicetree/bindings/display/panel/panel-common.yaml:2
Documentation/devicetree/bindings/display/sitronix,st7586.txt:1
Documentation/devicetree/bindings/display/sitronix,st7735r.yaml:2
