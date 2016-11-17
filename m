From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] soc/tegra: Implement Tegra186 PMC support
Date: Thu, 17 Nov 2016 18:31:10 +0100
Message-ID: <20161117173110.GA7915@ulmo.ba.sec>
References: <20161117171636.20580-1-thierry.reding@gmail.com>
 <0068ebe4-09f3-4434-fc38-071cf2d553bc@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0068ebe4-09f3-4434-fc38-071cf2d553bc-5wv7dgnIgG8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2016 at 05:28:53PM +0000, Sudeep Holla wrote:
>=20
>=20
> On 17/11/16 17:16, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > The power management controller on Tegra186 has changed in backwards-
> > incompatible ways with respect to earlier generations. This implements a
> > new driver that supports inversion of the PMU interrupt as well as the
> > "recovery", "bootloader" and "forced-recovery" reboot commands.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  .../bindings/arm/tegra/nvidia,tegra186-pmc.txt     |  34 +++++
> >  drivers/soc/tegra/Makefile                         |   2 +-
> >  drivers/soc/tegra/pmc-tegra186.c                   | 169 +++++++++++++=
++++++++
> >  3 files changed, 204 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,=
tegra186-pmc.txt
> >  create mode 100644 drivers/soc/tegra/pmc-tegra186.c
> >=20
>=20
> [...]
>=20
> > diff --git a/drivers/soc/tegra/pmc-tegra186.c b/drivers/soc/tegra/pmc-t=
egra186.c
> > new file mode 100644
> > index 000000000000..ee28eddd8e3c
> > --- /dev/null
> > +++ b/drivers/soc/tegra/pmc-tegra186.c
>=20
> [...]
>=20
> > +
> > +	/*
> > +	 * If available, call the system restart implementation that was
> > +	 * registered earlier (typically PSCI).
> > +	 */
> > +	if (pmc->system_restart) {
> > +		pmc->system_restart(reboot_mode, cmd);
> > +		return NOTIFY_DONE;
> > +	}
> > +
>=20
> IIUC, Tegra186 implements PSCI v1.0 and it always takes above path.
> So what other platforms does this driver support ? The name is
> pmc-tegra186.c, hence the confusion.

It's technically possible to run Tegra186 without PSCI enabled, or even
boot it with firmware that doesn't implement PSCI. In such cases it
would be nice to still be able to reboot via the PMC code above.

Thierry

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYLeldAAoJEN0jrNd/PrOhnmwQAIobHp6hN6qPyZqNP7Yo/YCB
okeAakUD42Gb5LrgCHRBI4qD7mipJd8OxgGQC6IJ95JxT8K3R5zFVRiLWEau6iS1
gi+PrLUVnnTXDgXxon6OGRWhZ+C3zMVK+k2td1Wqf5gsye40M5fEi8uOgRIioJPM
ItPmea+7cPFMKuj0SmxCJ6n5mPxomwJNHasRaDeDfEdCeEdDVIyqERNgYC4sKN9g
NzMbgGTjpZs9gxpsbelKfcoEiXu/i5sMbvahjUFaZLRCI4JelHpzka6Oaw/2ZZjX
vFlHpcmtqJLDMyEtgPQ4p+jAQibNWwQ2iDrlud7C+T0w1d8StoA+93y+u0y+Yasz
w4lGbYAb9Wpbzlw9v+g3eM1YvmdaW0W1PdhuP012FaPbbxCz1URsWHYDL4Lxv9c6
RrfWcFoGWNL/3z9uq9G405ficn0e2v2rWNQVInTNVYQTbjcI/1FhKjph6RMuqr6A
m7JuNTAMlffYt6XIA/Ts+AG4B/jVmBuBHaHLZ6qYok9qxCIJ1JAlBNX+ASiCN4i4
wKbDXAV0VgIjUy8nmiBtr1pj+ur9C9Gx5KPo6tCa9FU/2poBpFD3omo8bdAwZpQc
qtIknJGyhrd79nboNb2oQHqAn2GfYGaE2VSOBmaGRuzyV8JelWzVAgjdglCjP5Lb
6mNDuFAEAX1nPW0tcGxZ
=7TKe
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
