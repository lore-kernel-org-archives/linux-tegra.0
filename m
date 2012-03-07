From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH/RFC 2/2] arm/tegra: add timeout to PCIe PLL lock
 detection loop
Date: Wed, 7 Mar 2012 07:38:29 +0100
Message-ID: <20120307063829.GA16359@avionic-0098.mockup.avionic-design.de>
References: <1331023544-6439-1-git-send-email-mad_soft@inbox.ru>
 <1331023544-6439-3-git-send-email-mad_soft@inbox.ru>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1331023544-6439-3-git-send-email-mad_soft-aPYA7nAdAYY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Artamonow <mad_soft-aPYA7nAdAYY@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Dmitry Artamonow wrote:
[...]
> diff --git a/arch/arm/mach-tegra/pcie.c b/arch/arm/mach-tegra/pcie.c
[...]
> @@ -639,8 +639,14 @@ static void tegra_pcie_enable_controller(void)
>  	pads_writel(0xfa5cfa5c, 0xc8);
> =20
>  	/* Wait for the PLL to lock */
> +	timeout =3D 2000;

FWIW, the Vibrante kernel uses 300 for the timeout value.

Thierry

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk9XAmUACgkQZ+BJyKLjJp/h9ACfW2R7xi0f+fb2NTSlgOKIYWG7
5kgAoJ0ePwn0g2bF7wd4Emgucpaz4MgL
=PFZd
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
