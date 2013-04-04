From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH tegra-cbootimage-configs] Add Tegra20 Tamonten
 configurations
Date: Thu, 4 Apr 2013 20:59:29 +0200
Message-ID: <20130404185929.GA13407@avionic-0098.mockup.avionic-design.de>
References: <1365067814-12925-1-git-send-email-thierry.reding@avionic-design.de>
 <515DBD7F.1010800@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <515DBD7F.1010800-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 04, 2013 at 11:50:55AM -0600, Stephen Warren wrote:
> On 04/04/2013 03:30 AM, Thierry Reding wrote:
> > In addition to providing the BCT configuration that is common for all
> > Tegra20 Tamonten-derived boards, add scripts to build images that can
> > be flashed to NAND for the Plutux, Medcom-Wide and TEC boards.
>=20
> I wonder why there's a need for board-specific sub-directories? After
> all, those boards all use the same BCT file, and the image config files
> are all identical.

I could probably rework it to just generate one image that uses the
standard BCT and the u-boot.bin binary/symlink, which should work just
as well. So if the user wanted to build for different boards they'd need
to replace u-boot.bin and rerun the script.

Does that sound any better?

Thierry

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRXc2RAAoJEN0jrNd/PrOhHhgQAJEIKa3j2tR+v49qF1zsz9aL
7DxXrkDsuNVQRk13+2kkFW6zaqc9UIvpy3DsemlgyuLkhObAbZr/min+URFKp8W0
LtRd4MeI7qY8kwrsa++lG3aCSOlYNT1hhw8sJRfS//AOI7SeL127GsO05VKSl26V
QAg0iKJBw9/U51sj1sqdsujhkvu8nvbc2EcrsyVQlgh9ejb2FtWj4ASV4AfvIyhP
XFN3GvimO1Xwv5LjIczvWloZvEVoGukt4mju7kz6YNqNusEXiJhm2qRGyv3S3y9H
Ck6l0VspoAbdF/rIkf7x5lD8zoVmHSCiCu7EvoeTDJhlyKuSjpEtEytTcnbmySZU
jsOaYSPyvP+1RpjfawH3a80iXF+vxLDIfO7+kpgGPk+99vJpH3mtB1YJoYdWM0Pn
Q8st6Xf5sX64wYio2c6zKCvEx/uS5/RNQdDjs7BTJMwxpv7obqFFVW54FOkF6Yl8
o7/Fqk1D2QocJPytyydCkLTS85CukEz8k/Curo8GFjI8Wat90Y4opcjiO0OZju+h
9timKMZpMylOGuLXVQQTCaAV4a/423c0NYYgLvEHJbhDciO0PKagDOoY+TJdwY6f
RsP49wWYdlhftUbFj/QESyImKzGQHVR/mrJ7Afv669N0qRJtB73Pj+QGJLxETEXD
+iqxMBP8YoqIFi+rsCqC
=cphi
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
