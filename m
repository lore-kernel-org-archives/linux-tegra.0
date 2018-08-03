From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1] gpu: host1x: Ignore clients initialization failure
Date: Fri, 3 Aug 2018 12:50:55 +0200
Message-ID: <20180803105055.GC28546@ulmo>
References: <20180801150807.15926-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0164481244=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180801150807.15926-1-digetx@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: linux-tegra@vger.kernel.org, Kyle Evans <kvans32@gmail.com>, Mikko Perttunen <cyndis@kapsi.fi>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============0164481244==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eHhjakXzOLJAF9wJ"
Content-Disposition: inline


--eHhjakXzOLJAF9wJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 01, 2018 at 06:08:07PM +0300, Dmitry Osipenko wrote:
> From time to time new bugs are popping up, causing some host1x client to
> fail its initialization. Currently a single clients initialization failure
> causes whole host1x device registration to fail, as a result a single DRM
> sub-device initialization failure makes whole DRM initialization to fail.
> Let's ignore clients initialization failure, as a result display panel
> lights up even if some DRM clients (say GR2D or VIC) fail to initialize.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/host1x/bus.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)

This is actually done on purpose. I can't think of a case where we would
actively like to keep a half-broken DRM device operational. The errors
that you're talking about should only happen during development, and the
device not showing up is a pretty good indicator that something is wrong
as opposed to everything booting normally and then getting some cryptic
error at runtime because one of the clients didn't initialize.

=46rom my perspective, all clients should always be operational in
whatever baseline version you use. If it isn't that's a bug that should
be fixed. Ideally those bugs should get fixed before making it into a
baseline version (mainline, linux-next, ...), so that this never impacts
even developers, unless they break it themselves, in which case refusing
to register the DRM device is a pretty good incentive to fix it.

Thierry

--eHhjakXzOLJAF9wJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAltkM48ACgkQ3SOs138+
s6Hm1BAAoGsbJGzgHXS7YAf1X9ZYxz85nfkxuOjGHeVKZ0lIOhBDpuWrI3yLURAE
e4rwNMQVJiF+EPQ1n6TIl/WC3qgDaV7YZkaI5giyXkshdrLOE/YOEvRTBItDUIQY
+0/JExd0xNOUbYBId/YWfxVQOhGY+CCEqyg2ElZPYftSS82m88rxWQfmGKsXzh+7
iK0HxrAQIxLyBkbWqOLb3efku+CXFlG0Po8Km/JZ3gb+kpeb8j4JS5ldgy7nTOyu
hjx4vco54+bUoGUpLCGLlVIbVgz7maKrgiZ2LQaw4D+MPZ7pQ4eXUrJhXfXU7esM
FF2nObIzxo2ZR2tV8Ux5RozCKqD5Q6x3iY2YyYzwf2FW+lcADxHMcdxRaKE/HIWW
5f75xsVTJpsEnR7PyvWeJHEgf5zecTO9PQwiQMgqgAppDISrZGnOOXTe7JPyz28B
euJF3ARA/Gme8fQoL7KrNc5nC8cSDyVQIVq/1hIOu0CFjNiWJU1M8B1ZgdKb7umH
6nW06KYXaDBI7NXgx3QAnEuohTTDPsfYTVNw2KtCmNf+HnYrMun4SCACUt/RHJkJ
dO/xO8IV+XVp5knGHxN9tir0Xn7o9qgpU093jX2Uaq5xlsSXW4f9upQ3Qjt6ddjL
ooqeanlSWN/lsbSSOkOwF7e5AIphoq6vrDU1uyl83cTW4pd7oC0=
=em8O
-----END PGP SIGNATURE-----

--eHhjakXzOLJAF9wJ--

--===============0164481244==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0164481244==--
