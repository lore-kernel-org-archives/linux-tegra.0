From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: next/master boot: 142 boots: 2 failed,
 130 passed with 7 offline, 3 conflicts (next-20181129)
Date: Thu, 29 Nov 2018 12:54:13 +0100
Message-ID: <20181129115413.GA28224@ulmo>
References: <5bffcc4f.1c69fb81.ee2e8.b541@mx.google.com>
 <20181129114413.GC10570@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1844727450=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20181129114413.GC10570-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--===============1844727450==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 29, 2018 at 11:44:13AM +0000, Mark Brown wrote:
> On Thu, Nov 29, 2018 at 03:23:59AM -0800, kernelci.org bot wrote:
>=20
> Today's -next crashes on Jetson TK1 when the Nouveau module is loaded if
> it can't find firmware:
>=20
> [    7.617291] nouveau 57000000.gpu: Linked as a consumer to regulator.33
> [    7.624037] nouveau 57000000.gpu: NVIDIA GK20A (0ea000a1)
> [    7.629880] nouveau 57000000.gpu: imem: using IOMMU
> [    7.635013] nouveau 57000000.gpu: Direct firmware load for nvidia/gk20=
a/fecs_inst.bin failed with error -2
> [    7.644726] nouveau 57000000.gpu: Direct firmware load for nouveau/nve=
a_fuc409c failed with error -2
> [    7.653960] nouveau 57000000.gpu: Direct firmware load for nouveau/fuc=
409c failed with error -2
> [    7.662916] nouveau 57000000.gpu: gr: failed to load fuc409c
> [    7.669694] Unable to handle kernel NULL pointer dereference at virtua=
l address 0000006c
>=20
> This has been there for ~30 days but obscured by other issues.  Full
> log and other info can be found at:
>=20
>     https://kernelci.org/boot/id/5bffa74b59b5148342fddd64/

This looks like the same issue that I was seeing a couple of weeks ago.
There's a fix for this here:

	http://patchwork.ozlabs.org/patch/993812/

Not sure if Ben's picked that up yet, though.

Thierry

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlv/02EACgkQ3SOs138+
s6EuiQ/9Fv5B7qL5A21JTPuJlxneNDeHm8kxFkAJBPwsyBW9oE2gdG7NkeWC0nDX
47ymvAvQ7sLa3E0rLC4laxmtwke9Mdzm1R2276o7zL7/n/VbjlOgaiEC3OTXtbxn
CIIa+CnQiQoiMy9imA1FeyIDiKeqM/jEhNXoeg0BS/6vEWcmNAx6HNFBqsIL2Qoj
nk6lskIe+4e7oLTAP4DNRxbutwvvLMFKsE+oOOpSOYjfL0W4/bpYNiUZeeLPytPQ
BijEerjDcbB5jgSdHskQCRzHp3O5C0+Ignxsy4aGYhAmE1k2T8nZZ59sUV5z4qgh
x1cxhMJyELuws/s2lxEI8fp6NLbOClt4V+y0RpYSxm6s6L7/kxN8ijEYMc9PTLLS
5PYW+FDXxsL0IRHoNYDiKSRm9z/eASyySuZNwozlZENnn/gY5XSeqfPTQKy1/9Y2
JKQYDzMc47LiZGJMgPvcvaPjP5lGfH/rp43I2MhoQMIUHXnaFypcOoeHIvJ1uG7m
qGutvKJ246nxT+thBvykMxuaDRHGw2zYMYA1iQZ+EI3R2QfIAtf+zaxjo2+x7BEB
W2pFyO6TL7N+CcTSRQnvIE5lk1zvkDMFUKmVh/oyqy5Ojc86djz0T7prmPa4MhxR
SkEInzdiDfQEyoeNMPgqQH2RHOQ4+so+NFn7IipjkIUT00l/H0Y=
=xC3C
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--

--===============1844727450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1844727450==--
