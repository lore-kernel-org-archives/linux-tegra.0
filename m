From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 17/44] usb: host: xhci-tegra: don't print on ENOMEM
Date: Mon, 5 Sep 2016 11:23:51 +0200
Message-ID: <20160905092351.GA31424@ulmo.ba.sec>
References: <20160825173947.26624-1-wsa-dev@sang-engineering.com>
 <20160825173947.26624-18-wsa-dev@sang-engineering.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160825173947.26624-18-wsa-dev-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-dev-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 25, 2016 at 07:39:09PM +0200, Wolfram Sang wrote:
> All kmalloc-based functions print enough information on failures.
>=20
> Signed-off-by: Wolfram Sang <wsa-dev-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
> ---
>  drivers/usb/host/xhci-tegra.c | 1 -
>  1 file changed, 1 deletion(-)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJXzTmlAAoJEN0jrNd/PrOhYsEQAK7NMj9Id9NDyKvq47ZgDj7n
UkiFZ5LQNWE8GfbNUEvxY53S9RVsW4oApm4MtQ3ZMQ6Lpcr9s3shJXirPMeN0dg7
a2SsxcI0RdETzBtMBVOyItATiwOcLpuFm2RHQCMrMhoCiOXKayqJG7jcl1u3XIzq
Kg3Mx/Elj/Sv62jpUD2rGB9MLe0+8nEuOEavqz2Wnd08YMdLXI7LVZam8RSSW4xL
BlpMp+MagD9gi17q7OI5szLkLfZDnZiRbJEK7Ue9m2So8ZlENVRTpzzwlt6wpeVL
ZvMByh1b6UsSULlN6znRjwCUQ2Otiz/2uurg8hosfJqHnQ49rXOAdvSPFctLqiaw
aGja2rdobmJHLRSNtyvBVTPOCBD9kc9XJ+oeM3VIPeh+ukNsDedMFIn7TUgp6ng8
hPuiuee/A9TkiagdKc90ULrRojUiYChKSk+en85szzsM6n9QR1Jeu6l7num5+vFX
oFR+qPtTddvncDTjJjhmMqTm5KmaDz/zrgLRahdFN5lYmYADfgxzJEuNsVYUpALA
wEWgqNvN+3VdKJWTD+7HzHq37P9nHuWTnY1LrP2FI5vj1GVnzPnMX8SF1EEtWZDA
atrAURRaycWZ1lQClO4CFGVA4yqPYU+wwStOwjQaruGhbrjQpB+8eECARVc+PnrF
rpWx3Jfk4nPQqPT2gOm5
=jb7V
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
