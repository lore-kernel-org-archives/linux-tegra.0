From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] ARM: Tegra: Trimslice: Tri-state DAP2 pinmux
Date: Wed, 13 Jul 2011 20:00:58 +0200
Message-ID: <20110713180058.GB27828@avionic-0098.mockup.avionic-design.de>
References: <1310579091-7424-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wzJLGUyc3ArbnUjN"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1310579091-7424-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Rapoport <mike.rapoport-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--wzJLGUyc3ArbnUjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Stephen Warren wrote:
> DAP2 is used for a bunch of GPIOs. Not tri-stating the pins means audio
> signals get sent out there, and this ends up resetting USB and breaking
> SDHCI too.
[...]
> diff --git a/arch/arm/mach-tegra/board-trimslice-pinmux.c b/arch/arm/mach-tegra/board-trimslice-pinmux.c
> index 82646a4..47c596c 100644
> --- a/arch/arm/mach-tegra/board-trimslice-pinmux.c
> +++ b/arch/arm/mach-tegra/board-trimslice-pinmux.c
> @@ -35,7 +35,7 @@ static __initdata struct tegra_pingroup_config trimslice_pinmux[] = {
>  	{TEGRA_PINGROUP_CSUS,  TEGRA_MUX_VI_SENSOR_CLK, TEGRA_PUPD_PULL_DOWN,   TEGRA_TRI_TRISTATE},
>  	{TEGRA_PINGROUP_DAP1,  TEGRA_MUX_DAP1,          TEGRA_PUPD_NORMAL,      TEGRA_TRI_NORMAL},
>  	{TEGRA_PINGROUP_DAP2,  TEGRA_MUX_DAP2,          TEGRA_PUPD_NORMAL,      TEGRA_TRI_TRISTATE},
> -	{TEGRA_PINGROUP_DAP3,  TEGRA_MUX_DAP3,          TEGRA_PUPD_NORMAL,      TEGRA_TRI_NORMAL},
> +	{TEGRA_PINGROUP_DAP3,  TEGRA_MUX_DAP3,          TEGRA_PUPD_NORMAL,      TEGRA_TRI_TRISTATE},
                        ^^^^

The patch subject and description say that DAP2 is tristated, not DAP3.

Thierry

--wzJLGUyc3ArbnUjN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEUEARECAAYFAk4d3VoACgkQZ+BJyKLjJp9m3wCXWpawBhDtr+Xaja9536JIym4B
XwCeL00XEzdxlFp8VPgV1qsYL2Kg+R0=
=5eK3
-----END PGP SIGNATURE-----

--wzJLGUyc3ArbnUjN--
