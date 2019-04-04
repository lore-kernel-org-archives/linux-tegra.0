From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [GIT PULL] drm/tegra: Fixes for v5.1-rc2
Date: Thu, 4 Apr 2019 13:33:14 +0200
Message-ID: <20190404113314.GA11569@ulmo>
References: <20190322131517.825-1-thierry.reding@gmail.com>
 <20190403160659.GL5238@ulmo>
 <CAPM=9tz0+t5cWT43ESEpfOZU=SXFR4QVDK6k6W_FRFOOFsGyGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1251332921=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAPM=9tz0+t5cWT43ESEpfOZU=SXFR4QVDK6k6W_FRFOOFsGyGg@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dave Airlie <airlied@gmail.com>
Cc: linux-tegra@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org


--===============1251332921==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 04, 2019 at 12:15:48PM +1000, Dave Airlie wrote:
> On Thu, 4 Apr 2019 at 02:07, Thierry Reding <thierry.reding@gmail.com> wr=
ote:
> >
> > On Fri, Mar 22, 2019 at 02:15:17PM +0100, Thierry Reding wrote:
> > > Hi Dave,
> > >
> > > The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69ddd=
aa231b:
> > >
> > >   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-5.1-rc2
> > >
> > > for you to fetch changes up to 509869a2fec36ecb2b841180915995f41d5a02=
19:
> > >
> > >   drm/tegra: vic: Fix implicit function declaration warning (2019-03-=
22 14:08:55 +0100)
> > >
> > > I'm a little late sending this out, so I realize this will probably go
> > > into v5.1-rc3 despite the name of the tag.
> > >
> > > Thanks,
> > > Thierry
> > >
> > > ----------------------------------------------------------------
> > > drm/tegra: Fixes for v5.1-rc2
> > >
> > > These are a couple of minor fixes for build issues and sparse warning=
s.
> > >
> > > ----------------------------------------------------------------
> > > Anders Roxell (1):
> > >       drm/tegra: vic: Fix implicit function declaration warning
> > >
> > > Thierry Reding (1):
> > >       drm/tegra: hub: Fix dereference before check
> > >
> > >  drivers/gpu/drm/tegra/hub.c | 4 +++-
> > >  drivers/gpu/drm/tegra/vic.c | 2 ++
> > >  2 files changed, 5 insertions(+), 1 deletion(-)
> >
> > Ping. Can we get this into drm-fixes?
>=20
> Huh this already landed in Linus tree afaik,

Indeed it has. I must've gotten confused because this is not in drm-misc
and I was seeing build failures due to the above.

Anyway, sorry for the noise.

Thierry

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyl63UACgkQ3SOs138+
s6FNSBAAj5wGqSTYydTuHfRtEdhvBWgWT+u35SqrgTy3wX1wwsiOIOyp9R8Npfxo
CylbEx6+Y+EgSM2jIh7L3mKP9fQ3vRLiMpxRAgf2q95FgJrNUkeH2jeGYd/p7ecG
59WhmQEMFZOOUUYrVIPMpeyE5qRQHPzKZ2y6xWNWvo41QOPhI71C3bDPj5B9pYmF
U0Nkp1fOytJv39JWr7R3pi6T7ECIGbL2Am5OkKaISaleQVJrUATQ25g9UZJH1ZK4
h2dbr0Ij4u+TCmF84xBFgr/FAa/EZ1N5fjZuh6tYQ1WwphiF0G0/r1KCqLGQhAGR
/8v/SRbWq+siELHUfDCw9DV6adWNdnC9/raD/xn+aLc1nMe51kAziR/aT04o3Akc
UajMBC0ZZHmnalZ+8bgbQBfXB/mLn0WhGeDF1Txgnzi6P/9bGjZHsVYC/rXNKoMO
AOthtX3N7vbHAvqg3mnIu0+k7dX2KV4bm4D2bNHPHNG3xPMj5kkNfukoeKyWpUh4
ucWmlPJwpF8MG5ttftVNgHen22tgj28c34y+fMYFS5bE5HM6W5m0dkZdekDbhTmh
cAr5SCgbCW5Zuvbr9scjebnEyP0csUwez9X/lGejN07FZYX4SVnTgcaPeFUHoQy9
1FK63HzwqrTm/IA8MS86oiOa94Ph/6hiz0KfFqeMN33cxH59h+E=
=34au
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--

--===============1251332921==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1251332921==--
