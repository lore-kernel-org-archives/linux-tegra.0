From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Date: Mon, 27 Apr 2020 12:49:40 +0200
Message-ID: <20200427104940.GA3464906@ulmo>
References: <470b4de4-e98a-1bdc-049e-6259ad603507@nvidia.com>
 <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
 <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <20200427084424.GA28817@kunai>
 <820200ce-17f3-18c0-6f79-3e582f45492d@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <820200ce-17f3-18c0-6f79-3e582f45492d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2020 at 12:07:19PM +0300, Dmitry Osipenko wrote:
> 27.04.2020 11:44, Wolfram Sang =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >=20
> >> Wolfram, can you revert the following two patches for v5.7, please?
> >>
> >> 	8814044fe0fa i2c: tegra: Synchronize DMA before termination
>=20
> This patch has nothing to do with your trouble, why do you want to
> revert it?

It was part of the same series and addressing the same "busy CPU"
scenario, so I think it makes sense to keep both in the same series. I
guess we could try to run some tests with only this applied and see if
that really doesn't break anything. If so, I don't have any objection
to keeping this.

Thierry

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6muMQACgkQ3SOs138+
s6HF2BAAqZf92sFTs/Eyv87f5posF3vq/kOLjtXrGynwpI3AifzD9eQ6i64bHgI6
2+Bygj2uHJCx7PAstQ8VvHjd/uRNa6b2ZACjOoVf17mcGhfUT+0LafnEHC3JqJ+z
kFmak2jgejP0LY/RGmvrJi79/cTituLrKeFR62kwrXojfMe14kS81sZ8uZ2ki6Na
MlyQdkSKJvkueA7cSN+J8QW+TDHrdMfGV3cn5DiR4UNs2JbwbxTawByKImMt/pCp
0fY+q9LSo9XAjR0tx9xo5h/+XfbxgwxKGvlmiy/PrGxltKWluFbgZbK8WBP/uSVD
j77w1WlqqlW3Xv90ysW027FE6sJi5KvtZpacuHJdM0AzgqB0148hWOd7VURngg5E
8v/hs2RPD4wWET1O7DrIAZY3HbSXPuXuoNMnkTcVsZaDofV/R+yh4T7munkBhrnq
/y0hnxsvmZu/MvuA6Dzy5k+aHALtJxc3IxDqJA+FbPsIisnDaIu8tZF9tpPitNdm
KtMsYLxFfFSMA+hvTnrOSlalTk2DYXh7NuYBd0z9MkkqQHm2e/reDpr8houPxzN5
oNYTHosfzOsmklBvZ5seMR9zjFKeAhhC37+EWi5KCbbfuq0uRJViDIRJwLSeoie+
z0RgqB2aX6q0QKtsaubnnEolKKPl8eKyGe5v9EJd1uenzeEBAaw=
=+wzR
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
