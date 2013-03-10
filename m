From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH V2 3/5] ARM: DT: tegra114:add aliases and DMA requestor
 for serial controller
Date: Sun, 10 Mar 2013 23:42:19 +0100
Message-ID: <20130310224219.GG4743@avionic-0098.mockup.avionic-design.de>
References: <1362852678-13421-1-git-send-email-ldewangan@nvidia.com>
 <1362852678-13421-4-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iAL9S67WQOXgEPD9"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1362852678-13421-4-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--iAL9S67WQOXgEPD9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 09, 2013 at 11:41:16PM +0530, Laxman Dewangan wrote:
[...]
> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114=
=2Edtsi
[...]
> @@ -99,38 +106,50 @@
>  		       0x70003000 0x40c>;	/* Mux registers */
>  	};
> =20
> -	serial@70006000 {
> +	/*
> +	 * There are two serial driver i.e. 8250 based simple serial
> +	 * driver and APB DMA based serial driver for higher baudrate
> +	 * and performace. To enable the 8250 based driver, the compatible
> +	 * is "nvidia,tegra114-uart", "nvidia,tegra20-uart" and to enable
> +	 * the APB DMA based serial driver, the comptible is
> +	 * "nvidia,tegra114-hsuart", "nvidia,tegra30-hsuart".
> +	 */
> +	uarta: serial@70006000 {

I'm not sure if this is a good place for this comment. Perhaps it should
go into the binding documentation?

Thierry

--iAL9S67WQOXgEPD9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRPQxLAAoJEN0jrNd/PrOhdDEP/AmuvysFGkiVSQZukpun2xQJ
uGsBU9x/nXud+XUtGNDYcQYOr1n9e90RNWEn9A25UjtQc1JW06hYkdGzLDDUQCin
5PoyIQHbiuUelELGWvKalPPTgPwJYHmc1He3CH8rTrlcqfECT71dzJtpue1+aHqB
MnQr0gVFHcXG1rigq3FleEHWZTvmXUPb078FUDAM4VfNfAtt00KWWjBgYt0K6A1U
lNizMZ22HV6I8x/L9hnRJIwMJLJCgNDNMjNRiMtMapalrIONJFxM6dEgnOe+ODA0
wk4qvrQ/sQUBRfJwXhEXfrHuUlMPoFdjemjRS3nvk2a+n2xhokrHeRyQ0ngpjeKa
9YJgobjzx625hVWtLsEet22q98xKo7zilg+VOqbf93chUZayyKWy1tQF4c6eb79w
HiIf9YL9Tdd69g1zWbmoWoRhhV9phiiV9sPvApP1p0SgIuqZDwfz8TYII8KN4fuo
HGNdT75AE/lfF6GL1elycXBoqNFFUpQav6C41TMKSCsnv/+NnAsZQZlWivcPVqIN
xU7TeVdASHiQzqzVtrn29VI2F3QmZDAd/nB/SP+pzJvIlKne0Ud4MK87y62GqYwf
E9RRINbxUKx8Ro9GX27XUyqC4U8zPzZ0D1xW9DmnBWIc55i0zKa2PCD4u2WtKcLV
5U32NLBDjmqXJj6eBafR
=W0HI
-----END PGP SIGNATURE-----

--iAL9S67WQOXgEPD9--
