From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] mailbox: tegra: Fix superfluous IRQ error message
Date: Mon, 14 Oct 2019 15:24:58 +0200
Message-ID: <20191014132458.GG422231@ulmo>
References: <20191011083459.11551-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lHGcFxmlz1yfXmOs"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191011083459.11551-1-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--lHGcFxmlz1yfXmOs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2019 at 09:34:59AM +0100, Jon Hunter wrote:
> Commit 7723f4c5ecdb ("driver core: platform: Add an error message to
> platform_get_irq*()") added an error message to avoid drivers having
> to print an error message when IRQ lookup fails. However, there are
> some cases where IRQs are optional and so new optional versions of
> the platform_get_irq*() APIs have been added for these cases.
>=20
> The IRQs for Tegra HSP module are optional because not all instances
> of the module have the doorbell and all of the shared interrupts.
> Hence, since the above commit was applied the following error messages
> are now seen on Tegra194 ...
>=20
>  ERR KERN tegra-hsp c150000.hsp: IRQ doorbell not found
>  ERR KERN tegra-hsp c150000.hsp: IRQ shared0 not found
>=20
> The Tegra HSP driver deliberately does not fail if these are not found
> and so fix the above errors by updating the Tegra HSP driver to use
> the platform_get_irq_byname_optional() API.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/mailbox/tegra-hsp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Perhaps Greg should pick up this patch because he's carrying the patch
that adds the platform_get_irq_byname_optional() patch for v5.5.

Greg, would you prefer a copy of this in your mailbox, or does the
following patchwork link suffice:

	http://patchwork.ozlabs.org/patch/1175012/

Either way, this patch:

Acked-by: Thierry Reding <treding@nvidia.com>

Thierry

--lHGcFxmlz1yfXmOs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2kdyoACgkQ3SOs138+
s6HehxAAgC4Sj44wpLRlcNKL7bVIgUtRtc6C5Wu++Zsj+4UDw82vgYCVrFU+dAgy
tApzwfpUXsP9xnkhU2QxCXs+bLDJTa9amAFXDU4FyPTVZBKYk7SB7YgO6h5EvPC2
kmiRIPFaGj79Ufmn6ZP31RlYt0r+VOPdd0ihsKXWuItYlFTrbQMdQpfQuRuveZUD
UCn2RUu9CLFVkNb9HimfFDoSVo+/RiPrzFptzYBAtLw6uePdwj9cS4NoHUp6Q82R
+Emvumx0gkYE8bbsNEZce+hU1jQncjk8JXWLLdFRVDPOGlAA6V+SZd9awIlfKizX
InAtf9AkyPAALGbPJzrg4VmJxzOqlZK1f2ESJSlrUy0q6WFy6yh/6cuDTa7+eMbP
F/Z3KNyelVIB08JEmxvaeHLemX51QDaf34LKrshkMJXg+jh5xRHFyDrlWAm0zZpy
4917C1XKHHQXNcfuW5LVYvNF10gOpuTWYaLSCeCG4E7xZqvl2Ry1NVHmRYr7WPnH
tt5RmPxyJHDB0EgbLIiVcXh2QKTx6aXQOknFzR3Lb9uyzq2EBT7EwpR24qoJnr5Q
9EN62+A6eSVMuy8t6cAD2Ssn5AWPBu7zcBmZfBPNqqvoEIBgqhwbwkKadq1UMD7d
WWzI2TH4xWAqcd8GdmuZg51EsQIcR2N1zKCQphH1ZvveAMUDYqI=
=Kp6p
-----END PGP SIGNATURE-----

--lHGcFxmlz1yfXmOs--
