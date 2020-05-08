From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gpu: host1x: Clean up debugfs in error handling path in
 'host1x_probe()'
Date: Fri, 8 May 2020 12:26:31 +0200
Message-ID: <20200508102631.GA3030605@ulmo>
References: <20200426191630.41290-1-christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200426191630.41290-1-christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 26, 2020 at 09:16:30PM +0200, Christophe JAILLET wrote:
> 'host1x_debug_init()' must be reverted in an error handling path.
>=20
> This is already fixed in the remove function since commit 44156eee91ba
> ("gpu: host1x: Clean up debugfs on removal")
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
> ---
>  drivers/gpu/host1x/dev.c | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thierry

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl61M9QACgkQ3SOs138+
s6E5qA/+MmoiWrLTVaFdEnFgY568ldpbMKJel9y+2djQ7IncLvkQt+g/Z6o0ghVD
OkhEvQfWM6rdYUehLaFfN9k1VJ+8VaNqrvDPa+SEfivIS0lDAF5dU4x6rOxN8gFf
t6VHONMlhZsHhPI8jlMvIW+v3OczrbDzXmo5P9o6iKPFDfkqEpbS8FAqlzhpXGPY
qVSmowOZtNJcvF1754ssJFb95uz0kl0XZ6LNa5Pgl1YFHgBAZrUKHtu5ekmvs2hU
tXJB6Z/nyJs8/38HWqQD6+6MjOsPVD3hBEf/Mz6PE3TLSQlTxUoGGvECjU4NNnnl
HrdBPXIOCNYC5a8KAEyaFg9I4jUcpnhwfB7RwXZeFUmUMdl0DZx4m6jckCbD13pV
Qax13ypm7mUuTAh1ZpzI01Vb193QG5Zx3YpSb/cFlFeoe12YXZH+j9lawuoCI83s
TfcwxTaPtYhUd3UnxpW21SKmun49sL12lilKyLhydEWCVcMozaYJUyz7wkJPEoU5
Jkpnu8M1YhW6W3nFa/hOBXdcEHg+LG14DRaGZ/Dfv+9oMRNcOEoW+p7WZSSDODs1
84p1Ec/NedIcB9XJjtaB6RLkwu5PbPk5g7uBEZLl6hVSZfUnXW7/wg/zcuedwkO4
p7GYMpqt2vRfQ7iM4VXH60fqlN3lF1GDj0T5JZsMrclFInwK2dw=
=zg/O
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
