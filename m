From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 1/8] regulator: core: Introduce API for regulators
 coupling customization
Date: Mon, 17 Jun 2019 16:23:40 +0100
Message-ID: <20190617152340.GX5316@sirena.org.uk>
References: <20190603235904.19097-1-digetx@gmail.com>
 <20190603235904.19097-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Swav0nNPrA3tWuBp"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190603235904.19097-2-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--Swav0nNPrA3tWuBp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 04, 2019 at 02:58:57AM +0300, Dmitry Osipenko wrote:
> Right now regulator core supports only one type of regulators coupling,
> the "voltage max-spread" which keeps voltages of coupled regulators in a
> given range from each other. A more sophisticated coupling may be required
> in practice, one example is the NVIDIA Tegra SoC's which besides the
> max-spreading have other restrictions that must be adhered. Introduce API
> that allow platforms to provide their own customized coupling algorithms.

So, I don't completely hate this and I'm not sure there's any good
solutions here...

> + * @balance_voltage: Callback invoked when voltage of a coupled regulator is
> + *                   changing. The callee should perform voltage balancing
> + *                   and change voltage of the coupled regulators.

Some documentation on what the context for calling this is (locking and
so on) and how it should do the adjustments it wants to do would be
good.

--Swav0nNPrA3tWuBp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0HsHsACgkQJNaLcl1U
h9AZ/wf+Pme+NJZgnNHaUP/TA5RgftsxYHZ1bXA8oSKUiZBT9rTdOHx9ZD+S+W0A
gw+3s/TA8Ih05PlGrB9IHVsJErrUKUUemfGB9vK2HLYP5B6FRTAXexN/4jJ3xEZ2
gBbhAAEbzvE9QtOcJEx2bjtHXAVtfsteRJ0vrvm2Ws+Hyvav7vjyAoJ8J8Q7acww
g7fo7iYuiUy7GV3g9GeE/R6y8iKE1/+B3QHKk1q3HY6l1a+Dfpf4/tk8lwR8QSN5
MxwjIb9benyzSlJvaf/sibjUJbXmKaGB145bY2TV6xTz7LOB8CwxwV6nyP//joGB
MdEI1WNmiyjzfwYe31h3sRxWhPviVg==
=S4Pq
-----END PGP SIGNATURE-----

--Swav0nNPrA3tWuBp--
