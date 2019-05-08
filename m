From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH v1 1/6] regulator: core: Introduce API for
 machine-specific regulators coupling
Date: Wed, 8 May 2019 16:55:42 +0900
Message-ID: <20190508075542.GV14916@sirena.org.uk>
References: <20190414175939.12368-1-digetx@gmail.com>
 <20190414175939.12368-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Pv0wy+ojp4n+t/Vq"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190414175939.12368-2-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--Pv0wy+ojp4n+t/Vq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 14, 2019 at 08:59:34PM +0300, Dmitry Osipenko wrote:
> Right now regulator core supports only one type of regulators coupling,
> the "voltage max-spread" which keeps voltages of coupled regulators in a
> given range. A more sophisticated coupling may be required in practice,
> one example is the NVIDIA Tegra SoC's which besides the max-spreading
> have other restrictions that must be adhered. Introduce API that allow
> platforms to provide their own custom coupling algorithms.

This is really concerning since it's jumping straight to open coding the
algorithm in platform specific code which isn't great, especially since
that platform specific code is now going to have to handle all possible
board specific restrictions that might be found on that platform.  Why
is it not possible to express the rules that exist in a more general
fashion which can be encoded in drivers?  I'm not thrilled about later
patches that export core functionality for platform specific use either.

--Pv0wy+ojp4n+t/Vq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzSi34ACgkQJNaLcl1U
h9D1UAf/UAwJK/b/t/+xtrLdSj2q7XnjDc+jt0JG8fzPdnxULJenEbdnDLSPd+S0
VNe0KuOFhyWYAaY9E12iBe8Z3akZ3z5DviE5KODSYlmU9mf4wRgzuC828Ho3Z8Nz
ffbbBWmVu8/3F1OJktrfiuX1e52z25LmXT0c9XNa/EFi1XeMISR9Ghi/Q3sfG45u
1w4eeq2pVflE13N5vtu20vqOpjo3Z8glftnxFN1htIEDAhuhaKSTnmotr9dqQyML
lujag20oYDVKTtb18ZiFnJSEdfYeHqDdiz6BwvOyGwmupyIqS62xe0/h+nyjgMyM
jK5+9dcG0cRbL3BRsuekodVatgxo1A==
=R/Xh
-----END PGP SIGNATURE-----

--Pv0wy+ojp4n+t/Vq--
