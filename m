From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dt: tegra: seaboard: add regulators
Date: Tue, 10 Jul 2012 16:42:01 +0100
Message-ID: <20120710154201.GE10022@opensource.wolfsonmicro.com>
References: <4FE80413.6070001@nvidia.com>
 <4FE87FE3.1080608@wwwdotorg.org>
 <4FE882A5.3080504@nvidia.com>
 <20120625222646.GB30406@opensource.wolfsonmicro.com>
 <4FE8EFC4.3090509@wwwdotorg.org>
 <4FFC190A.2040800@nvidia.com>
 <20120710134436.GD9409@opensource.wolfsonmicro.com>
 <4FFC31D5.7090600@nvidia.com>
 <20120710135302.GG9409@opensource.wolfsonmicro.com>
 <4FFC4478.7000204@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="F8dlzb82+Fcn6AgP"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FFC4478.7000204-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--F8dlzb82+Fcn6AgP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 10, 2012 at 08:34:24PM +0530, Laxman Dewangan wrote:

> The sample code for tps65910 is as follows. So where do you think
> that it is wrong and what should be correct approach.
> I need to follow the same for tps6586x also.

Like I said the use of a supply name should be unconditional, you should
just set the supply name in the descriptor.

--F8dlzb82+Fcn6AgP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJP/Ex1AAoJEBus8iNuMP3damwP/A3plCt2JtrP5yo49OQTq584
wVsFuyTVb4fEr3owPietR7oaeaVEXDVbO02BpKkaBC/6MIbmQLkMeuLatb63AA07
7dsSQ4A+rVYxBVkxHi9PzB7nkvCeIDMK0scPHBu5CyIH+ycRDJU5oraRJauiaRyl
fIlOdoiHf+ZUEiqH1GTnOvnkR/HQujnxv5rEqEr8j48PqW+YRPEAJy8ETU0V9QNS
OzkrEBV+WhkB39WmZG7HECby4LhZj3R8oAhW8JQ1Qd3uLZ0NwFB7DxwzDJm0MDmD
ZUpujoVf4aVVg7/GMPTLYW6MToX31wve3R2gJcEHA2Uz/EGz1n/ae88On21MM6UI
VJWW6Cxp7CE9H0Gt1jrizhdxp2BptCDpWxQnLqEVEna7nzxtGMk+VVz3Tmq6HUkO
TaQlgI07+uZAibvHYTtRhpzR3DwXkpHIon3dlqvlCszxhsqVafVbu7M+bLzRyLRQ
RwrOT0CHpUUkZ+Tts0ZA3d+EcE66jR7lpM9C04NgiSrUlK0PUqpJOYh3urWMqY1D
j7MBC9mKYUVlhZbrswt+GQzwEyU1byXvuNaPX2SxtxnVNBwtA9oQj2t7qDkjI2aq
tTOc74rfbtU6MhnZGESR2UZ+P7o4ZaFtwozcRgHOW+WiT3mC15Tzp7eHVfooRu4c
/wY4g603stNvrnTkyuiw
=oXpR
-----END PGP SIGNATURE-----

--F8dlzb82+Fcn6AgP--
