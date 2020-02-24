From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] PCI: tegra: Use pci_parse_request_of_pci_ranges()
Date: Mon, 24 Feb 2020 14:17:50 +0100
Message-ID: <20200224131750.GA2209519@ulmo>
References: <20191028225136.22289-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20191028225136.22289-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2019 at 05:51:36PM -0500, Rob Herring wrote:
> Convert Tegra PCI host driver to use the common
> pci_parse_request_of_pci_ranges().
>=20
> This allows removing the DT ranges parsing, PCI resource handling, and
> private storage of resources from the driver.
>=20
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> Cc: Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>
> Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> Here's one more conversion to use pci_parse_request_of_pci_ranges. It's
> dependent on my prior series, specifically this patch[1].
>=20
> Compile tested only.
>=20
> Rob
>=20
> [1] https://patchwork.ozlabs.org/patch/1185555/
>=20
>  drivers/pci/controller/pci-tegra.c | 187 +++++++----------------------
>  1 file changed, 46 insertions(+), 141 deletions(-)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5TzPkACgkQ3SOs138+
s6Hb8RAAuBDCgCf7ITjK0QRvKFK25IIEygzPe1+E4wb2eHC0zeX2C0x1bgF1w+Gs
rqijPm12ur/NDaHhpgNKVJYr4P3zBsyDsM4fcdz90g2lbFU93ARE1RkWJ3yB4b/K
qETz7iqTHYNva268HT/CZjPA1au3Yjy/aY4l1lJBdVK4t6g7QeWm3Imze6F/LMb5
qdvrZidTY/Qv/8VXu7ICE6c8XrngCzkqWcC6TBbIXN/6m5ceEYSuuHFIf+M7+X5z
PFjTDuV3A0lULO5XQkxvu5fNmSW6zfxBdxPoI/LnF9YlbAdmVCqikjWCEI2cS/sT
bB83jaqcx+04i6d17eVEiZ4qciysoB9d+K8VK1TH6ffH/wXhIOEdWdRpvd0PxAKL
8AcvR9H8skNkpqbzNvt6ncl06pxc35DJD345Y7fVCUCah0xkS1w7u4aigcQy3QeA
FlXLszvV0+8BNPThj4o+YhpIOfSsOd1xfS3spmNu00PJ1iGWwOYVZNgqHrFIuF6J
DOfTN14zUY/TvyBlfydgYr2bHf2vTHVODeW5C366TCEHeanru2Nhe6fdRE5uzn1R
SrzNaP0DQezNjL/epz2UKZ9559uTw75eWSyM0M8vdow0WnG1AthZSoEWPzYklTDb
whWqkdO+8mG0eL+cCheKkulg2DZa8sfQH5PxWdilpGFx/d6FAZE=
=GutB
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
