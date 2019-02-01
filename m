From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] host1x: cdma: use completion instead of semaphore
Date: Fri, 1 Feb 2019 15:16:27 +0100
Message-ID: <20190201141627.GA14499@ulmo>
References: <20181210215119.1903413-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181210215119.1903413-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mikko Perttunen <cyndis@kapsi.fi>, Dmitry Osipenko <digetx@gmail.com>, Emil Goode <emil.fsw@goode.io>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 10, 2018 at 10:51:04PM +0100, Arnd Bergmann wrote:
> In this usage, the two are completely equivalent, but the
> completion documents better what is going on, and we generally
> try to avoid semaphores these days.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/host1x/cdma.c | 6 +++---
>  drivers/gpu/host1x/cdma.h | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied, thanks.

Thierry

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxUVLsACgkQ3SOs138+
s6HJrg/8DUV/2aBHeJcobK+v1R27eKQxU2eO6ogjuYEqCg79mGygwLuNgF01sZcZ
TZu+XrXmIXecnfDkFqtNXx3hM4SnMznXijz98TEzFhFRFuqoYd4f5F0QIUVioeYN
BrBjK9mcJy4HR4jpkSvWSXPd9QwQyRvnwHrJKQGUr2O/0ygaGbOyjwUViDVgNx5x
hX/wB5eoGrZ6jFtoQ9U/jOhrIR7Uvu+jKMDGuwL/f1Shzgz2IEI5Wqm85VvmfyAC
8/Pl4trl9kD1cJOlT6NvJhlFKc/fRTlfRJEh5A2Hg2F9XBCAJdNr4BDDspU0+ZNI
HTmqJYgEs3CmADvNWOEpB9WOCnhBxgXWaeTLOYYoQgo9JPK6F0lHs33kakTDdiSc
Zb9mnlJeTIrqa2Zd5VD7adCK0eQ5OQVxCNckU73+dA+I3/dbBsvKh3gTtAlZiNA3
4hcXmBmRhnUjNYAML57QCaQvkrGkfHr2HU/T1EWIdwuAAucyAy15CuT+K/LMEbgX
4eDWQPborhV078etJSuUPiSNZr08G+YQ0I/QBtwYbK+x3X7Y+p5z3prUUSmY08ag
lsqoPC8C5xOk0ESbOEVzh5GRO2qIkoXnHZ4QHLDGfY85jSkiITTi0+oDjW9RNP6R
aTDTu4IkJfqzSL6WciEZfKHCeeL7Jsm3cNUzFXoJq2QaNpepbt4=
=refY
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
