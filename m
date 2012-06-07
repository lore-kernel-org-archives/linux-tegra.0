From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [RFC PATCH 3/3] ASoC: tegra: add .stream_name to CPU DAIs
Date: Fri, 8 Jun 2012 07:01:40 +0800
Message-ID: <20120607230139.GI14525@opensource.wolfsonmicro.com>
References: <1339024507-5096-1-git-send-email-swarren@wwwdotorg.org>
 <1339024507-5096-3-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Encpt1P6Mxii2VuT"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1339024507-5096-3-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Encpt1P6Mxii2VuT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 06, 2012 at 05:15:07PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> This is certainly required if the I2S and SPDIF controllers are converted
> to be CODECs, and is probably good practice irrespective.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> I'm not sure if this is technically correct. It's certainly not required
> for the drivers to work correctly when they aren't CODECs, but doesn't
> appear to harm anything.
>=20
> Mark, Liam - what are your thoughts on this?

It's just generally best practice to provide a name for all streams, it
can be used for diagnostics if nothing else.

--Encpt1P6Mxii2VuT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJP0TLNAAoJEBus8iNuMP3dRQkP/3+Uzq3JjsSylpQ4+JbAf2pu
33DBPRC5sTxLyKUUFDo3boW5JrKF/NaydrDMaIhqit/VuiG/pYELShQVtyZmVrpG
DpNr7y9htra1buSOzuytayU2XcwyuCpvePHQl9u7xNBGrxvT107oDbjY7xrxgF0c
ISkkyyiL4At/u9l1jGgJekbT+U4eMwcRwbBCoXeYC/Yk1IQr6Pc2YM1eRe4IQo9k
9cwxYteNYiZmZxHIotZa2Pod5BpKySkqY0lh5Z5w2YvWTWOQXP+++2qSENyeh9xa
BGhXtP7TRcpsPryhg2kH+NeOjJgYQHRKYxrwwsjzLkHen095dBtc+uOcVUYQG8eg
tupBRuoYT0dRqOeE3YREwAVIPkg5otQod6u8unCxYBaUh8ZFLC3w4JyN5DC4avfM
P2V1c/NzCHeSKPOjVHbbiXGa9yTLJCUcKxKpl3x29DIRa/+Z1n3yNd9AXBBqdwAD
xytCzqTY6qVMQrnMGTmXcdn5RoMXXQ5OwkfEGDjGLKLBLQec50MURbKxpkbxuLPW
ZWQcB1pOcd8KPYA3jU44wm6gojgjHpnM5snQw1Ck+Zsady7u2vczMwFyb+E7cc1X
sCpxOJb3ed4CvujKeMLWBf0AkAR03+p9weHj61sXzSK2bX8Cklhc2decQMvuH568
HeMgVhKrTI0P631HPzzT
=rLKO
-----END PGP SIGNATURE-----

--Encpt1P6Mxii2VuT--
