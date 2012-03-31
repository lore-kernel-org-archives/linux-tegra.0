From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 09/17] ASoC: tegra: sort Makefile into common and per-SoC
 files
Date: Sat, 31 Mar 2012 20:50:36 +0100
Message-ID: <20120331195035.GK5012@opensource.wolfsonmicro.com>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
 <1333148852-17806-10-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gBYU9MM4gf8jKg2V"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1333148852-17806-10-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--gBYU9MM4gf8jKg2V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 30, 2012 at 05:07:24PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> The DAS, I2S, and SPDIF drivers are Tegra20-specific. Group these
> together so that when Tegra30-specific equivalents are added later, the
> file ordering makes sense.

Applied, thanks.

--gBYU9MM4gf8jKg2V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPd1/yAAoJEBus8iNuMP3dIlwP/1e57M4Oefqttylx4dbdMqtO
iOh0FqOrkJTGT8uEUhCD4JMfD6ciPt9id3kaUTSwwjVs3RJ0d9zwtiWsCXovtu6O
p7pGRTuWvmFj+VWq+29bp4sftuGed7VhJZ8BbLW+mhFeQ+dAVrqPSvWpmYULFl2g
yzGk1CIf9djPXZj0C0Gvk3G7LxnJmkKulQH1NWjFVjMu1f7MSngfmpL4r2BjWodf
qpqjb4ObQQycHmU4PYgsPtaBojOoR1mShw9uwxm+NYfMmLzoh9JHzWC35OV5fl4L
XeVkTKO7P/qxKl+aPzVK4iTip2oMft8NAWG7sZy3pxuybg6QTpp0zvChzK74H4Ap
fxKEMzBkr2Y2Bn63HmrnuVGsYQmXzCVAmfOxFDt+qDlwAQu4G/8Uid787fcuXUOJ
Lu6UWhsD6aumj6N6rndThFq04COGD+htFqTod9T+bP38D+8rpaRHkMMbzzR35vSD
q38uRlkejCbGglTVM4ApEVyLyyLV2zgu+06YIjALsRgnnjeIXKcFtR9KbZPkhgLV
pdTvIlGDcXvz095teufyxApNJgIscfTA8xYJ4Bpp3B0NEQ5ceMafgfOuICHqsO4h
yFTGUaTQ2M5xQf2jk2k2v31qTY4pZhE80KKr+ZF/iyL+WobbvVlwE6I9rPjrXjpB
4DCYWJoNFA4+YFRKPI5E
=myhg
-----END PGP SIGNATURE-----

--gBYU9MM4gf8jKg2V--
