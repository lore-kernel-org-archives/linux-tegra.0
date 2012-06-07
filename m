From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 1/2] ASoC: tegra: statically define DAI link format
Date: Fri, 8 Jun 2012 07:03:54 +0800
Message-ID: <20120607230353.GK14525@opensource.wolfsonmicro.com>
References: <1339024549-5135-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OX2aLCKeO1apYW07"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1339024549-5135-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--OX2aLCKeO1apYW07
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 06, 2012 at 05:15:48PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Define the DAI format statically in the dai_link, rather than executing
> code to set it each time the hw params are set.

Applied, thanks.

--OX2aLCKeO1apYW07
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJP0TNSAAoJEBus8iNuMP3djdgP/ioCaq9pXihkpbrdvVGuL+8M
WcQLq+/bNF8knnbokEyYggpW7r5leRPEpN8zR4KYEGD8/6dun5QJi5+dfE3SsnKQ
6Z7XTjSrSq0Q9tpZWeiItACBmbFlByqqbG1PsMQlcrDl1/2IEO78QCSHmPrdqZja
j2CSQ7ingug4Lm2IB805dQ96P8svBoVbX5KW4hdgBE6U5O2I131hVJqrjsUCqVKE
8woio+XeGYbWUOyaBpBO9sH0XLLWwT1+KVgIsGIlqqbtKqgetB5G/YfYH8PaJd3+
JWs1TtsG1n+/0DT4v7D+LrrbFYTGttXA/at7FEVWbxRq+dQFbYgxj5b7FjPpTESm
OcVbiwwlxCZdh4pe1XiSS1SMyeZHQV2/E9bLWKVIla3orMgsvH5Qy1GScfNSwNvk
VdEfEJc6yG2tgLzX8bVYr/GiiWRQ2ix2SuShmEZugNTu3KnHbd7qYb2PC95SD+W/
Jh/Ibuz4F8fqo6KDe3zPyugZRasA4BhkNQJWFcyErEhG0h+X3TNr+ODXzmrGzSZD
3lAcUFob1WQXalwlcLRxYtA+moHNgLomEAyJ0a2s3iJE7tMvpvCDgLrwqrNy4K46
27XcmDwn/SqbSq6zvdbNBZkvWOqHFMoJAiGN9vZjRkUpSQw+TouJX7b6edXKC/Pl
DcaRhaglvkmsCVew1muE
=JCFK
-----END PGP SIGNATURE-----

--OX2aLCKeO1apYW07--
