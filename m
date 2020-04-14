From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 07/14] clk: tegra: Implement Tegra210 EMC clock
Date: Tue, 14 Apr 2020 16:34:24 +0200
Message-ID: <20200414143424.GG3593749@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-8-thierry.reding@gmail.com>
 <8dc000fb-8867-cf8f-8204-a9e1e79a4811@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pE2VAHO2njSJCslu"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8dc000fb-8867-cf8f-8204-a9e1e79a4811-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--pE2VAHO2njSJCslu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 09, 2020 at 09:24:31PM +0300, Dmitry Osipenko wrote:
> 09.04.2020 20:52, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> > +static long tegra210_clk_emc_round_rate(struct clk_hw *hw, unsigned lo=
ng rate,
> > +					unsigned long *prate)
> > +{
> > +	struct tegra210_clk_emc *emc =3D to_tegra210_clk_emc(hw);
> > +	struct tegra210_clk_emc_provider *provider =3D emc->provider;
> > +	unsigned int i;
> > +
> > +	if (!provider || !provider->configs || provider->num_configs =3D=3D 0)
> > +		return clk_hw_get_rate(hw);
>=20
> This still looks wrong to me. Nobody should be able to get EMC clock
> until provider is registered.

The EMC clock is mostly orthogonal to the provider. The provider really
only allows you to actually change the frequency. The clock will still
remain even if the provider goes away, it just will loose the ability to
change rate.

> This is troublesome, especially given that you're allowing the EMC
> driver to be compiled as a loadable module. For example, this won't work
> with the current ACTMON driver because it builds OPP table based on the
> clk-rate rounding during the driver's probe, so it won't be able to do
> it properly if provider is "temporarily" missing.
>=20
> ... I think that in a longer run we should stop manually building the
> ACTMON's OPP table and instead define a proper OPP table (per-HW Speedo
> ID, with voltages) in a device-tree. But this is just a vague plans for
> the future for now.

This code only applies to Tegra210 and we don't currently support ACTMON
on Tegra210. I'm also not sure we'll ever do because using interconnects
to describe paths to system memory and then using ICC requests for each
driver to submit memory bandwidth requests seems like a better way of
dealing with this problem than using ACTMON to monitor activity because
that only allows you to react, whereas we really want to be able to
allocate memory bandwidth upfront.

Thierry

--pE2VAHO2njSJCslu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6VyfAACgkQ3SOs138+
s6HofRAAia8TjCbY5zDBbRMouJEBKcUyaKEoUaUahRyFSZueh7M+Cbv/OqonijkR
LM4T1jYRzLNA6mhU+k0bDjFhM9NWnCxs5HAAr0uMk6pVdGXMyYnUtqps0mGfVJFd
q6M842aj7XYqZaQcamhCqTC62Bpi5ggbSLzkhV9nv1k5OKR06rXWYu//FAogjIKM
zVHansjaeBdsaeuWg4kvsx6su7IPAyVzYJCO05fooziHEKJjUzouzCkIDSXM6noQ
LhmnidHUVAOHw4Qit4/ccT3azEYYSEuOl1R2P9JyRgR9zvOxp3GJtIOC09KUjyP/
Z8EiLDKlgyMPi4Ev10njlhHjkJ9Sao/ICYYyfzika+RQtdILzCLhx4tIlxsu+Ahp
MOwUU4RYufFF3GGbeCrMd2qwPN15VdxhaiqWUeIlusBLiCSu/jXUdI0VRa06J4dv
wp0gkDdDQE+IxDms1sp3BCppQyMgf7wZvW+obCPTofwUFzs+uyUllZn8Mv9+2QKC
DGO30C2kk2NrA5XZASA/y0+6LQFAzNMIYl+TqKgKuusW3jHeSR1dzPmwl0v1qdb/
YqibANFqzqFbhSbR0JLlG30lZ1LW62AbKCVu6kiyz8xOm34bhQTCNlbtYkopfuHs
RfM7hq61jxfyqyCvwujvw3EIxfdMFwejUCX0vmfCHEfvF24bxQ4=
=V99P
-----END PGP SIGNATURE-----

--pE2VAHO2njSJCslu--
