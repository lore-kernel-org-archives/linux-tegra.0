From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 1/2] usb: phy: Add Kconfig entry for Tegra's PHY driver
Date: Mon, 11 Dec 2017 11:02:48 +0100
Message-ID: <20171211100248.GD10671@ulmo>
References: <b820f290730e57c999c211e5f82cf833755c299f.1512947332.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LKTjZJSUETSlgu2t"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b820f290730e57c999c211e5f82cf833755c299f.1512947332.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--LKTjZJSUETSlgu2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2017 at 02:09:59AM +0300, Dmitry Osipenko wrote:
> Add Kconfig entry so that other drivers other than ehci-tegra
> (like ChipIdea) could add Tegra's PHY to build dependencies.
>=20
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/usb/host/Kconfig | 2 +-
>  drivers/usb/phy/Kconfig  | 8 ++++++++
>  drivers/usb/phy/Makefile | 2 +-
>  3 files changed, 10 insertions(+), 2 deletions(-)

I don't think we actually build-depend on the PHY driver from the
ChipIdea driver. In the past, we've refrained from modelling runtime
dependencies using Kconfig because in some cases (such as this) it'll
include more than necessary (ChipIdea will automatically pull in the
USB PHY driver irrespective of whether or not Tegra is enabled).

Thierry

--LKTjZJSUETSlgu2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlouV8gACgkQ3SOs138+
s6EX4Q/9G8MlT8qwMzotfpafj8jVbSIbGCe3+SfcCIRKmodJ1VWEYnRGhsAmfyVg
GLfmNMFeGtMlte5J8t2oKYAgvv2Fd/GWztofNmlyhm142zDe6KEuVPXk5kiVCG0o
7xLFQ6PdzGFT9UysuiIL3U5YCN2Nfb4BUXgis0GoeZcqaPNaIZ72o9VIHGlbkC5u
fDe1C0ODONd2UwBuwqCWcxxZ6Pf4SjjDnAELnKj9ayetWYpxNFQhX19t1lloGG3p
2nCYdyuDdQy7/HZ8ElI96W65akxcWjA7CFJa8wVCEmsSgiDsEnJNUCooKp9XEAVg
QAAZm1OXA/njdLX3aAfaXTJsOKseSOkhMSk6wu77Y63o24PZpW0EwqyhjODgUpME
OZAOPk6ncJieVx+VQKHOcGC/OWM8hLnP8tdfXLRIx7cyotExvLaspNmOw285A2uK
Oraa/eSETKLzXc8yhZR1eD+YZvywpOoIJWv8LCVXyTgLs33rQmdw8a9McVjOFAqa
nUOKzo3/bPOrIpLiMaRFyP+ahA1hXwUIwP6GxwOunXXB/tsAilFZ+C9utGaJ6uaN
O6rGhNjB3a6moMi/lxtlN4SvbjpbqWpPMlw+JanezfED0poixEY2a0TrrI8e+vuv
ogW0p/YlGLOQOT2G9FQ+AePSGTUAeQWGqeoQYDFtJQ7nMUlI6YU=
=mUHF
-----END PGP SIGNATURE-----

--LKTjZJSUETSlgu2t--
