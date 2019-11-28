From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] PM / runtime: Allow drivers to override runtime PM
 behaviour on sleep
Date: Thu, 28 Nov 2019 17:50:26 +0100
Message-ID: <20191128163623.GA2382107@ulmo>
References: <20191128160314.2381249-1-thierry.reding@gmail.com>
 <20191128160314.2381249-2-thierry.reding@gmail.com>
 <CAJZ5v0haOB1vc8aKk11RR-OnfLHChcqa+z7QkeKyN66s6xM3OA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0129945948=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAJZ5v0haOB1vc8aKk11RR-OnfLHChcqa+z7QkeKyN66s6xM3OA@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Len Brown <len.brown@intel.com>, Linux PM <linux-pm@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, dri-devel <dri-devel@lists.freedesktop.org>, Pavel Machek <pavel@ucw.cz>, linux-tegra <linux-tegra@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>
List-Id: linux-tegra@vger.kernel.org


--===============0129945948==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2019 at 05:14:51PM +0100, Rafael J. Wysocki wrote:
> On Thu, Nov 28, 2019 at 5:03 PM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> >
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Currently the driver PM core will automatically acquire a runtime PM
> > reference for devices before system sleep is entered. This is needed
> > to avoid potential issues related to devices' parents getting put to
> > runtime suspend at the wrong time and causing problems with their
> > children.
>=20
> Not only for that.
>=20
> > In some cases drivers are carefully written to avoid such issues and
> > the default behaviour can be changed to allow runtime PM to operate
> > regularly during system sleep.
>=20
> But this change breaks quite a few assumptions in the core too, so no,
> it can't be made.

Anything in particular that I can look at? I'm not seeing any issues
when I test this, which could of course mean that I'm just getting
lucky.

One thing that irritated me is that I think this used to work. I do
recall testing suspend/resume a few years ago and devices would get
properly runtime suspended/resumed. I did some digging but couldn't
find anything that would have had an impact on this.

Given that this is completely opt-in feature, why are you categorically
NAK'ing this?

Is there some other alternative that I can look into?

Thierry

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3f+tAACgkQ3SOs138+
s6F4mBAAqcwu+TStcK/qpZpkwObpVPR3H5IoPOrDpq8MN9UfrWpbf4uaAcUPdVMj
7yMCZQT8etpz6ZSoyDATX4QqU5RYmAYcYQpVEzHNQ4WryTkba8Z6ElbOZMhlESfs
rNIHFvtYsBwvjPCq4VV4gdjodlKiarKCsKogOwP4CmPGOph0j4bdwyxpuUMhB+bd
nrxkDeDzHNGHqRgg9uGVt23icJnMqlWAl+NCkxvTCzpt3r0BwT2TW4xnZ6IEx9Rx
rcimhfWk9WxMkAKeYK1q9CZBwSeaEMkZ9LtmH242j9rTQj7UiEKnWgm8ogzIsq2X
/ZtPeZ95g5cNGzMJTrmxvteNvoIv2ROaKiOI12HrEAfFtFoHt9sotcNS0awSm5eG
6Yfle+/XfnVyBk+3mPX43r6hULcicnLY281NZ0YP+Av8y40HD0I+ynrjtByj/c3M
XZGsgVEPPNioiPPhKo3i+mbIGqfTiA1NeCb6EP+zHaMkqsswxSLlSckGXb3O3rdc
W0C0KZByR7PkzohlsTSnuV5edDwXWM0lfsBWEtL4PJG7ukNYHCifM4B2IW6ANc40
ACLA3rShB7oY9fuxtVDd4/Q/CK4r+4qLntQ9cF09g0NKUgs7HnIXKbMdcd0WYyWB
5S3TBt8Bir2B64eaa5x/Sr12uLRm+kkzWQMopKNUpI3Dt4Q8D1k=
=U0Wg
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--

--===============0129945948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0129945948==--
