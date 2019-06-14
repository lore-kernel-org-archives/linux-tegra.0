From: Thierry Reding <treding@nvidia.com>
Subject: Re: Cleanup of -Wunused-const-variable in
 drivers/usb/host/xhci-tegra.c
Date: Fri, 14 Jun 2019 11:09:27 +0200
Message-ID: <20190614090926.GB14954@ulmo>
References: <CAJkfWY4nKwyPDh=MuCURst2SZceceeR2v3qrT9UY=VbvLnEmFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="p4qYPpj5QlsIQJ0K"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJkfWY4nKwyPDh=MuCURst2SZceceeR2v3qrT9UY=VbvLnEmFg@mail.gmail.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Nathan Huckleberry <nhuck@google.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
List-Id: linux-tegra@vger.kernel.org

--p4qYPpj5QlsIQJ0K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2019 at 11:38:38AM -0700, Nathan Huckleberry wrote:
> Hey all,
>=20
> I'm looking into cleaning up ignored warnings in the kernel so we can
> remove compiler flags to ignore warnings.
>=20
> There's an unused variable ('mbox_cmd_name') in xhci-tegra.c. Looks
> like it was intended for logging or debugging, but never used. Just
> wanted to reach out to ask the best steps for cleaning this up.
>=20
> If the variable is no longer needed I'd like to send a patch to remove it.
>=20
> https://github.com/ClangBuiltLinux/linux/issues/533

Feel free to send that patch. If we ever need this debug information
again we can easily add it back by reverting.

Thierry

--p4qYPpj5QlsIQJ0K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0DZEYACgkQ3SOs138+
s6F0tw//W5cSvT/bzIDSSWLG2gWjBGan521TaQV9D62U4c5bYKIDMGBGyXKIQkPC
yL81T65cFTzuAD/+4isvxTihI42lYK5CbI1JyjKdE2SGjrMOQQkrm7+O02FGye4w
TDje5ir0HRUx2KtjfuDbjvRKlUY3Q/gp8255k4KPSY3ZozepzO1FrjaaXMew6bn1
xcWtVh8LVqcsGbP0Ifp0bMrHx7mKHajEnhtPtevnH1/11ELJE86l/iOOekjL151m
feA9Vs5v4NB84NRFE3HVx9c5N8DBdmuLfDHgrECIbP/xvbgGrqKQi+6a0cZOMZcB
LJ9oTATYH/FpbmFOg7MCrfjkU4eKP6xVUjL+Y3qD7iha7IWuWxGuK+QtrWhq3Bxq
qiE4r5eFdRVAu44dl0GoNIuNzlHqiuOvZ52DyTzHuBqEkyLYQYm4NqHsFgjHMwnd
cz2oALUYAcrhFv8qfSVeqDIg23PK7ulrAt2hBUaDDDD8hYOc2WIdVw3xg7wCa9qb
ZW07rRakhLV1xsoIhcbKhKzSpVNymchyI5HvrRQyY5nVdx99N4dyHO6rDrMHWAQE
VUautrjtchnOkHpIPQi+rkcZjCqtGK1GNfpljSP42WSZCYeOZJMoFbkdfU5AVRVu
wSxU5NEnY4uo4Xm31cvUXd+DU14SuF+kicc02+fU9GuKnVfc/Is=
=BAJT
-----END PGP SIGNATURE-----

--p4qYPpj5QlsIQJ0K--
