From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 8/8] soc: tegra: pmc: Ensure GPU partition can be toggled
 on/off by PMC
Date: Fri, 12 Feb 2016 18:25:40 +0100
Message-ID: <20160212172540.GA29081@ulmo>
References: <1455213806-21871-1-git-send-email-jonathanh@nvidia.com>
 <1455213806-21871-9-git-send-email-jonathanh@nvidia.com>
 <56BDA826.2000304@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56BDA826.2000304-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 12, 2016 at 09:38:46AM +0000, Jon Hunter wrote:
>=20
> On 11/02/16 18:03, Jon Hunter wrote:
> > For Tegra124 and Tegra210, the GPU partition cannot be toggled on and
> > off via the APBDEV_PMC_PWRGATE_TOGGLE_0 register. For these devices, the
> > partition is simply powered up and down via an external regulator.
> > Describe in the PMC SoC data in which devices the GPU partition can be
> > controlled via the APBDEV_PMC_PWRGATE_TOGGLE_0 register and ensure that
> > no one can incorrectly try to toggle the GPU partition via the
> > APBDEV_PMC_PWRGATE_TOGGLE_0 register.
> >=20
> > Furthermore, because we cannot use the APBDEV_PMC_PWRGATE_STATUS_0
> > register to determine if the GPU partition is powered, use the
> > APBDEV_PMC_CLAMP_STATUS_0 register to determine if the GPU partition
> > is powered. The APBDEV_PMC_CLAMP_STATUS_0 register is bit wise
> > compatible with the APBDEV_PMC_PWRGATE_STATUS_0 register and if the
> > clamp is disabled (ie. the appropriate bit =3D=3D 0), then this indicat=
es
> > the partition is powered.
> >=20
> > Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/soc/tegra/pmc.c | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> > index 8e358dbffaed..442232269df3 100644
> > --- a/drivers/soc/tegra/pmc.c
> > +++ b/drivers/soc/tegra/pmc.c
> > @@ -52,6 +52,8 @@
> >  #define  DPD_SAMPLE_ENABLE		(1 << 0)
> >  #define  DPD_SAMPLE_DISABLE		(0 << 0)
> > =20
> > +#define CLAMP_STATUS			0x2c
> > +
> >  #define PWRGATE_TOGGLE			0x30
> >  #define  PWRGATE_TOGGLE_START		(1 << 8)
> > =20
> > @@ -109,6 +111,7 @@ struct tegra_pmc_soc {
> > =20
> >  	bool has_tsense_reset;
> >  	bool has_gpu_clamps;
> > +	bool has_gpu_toggle;
> >  };
> > =20
> >  /**
> > @@ -176,7 +179,10 @@ static void tegra_pmc_writel(u32 value, unsigned l=
ong offset)
> > =20
> >  static inline bool tegra_powergate_state(int id)
> >  {
> > -	return (tegra_pmc_readl(PWRGATE_STATUS) & BIT(id)) !=3D 0;
> > +	if (id =3D=3D TEGRA_POWERGATE_3D && !pmc->soc->has_gpu_toggle)
> > +		return (tegra_pmc_readl(CLAMP_STATUS) & BIT(id)) =3D=3D 0;
>=20
> Well, this is still not right. For devices with
> !pmc->soc->has_gpu_toggle, these devices have their own separate
> register for removing the clamp and so the APBDEV_PMC_CLAMP_STATUS_0
> register will not tell us the status. I need to look at this some more.

Any objections to me applying patches 1-7 while you work on fixing this
last one?

Thierry

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWvhWQAAoJEN0jrNd/PrOh/I4P/33fZ+GpuOoDEHwTd0rYLVTf
tJu1qNs2rnipOB73C2IQ5y6T9RztI+YK6c7MPlP4UVyLiZDn3mPiyx4qeY2T7zaf
fm2hfVkpk0yqXZ2XS/yPqKoe0XLFTaup8v4whjLc2/jcBBE1BJhUOoUcnbFQPn2f
XXGQzY6a8RfH40h+WJUJAJa1fONUmomOII9rdDyP8zB/BJSzbXM/RrMpxgrqGxrH
AZX5scYsQ+nYRw25Qnc6Glb/f5wHnqIDBm/iYakDLaltE5OE4hkDOQEU2d/E2rsH
TjlJwfVSO8EZ6SW69QYwowmkJRFSuMlpcKb0YfqqjDtH/QxS0OEJc5eMyGzDshfX
SjAbqSv/Hkba4RYl3VR57mfKdCfuWwcj9ef6zv2jPbiDyeF2jGIlMlmRMksXmJo/
KqUp31HnlpTGw6K7AyATM3kKRdoCHmAv2QlXAy1SO8N4UtHlAMlv9MIaEYPFb5Nt
dyTuLloHDL+gP60SloLWMCi+4TqcD+2nmo6EtcFktZrVbT1IeArhA5IIKqqfdK3x
cClPqIJT7I7g2oFqKraWwVJSZfqiNft+v4jKKdyRVh5nvtfaeyfVLOYMVWROnimF
fJOVg6eaR7VqVCioAn61boTzQ1e7obmAmQ0xiPLFBEhHVgEwg06picjdEPUd5RuX
LDh2yh2QqY7u+h3SpiYB
=bP2E
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
