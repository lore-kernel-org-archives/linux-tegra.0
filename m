From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [GIT PULL] drm/tegra: Fixes for v5.1-rc2
Date: Mon, 8 Apr 2019 11:05:33 +0200
Message-ID: <20190408090533.czyr6ogzc2n4gjgz@flea>
References: <20190322131517.825-1-thierry.reding@gmail.com>
 <20190403160659.GL5238@ulmo>
 <CAPM=9tz0+t5cWT43ESEpfOZU=SXFR4QVDK6k6W_FRFOOFsGyGg@mail.gmail.com>
 <20190404113314.GA11569@ulmo>
 <CAMavQKK7h8u1zN_ZZZyo3yjVvJ_cxQkfzLw+mdEy1kuv2-n2Gg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0080007008=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAMavQKK7h8u1zN_ZZZyo3yjVvJ_cxQkfzLw+mdEy1kuv2-n2Gg@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sean Paul <sean@poorly.run>
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org


--===============0080007008==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yfjqfp4ujzbcmeyn"
Content-Disposition: inline


--yfjqfp4ujzbcmeyn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 05, 2019 at 03:45:10PM -0400, Sean Paul wrote:
> On Thu, Apr 4, 2019 at 7:33 AM Thierry Reding <thierry.reding@gmail.com> wrote:
> >
> > On Thu, Apr 04, 2019 at 12:15:48PM +1000, Dave Airlie wrote:
> > > On Thu, 4 Apr 2019 at 02:07, Thierry Reding <thierry.reding@gmail.com> wrote:
> > > >
> > > > On Fri, Mar 22, 2019 at 02:15:17PM +0100, Thierry Reding wrote:
> > > > > Hi Dave,
> > > > >
> > > > > The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> > > > >
> > > > >   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> > > > >
> > > > > are available in the Git repository at:
> > > > >
> > > > >   git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-5.1-rc2
> > > > >
> > > > > for you to fetch changes up to 509869a2fec36ecb2b841180915995f41d5a0219:
> > > > >
> > > > >   drm/tegra: vic: Fix implicit function declaration warning (2019-03-22 14:08:55 +0100)
> > > > >
> > > > > I'm a little late sending this out, so I realize this will probably go
> > > > > into v5.1-rc3 despite the name of the tag.
> > > > >
> > > > > Thanks,
> > > > > Thierry
> > > > >
> > > > > ----------------------------------------------------------------
> > > > > drm/tegra: Fixes for v5.1-rc2
> > > > >
> > > > > These are a couple of minor fixes for build issues and sparse warnings.
> > > > >
> > > > > ----------------------------------------------------------------
> > > > > Anders Roxell (1):
> > > > >       drm/tegra: vic: Fix implicit function declaration warning
> > > > >
> > > > > Thierry Reding (1):
> > > > >       drm/tegra: hub: Fix dereference before check
> > > > >
> > > > >  drivers/gpu/drm/tegra/hub.c | 4 +++-
> > > > >  drivers/gpu/drm/tegra/vic.c | 2 ++
> > > > >  2 files changed, 5 insertions(+), 1 deletion(-)
> > > >
> > > > Ping. Can we get this into drm-fixes?
> > >
> > > Huh this already landed in Linus tree afaik,
> >
> > Indeed it has. I must've gotten confused because this is not in drm-misc
> > and I was seeing build failures due to the above.
> >
>
> Adding Maxime for a backmerge/rebase of -fixes so we can pick this up.

It's done now, thanks for the notice
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--yfjqfp4ujzbcmeyn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKsO3QAKCRDj7w1vZxhR
xX5QAP93io/IPTe5c+0H51wQbJ1/Rj/clgh3VseaNJ/H43d7sAEAjpLRUaAtUwSz
XYkjfDk6N5/+ui2xg8VJYXYROc9vMw8=
=6zlg
-----END PGP SIGNATURE-----

--yfjqfp4ujzbcmeyn--

--===============0080007008==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0080007008==--
