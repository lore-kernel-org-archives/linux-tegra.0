From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 09/15] ASoC: tegra: Add fallback for audio mclk
Date: Mon, 9 Dec 2019 20:47:35 +0000
Message-ID: <20191209204735.GK5483@sirena.org.uk>
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-10-git-send-email-skomatineni@nvidia.com>
 <20191209164027.GG5483@sirena.org.uk>
 <7fe879fd-dae3-1e64-1031-cd9f00e31552@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LQ77YLfPrO/qF/pM"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7fe879fd-dae3-1e64-1031-cd9f00e31552@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, alexios.zavras@intel.com, alsa-devel@alsa-project.org
List-Id: linux-tegra@vger.kernel.org


--LQ77YLfPrO/qF/pM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 09, 2019 at 11:31:59PM +0300, Dmitry Osipenko wrote:
> 09.12.2019 19:40, Mark Brown =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> > Why would this need to be a stable fix?  Presumably people with stable
> > kernels are using the old device tree anyway?

> At least Rob Herring is asking to maintain backwards compatibility
> because some ditros are using newer device-trees with stable kernels.

You're talking about forwards compatibility not backwards here.  Are
those distros actually using LTS kernels?

> I'm personally also tending to use the newer DTB with older kernel
> version whenever there is a need to check something using stable kernel.
> Perhaps losing sound is not very important, but will be nicer if that
> doesn't happen.

That really does sound like a "you broke it, you get all the pieces"
situation TBH...  I'd be a lot more comfortable if the stable kernels
were sticking to bugfix only though I do appreciate that they're not
really that any more.

--LQ77YLfPrO/qF/pM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3usucACgkQJNaLcl1U
h9DLZgf/bl+y6tN1f9+6Q5i4PkGjVAppOzDxi0mDZ6TrvcSLsNfAhK9+1IH7w0+x
F90tauu6Flsm9/TnoDK5Csuotm+nKlkXidXNL5qfSzW4azrXes5gdOrwpicKOnEG
7T92jLjHOCPaANNqKrtX+29qAamyxmKOCW/8AKH8SNjerkCDZfZks3yjqilm4i4A
6jwUUAi9ij8TvZlSGteUlqfmib7FdxodH0Gud2q3lYFUKWrKpGnPh823iHtTpiKK
EGDYhbcuS1BeEP6dB/7baejQjkrEjpz7YslmD2KjGlUWIRVEpKPqU/SY63e7mChB
UDCefmC858Tzlkyi7AFFmjnFrTfrMQ==
=IA00
-----END PGP SIGNATURE-----

--LQ77YLfPrO/qF/pM--
