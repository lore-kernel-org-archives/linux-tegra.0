From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: Fix copypasta in host1x_reloc_copy_from_user
Date: Fri, 23 Jan 2015 12:24:27 +0100
Message-ID: <20150123112425.GA15448@ulmo.nvidia.com>
References: <1421807855-27853-1-git-send-email-davidu@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1421807855-27853-1-git-send-email-davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: airlied-cv59FeDIM0c@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2015 at 06:37:35PM -0800, David Ung wrote:
> Fix copypasta bug for function host1x_reloc_copy_from_user.
>=20
> Signed-off-by: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/drm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I've applied this with a reworded commit message and added a proper
Fixes: tag. It should also go to stable because the offending commit was
merged in v3.17. Yay for not having automated test procedures that could
have easily caught this...

Thierry

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUwi9pAAoJEN0jrNd/PrOhuH0QAK+L4VTwiABiaB4MLnUIO/V+
exyaume/0riVjLfmjPM8vCk8X6Lil63y6o8lxzEgluo9VfKLpuZ5PgXuESi1PY9k
0EuhT43kyVu5zOzrInLUX6wcqRQh9vXmQpY4k7IdcAgHSCMWaKQE1qHoxrEUR74d
5ES38um7oNItDcloHq4OFWTRxX8DwkaltVypEWyRstQNg+j9s7b14AtOK0CNQHEY
K5HTVj5GcSVZe4GCWpRz3ApzrEygNXLpGN7kgGbsZYzwGWP8GwtLKO2z0hsQfsRn
K5DLgo9zB2I8SLUS18Wi9UBCjREL0GXLuQ0By3fGdKgrQyFLJBXcmn5g4rKg2K+H
DLC/3eXLWTUsc4PJFJ73+6Wh0iL6+9Ny/giX58ERh3tkcpJvqNaypn8mDFICsglv
dwPYOHFmipZOnA8ZkDpj6gG2nC+ZeS3shqe7+eUWov+BrbU9b1Txgz2PlPh3T47m
FeZxkbv3HffqEG6fFc/c+ZaWph+B/GZqR9te0APGMyEtZHVxuts2OXOEqPWCEgZw
p9axJohJZ4734wuJBFZrvEryyHGYqzY3sRdc1gkSaIguX/oZTYx7l4mGzJ+eyFdA
ntX34gKH0gXyXu8IQP6XAcIlTmJKTrnoxOd6N8ShQVSVLG6Qu+aVNOHAThyv7LWI
VLXa5QQr/6NasSuvQHZH
=gpX4
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
