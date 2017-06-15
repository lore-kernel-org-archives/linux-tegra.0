From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 02/20] drm/tegra: Correct idr_alloc() minimum id
Date: Thu, 15 Jun 2017 14:13:04 +0200
Message-ID: <20170615121304.GC30056@ulmo>
References: <cover.1497480751.git.digetx@gmail.com>
 <9c19a44219acd988e678cf9abe21363911184625.1497480754.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ghzN8eJ9Qlbqn3iT"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9c19a44219acd988e678cf9abe21363911184625.1497480754.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--ghzN8eJ9Qlbqn3iT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2017 at 02:18:25AM +0300, Dmitry Osipenko wrote:
> The client ID 0 is reserved by the host1x/cdma to mark the timeout timer
> work as already been scheduled and context ID is used as the clients one.
> This fixes spurious CDMA timeouts.
>=20
> Fixes: bdd2f9cd10eb ("drm/tegra: Don't leak kernel pointer to userspace")
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/drm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to drm-misc-fixes, thanks.

Thierry

--ghzN8eJ9Qlbqn3iT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAllCedAACgkQ3SOs138+
s6HBdw//ZqCtCkZ/Cva9BP+0uKtDGNtexHZgl90+pe0ZpyseCaz3PqyXl5RblINA
svNfOrOKxPinxslv9yQ/4ULJAbaDVRRm4gZpPFZxyvcY3XzgMP1jT0a5NhpUhKjW
Ur8PHgcVRntiHCzN9CmTy2JeAOB6k+D4a2yKhuEtbntMEKQyagIIfDDuqdK9Ts93
OG1jwhDVUMY+8WFT7lZMexKVg8KUD/kxJh0Wmqp2ejWO603Rb47nOQYMery4vG/T
DLdABxMngKCKgp3aMzn4ldtYrmvGm4nRt3ePXMSWh1fjxx8Ttzg7R44/ChNY8LC5
sy4rh3D8Y9T96f5oexQxUwDnDtZqQDpzpVz3SURLSM4x0i5Vs1T/zWXU9G6SmGz6
daHcwsxE8hgFiUVGYepcSYVk3BLZza13+j4nDbl6Qt3is5wU/xmcg2SEXrBH62t5
zuzvGvA6JZUyjujyqwW/NlKCBX62uJgJSIU06XFSWI6ufnCLvSbhb0pfciZSyXIi
JZ/tkAhn9IenYolke3LxFCcApJaeWt3wMk4uJg8EWKJ8O0RK9MI8pv/VjWi76bYI
rRrqutkxabNiYOpni9ShYzjVyZw6lk5cq6hNuGguWSRpMfCo4kwVaTPVYOxK+CKe
XvopfvvsWlygTxwP6RuDTTMIAlwR850XvuzxylquduDtpVRvres=
=6Nfx
-----END PGP SIGNATURE-----

--ghzN8eJ9Qlbqn3iT--
