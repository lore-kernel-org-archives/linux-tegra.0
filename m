From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] mailbox: tegra-hsp: mark PM functions as __maybe_unused
Date: Thu, 10 Jan 2019 09:16:15 +0100
Message-ID: <20190110081615.GD5213@ulmo>
References: <20190108143713.15120-1-anders.roxell@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bajzpZikUji1w+G9"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190108143713.15120-1-anders.roxell@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Anders Roxell <anders.roxell@linaro.org>
Cc: jassisinghbrar@gmail.com, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--bajzpZikUji1w+G9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 08, 2019 at 03:37:13PM +0100, Anders Roxell wrote:
> Without CONFIG_PM_SLEEP, we get annoying warnings about unused
> functions:
>=20
> drivers/mailbox/tegra-hsp.c:782:12: warning: =E2=80=98tegra_hsp_resume=E2=
=80=99 defined but not used [-Wunused-function]
>  static int tegra_hsp_resume(struct device *dev)
>             ^~~~~~~~~~~~~~~~
>=20
> Mark them as __maybe_unused to shut up the warning and silently drop the
> functions without having to add ugly #ifdefs.
>=20
> Fixes: 9a63f0f40599 ("mailbox: tegra-hsp: Add suspend/resume support")
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  drivers/mailbox/tegra-hsp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--bajzpZikUji1w+G9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlw2/08ACgkQ3SOs138+
s6FA9g/7BZnwUwUOpe+vG8m8xTivmfFvce+BAah6q88UtWSGi5VrG1seAVibwTHO
SkMQQgyU8ji+QXgSzoPVexaluII6sYBLzDkIYM7+Jssilms391OflC0gPqIadkxY
jYQMXjDh9rEXo+42W+3lSLw2P5rYpgXEUKcBkCK8zjz6pDYt40X5ApnSsaG0Z3v+
ad3802dUF4x/EgDpqyKkA23LsvM+5PU6DDQ+cjwEt5fwb/BObQSdb3v36BU5gC8/
7l56xyBb8qtjsN7IfuGrFF2RTSr4QMMf0SLu7vaArJlIj9pgO/eKGbms3UulDtpz
23pSEXG/aAFSSvOA/ajcME+2MtYIBxo3FTRT5ED2la7oB+UWr06Tzk7c8J3e7uEG
q+dqzdOT1dmG6dPX+lq9GSlpgwq/jSMmobSswZgnpPu3UW0qvBI6I6pEm2jrzGSN
iDGKWsQAzaYSvwXVTRcQLnPidLDe0B24ExRR/mQkMPDJRrVOcEbJtNw0QiKLF5Cn
MdRfFsulghWaVIlJ2z3MxbNj5sXrKagXrzYtwviZrDX57w6tSIo7wBD3i7zEjBV7
LrwgOFwliyGAT5sd3WFOe5bEJucO/7ELAnaaIqJ65dwoqvTdnOvgOyYzvX6OwqaO
wiiwvk6sfUFVAOaTGAEvfdXmI/HmthDGGH9mwkBzz4ULNKgxrC0=
=NYWm
-----END PGP SIGNATURE-----

--bajzpZikUji1w+G9--
