From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 0/8] Add CPUidle support for Tegra210
Date: Thu, 28 Mar 2019 17:05:35 +0100
Message-ID: <20190328160535.GC5518@ulmo>
References: <20190221072150.4395-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2751738318168488659=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190221072150.4395-1-josephl@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joseph Lo <josephl@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============2751738318168488659==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ABTtc+pdwF7KHXCz"
Content-Disposition: inline


--ABTtc+pdwF7KHXCz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 21, 2019 at 03:21:42PM +0800, Joseph Lo wrote:
> This patch series adds CPUidle support for Tegra210, which supports
> cpu-sleep state for CPU cores. And due to arch timer cannot work
> across CPU core power-down and power on reset signal event. We introduce
> Tegra210 timer driver to work as clock event device. So it can be the
> wake-up source of CPU cores when they idled in the power-down state.
>=20
> Fix in V7:
>  * kconfig fix for 'depends on ARM || ARM64'
>  * move suspend/resume to clkevt
>  * refine the usage of the macro of TIMER_OF_DECLARE
>  * update the 'entry/exit-latency-us' properties in the idle-states node
>  * add one patch for Shield platform support
>=20
> Fix in V6:
>  * refine the timer defines in the timer driver (PATCH 2)
>  * add ack tags from Jon Hunter.
>=20
> Fixed in V5:
>  * Just resend this whole series again with timer and Tegra maintainers
>    included
>=20
> Fixed in V4:
>  * merge timer-tegra210.c into timer-tegra20.c
>  * add a new patch to select TEGRA_TIMER by default for Tegra210
>=20
> Fixed in V3:
>  * use timer-of API for Tegra210 timer driver
>=20
> Fixed in V2:
>  * list all the timer IRQs in the binding doc and dts file
>  * add error clean-up code in timer driver
>  * add entry-latency-us and exit-latency-us properties for idle-states
>    DT node
>=20
> Joseph Lo (7):
>   dt-bindings: timer: add Tegra210 timer
>   clocksource: tegra: add Tegra210 timer support
>   soc/tegra: default select TEGRA_TIMER for Tegra210
>   arm64: tegra: fix timer node for Tegra210
>   arm64: tegra: add CPU idle states properties for Tegra210
>   arm64: tegra: Enable CPU idle support for Jetson TX1
>   arm64: tegra: Enable CPU idle support for Smaug
>   arm64: tegra: Enable CPU idle support for Shield
>=20
>  .../bindings/timer/nvidia,tegra210-timer.txt  |  36 ++
>  .../arm64/boot/dts/nvidia/tegra210-p2180.dtsi |   6 +
>  .../arm64/boot/dts/nvidia/tegra210-p2894.dtsi |   6 +
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts |   7 +
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi      |  33 +-
>  drivers/clocksource/Kconfig                   |   3 +-
>  drivers/clocksource/timer-tegra20.c           | 370 ++++++++++++------
>  drivers/soc/tegra/Kconfig                     |   1 +
>  include/linux/cpuhotplug.h                    |   1 +
>  9 files changed, 348 insertions(+), 115 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/timer/nvidia,tegra2=
10-timer.txt

Patches 4-8 applied to for-5.2/arm64/dt, thanks.

Thierry

--ABTtc+pdwF7KHXCz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyc8MwACgkQ3SOs138+
s6GkrA/+J0q8YkPX5UQ7nACwOrHN2DuZu1tAgso0IMHBYCsseqbISpaIGZc6bw/i
pxrb7ugp/7KVSaXUK0uwnDXKh0pkEMLX8sey8pP/si/EeJbEJ6al1pkzgess2BHp
rJmEdCmDg6yfR4pcMsTCadZ84pB1oLgYUMixUnPqT6G2PjZDDzkj7b0B6VhrLkIO
iCWXdU3laVOLSFpHDtIAjEJfPVFnfUesCIx+dsXvTbg3XlHjBqFhCeIE13C+gNF7
7gaIJanjdncXtJ1rxb0LWu7nVptL7l2jbEpw78Xgha5qikhfee13IeAETLWc+k47
JC4jdhJ7VZV4sV4URepUMurHN7ObI9O5lGuLntLAd5mysiyUmvzkpOSWL/3MNnU8
qVk2x6Z/+fQ0aWpQPzg3Er5tH5JFtfmE8XDTs5Xlvoz309T6lrxs19g8Auaa/Isl
iz1Y6N3u8Kh8jKLoufDXNkh/43RCoB9bGoBg9cPRPntPL6U5dsMN1vRGshLtmdTx
mAweRrsNdLvwiST7UHSp50ny4bA7+cUeMMMUMt0RGwmpW9VZph17mFiYT5eIvYiN
jRXImCAK6hTZYYmJfU/ofenIs9W1JagZfl2Ya9pVnPP7EJjc4xJm24TAGoTcqmna
+/sGpUeHjD0cAelUR7STgqMVyFhaFR4yBEeY/c3JYemQ5GtkKpA=
=t0K7
-----END PGP SIGNATURE-----

--ABTtc+pdwF7KHXCz--


--===============2751738318168488659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2751738318168488659==--
