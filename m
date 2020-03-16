From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL 10/10] phy: tegra: Changes for v5.7-rc1
Date: Mon, 16 Mar 2020 14:48:50 +0100
Message-ID: <20200316134850.GB3825456@ulmo>
References: <20200313165848.2915133-1-thierry.reding@gmail.com>
 <20200313165848.2915133-10-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="K8nIJk4ghYZn606h"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200313165848.2915133-10-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--K8nIJk4ghYZn606h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2020 at 05:58:48PM +0100, Thierry Reding wrote:
> Hi ARM SoC maintainers,
>=20
> The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862=
b9:
>=20
>   Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-5.7-phy
>=20
> for you to fetch changes up to 04c929223d1db6ad4ba8e4c23122e1052f670c2e:
>=20
>   phy: tegra: xusb: Don't warn on probe defer (2020-03-13 09:17:50 +0100)
>=20
> This is a dependency for the USB changes that are also part of this
> series of pull requests, so it was deemed easier to take this all
> through the ARM SoC tree. The patches have all been acked by Kishon.

Please don't merge this just yet. Stephen reported today that this was
breaking the build in linux-next because of a conflict with the USB
tree. I'll rebase this on top of Greg's usb-next branch and resend the
pull request.

Sorry for the inconvenience.

Thierry

--K8nIJk4ghYZn606h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5vg8IACgkQ3SOs138+
s6FqWw//c6MHAtQmVy/jmygoyRjW60kHc9dGR6wmzgrZ2PEAN3SPkKHxMmsAOjQ1
POFT7wg72m/PWduosFoVp6hLzSgVLFEY4HhEtuEGV9LaAtiEkDCmCSa3Q0cHsxhI
SPYBmvkfmX3pWU0asxuh18gQJ8N2umoD99whfEgi4fwfwVpM19vrYdmpfjn43YrO
RgNKr8v5/nL390jLNKqTwb4vv8uHOq5lSMG7udBFWH57JiOiajAHqVdigo6R/QGG
WLkP3qS5Q+dQ1JH6NII68bFgCZNUxJweOaQXb9lBERmqmBdhWUqBtmoOu72hkZwT
iBo0uXtAToTQ1i5N8+9GQi85BDoa3/ZktIiHeJPLAjRGSB1U2l3SU387cB8/DR+M
nY47ctZlt6+oD3guO1Ilh8HxCqu8MV0OdnlauEZRDriunAaH5Xcg2STsPqUErjZg
skbyWtMNbkx/XSNVkYkX2LSE0Pn5m/PUdsD7ieD40jOtHzkvi8njKRvE5F3KHCFg
vc1EwoVYJ9e6EMsF0g9c+4Fxf/AhL9WcUqCfscSFLk14pSo40yQ3qc0QRMsbuFas
1GQMWuPCMICvf7UxVfCg6bjKZgPAhSmRuF/Y2XUOo00DyksRUpr4JxmQN31XTqDh
U+6rwgMb5I6RKtr2JxYdxKpWg+kwdZqOfr3zNg4PYJK4jq0WRpw=
=s9Fz
-----END PGP SIGNATURE-----

--K8nIJk4ghYZn606h--
