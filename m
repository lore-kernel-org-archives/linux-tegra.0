From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: tegra: depend on ARCH_TEGRA,
	not ARCH_TEGRA_*
Date: Wed, 17 Jul 2013 18:57:01 +0100
Message-ID: <20130717175701.GY22506@sirena.org.uk>
References: <1374013667-21435-1-git-send-email-swarren@wwwdotorg.org>
 <20130717083003.GA22506@sirena.org.uk>
 <51E6CDEA.7060003@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8600565776604510394=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <51E6CDEA.7060003@wwwdotorg.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Stephen Warren <swarren@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============8600565776604510394==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kU1KBl72y3ES5hCz"
Content-Disposition: inline


--kU1KBl72y3ES5hCz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 17, 2013 at 11:01:30AM -0600, Stephen Warren wrote:
> On 07/17/2013 02:30 AM, Mark Brown wrote:

> -       select SND_SOC_TEGRA20_I2S if ARCH_TEGRA_2x_SOC
> -       select SND_SOC_TEGRA30_I2S if ARCH_TEGRA_3x_SOC
> +       select SND_SOC_TEGRA20_I2S
> +       select SND_SOC_TEGRA30_I2S

> But then, it won't be possible to disable support for older SoCs,
> since simply enabling a machine driver that might support Tegra20
> would force ASoC support for Tegra20 to be enabled, even if the user
> only cares about Tegra30.

So how do they disable the core support for the older SoCs with the new
model?

--kU1KBl72y3ES5hCz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR5trqAAoJELSic+t+oim9APUP/0B/dh00BnGXXduz4aok4vCF
klN/nECfZQh1XGmMEYpEtxp9euJCqoHWvmBHqShNjH3d9gcwMraGU6XIIRNQsjV9
XDkhzkW9bB7TLmPYlQVHUYc+YpT2cIsph6EDIYI22Y575xZxNLH39jgi28IKaxsA
uyLi++vSeU1NIhoYgxxbuaZ8XiGxjiTeWHsSvBD/KSSpL/+//bJTo8x4N5ZCYtbB
UCcmzDCQuyD11LVH/4yWLYbUS2k20bMudeHka+87YswDWbHbWzWm6HGpMUAhBVyH
94qws0nByT/gM+R/rRdDHIem9BCd8bR5leD92nk2x/Bu5RsOZPjvrp+Dttx6ymDv
7pcyM/Qn04xIs+q2hlkpLYa8A+qkK4KhSfGtCvWHu7QvnHebl4bruySXDvEQO9Ij
y1i0G0c7UpFtUl7GOc3apQZreQnFHCLzNKwyOYRN3pnq3lhX0IRr5Wx+pWw05uIC
b+cX68Kg63FEDvjp1AYfgTjdbKDkrj4wQ/tJCJQrWgalTBZCAzRAPruqYUCGNKYh
KpVhFxDI49IaYKuwrRB5vCpg9fLZFWBegx+dShlyKSmoRXojKhfllymRitTaqUJO
wIh8Y9BM8ut+3qOqEquuIgSZ153rUvdrSGlw+Ih0PvNpNZN8nnGo8yi3RIm+hMjB
K24ZzrVHPBbi5TOeSJZi
=h8I1
-----END PGP SIGNATURE-----

--kU1KBl72y3ES5hCz--

--===============8600565776604510394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============8600565776604510394==--
