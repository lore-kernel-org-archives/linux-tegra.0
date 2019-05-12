From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH v1 6/6] soc/tegra: regulators: Add regulators coupler
 for Tegra30
Date: Sun, 12 May 2019 18:04:46 +0900
Message-ID: <20190512090446.GN21483@sirena.org.uk>
References: <20190414175939.12368-1-digetx@gmail.com>
 <20190414175939.12368-7-digetx@gmail.com>
 <20190508075848.GX14916@sirena.org.uk>
 <af6de446-ab45-1745-30e5-426c6b34421f@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="b/Q3JWIUAuLE0ZFy"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <af6de446-ab45-1745-30e5-426c6b34421f@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--b/Q3JWIUAuLE0ZFy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 08, 2019 at 04:27:42PM +0300, Dmitry Osipenko wrote:

> Constraints:

> 1) The max-spread voltage is 300mV.

> 2) CORE voltage must be higher than the CPU by at least N mV, where N
> varies depending on the CPU voltage.

Those seem like they should be doable in generic code, though the fact
that the constraint is variable makes it annoying to specify - otherwise
it'd just be a minimum and maximum spread.  I'm not really coming up
with any great ideas right now, it's getting into OPP type territory but
it sounds like there's more flexibility for ramping the core voltage so
you'd end up with silly numbers of OPPs.

> 3) There is a constraint on the maximum CORE voltage depending on
> hardware model/revision (cpu_speedo_id) where a higher voltages
> apparently may cause physical damage, so it's better to hardcode the
> limitation in the code rather than to rely on a board's device-tree
> description. This constraint is quite vaguely defined in the downstream
> kernel, I'm not really sure if it's solely about the hardware safety.

I'd expect this to be enforced by the cpufreq driver just not selecting
higher voltages on affected parts.

--b/Q3JWIUAuLE0ZFy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzX4aoACgkQJNaLcl1U
h9BiSAf+PlAvjLtCQwRR2XCmR5U+AAAivAT1sm0iqUlGmSdBNtuUBw609WkyoTmA
KoNugG/GkOu80UcYui0jUCeRfvejDmWwCchaus32RReYk6Ba9PNDw0LMNpbQGIAq
j0o+h0Sy/U7LZxRh/945sGUNmnrpRySwIfl1ethg7mlVUrJJfOoGwEIvLjGazE1i
xrFjQzDWxP/8XXhBTecQN47o6giksCkvdr6FMF7EX//STlsEuZIFQsen0EM8P5QG
QAN+aLmvrePr7FFBwxeVavmzdQZo5aRE5KQ/OYSIQD4FRBDGE6kmhapQa0+djsPv
W5+GFDWNTOrCFEU7TJXZIl5Po5ijlw==
=25S4
-----END PGP SIGNATURE-----

--b/Q3JWIUAuLE0ZFy--
