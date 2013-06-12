From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH V3 1/7] usb: phy: export ulpi_viewport_access_ops
Date: Wed, 12 Jun 2013 18:06:03 +0300
Message-ID: <20130612150603.GA15056@arwen.pp.htv.fi>
References: <1370462589-3090-1-git-send-email-swarren@wwwdotorg.org>
 <1370462589-3090-2-git-send-email-swarren@wwwdotorg.org>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1370462589-3090-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 05, 2013 at 02:03:03PM -0600, Stephen Warren wrote:
> From: Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>=20
> In order to build a ULPI PHY driver as a module, this symbol needs to
> be exported.
>=20
> Signed-off-by: Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> [swarren, reworked Manjunath's patches to split them more logically]
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

This should go straight through Greg:

Acked-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>

--=20
balbi

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRuI5bAAoJEIaOsuA1yqREKLIP/iPB5UbzAjwefEiM0ohzY402
Y/Ott3cDckMbMFuGkFKpYm2gNtzZGrWiMTZx9ayEiWb/0NTD6QdmTPOLk4w23Zmx
hDlWNKeYMfSii1bpTmaJR8bIfBwnf4X9v8vAFjdL5Paspg1pV28V4dqZjJDNAFwM
2B33fCBNer6QrfpUPrG/GT0t48RQTi8V2Zun6TnFwhdmsS5CZZYoNyy5YcnwYubD
nLhJ6+otiwq/ZlWCS+YrK3avov5El4+DXzv841ybcx/J7Nm2Ar4lt2m+G1T5ohB0
193OUV2taTWXSX0dUA1H6n9ofx1qhkkyEIJjX4OrEmdrrpzowJLaoytv1/Lorh80
MIxBYhbgNxIxkvR7eGvC65opVBGaOAbEdDDRi3kAOK+erLZWOCuqh1rjHRwkTFtl
oiJ4iCcbQAfBpHDvxAm7EoAVnDIdg5lyhVvC6ILza8xDwbWSg0I67g8WgV6JssjR
70kVzk7otIO/5bzU1rpY6zST3rjVH3fvR2ukplOgg8K1Jz11IKmUmcuVsV9igsOa
NVT3g39xSw0t0gm80iTpKOew96OB/TmBF7hInqGvxfFyc/1jgIsWPMMjxXn3MmI3
/3dygW14/xmn5YtjoaKemPa4Cvwpr7r8njwJtvoiMtsqd0W5qtlKUkfBk7EdRjcu
mfFfBbjx2IkqDNXXSVP9
=koAG
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
