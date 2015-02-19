From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: DSI panel not working on -next
Date: Thu, 19 Feb 2015 09:12:26 +0100
Message-ID: <20150219081225.GA5086@ulmo.nvidia.com>
References: <54DD99B5.2080504@nvidia.com>
 <20150213095516.GA17888@ulmo.nvidia.com>
 <54DDCF63.7040208@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54DDCF63.7040208-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2015 at 07:18:11PM +0900, Alexandre Courbot wrote:
> On 02/13/2015 06:55 PM, Thierry Reding wrote:
> >On Fri, Feb 13, 2015 at 03:29:09PM +0900, Alexandre Courbot wrote:
> >>Hi Thierry,
> >>
> >>I noticed that the DSI panel of SHIELD (tegra114-roth) was not brought =
up on
> >>-next. I have bisected the following commit as introducing that behavio=
r:
> >>
> >>commit f4c5cf88fbd50e4779042268947b2e2f90c20484
> >>Author: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>Date:   Thu Dec 18 15:29:14 2014 +0100
> >>
> >>     gpu: host1x: Provide a proper struct bus_type
> >>
> >>
> >>With and without this patch, the DSI panel is probed, but the stack tra=
ce in
> >>the probe() function is different:
> >
> >This shouldn't make much of a difference, really, since we're attaching
> >to the panel only during mipi_dsi_host_register() anyway. And the panel
> >device can't exist earlier than that because mipi_dsi_host_register()
> >will instantiate it. Still...
> >
> >>i.e. with f4c5cf88fbd, the panel is not probed from tegra_dsi_probe()
> >>anymore, which means DSI remains without a valid connector:
> >>
> >>[    1.378513] [drm] Initialized drm 1.1.0 20060810
> >>[    1.384564] 54300000.dsi supply avdd-dsi-csi not found, using dummy
> >>regulator
> >>[    1.396394] [drm] Supports vblank timestamp caching Rev 2 (21.10.201=
3).
> >>[    1.403021] [drm] No driver support for vblank timestamp query.
> >>[    1.409080] drm drm: No connectors reported connected with modes
> >>[    1.415128] [drm] Cannot find any crtc or sizes - going 1024x768
> >
> >... the failing log here does indicate that there is no panel, so I'll
> >need to investigate why that's happening.
> >
> >>Are you aware of this? Does it affect other DSI panels? Does SHIELD's DT
> >>need an update of some sort?
> >
> >I'm almost certain that I've tested this on at least Dalmore and I don't
> >see any differences that could be causing this. I'll look into it.
>=20
> Thanks - please don't hesitate to ask me to run some more tests (or just =
to
> try and fix it by myself) if this can save you time.

Let me try to summarize what we discussed on IRC earlier. The root cause
here is that the panel is probed as part of the mipi_dsi_host_register()
call. In some cases the panel driver may defer probe itself, therefore
causing the DSI output to end up with no attached panel. The KMS fbdev
emulation will then assume a default resolution of 1024x768.

The panel will at some point successfully probe and attach to the host,
which should cause things to work normally for anything that's able to
set a mode by itself. So running modetest or weston should still work,
even if fbcon doesn't.

I see three possible solutions:

  - Defer in the DSI output's ->probe() if after registering the host
    there is no panel attached. That should delay the initialization of
    fbdev until a panel is detected.

    This is somewhat ugly, but I think it would be the easiest fix for
    the regression until a proper solution is implemented.

  - Modify the driver to cope with "hot-pluggable" panels. This isn't
    really going to fix the regression because the outcome will be the
    same. In fact, for DSI panels are already hot-pluggable.

  - Implement a mechanism to tear down and setup from scratch the fbdev
    when the first output is added. So at driver load time the fbdev
    code would skip fbdev initialization if no connected output was
    detected. Once any of the outputs is connected, the native mode of
    that output can be used to create fbdev. That should be enough to
    fix the problem for panels that defer probe, but I think an even
    more generic solution would be to go a step further and completely
    tear down fbdev when the last connected output goes away and then
    create it again when any of the outputs is connected again.

    I'm told that it's very difficult to resize fbcon, but I know that
    at least with the Tegra driver it is properly torn down and set up
    again during a driver unload/load cycle, so it must be possible to
    do this more granularly for fbdev only.

Thierry

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJU5ZrpAAoJEN0jrNd/PrOhMJsP/2upgFn77VD5nWxs8Efkx5xW
ubG0pxyzpO0ZoGMMbMVxrrBrJMEEtX8AbykB/Pl9KAcae0MjfCoBBksb5axcRgub
SrSgO05/EDvsGfmVH95hx+0FImxPHV6ne2cpQVtogR7BgeERExb64vAe3iHXELHw
UD0jrzG6p2EkfCh91kXEfwBKJisanole1DxpbXpR4lzB5WMb208jxpX02vylplwq
1+4JDxoioAVbCgW2dx/m6eVaHCrXZoaVVxnd0EJ3UyJ3pM9UxKNC9zVwd2SzRb9K
i30BAC98xp9MhxK1moSW9SS0aDLbwho1vpt+wcPOOQOxAS166t1KHypBPscOxfbL
aH9Zxb/zRw9YrySTGsQzXP0wzyia0BDnE65KVj65ElkYhLJswvmjXX6MOJT1tLJl
ZhXr09bOBx87v3yc+hH5UBpcL2HuY18as2ZjlPm5a9n6gUIIIWcQHRW6qSI1s/V+
ldoNMJIsobJh3XycZr+f7ldFb0OAjMsmdKIgjEb/wNTbQozjJvK8R0q6b1b3FBa2
5aC4jtwB0FJL9hv7WhD0ZI6wF/RkEMOd53HghX7wo17s2HHucyG407eh8LKUJbww
EJ375ZZ3rZDm0SEvtBTVTzuorP23YTsjZw1lPNIKSCRW25HWWb7FQHgu8IdWR4pn
7oK1DZHiPwhodLJPxHLD
=eNPR
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
