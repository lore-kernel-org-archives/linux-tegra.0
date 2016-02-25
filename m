From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: core: fix error path of
 regulator_ena_gpio_free
Date: Thu, 25 Feb 2016 10:46:29 +0900
Message-ID: <20160225014629.GU18327@sirena.org.uk>
References: <56CC7863.4080202@nvidia.com>
 <1456302479-14045-1-git-send-email-krzysztof.adamski@tieto.com>
 <56CD75D3.3070805@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8q6ApRMttMB4WTI6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56CD75D3.3070805@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Adamski <krzysztof.adamski@tieto.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--8q6ApRMttMB4WTI6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 24, 2016 at 09:20:19AM +0000, Jon Hunter wrote:

> Make sure you tag the patch as V2, etc, so that Mark knows which version
> to pick up.

Versioning is nice but not totally essential.  What really helps is not
burying new patches in the middle of threads, especially if it's a
multi-patch series (not the case here but people do do that).

--8q6ApRMttMB4WTI6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWzlyAAAoJECTWi3JdVIfQfKEH/3asolHtdsUAgjvGjRDFvfeY
Abn6AI8K40rUWUUUiv2IlyH+8TVTTcRYUsnjijrM5RUFQDOkyyhPL70JmVofHCeM
Eg7BDVdUzNR+ZExmUgxhhghWLxHM2Hvlg/M7YyGjeyolsPplqdOmZmCijMfmfy4B
MialzV07Zj82nijEHL0dsg+5FthTxzNZTIqrCfaAZG+AdbNqk+YcMDXBJNt/0ndk
eQzcu3fE0ByYrAocdIaKyxoZ+NdgeIIaMm5tvWp6wXSGlAzLIUX8BEDNsoxGQjkH
DYItjUdtFnypUghyPTfbzcjkqP4QTr+PNkBIY7cQ4TEWqFSvVuHN8RDeX3uf6tg=
=XV9a
-----END PGP SIGNATURE-----

--8q6ApRMttMB4WTI6--
