From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH] ARM: dt: tegra: paz00: configure power off
Date: Sat, 12 Mar 2016 14:34:31 +0100
Message-ID: <2473480.r8zbktHrhX@fb07-iapwap2>
References: <1457730000-11868-1-git-send-email-zombah@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1613468.fv5e0luEql"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457730000-11868-1-git-send-email-zombah-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Misha Komarovskiy <zombah-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--nextPart1613468.fv5e0luEql
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Micha,

Am Samstag, 12. M=E4rz 2016, 00:00:00 CET schrieb Misha Komarovskiy:
> Add DT property to tell the regulator that it should provide
> the pm_power_off() implementation. This fix "shutdown" issue
> on this device.
>=20
> Signed-off-by: Misha Komarovskiy <zombah-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>=20
> Tested on current mainline version, ac100 models 116 and 117,
> successful rate of "shutdown" increased from 10% to 90%.
>=20
>  arch/arm/boot/dts/tegra20-paz00.dts | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/tegra20-paz00.dts
> b/arch/arm/boot/dts/tegra20-paz00.dts index ed7e100..c82e3ae 100644
> --- a/arch/arm/boot/dts/tegra20-paz00.dts
> +++ b/arch/arm/boot/dts/tegra20-paz00.dts
> @@ -316,6 +316,8 @@
>  			#gpio-cells =3D <2>;
>  			gpio-controller;
>=20
> +			ti,system-power-controller;
> +
>  			sys-supply =3D <&p5valw_reg>;
>  			vin-sm0-supply =3D <&sys_reg>;
>  			vin-sm1-supply =3D <&sys_reg>;

I think this is the wrong fix. The power_off hook is already occupied by nv=
ec.=20
So either the tps or nvec is responsible for shutting down the system. AFAI=
R,=20
nvec has some hard wired connection to the tps for doing this, so in the en=
d,=20
it will shut down (but I can't find it now in the schematics). See paz00-
diag.c in the original sources on how the system is beeing shut down.

In any case, we can only have one power_off handler. Either via tps or nvec=
,=20
not both.

Marc

--nextPart1613468.fv5e0luEql
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJW5BrnAAoJEKyeR39HFBtoJ6wH/11ZtLj/1h2xFHoppvITrJAp
4LljLWix0TWmxH/U9MztQrLL2Xzj/lKZvycKmaeS0tjdUzKSIAgmzBhLRrrwlllf
nXzLP7DviBd+ZPXIH30AJXsa9xkwja5aBb5Wp/7hdnJBEhG9O6DSKn3IUNomeNT4
48vftryV2QZ2z4KNZLJAsL72Vxf1V+TdhQNxZDigUnrIgfgFr9ohjS7MvxOC0SxZ
m35OsQ1X444+vAywK0u2iZz+4KS2zJrhHeqpFhIGbEQwcWEoopUL2NA6IDgozviu
BZpSsqawvyKb/etG9Z44SAsi7bf+g3zAJ0G5Vi7to0wHjYxooG31q4agIEckj1k=
=30+D
-----END PGP SIGNATURE-----

--nextPart1613468.fv5e0luEql--
