From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 01/10] ARM: tegra: Add AS3722 PMIC on Venice2
Date: Fri, 20 Dec 2013 11:25:43 +0100
Message-ID: <20131220102542.GJ27787@ulmo.nvidia.com>
References: <1387469182-14398-1-git-send-email-treding@nvidia.com>
 <1387469182-14398-2-git-send-email-treding@nvidia.com>
 <52B355EC.9040306@wwwdotorg.org>
 <52B3E968.8090906@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6J7GEvtanOfV9oXA"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52B3E968.8090906-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--6J7GEvtanOfV9oXA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2013 at 12:23:28PM +0530, Laxman Dewangan wrote:
> On Friday 20 December 2013 01:54 AM, Stephen Warren wrote:
> >On 12/19/2013 09:06 AM, Thierry Reding wrote:
>=20
> >(Laxman, as an aside, I'm not sure why you're upstreaming patches that
> >don't exactly match the existing kernel support for this board...)
>=20
> I did not get this based on what context it is. Can you please elaborate
> where I am missing the stuff?
>=20
>=20
> >
> >>diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts=
/tegra124-venice2.dts
> >>+				sd0 {
> >>+					regulator-name =3D "vdd_cpu";
> >>+					regulator-min-microvolt =3D <700000>;
> >>+					regulator-max-microvolt =3D <1350000>;
> >Laxman's patch has:
> >
> >  					regulator-max-microvolt =3D <1400000>;
>=20
> We have the Laguna platform on which Android and L4T is running fine. This
> is based on same PMIC used for Venice2. As we are running the more cpu
> stress on Laguna, I took this parameter from the Laguna Power tree where =
it
> is maximum 1.4V. Chrome have maximum as 1.35mV.

Whether this is used on Android, ChromeOS or L4T doesn't matter at all.
It specifies hardware constraints and thus must be agnostic of the OS
and workload.

Also this file describes the power tree for Venice2, so using values
=66rom Laguna is wrong, no matter how similar they are.

Thierry

--6J7GEvtanOfV9oXA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJStBsmAAoJEN0jrNd/PrOhJsYP/A0kWKPa5idr2PnMvzGlFDEA
CeH/DrRkA9GMYpW5LOArNo+OSryHBPcH7BgYjnXSrwQ8aOYos6PX57VNWXQwhCv4
KO+s/i3MVT6KhdESK7UsgPUqwZDv7Dqb620GzXskwh3gT+vjT/doGxhsXD77/6EX
sfzthZiN16qABeLsqjkB9JMuQX1Y85il7bx5yQ/woTE8Oe1vPkGVFAfG3GxLITGF
iGpp9F75cD3Nc3Ei9SYc243WvlPTkZz3gf8FLBwoO+zSW8X3eS8CKHRv/luL+T2A
8Hhy4rjSJ4/Ix0c1QPTH28lekR1nUbcYPaiMwiMAlZo9zzMmemnvz1wFZDgZLakR
PfcrJObFCrpCBwaEDdEThxL/lLcJm8A+JN5kzPQPUptO8Jq0PWM5PF5pPKG0kwDv
uFE6vIMIDogH+jPzErB0DsKNHNWMt1yX9nHUaNkaAvXUXCwUbdpdcVWt5zaz14Ri
cxqI0tjWd5IMSQwBKTxrMSB70leBaFcd7QAR/gNHYNiySGVpMtWpHwU7VpN/MPms
+QHd3RK0Rvewm3/7vh8Txhudio1tx0QOP2uW/bhQ+bcYWFFhhPnb56V2lJ0Gg21J
2Q4xQ6/AYsCeXnpH5DFtSQHQ0z5FZc+3XSjocMq01vDPEdFPOCNPrxii6rPeZZr/
GYzW2sz+JTDadACnKPqI
=WFJD
-----END PGP SIGNATURE-----

--6J7GEvtanOfV9oXA--
