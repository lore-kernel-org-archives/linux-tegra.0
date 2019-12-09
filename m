From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 09/15] ASoC: tegra: Add fallback for audio mclk
Date: Mon, 9 Dec 2019 16:40:27 +0000
Message-ID: <20191209164027.GG5483@sirena.org.uk>
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-10-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UKNXkkdQCYZ6W5l3"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1575600535-26877-10-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, alexios.zavras@intel.com, alsa-devel@alsa-project.org
List-Id: linux-tegra@vger.kernel.org


--UKNXkkdQCYZ6W5l3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 05, 2019 at 06:48:49PM -0800, Sowjanya Komatineni wrote:
> mclk is from clk_out_1 which is part of Tegra PMC block and pmc clocks
> are moved to Tegra PMC driver with pmc as clock provider and using pmc
> clock ids.
>=20
> New device tree uses clk_out_1 from pmc clock provider.
>=20
> So, this patch adds fallback to extern1 in case of retrieving mclk fails
> to be backward compatible of new device tree with older kernels.
>=20
> Cc: stable@vger.kernel.org

Why would this need to be a stable fix?  Presumably people with stable
kernels are using the old device tree anyway?

--UKNXkkdQCYZ6W5l3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3uePoACgkQJNaLcl1U
h9D66wf9EtL0BmittcbTOCbTdEmV+6j2kRHf90+8kREBk+po5Zgw/f04NXW1VR/o
kLtbsSNRWvW6HVGcWiKcNfqwBnq6P5mb2ufc9OsvjWAKJJNBnZxF2AacAn7/I2my
ck6qGzJj4X70Xdt+KkhdTorKJX8PdX3Az9abC77DTq8cH2kbWt/domujEXrR/36g
XCAXHpj+Id9dTLaqKz8z0ZhYsZlzaaW+QTJ12Ocuayna4rF/JB/P0n94rSjBVSVG
ozfOhg7YYn9Q0NaGtjX7tUNX6vSF48kHKfrhfMIEDtkidq3AogcQACno8rg4amIL
EhtifDhVUKFWuXliJGz3WveE8/2MrA==
=CHYQ
-----END PGP SIGNATURE-----

--UKNXkkdQCYZ6W5l3--
