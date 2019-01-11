From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: core: Fix deferral of machine drivers
Date: Fri, 11 Jan 2019 13:23:03 +0000
Message-ID: <20190111132303.GC2804@sirena.org.uk>
References: <1546968494-22993-1-git-send-email-jonathanh@nvidia.com>
 <20190109183605.GH10405@sirena.org.uk>
 <44a64e6e-c9ec-8eba-60fe-eda092250d82@nvidia.com>
 <20190110164835.GF9541@sirena.org.uk>
 <96f2e729-8ec2-44ee-448c-255c07c068b9@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3729382478369606177=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <96f2e729-8ec2-44ee-448c-255c07c068b9@nvidia.com>
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
Cc: alsa-devel@alsa-project.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Matthias Reichl <hias@horus.com>, Marcel Ziswiler <marcel@ziswiler.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============3729382478369606177==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ALfTUftag+2gvp1h"
Content-Disposition: inline


--ALfTUftag+2gvp1h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 11, 2019 at 08:43:24AM +0000, Jon Hunter wrote:
> On 10/01/2019 16:48, Mark Brown wrote:

> > I'd need to find your patch again and fix the rebase issue.  It was
> > assigning a pointer to a platform IIRC.

> Sorry I still don't see it. Happen to recall the config you were using
> to build? I tried enabling the various SH soundcards (which I believe
> the SCU card is under).

Configure all SND, MFD, REGULATOR and SPI symbols y on top of a base
config which is:

CONFIG_COMPILE_TEST=y
CONFIG_OF=y
CONFIG_I2C=y
CONFIG_SPI=y
CONFIG_REGULATOR=y
CONFIG_SOUND=y
CONFIG_SND=y
CONFIG_SND_SOC=y
CONFIG_SND_SOC_ALL_CODECS=y
CONFIG_SPMI=y
CONFIG_DEBUG_FS=y

(I should add ACPI to that too now I think about it) merged with
defconfig.  I was reproducing on x86.

--ALfTUftag+2gvp1h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlw4mLYACgkQJNaLcl1U
h9Bsmgf/VrAb5Y8CM9kh57w7bWVNWma09eAzafZhXLEn67IHp7wVlo2Tf1hn7o5H
r6SzNs11sE8BT5cpgbC8q69sUKkBWOYeYTuu39B8tzuZZn2pDsZ+7dDCX8aO9foe
Xrq7VUNfMvmQAV+vZ1sa5LK2Qw0BPnjLj0U0RmKcefODPOmwRExGbnBvbkX/UVdq
5bNef1Hc7TF0M8W4sEJ4/f2gNxR8Br4Z4PWt4AwNGVt+9IgxRBDH8Pa2MvsVD3L4
A8SriEM0XwZUcVt4iv5HaWNIdr/qyh7z0KM1ig/dcPPktDpUJgW+mQcxx5mESjz4
qwfz6nppU+e9TWS3E+Mx+XPKVQpfJA==
=vUzz
-----END PGP SIGNATURE-----

--ALfTUftag+2gvp1h--

--===============3729382478369606177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============3729382478369606177==--
