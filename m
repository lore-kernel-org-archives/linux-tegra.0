From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/4] ASoC: tegra: Add a TDM configuration
	callback
Date: Mon, 30 Jul 2018 11:18:00 +0100
Message-ID: <20180730101800.GF5789@sirena.org.uk>
References: <20180727125931.9794-1-jorge.sanjuan@codethink.co.uk>
 <20180727125931.9794-3-jorge.sanjuan@codethink.co.uk>
 <2392df6f-12bc-74fe-ec0f-50dbb7b9a33a@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0794127775264543792=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <2392df6f-12bc-74fe-ec0f-50dbb7b9a33a@nvidia.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, Jorge Sanjuan <jorge.sanjuan@codethink.co.uk>, thierry.reding@gmail.com, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============0794127775264543792==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cpvLTH7QU4gwfq3S"
Content-Disposition: inline


--cpvLTH7QU4gwfq3S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 30, 2018 at 10:31:16AM +0100, Jon Hunter wrote:

> It can be quite common for the fsync-width for DSP modes to be a single c=
lock and so=20
> I am not sure that is makes sense to set this here always to the slot wid=
th. It maybe
> worth considering add a DT property for specifying the fsync width.

DSP modes only care about the rising edge of the LRCLK, the pulse can be
any width without causing interoperability problems.

--cpvLTH7QU4gwfq3S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlte5dcACgkQJNaLcl1U
h9Cmmgf6A3ZVShnwGY8+CbCEKpg10pLzq0i/Hmy7ddaziG8FCQ6DzQDGV80EtWbI
OBpIRBNe9vIek89Z/ZTi3CFMrtF8wWVdREgHSqmGkAwfcvFd4zr6pqKcgVAs5ePt
wWpqWmOmIT+lA4zLbL9Rfg9W4tX9PiK5f+YESyz7fUPjrSPYNYJP1+VBWli4Srdb
/528dsJcuTi9YbOOpQ1JiJZD5DLc5BqjdJMjS9gbr+aqD/0XZaWNmnSVGAcI65JR
Og3Ipd8863WMsRIRO9lm+kVNp+InF9sZKUIgvP9xIbnzPQQeIeWs6xCYuWqVpGiY
HnjLSXrJBDuwU2gXh0ATRxC8GvU6xg==
=5Rul
-----END PGP SIGNATURE-----

--cpvLTH7QU4gwfq3S--

--===============0794127775264543792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============0794127775264543792==--
