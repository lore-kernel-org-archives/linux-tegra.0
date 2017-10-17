From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] firmware: tegra: propagate error code to caller
Date: Tue, 17 Oct 2017 12:41:24 +0200
Message-ID: <20171017104124.GD30589@ulmo>
References: <cover.1504776489.git.talho@nvidia.com>
 <c349d38a8cb1d00a4dc11d6aa286fb392017bc8c.1504776489.git.talho@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0IvGJv3f9h+YhkrH"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <c349d38a8cb1d00a4dc11d6aa286fb392017bc8c.1504776489.git.talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--0IvGJv3f9h+YhkrH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 07, 2017 at 12:31:01PM +0300, Timo Alho wrote:
> Response messages from Tegra BPMP firmware contain an error return
> code as the first word of payload. The error code is used to indicate
> incorrectly formatted request message or use of non-existing resource
> (clk, reset, powergate) identifier. Current implementation of
> tegra_bpmp_transfer() ignores this code and does not pass it to
> caller. Fix this by adding an extra struct member to
> tegra_bpmp_message and populate that with return code.
>=20
> Signed-off-by: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/firmware/tegra/bpmp.c | 22 ++++++++++++++++------
>  include/soc/tegra/bpmp.h      |  1 +
>  2 files changed, 17 insertions(+), 6 deletions(-)

Applied, thanks.

Thierry

--0IvGJv3f9h+YhkrH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnl3lQACgkQ3SOs138+
s6Fonw//XJXceV55oTbZC9lvXeaDE3K1B1NiFFpDxRKUjeIyjHQgfiBlItlg9enW
E4rXKN2MNdwqltaHuELOjDMj8chPUVKf7KgoVxHxMJfhvyi9Ln5f7kSzNJzX/04C
iiAfVHxzOhkYaGeMXciHH+rRtH3kDoChWQWn5gYPYhRADAA9lV93/oQ6h1/9SeOe
euM/6Vyj1abqecUS7f0ZgcESJwtsQKjlEYtJkxY7UwerHvvkSOjZfRv+8V4DaaHu
E1tCFOWW8ERxLGP77RSR+kRwjBQCMqxgNxY0J52fftnJjtlBPH3G9+AoOleEyTRP
sr3y94R8y5sHgjP47oKNkKZwCHdZ/I7EOXbg4HjxFVAr9Vddl9gBh5fphoUDpjeX
ncWbxr2pua1+lfTSD6tuKyEnLa8w9dJGxRI2loEIW9NgeI1MtWB9DOlSk2jx9vUW
mou8fJn55F6WIVBeXo2tQrws8QcRFZ2Oxgc1TU3rrDN0HGvmQAPr3uAqH6afyM6+
todzE0srAFW8WOw8htjSGHh8KMOiRdOePhorF882T01hLpLnQ2RFL1BWoFgbgnUW
GUmLaifcCm55ENrU0cCYcITKzsButDfMiqCgNp/+44yDklCMg7oiC/rQ+kvZ3xNl
L6aYUXssEIveHPhVeH2YkWn4/E4FJVgu/YR3YFj9ImiaJ8LZQME=
=tG5M
-----END PGP SIGNATURE-----

--0IvGJv3f9h+YhkrH--
