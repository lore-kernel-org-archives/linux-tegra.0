From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 04/13] of: document new emc-timings subnode in
 nvidia,tegra124-car
Date: Wed, 12 Nov 2014 15:18:57 +0100
Message-ID: <20141112141856.GA26488@ulmo>
References: <1415779051-26410-1-git-send-email-tomeu.vizoso@collabora.com>
 <1415779051-26410-5-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1415779051-26410-5-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, mikko.perttunen-/1wQRMveznE@public.gmane.org, acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2014 at 08:56:27AM +0100, Tomeu Vizoso wrote:
[...]
>  Example SoC include file:
> =20
>  / {
> -	tegra_car: clock {
> +	tegra_car: clock@60006000 {
>  		compatible =3D "nvidia,tegra124-car";
>  		reg =3D <0x60006000 0x1000>;
>  		#clock-cells =3D <1>;
> @@ -60,4 +83,23 @@ Example board file:
>  	&tegra_car {
>  		clocks =3D <&clk_32k> <&osc>;
>  	};
> +
> +	clock@60006000 {
> +		emc-timings@3 {

Shouldn't this be following the same naming scheme as the memory
controller's subnodes?

> +			nvidia,ram-code =3D <3>;
> +
> +			timing@12750000 {

And this?

Thierry

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUY2xPAAoJEN0jrNd/PrOhb2sP/0tmY+HHUDM8YmTw6uMLnq7s
zyr/8IvsvcZtXcf1wfGFumjtvfZL7zxAjm4J7y8TQ21ugCVWG8hxIC/6gwdNKwcA
eJsqMmiRKI5q17aQrD9peDYoPL9K0XM6dddWGU7vd0UmtIFkygGQFbNUs1mw3U78
KEUlkmU16Fw1JykGfpbkF7QGtjC5v78y/aI330rt/3ePpAx31Oxo+LJCiNZfuNyJ
8hgRTDVE1uH88yBt6tUhz9movAfNlCLQBZgSoX5/Gp8PkpYnB/o6imLR02OnGNuh
3cnMrT7Jhh93KiMb9CLP9XByYypl8RbBz0Ub4TIaAfbxZQ8GD25J0/HA+T1SxQFm
FZI1AVXMQNoNiaO6Uc8cdohhbH4mOJEhRMIqVXr5UfbpMPNCcXMbISwNOEF3E6JM
tZLzuZp4Fha7S+SDGrKLJaN+kce048H2iEDqgsOyNLWIFHtsSgzRc7kQnlNY+wK2
ZOBXiPt/opY95JRPvyoMNWukqn/XiQPjAWWCgcn05ysSbJwqgcf2byOqPu2VTsvh
b6ubKIx3HK6RwYe76CeGE2cgs6PNtnHIQO0eJkkLRnRu1XDdxTivxSn6oxlV6Oqu
3tI4SfWWBhr3RBmywRdLgv24A53OFqxcu7vXicCEgkVqPiBQd4rsOz1o1wY8A8oX
beteYkD2QUYLmBUTR/FK
=/ygY
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
