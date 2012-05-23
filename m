From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 1/2] ASoC: tegra+alc5632: move all GPIO setup into probe
Date: Wed, 23 May 2012 12:20:40 +0100
Message-ID: <20120523112039.GN4085@opensource.wolfsonmicro.com>
References: <1337724592-12434-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oIlomvtVtXAVxSKT"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1337724592-12434-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--oIlomvtVtXAVxSKT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 22, 2012 at 04:09:51PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Now that deferred probe exists, we can parse device tree and request
> GPIOs from probe(), rather than deferring this to the DAI link's init().

Applied all, thanks.

--oIlomvtVtXAVxSKT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPvMgAAAoJEBus8iNuMP3d1HQP/3T7u/HekFPZnQxTpW6du+qP
bTBbdIfG74wUG3I9linukhsOgYlPw4G1f8deAIBrDFOUvQt+G26ToIfaFXgDcYQz
pEGT/ugr7hJYGHxUWIdoGjFDnV/ALi7s9uKtCg/dKz71CnlmkhHx6ZQZEvtiXKSX
afnc4hKstsBKH4NrnA4/RohZPlG7H7yThSLvl0uzmOOC2hiiGrosolWDha/6sfig
uY4nEvKtuTOogTbc9RTnEyPJYykbgeoU3uZY4MwmRqoSHuqKCVZTP1WN/jtodcB9
cdoi03kcJZv391/MgKbHnIsEEa2KNbvvyxmvZSE0Yoq2BEr5z5VSjEtsnwkD8AMe
HvBygCHGmpnwA2pkn5XKZCRmkZ65uTVPoAcgM3jiPLVMbr+vIEQkW3kRloA7EcLM
ultvni6ImbdlxeB1qen9u4RH62ybI8GzAQ3MfH9YBxJatIF1u+X/Whhgnq9i7HBI
YvicxZ0Jdd1oxd4xJz2P3TdHxiSGZsxQp4UwFT0JVl37Po1ozRLyqttqIyNe5lBO
z+UmSiraWIgx/sovqYJVBc+Bl4nnZDUyrBWGhacwb+C/7v+hmOe/vbJdU8GIUTjd
sSZPqyAKIdC35bofHfLTnquPiAEQ+kP1+zjD0Z07Wk1n+hqqHIpe9EMzybVXcdDF
/Qim5RhFSSStyNmf2xjL
=iEgZ
-----END PGP SIGNATURE-----

--oIlomvtVtXAVxSKT--
