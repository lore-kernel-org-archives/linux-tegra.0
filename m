From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3] ARM: dts: tegra30: Connect SMMU with Video Decoder
 Engine
Date: Tue, 29 Oct 2019 14:13:09 +0100
Message-ID: <20191029131309.GC508460@ulmo>
References: <20190623170730.5095-1-digetx@gmail.com>
 <20190623170730.5095-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DSayHWYpDlRfCAAQ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190623170730.5095-2-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--DSayHWYpDlRfCAAQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2019 at 08:07:24PM +0300, Dmitry Osipenko wrote:
> Enable IOMMU support for the video decoder.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>=20
> No changes since v1.
>=20
>  arch/arm/boot/dts/tegra30.dtsi | 1 +
>  1 file changed, 1 insertion(+)

Applied to for-5.5/arm/dt, thanks.

Thierry

--DSayHWYpDlRfCAAQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl24OuUACgkQ3SOs138+
s6FG0xAAgMsJHddh5VUJbI4i15//MpJSJLnwPjTUM0SfXsxqqMQwzkgqGe+AydBq
IoFAAUvBVOxqMjXw0B5/Thy4tMSqd1VM7gdoY6yMWLD5GUnTH+7Ce5IUGl+5bHif
G0Zl9ehYm2LkDEDTKEeYJ81O60iZtHR7IFdCnpwSD52dmxwnKk072UbpBB4XDW+A
K7yseW78aKMPQ6YmuR1q/iA9a6pPoqDifZl+QCPDxP21wq9OHC3K1OJqJCT+B67f
5B4fCugTTNCTsrHplkty95KBJfwDsrZd/nYA7FZJldeYgRTyIKIHQU6fv9dwDn5C
cYRlp6RPITn0NGSrVanvfPAwk3rorQSfXPbw/At8CRttqkOzp2VOWB2PP3cOvtok
1+SudogUvehLHoiPNKCKR1proc5WYYDaRgZyHmMDxzw6PxF62K9/qM0WhgeVvFoG
TW3aaGq8783udERsm8KeKZDKeFk6MHC0Jam+5nCG/aB5cwqLyEivAx09VpddfsrY
/znhxLFRQZGnbrnqD8+rKk0QMTN0XV3TQ1YP3SeQv6hFt67elWqWEzTcQyqW6Tno
Voa3YOX6NdOVefo/JbaskkUMyWUvhQsV311+u2gfkq7Ba+K1ATjFVzGpYz+mywQc
uxwNWBVJJO6BFaGcraonpnQCMx7Sq8dBqncQXAPfL4JAY1HvJhs=
=Qfvc
-----END PGP SIGNATURE-----

--DSayHWYpDlRfCAAQ--
