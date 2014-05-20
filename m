From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv5 2/2] ALSA: hda - Add driver for Tegra SoC HDA
Date: Tue, 20 May 2014 10:59:27 +0200
Message-ID: <20140520085925.GA10210@ulmo>
References: <1400552307-20192-1-git-send-email-dgreid@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1400552307-20192-1-git-send-email-dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, tiwai-l3A5Bk7waGM@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2014 at 07:18:27PM -0700, Dylan Reid wrote:
> This adds a driver for the HDA block in Tegra SoCs.  The HDA bus is
> used to communicate with the HDMI codec on Tegra124.
>=20
> Most of the code is re-used from the Intel/PCI HDA driver.  It brings
> over only two of the module params, power_save and probe_mask.
>=20
> Signed-off-by: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

When I run this on Jetson TK1 I get the following:

	[    1.571912] tegra-hda 70030000.hda: CORB reset timeout#1, CORBRP =3D 0

Is that expected?

The device seems to register properly:

	$ aplay -l
	**** List of PLAYBACK Hardware Devices ****
	card 0: tegrahda [tegra-hda], device 3: HDMI 0 [HDMI 0]
	  Subdevices: 1/1
	  Subdevice #0: subdevice #0
	card 1: TK1 [NVIDIA Tegra Jetson TK1], device 0: RT5640 PCM rt5640-aif1-0 =
[]
	  Subdevices: 1/1
	  Subdevice #0: subdevice #0

Would you mind sharing the procedure how you test this? I tried various
incantations of this sort:

	$ aplay -D hw:0,3 /usr/share/sounds/alsa/Noise.wav

or

	$ aplay -D plughw:0,3 /usr/share/sounds/alsa/Noise.wav

to no avail.

Thierry

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTexltAAoJEN0jrNd/PrOh4eYP/RGTvGCqyp9fFgHD8lLMDcKg
jZ4nkfki2EDx1jDvwtuPlRJH5g6Dq1/6SsflGo7PIAx/oL2ppC0hkTNEmsAauaA6
G9Nh1hzHZRSR38P6R0hBXRdKEV82b9z2cz9bs+l84Ws0hbJe71xTfzjIPORs6Eeh
LEFFc9Mt5+ydbImQjuQLAcCOabKeIPWf94Rl9U2NwaEPK+AcDjWinO1utscCUTGA
5m+D5FTxP+sRGOwBtoYpbdOqEdaIpRAlWjSsd2GhSj+Uu7AF0AjyDWPy+gxIXcha
AE/oxdlM1gvzJgVNB8IZf2ugcVhL5MuFn4tWhQns0E2zE1TBeq3hBwxrIEtWJ9uG
BfcrPuMtCaTif5JKvFMIzwDk0I2z8CDacpVcoeD4JgLrWvV6DO34QARAoHVqU0/H
HlzLe3zdNrnSsJKzUo8/xxBkO/wPQn+cr4btBE7jDCUBWvXFqthCBHyBmrx5uUMF
r7pYo2v/fUH9+kiZffOBlQNhdKvNTLG5zt41Wsw+zNsd2vt76LOuxdMLW2/sIMBN
UTCe51rzKowyvNqT2SFSteSD+CwQAod8xz4CiSy/n6MXY6RKrgWXbzB8PY3/vMAK
NBv3g198q+hBFxqX/GIGfs0KK5zWN7+d6CdrjPYLnkasnO1yr4RosM5wYsYXHoe8
P++WAvr6KsFS4q5wU6gu
=oAqY
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
