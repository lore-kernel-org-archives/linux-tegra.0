From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: sor: Support for audio over HDMI
Date: Tue, 4 Dec 2018 11:09:12 +0100
Message-ID: <20181204100912.GA27857@ulmo>
References: <20181203153642.13562-1-thierry.reding@gmail.com>
 <875zwa8uks.fsf@intel.com> <20181204084240.GA25962@ulmo>
 <8736rd8wlf.fsf@intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0563090563=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <8736rd8wlf.fsf@intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: linux-tegra@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>, dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============0563090563==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 04, 2018 at 11:33:48AM +0200, Jani Nikula wrote:
> On Tue, 04 Dec 2018, Thierry Reding <thierry.reding@gmail.com> wrote:
> > On Mon, Dec 03, 2018 at 06:05:07PM +0200, Jani Nikula wrote:
> >> On Mon, 03 Dec 2018, Thierry Reding <thierry.reding@gmail.com> wrote:
> >> > From: Thierry Reding <treding@nvidia.com>
> >> >
> >> > This code is very similar to the audio over HDMI support on older ch=
ips.
> >> > Interoperation with the audio codec is done via a pair of codec scra=
tch
> >> > registers and an interrupt that is raised at the SOR when the codec =
has
> >> > written those registers.
> >> >
> >> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> >> > ---
> >> >  drivers/gpu/drm/tegra/sor.c | 229 +++++++++++++++++++++++++++++++++=
+++
> >> >  drivers/gpu/drm/tegra/sor.h |  68 +++++++++++
> >> >  2 files changed, 297 insertions(+)
> >> >
> >> > diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor=
=2Ec
> >> > index b129da2e5afd..22a54434a757 100644
> >> > --- a/drivers/gpu/drm/tegra/sor.c
> >> > +++ b/drivers/gpu/drm/tegra/sor.c
> >> > @@ -19,6 +19,8 @@
> >> > =20
> >> >  #include <soc/tegra/pmc.h>
> >> > =20
> >> > +#include <sound/hda_verbs.h>
> >> > +
> >> >  #include <drm/drm_atomic_helper.h>
> >> >  #include <drm/drm_dp_helper.h>
> >> >  #include <drm/drm_panel.h>
> >> > @@ -407,6 +409,7 @@ struct tegra_sor {
> >> >  	const struct tegra_sor_soc *soc;
> >> >  	void __iomem *regs;
> >> >  	unsigned int index;
> >> > +	unsigned int irq;
> >> > =20
> >> >  	struct reset_control *rst;
> >> >  	struct clk *clk_parent;
> >> > @@ -433,6 +436,11 @@ struct tegra_sor {
> >> > =20
> >> >  	struct delayed_work scdc;
> >> >  	bool scdc_enabled;
> >> > +
> >> > +	struct {
> >> > +		unsigned int sample_rate;
> >> > +		unsigned int channels;
> >> > +	} audio;
> >> >  };
> >> > =20
> >> >  struct tegra_sor_state {
> >> > @@ -2139,6 +2147,144 @@ tegra_sor_hdmi_setup_avi_infoframe(struct te=
gra_sor *sor,
> >> >  	return 0;
> >> >  }
> >> > =20
> >> > +static void tegra_sor_write_eld(struct tegra_sor *sor)
> >> > +{
> >> > +	size_t length =3D drm_eld_size(sor->output.connector.eld), i;
> >>=20
> >> This caught my eye, can't be right?
> >
> > Why do you think it's wrong? The length is the number of bytes that are
> > to be written to the HDA ELD buffer. This is pretty much the same across
> > all drivers that support HDMI audio (i915 and nouveau).
> >
> > Also, audio is definitely working with this patch, and the HDMI codecs
> > are showing the correct information in procfs.
> >
> > Can you elaborate?
>=20
> Ugh, apologies for being too terse in my reply, as well as utterly
> wrong, and also too ashamed to admit after the fact where my fallacy
> was!

No worries.

Thierry

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlwGUj8ACgkQ3SOs138+
s6EqYw/5AV2jKclNeMym6MZ1RuUbLY/+Vr+cF5YDOIor4rZ8A7P0eDJioEvBCOIa
65fxr40IXV+ymFJp1yLp28L5M5J1qVccpIhnUDd5iUHDXrXPQkKVGzqGXR92IZWZ
jgDanyaNcqxmCfwclgrqKMx3g2Zfg11sefrw2IsmrNOSktYPzlhJQctomjafBGdr
gDOe97iNOLu4IUlc0Ws9xWiEFGR1Ao4mA8RiaWcPLfSHenjJAV3/fOGtdDULtsJd
tFP3MohveHeeQRVoT4S+h4kk6PH89BOuY1SsInsSH9qA2qGSR+lWjEoI9hrqt1Pj
5k9KLHc0tKi5xgAZl2e22W893/lkRQn1IWxDzzH7rg2mVJZ8tGsQkfRBzvoj8Hqy
tHbmT24LvEjQGiMrnjlpXQCmuJq/H7UrbULcj28kGWICyFu11srPfUy55OvlhC4d
kYvvm2QMGA4x5O4RKIwXt/h4lNST70LwO9uG03Ai/vsHqaRIOMGWgtyDvEAuQvYL
QM9BTVxnL/mx0zj5DodvyCoZZxYrSclIwrWvxFNF++CJHNF/JLXmpAXyaM8F+n4s
h96GyI02lu7vxBsFaN+lf3u5UxsP/7LQnRLr2EIzcht7Y8KyzGW2SBY7i+n0B35M
hGR5CMBYp3vuBvIovV/pA9onyq09WqmzIHnaZu+HgBuBcApZmb8=
=6AhR
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--

--===============0563090563==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0563090563==--
