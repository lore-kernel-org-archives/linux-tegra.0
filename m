From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH -next] ASoC: tegra20-ac97: add missing
 clk_disable_unprepare() on error path
Date: Mon, 16 Dec 2013 18:37:53 +0000
Message-ID: <20131216183753.GL3185@sirena.org.uk>
References: <CAPgLHd8f20ryuiZwUqAHfWb4Uujp6=XyNosVWxjD5E9e7kBdow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3543754978073341705=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <CAPgLHd8f20ryuiZwUqAHfWb4Uujp6=XyNosVWxjD5E9e7kBdow@mail.gmail.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: alsa-devel@alsa-project.org, swarren@wwwdotorg.org, tiwai@suse.de, lgirdwood@gmail.com, robh+dt@kernel.org, linux-tegra@vger.kernel.org, yongjun_wei@trendmicro.com.cn, thierry.reding@gmail.com, grant.likely@linaro.org
List-Id: linux-tegra@vger.kernel.org


--===============3543754978073341705==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AGBBLMjITsWHeOTZ"
Content-Disposition: inline


--AGBBLMjITsWHeOTZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 14, 2013 at 01:29:11PM +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>=20
> Add the missing clk_disable_unprepare() before return from
> tegra20_ac97_platform_probe() in the error handling case.

Applied, thanks.

--AGBBLMjITsWHeOTZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSr0h+AAoJELSic+t+oim9uY8P/2nw1grUKrq7i0kVqMT31TVe
QNmqrwJ6RBiyiSnK8B2ENUy0CqDoSZyXk9vQ5xEzcaWo4SpNc/B/xQy7u0szEwfD
+riL6UjJb8hDdAYSWK4nA2oglaedakGRQ/rdsAPfoaFXbKv8OWl/lQkW9k4xOAiQ
8ng/okFkBUDeHfRaFusS5625iLNOF3gaHFuvr9W1qK1tBzKWGDkFzDB01UNiPok+
jnSDwdN//mJmWk4vA/dczOLL3xgnEBtOpg10g02vmT+oI5x2j2Z991HO+12QoB5b
kEjlba4JWsI6PL4mOD1VrmEsmvz3eFtXfjIgOwv2JGI8oWWdlKndtGg4/RLzKKHY
WdbvcyMbAi3oxstbaUrq6L4LqrxBnL3erpak4T2JDT972SNkERqruw1Sditp1CAF
shafTBpodMR4qRmfvekS1q9FZcOcozMXVCDrKxLOv/kk6tpRz1SlwUN4Z81jxnqE
xAvVBSi4ZO7GiSjpNTESKehOoyx6YCr9XUsfTb6wbA4DZhVpt2TI/v4ISzXjqHdL
DYXahomPJAbONVC02/3gVCRm9SV9lP0LvvqiatRul9/399ionM76z1QeOFAgS2nQ
nAGpJR0QL7SgYj2NvXNZcGxsbZ1jQt3XAn7Ug1xyEWNImq1pphcJj1/z9eo5gsEk
0+6QNEHW4jR3YWQ00vkY
=CrX+
-----END PGP SIGNATURE-----

--AGBBLMjITsWHeOTZ--

--===============3543754978073341705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============3543754978073341705==--
