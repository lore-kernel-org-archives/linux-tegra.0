From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH -next] gpu: host1x: Convert to DEFINE_SHOW_ATTRIBUTE
Date: Fri, 17 Jul 2020 16:25:24 +0200
Message-ID: <20200717142524.GA1218823@ulmo>
References: <20200716090323.13274-1-miaoqinglang@huawei.com>
 <20200716133450.GJ535268@ulmo>
 <5684dcb3-c5a4-96c1-dd96-c44f5a94938f@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5684dcb3-c5a4-96c1-dd96-c44f5a94938f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: miaoqinglang <miaoqinglang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2020 at 09:32:21AM +0800, miaoqinglang wrote:
>=20
> =E5=9C=A8 2020/7/16 21:34, Thierry Reding =E5=86=99=E9=81=93:
> > On Thu, Jul 16, 2020 at 05:03:23PM +0800, Qinglang Miao wrote:
> > > From: Yongqiang Liu <liuyongqiang13-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> > >=20
> > > Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.
> > >=20
> > > Signed-off-by: Yongqiang Liu <liuyongqiang13-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> > > ---
> > >   drivers/gpu/host1x/debug.c | 28 ++++------------------------
> > >   1 file changed, 4 insertions(+), 24 deletions(-)
> > This doesn't apply. Can you please resend, based on something like
> > linux-next?
> >=20
> > Thanks,
> > Thierry
> Hi, Thierry
>=20
> =C2=A0 Sorry I didn't mention it in commit log, but this patch is based on
> linux-next where commit <4d4901c6d7> has switched over direct=C2=A0 seq_r=
ead
> method calls to seq_read_iter, this is why there's conflict in=C2=A0 your=
 apply.
>=20
> =C2=A0 Do you think I should send a new patch based on 5.8rc?

No need to. I'm about to send out the pull request for v5.9-rc1, so I'll
just defer this to v5.10 since it doesn't look like it's anything
urgent.

Thierry

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8RtM8ACgkQ3SOs138+
s6Hj6g/+MgjmNXDQakxoDHLk0m84f7i97cY0lrI0Z0XFp0ZsuZp4VHLS0Rzd2wt8
3tb6OLbwu6Q456lBZIw/FKa7i4zJ3bRzV1+dnvZaXPWgVUzSRMEgo6AugBNGQqhy
eQJH+5NfpN75sWFtXjhA/PscNW1v6oR/QkTKa2kcYFtP5xbSWHxVkdRUK/Xl5s15
TGaYsskrZehPE8k+6xNH6c0RIpt6ERO1NxnjrapApW3w98IYen1X8ONjILhJhjny
ZjUJN3WbTaZVo7WtxZWG9G5AMR+5LK8qByRzjf1VoWWpFbiuZaPae/ewRFm8CZeg
jNS3PYpAuSW9Bv0j5o2EEXUK4LV9gAC8ET140dTMmupSLH73Eu1ML7+Lm0TAGkK0
MPmJ8jLc0TMTERdA2Jt5s5sNZttMjaABxgPvl2igT+2zVA3yzyE1E3EO5qpyVQSF
R2AWrcyc9gVdyCElBq5Z39td7OkL4ylG/sboo6xxudgW5gcYo2K2w541CEES9TKm
JWeo5cf8YiBWcoF6ppg+OkTw61NILMjiMopyrd5ZDSOnwAi/oprOyGT7TfQJqazJ
y78QPzi3GrAzlZzMovNWNw+7MIIuig0tYtxVMz1i5/uBAE89ngZjN+09a4G14q4z
0giSD+1Iya4q2w/DBhCIwiyhT53pHp76KrCj/+Xy1+8FUVHUprU=
=J7AY
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
