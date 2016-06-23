From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH 00/13] Add support for Tegra DPAUX pinctrl
Date: Thu, 23 Jun 2016 10:04:00 +0200
Message-ID: <20160623080400.GA8136@ulmo.ba.sec>
References: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
 <20160617165611.GO27475@ulmo.ba.sec>
 <20160617165842.GP27475@ulmo.ba.sec>
 <CACRpkdaEUUCs3UR9U331wuFTkRswU4tFEg6JLoMVkHeSXfS_sA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0557355303=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CACRpkdaEUUCs3UR9U331wuFTkRswU4tFEg6JLoMVkHeSXfS_sA@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Stephen Warren <swarren@wwwdotorg.org>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, Jon Hunter <jonathanh@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--===============0557355303==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 23, 2016 at 09:49:20AM +0200, Linus Walleij wrote:
> On Fri, Jun 17, 2016 at 6:58 PM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
>=20
> > Oh wait... there's the pinctrl helper function that is a build-
> > dependency. Linus, would you be okay if I took that through the
> > drm-tegra tree along with the DPAUX driver change, and provide a
> > stable branch for you to resolve conflicts against if needed?
>=20
> I have already applied it, but I can rebase and pull that patch out
> on a separate immutable branch and then  merge that branch
> into my devel and then you can pull it too.
>=20
> Would that work?

Yes, that would be just fine.

Thierry

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXa5fsAAoJEN0jrNd/PrOhr3IP/2BsqiFy2AOUFDDVY3CUSinw
vZan6TbE0yv7c47WoxtYq+c7luEbksr5gOEsdNlY4/kuYvDE0D8jG7X2MIm7xQBE
T8Gn5S4t/zRE/XdOIhsl0nqBT3KozWn+L5ZsHfPM8S/sI84IdJB9G8o5asMTAb2J
RJVXIyeJW2i+QrALLgluC1MkyqgJSqyPNlxsYCy9vuxRnyj7e+dU+61EnPPzIkAV
fJt10IBT0CDR0Zr//CxwDW6DNkZGV8RYlxJdp57/y4DwL223m9N8gPpnpb3t1Nk9
GUdUHO7geC5qRbhgdMmf4wyICov5mbf3bIT8XiUE9/xzeGv38dHVMx/DmU+5hhm0
qWZVubYL/6642OcnK1IdmsEiTQrYhXWLoCnOt0F9ICKFfIDjmApZqI4bnnwsrygy
Yvb2H9jkRGJARTUTpc6xaJxYNb4wuhCs4Q4K4Jj2A9+ynyz4F6kZdLE4OD5wnWRi
R2w/t2zm5AOmJ24PIbyLTxEd+wwlgfjcZg4DfvZuuhdM9Rw6cubThR6czTu36moY
pK3JVQ6CGMTi6ABbqOASHUTQ0tE6WKX2uqvpXKAq7xhSuZb3vUreKhk7vxjALqYB
w0PpTWwITcaJfaJ9pTrX9zdCCDQsJcE8pUcGIGKUFv/ufrxNov0i2lOIYdPkwn5f
zPmjDtDgGgEeLQA9DFJ0
=w9Ex
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--

--===============0557355303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0557355303==--
