From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Tegra DRM with HDMI support (\o/)
Date: Thu, 18 Oct 2012 08:34:53 +0200
Message-ID: <20121018063453.GD24637@avionic-0098.mockup.avionic-design.de>
References: <20121011200705.GB27599@avionic-0098.mockup.avionic-design.de>
 <1350375538.2332.31.camel@markz-hp6200>
 <507D856C.1070708@wwwdotorg.org>
 <20121017054224.GA21783@avionic-0098.mockup.avionic-design.de>
 <507F9BF5.20002@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IDYEmSnFhs3mNXr+"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <507F9BF5.20002-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--IDYEmSnFhs3mNXr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2012 at 02:04:37PM +0800, Mark Zhang wrote:
> On 10/17/2012 01:42 PM, Thierry Reding wrote:
> >* PGP Signed by an unknown key
> >
> >On Tue, Oct 16, 2012 at 10:03:56AM -0600, Stephen Warren wrote:
> >>On 10/16/2012 02:18 AM, Mark Zhang wrote:
> >>>Hi,
> >>>
> >>>I've made this drm driver worked on Tegra 3(LVDS and HDMI both).
> >>>But the code that Thierry
> >>>hosts(git://gitorious.org/thierryreding/linux.git) doesn't work
> >>>directly. If you build and run it, you'll get a white blank screen on
> >>>Tegra 3. I didn't find the root cause but I think this is not caused by
> >>>drm driver itself(maybe the PCIE codes?). The main symptom is: some
> >>>regulators can't be inited all the time. I tried to build drm driver as
> >>>kernel module, after kernel booted, modprobe the drm driver, and you'll
> >>>find there are a lot of error prints like this:
> >>>
> >>>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>[   21.383529] reg-fixed-voltage 1.regulator: Failed to find supply vin
> >>>[   21.390299] reg-fixed-voltage 1.regulator: Failed to register
> >>>regulator: -517
> >>>[   21.397645] platform 1.regulator: Driver reg-fixed-voltage requests
> >>>probe deferral
> >>>[   21.405604] platform 2.regulator: Driver reg-fixed-voltage requests
> >>>probe deferral
> >>>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >>This is normal; it's probe deferral. You'll find that those regulators
> >>initialize correctly later. Hopefully tegra-drm handles this correctly,
> >>and passes that error code through as the result of its probe.
> >
> >I presume those regulators are for the vdd and pll supplies of the HDMI
> >output? Those should be properly handled by the tegra_hdmi_probe()
> >function. Also the way tegra-drm works right now, unless all of the
> >outputs are registered properly the DRM portion will never even be
> >initialized.
> >
>=20
> Not exactly. In hdmi driver, if I try to get/enable vdd & pll
> regulators which HDMI needs, error occurs. So currently to make HDMI
> working on Tegra 3, we need to temporarily remove these codes.
> In fact, there are a lot of this kind of errors, I just pasted some
> of them. So there is something in your changes which blocks these
> regulators correctly inited cause this issue doesn't exist in
> upstream codes.

I don't understand. If you remove the code that enables the regulators,
how can HDMI work at all?

The code in tegra_hdmi_probe() tries to acquire the regulators and
should return an error if it can't. But if HDMI is enabled and the
driver can't access the resources for HDMI, then nothing will be
registered with the DRM core in the first place. That's actually what
the drm_clients list is used for. Basically this defers the DRM
registration until all clients are available.

Thierry

--IDYEmSnFhs3mNXr+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQf6MNAAoJEN0jrNd/PrOhJWkQAIL2uk5O83l1CJma+A+2Wlk+
lYzIOP2XVxBcBvwq/ojkcqkndYZRvPB+64zW+XwkYJgj/hFAKcs1318yN4Zm/I/0
DBYuVfa/V+ektvJ/N0UTY8Lb4D2lKE2oqRdPnCZjlPxlrvRQlKPyYWxW7+LB+TSa
0nmxHkGRFdIOyN6/U6E1rUz/bdTia41U6nL4bDf6JebkpDLptXF3aNGBsRFRBZQ5
ntHkwSBpc0IMO7v/gox9TTBbWozVMv3R+V8qfmfLv69VW7a/T8ZHUjYW0sWgsDFn
1ZvY5M5EssU1cuVjlzMyYlny6WukdeOzzkMJPh1ivykLX0V//QTk3tgGFsKEcqXA
zzBlWI1s6Kj0xIffmYk85Hl+LLpZVG+fjB2mX4PPykfdm9l5fYNfsJMq9mgowoZd
KVTI8OSoFN/v3dFagORGJrlKHblX4BIcvgR1kydMdHuk4D/mvtAc+txyD3hb9kiF
QvgpoM1Tt3oy06UxwEakjwTEC6SKduTBqG2/u6x8DbNHe+Tg/u/RdvFFKNtdhcwY
nMWoTE82hvReusUV9wh+Iaj0hdXhFemDVdgi43szDf9hF6UWSX/MPfnYEOiEHaqZ
q6ZqNGh/A9HssoM4J6CaMKX/aqKmmewN3j8+sW+oqaWF4M6SBZv506LainvixJXY
Z+Pspr2/aSsaCxfGAbir
=aOIS
-----END PGP SIGNATURE-----

--IDYEmSnFhs3mNXr+--
