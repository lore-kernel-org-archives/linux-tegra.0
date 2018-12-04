From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: sor: Support for audio over HDMI
Date: Tue, 4 Dec 2018 09:42:40 +0100
Message-ID: <20181204084240.GA25962@ulmo>
References: <20181203153642.13562-1-thierry.reding@gmail.com>
 <875zwa8uks.fsf@intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0637243924=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <875zwa8uks.fsf@intel.com>
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


--===============0637243924==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Content-Disposition: inline


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 03, 2018 at 06:05:07PM +0200, Jani Nikula wrote:
> On Mon, 03 Dec 2018, Thierry Reding <thierry.reding@gmail.com> wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >
> > This code is very similar to the audio over HDMI support on older chips.
> > Interoperation with the audio codec is done via a pair of codec scratch
> > registers and an interrupt that is raised at the SOR when the codec has
> > written those registers.
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/drm/tegra/sor.c | 229 ++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/tegra/sor.h |  68 +++++++++++
> >  2 files changed, 297 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> > index b129da2e5afd..22a54434a757 100644
> > --- a/drivers/gpu/drm/tegra/sor.c
> > +++ b/drivers/gpu/drm/tegra/sor.c
> > @@ -19,6 +19,8 @@
> > =20
> >  #include <soc/tegra/pmc.h>
> > =20
> > +#include <sound/hda_verbs.h>
> > +
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_dp_helper.h>
> >  #include <drm/drm_panel.h>
> > @@ -407,6 +409,7 @@ struct tegra_sor {
> >  	const struct tegra_sor_soc *soc;
> >  	void __iomem *regs;
> >  	unsigned int index;
> > +	unsigned int irq;
> > =20
> >  	struct reset_control *rst;
> >  	struct clk *clk_parent;
> > @@ -433,6 +436,11 @@ struct tegra_sor {
> > =20
> >  	struct delayed_work scdc;
> >  	bool scdc_enabled;
> > +
> > +	struct {
> > +		unsigned int sample_rate;
> > +		unsigned int channels;
> > +	} audio;
> >  };
> > =20
> >  struct tegra_sor_state {
> > @@ -2139,6 +2147,144 @@ tegra_sor_hdmi_setup_avi_infoframe(struct tegra=
_sor *sor,
> >  	return 0;
> >  }
> > =20
> > +static void tegra_sor_write_eld(struct tegra_sor *sor)
> > +{
> > +	size_t length =3D drm_eld_size(sor->output.connector.eld), i;
>=20
> This caught my eye, can't be right?

Why do you think it's wrong? The length is the number of bytes that are
to be written to the HDA ELD buffer. This is pretty much the same across
all drivers that support HDMI audio (i915 and nouveau).

Also, audio is definitely working with this patch, and the HDMI codecs
are showing the correct information in procfs.

Can you elaborate?

Thierry

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlwGPf0ACgkQ3SOs138+
s6GR3Q//XlMugaqQSzooyxuunwQzLzG/wDyJbjHdUrzj/Bp/3hoVZ7zcBMOhxfwG
c3d+LXPNZTeFkJze2NdR1uvWZcgMDs8R3LlRgWfrTuTot9+L/OUho09H6abGFdEY
X/MCd5BIDIKKs+cOInGP4/jzPkuL+y01zNUDkz9ejiIxNfEcsf+syWEKTczdSVE8
wlhU0hkKGsg90r5caHAGifHcRK2Bj1zcMDxuwwCgxIMI//GhMpJ2Vx8Prs/T8MVM
qG08XE+K8kMP+Bcn3zoDaSrnYUEFRdB0IpZJQrGTlkLvK/dMS+yu3VoLn8VVYt4q
vZ0tSqifRTFWi96clqNlZlhDdk1/+6lq6DjR561KKHJkifhauYkfF8Jp5x0y+OIz
2lRMX7BX+WcA13hdCLbkk1fADpkVMGPWcQkB36l6+Lb3VFGbVZMusdj6Yao6ll/r
zopGUFFm89mHs/bH6ygUUqzEhF5KOTLo5UjKm+YP9/jPj0cdMRLZtAXvzCr+bhdF
jlYJypJMvLsdeTugWrB4+Sj5z/KVQOp4Hvsq5UqNqZOPd1oucS6eYZe5EGyhUcdU
0I+zXy726gNVDryo9V2LjlfWN2LRqL0q0Zs1JJU9Sk5/xJ/CHABcncC9G8GkTj7c
LKDtzyqzRo7RUfOsFmxXF4Yn2EwoYNCJA0pZ58w+mG59EOYsdyM=
=vhVk
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--

--===============0637243924==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0637243924==--
