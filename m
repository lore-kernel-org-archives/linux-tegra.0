From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] PCI: tegra: Fix argument order in
 tegra_pcie_phy_disable()
Date: Thu, 6 Oct 2016 16:49:34 +0200
Message-ID: <20161006144934.GA800@ulmo.ba.sec>
References: <20161006134303.5595.9298.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161006134303.5595.9298.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Sender: linux-pci-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-tegra@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-pci@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 06, 2016 at 08:43:03AM -0500, Bjorn Helgaas wrote:
> The tegra_pcie_phy_disable() path called pads_writel() with arguments in
> the wrong order.  Swap them to be the "value, offset" order expected by
> pads_writel().
>=20
> Fixes: 6fe7c187e026 ("PCI: tegra: Support per-lane PHYs")
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> CC: stable@vger.kernel.org	# v4.7+
> ---
>  drivers/pci/host/pci-tegra.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Good catch!

Acked-by: Thierry Reding <treding@nvidia.com>

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJX9mR6AAoJEN0jrNd/PrOhnasP/2atYh+va2Q5gdE76k6iAFoI
HelsB+ocJ3TE9pHfJTeWfqH5rXWb8R2yvQERMVpKxpnWD7GFXrE1Apq7r8WNANDB
pOtn7kGnNo1eVrH++8Utppe6+o3xkN2kWTIOFlJFjNeBqzt8SkoedaBHVD6aTagb
dbgb/5yQPyp+bTWQ6H4tfP9FpvV+Jx4JPglyEoz8exvlWpcE0XIjhNRM2/bqJ9E4
WnL35xrcL/dyRq5hRmyXk9b0M6BQH4MHTRTsIS61J8RGInCGMIG/1hSjeKGq1PEQ
AefEUlUpiou3g+tttr/B/+2GX4lhI299RzkxoypTflEMToaJPPL2DPpGeyqaiKu9
n104rKbeHMaCVRkreMmvdVllbYKr8udh+Crz/VUUq1wVAcvo6s1W9ofwTVzPSxoX
5WVqZfcjsdpITDq8hopxmyaWD0+ePfMLEwVWdJJSoK4/CJDq4QDtriHyAr0mVbAB
OjHRrHBGi+ntMsPrYc8b4Sf+6zSKMOe3xzj8tioLu5svaWUg18gIjA0Q6vDcuWiv
1Q+cV10bapErKl9oQaDS/KReE1357meotN3Q+8EXOkoCszzZyBX5Jn3AY6JHm0Di
vAheKUYYm0oJOD33jdSALrQCfiHEFjDUaQlRDS6r3o1CYlw0ZSo4tl26+UchnO2m
LqUUabFCL5J+MYz3IQuJ
=MglN
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
