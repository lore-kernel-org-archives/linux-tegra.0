From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] drm/tegra: Add VIC support
Date: Fri, 22 May 2015 12:02:52 +0200
Message-ID: <20150522100251.GC16507@ulmo>
References: <1432214425-27137-1-git-send-email-amerilainen@nvidia.com>
 <1432214425-27137-4-git-send-email-amerilainen@nvidia.com>
 <555DEE5F.2060100@nvidia.com>
 <555DF576.7070307@nvidia.com>
 <555DFD48.4000609@kapsi.fi>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qjNfmADvan18RZcF"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <555DFD48.4000609-/1wQRMveznE@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>
Cc: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, srasal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dnibade-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--qjNfmADvan18RZcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2015 at 06:44:08PM +0300, Mikko Perttunen wrote:
> On 05/21/2015 06:10 PM, Arto Merilainen wrote:
> >...
> >>>+
> >>>+    vic->rst =3D devm_reset_control_get(dev, "vic03");
> >>
> >>I might prefer just "vic" as the clock/reset name. The name is often
> >>used as a sort of "role" for the clock/reset for the device, not
> >>necessarily the raw name of the "correct" clock/reset.
> >>
> >
> >I considered that - but I then noticed that
> >drivers/clk/tegra/clk-tegra124.c was already using vic03 variant. I can
> >write a patch for changing that too.
>=20
> Well, the two can be different; the clock-name in device tree kind of mea=
ns
> "string that i use to refer to a clock that powers the VIC unit". It's not
> really a big deal though, both ways are used in DT bindings.

I'll insist on calling this vic in the clock-names property. The 03 is
as far as I can tell an encoding of the version number, so if you want
to call this vic04 in some future version we'll have to needlessly
patch the driver.

Thierry

--qjNfmADvan18RZcF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVXv7LAAoJEN0jrNd/PrOhS/AP/A1qevrmwHmgtqyU5Oxdj9lP
VZ3DD1Tf6jhOsDk79vGSEP0oegbCll+3byxWOO2CyoFp0ZlqAhdEh0utdE/e8TlR
FbEJt86DXPHQIewjWVJND5PDNn/6MGVNh8PKiQPkSkaP6p40xyi+J/1nVFcF62bA
vV1XTMvF/PkHQOBazOjN7za6sljOIb7TLlNceb+XsoR5o+s21AoyDBgChDfDh0n+
a/m7Hfg5dircyHpR5gezxG0dMi4PPQx0PHO02SRl4zAOPJ3oInQKxhBpkc7b9jne
M1ATZkL/hZcLiirj9z3aTJD6t0bRG97v0amDd996QSdgDWL3jxbk1MxYkShlrqg+
Ha5/0CvZ7rzOecFJ63uSdOVmVDBye7yYgRCZ5vFY8s5GSueTRZZRyK8NCDYOzYUC
F8QsC7nmkqBIIbJoO4vsawAZ2S3qtu5ZeOmRXIUzHj4oxZhXrhzji1yr7VkaYbrn
a8oBhPnGcZr9iSpvEPh5aVANH/Lv76FGE3leOIHlxThluiOn4+DkauNWIkeJ89cf
3HBv+MCoDvvzXfZP21hszDR6UwFb87Om+zcmj5VTf+B0/0+fMINy/+GTi9fgIvPe
T4vvYxXTESo426KzI+7wEpvASTiJ6Y4uroWh1Zfav78QYtRGMHLYiiMGn8C+lYZm
l0W9G9dEUszWynxDyzUm
=e0Az
-----END PGP SIGNATURE-----

--qjNfmADvan18RZcF--
