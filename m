From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] bus: tegra-aconnect: remove PM_CLK dependency
Date: Fri, 10 Jan 2020 12:32:31 +0100
Message-ID: <20200110113231.GC2233456@ulmo>
References: <1561045919-15449-1-git-send-email-spujar@nvidia.com>
 <55217434-2a50-7abe-25c3-6f4f90d8ba34@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7gGkHNMELEOhSGF6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55217434-2a50-7abe-25c3-6f4f90d8ba34@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Sameer Pujar <spujar@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--7gGkHNMELEOhSGF6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2019 at 05:02:27PM +0100, Jon Hunter wrote:
>=20
> On 20/06/2019 16:51, Sameer Pujar wrote:
> > aconnect bus driver does not use pm-clk interface now and hence the
> > dependency is removed from Kconfig.
> >=20
> > Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> > ---
> >  drivers/bus/Kconfig | 1 -
> >  1 file changed, 1 deletion(-)
> >=20
> > diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> > index 1851112..4587ef2 100644
> > --- a/drivers/bus/Kconfig
> > +++ b/drivers/bus/Kconfig
> > @@ -128,7 +128,6 @@ config TEGRA_ACONNECT
> >  	tristate "Tegra ACONNECT Bus Driver"
> >  	depends on ARCH_TEGRA_210_SOC
> >  	depends on OF && PM
> > -	select PM_CLK
> >  	help
> >  	  Driver for the Tegra ACONNECT bus which is used to interface with
> >  	  the devices inside the Audio Processing Engine (APE) for Tegra210.
>=20
> Thanks. We should probably populate the 'Fixes:' tag for this to show
> which commit this fixes. Otherwise ...
>=20
> Acked-by: Jon Hunter <jonathanh@nvidia.com>

Looks like this was never applied. I don't recollect that there was a
specific reason why we shouldn't, so I went ahead and applied this after
adding:

Fixes: 0d7dab926130 ("bus: tegra-aconnect: use devm_clk_*() helpers")

Thanks,
Thierry

--7gGkHNMELEOhSGF6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4YYM8ACgkQ3SOs138+
s6FVRw//T20mgoBuGWTrMprzcNfp4FCfm3vVNQ++PT0MLgHryl4scurRrsBATSKa
9ksRZaXbwGkxrfypVAliBl6VQ012T5daNqnVCc5InnC5fBBwB+D90Bpqe2/dSglX
YhaRrl3bujE/OuHYnoHY/TxOqJjYoIxgJ9WIQExDOxRdPT6y1U/6NQIjARXrDLob
0qo08Pln5nHDoJ2rrYnRaNwC51YGOnNMnv6YQgxJpoPJ5Z82Ikck7WRJv8oFPuCV
tn2UeQM+McZhd3tE/7MhQv6MA95n59+VgcNCNVaFgkN856fzIVMOK0ArDUk1pNgO
a8EACZgWZaXpUOz3V0TPpTJVwNq6p/+xjHb3vQGwLFtIo6NMcq10TYmFpqjv7z7z
HGQeeOk+ZlR1dwaMI6bPMEnccdbQmKesqGn59GtAiejwbcJIoO2/IvERmYX77kNh
opAIwVDUEOE8LWx0WrxmiLOOF8Xgn84IDevhuRR/mNa+GmwPsb4znDMUSfuOi5c8
jV9vDWDd8/oNmQjaPvaEp4f6nI/gO2ghxtjS8HpU+ZaiR0rmwqjq6LRy7lvuqbDS
SpTnqO86uuxLVBFB0Qe2tN572dTdItvvTkAI5WO/bnSFlJGcnPqlIIpbhgr2I6lu
YhTQDFav40BzgLiD44ZHOhixifJMgJKRBCNBP9I3aXJHxESBkgQ=
=zEDp
-----END PGP SIGNATURE-----

--7gGkHNMELEOhSGF6--
