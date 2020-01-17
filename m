From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V3 2/2] PCI: Add MCFG quirks for Tegra194 host controllers
Date: Fri, 17 Jan 2020 12:42:47 +0100
Message-ID: <20200117114247.GA166525@ulmo>
References: <20200106082709.14370-1-vidyas@nvidia.com>
 <20200110191500.9538-1-vidyas@nvidia.com>
 <20200110191500.9538-3-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Return-path: <linux-acpi-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200110191500.9538-3-vidyas@nvidia.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: bhelgaas@google.com, lorenzo.pieralisi@arm.com, rjw@rjwysocki.net, lenb@kernel.org, andrew.murray@arm.com, treding@nvidia.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 11, 2020 at 12:45:00AM +0530, Vidya Sagar wrote:
> The PCIe controller in Tegra194 SoC is not completely ECAM-compliant.
> With the current hardware design limitations in place, ECAM can be enabled
> only for one controller (C5 controller to be precise) with bus numbers
> starting from 160 instead of 0. A different approach is taken to avoid th=
is
> abnormal way of enabling ECAM for just one controller but to enable
> configuration space access for all the other controllers. In this approac=
h,
> ops are added through MCFG quirk mechanism which access the configuration
> spaces by dynamically programming iATU (internal AddressTranslation Unit)
> to generate respective configuration accesses just like the way it is
> done in DesignWare core sub-system.
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> Reported-by: kbuild test robot <lkp@intel.com>
> ---
> V3:
> * Removed MCFG address hardcoding in pci_mcfg.c file
> * Started using 'dbi_base' for accessing root port's own config space
> * and using 'config_base' for accessing config space of downstream hierar=
chy
>=20
> V2:
> * Fixed build issues reported by kbuild test bot
>=20
>  drivers/acpi/pci_mcfg.c                    |   7 ++
>  drivers/pci/controller/dwc/Kconfig         |   3 +-
>  drivers/pci/controller/dwc/Makefile        |   2 +-
>  drivers/pci/controller/dwc/pcie-tegra194.c | 102 +++++++++++++++++++++
>  include/linux/pci-ecam.h                   |   1 +
>  5 files changed, 113 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4hnbUACgkQ3SOs138+
s6HZOhAAnILncAsI0NO4YaCAJyr8nNz9ftnnPp7ihpi/DXe978sztIAM19zmKoJp
wA0zL7ZVnB7apyS9l5/gE2vLHPvjLOSbQUPqg1uNJj13GSQnaEtxjKVVQSnx9aZA
C8ccxXQwOAyiJpASBQsTSxNfdW34vFY7y6gX5pK0wR7gXgeSSBKkFiETgh3LfddG
yqescNSrjVOLk6Mucd1YZuN0JY5Z98+rB22KbGb6tJHh009/QLtfUGQscOcEUUMP
/cyhoOp3EAH7mQMUF2exV1C9EGIJwTtri5MiX7bRV9TttD3cFNakXkh7/+CxsjYj
wCqKYXpLZZxSlyAwpEK8qPEhmd7whtD0io682ymZbKgasvtY0Wyp2gmmuEXWEkdB
e2pWgUcTQ2+wP73Xpd0OS6/tXIPB32ekF7v9GN6gzGoNw6klTSWKE22ttf8BTvHD
JtH1xhXxYw8gpa+lU/WXWz7o4vD+93Blr4Yki1Evo5RHtEIM045+PfN9Di6VppQU
/KvmKo7Njq2rxUy9ZDOhM0nhwbsJpvvr6osTDRH/R7LHg3xv7+gGw9u9NhA2cXdG
7RsrAv7QwwU1ZImZNRdVyrsUk7wo8VhbZ8FwiIns7Dr/Z6AFt9JaxcAc8yWBqQ0z
agWtfFEGWyv9DxXpJtwInejJb0IA/Dj3H+kJ/SYPptT9N/ReMjo=
=iCqM
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
