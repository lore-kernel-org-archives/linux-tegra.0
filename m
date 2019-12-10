From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 09/15] ASoC: tegra: Add fallback for audio mclk
Date: Tue, 10 Dec 2019 18:59:33 +0000
Message-ID: <20191210185933.GJ6110@sirena.org.uk>
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-10-git-send-email-skomatineni@nvidia.com>
 <20191209164027.GG5483@sirena.org.uk>
 <7fe879fd-dae3-1e64-1031-cd9f00e31552@gmail.com>
 <20191209204735.GK5483@sirena.org.uk>
 <560185d9-32fd-a85e-5feb-105f79b953c6@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XigHxYirkHk2Kxsx"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <560185d9-32fd-a85e-5feb-105f79b953c6@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, tglx@linutronix.de, allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, alexios.zavras@intel.com, alsa-devel@alsa-project.org
List-Id: linux-tegra@vger.kernel.org


--XigHxYirkHk2Kxsx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 10, 2019 at 09:24:43PM +0300, Dmitry Osipenko wrote:

> In some cases it could be painful to maintain device-tree compatibility
> for platforms like NVIDIA Tegra SoCs because hardware wasn't modeled
> correctly from the start.

> I agree that people should use relevant device-trees. It's quite a lot
> of hassle to care about compatibility for platforms that are permanently
> in a development state. It could be more reasonable to go through the
> pain if kernel required a full-featured device tree for every SoC from
> the start.

We absolutely should support the newer kernel with older device tree
case, what's less clear to me is the new device tree with old kernel
which is applying LTS updates case.  That does seem incredibly
specialist - I'd honestly never heard of people doing that before this
thread.

--XigHxYirkHk2Kxsx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3v6xQACgkQJNaLcl1U
h9DaRQf/a3YemFgucFyV5HfTaJz5xFhKVR+h6YPRh1yMll+FZbh9bfsgwoQ0yWWe
pu3FNb2UWObN6Yd0c6nIxiIJAqyvPridz15jnQ8mfGSTehSRsbHf6YkTUsDeSpik
LZTQ4pCWNtrA5vJuFJ3i9DMNfOFTQjBOTwnFM0JcecBddROFtPhAG5CseblR7BlT
hBvipkmnrquc66L0hFpbqBoBN4RvHAaYBa+t8GZntPUqrQyN1XxtjJW4Ye+IRS7u
CsSsnVe5WUhZp70+Fa2UxTXhtAnmpTl5cFixH6fq6ynxgwgueKOHDfmLNB/wSR4I
Cg0W+t7FHmBN2Wrd/7z/avBc1teFeA==
=c8lH
-----END PGP SIGNATURE-----

--XigHxYirkHk2Kxsx--
