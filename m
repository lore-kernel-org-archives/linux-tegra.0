From: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [cbootimage PATCH 2/3] Fix image update with image smaller than
 10KiB
Date: Mon, 7 Dec 2015 12:51:23 +0100
Message-ID: <20151207125123.7c57b5c8@avionic-0020>
References: <1446739402-14238-1-git-send-email-alban.bedel@avionic-design.de>
	<1446739402-14238-3-git-send-email-alban.bedel@avionic-design.de>
	<56436E95.8000305@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/FSl.xLEh7lZOKUi6UNoYiQc"; protocol="application/pgp-signature"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56436E95.8000305-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--Sig_/FSl.xLEh7lZOKUi6UNoYiQc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 11 Nov 2015 09:36:37 -0700
Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:

> On 11/05/2015 09:03 AM, Alban Bedel wrote:
> > The BCT size check assume a quiet large image, however if the image
> > doesn't contains a bootloader it won't be that large. Change the size
> > check to check for the smallest possible BCT size which is currently
>=20
> > diff --git a/src/cbootimage.h b/src/cbootimage.h
>=20
> > +#define NVBOOT_CONFIG_TABLE_SIZE_MIN 4080
>=20
> I think a comment is warranted here. This value needs to be (a) small=20
> enough that it isn't larger than the total BCT size on any chip, and (b)=
=20
> large enough that it includes the bct->boot_data_version field for all=20
> chips. (Hopefully those two constraints can continue to be met with a=20
> single value in the future...)

I'll add this in the next patch.

> > diff --git a/src/data_layout.c b/src/data_layout.c
>=20
> > @@ -1052,7 +1052,7 @@ int get_bct_size_from_image(build_image_context *=
context)
> >   	if (!fp)
> >   		return -ENODATA;
> >
> > -	if (fread(buffer, 1, NVBOOT_CONFIG_TABLE_SIZE_MAX, fp) !=3D NVBOOT_CO=
NFIG_TABLE_SIZE_MAX) {
> > +	if (fread(buffer, 1, NVBOOT_CONFIG_TABLE_SIZE_MAX, fp) < NVBOOT_CONFI=
G_TABLE_SIZE_MIN) {
>=20
> Can you please also update the size of buffer[]:

No, we still need to read up to NVBOOT_CONFIG_TABLE_SIZE_MAX if needed.

> int get_bct_size_from_image(build_image_context *context)
> {
>          u_int8_t buffer[NVBOOT_CONFIG_TABLE_SIZE_MAX];
>=20
> I wonder if it's worth updating all SoCs' versions of=20
> if_bct_is_tNNN_get_soc_config() so that they validate that the end=20
> offset of bct->boot_data_version is < NVBOOT_CONFIG_TABLE_SIZE_MIN, or=20
> perhaps that the offset is < context->bct_size, in which case=20
> get_bct_size_from_image() would need to be enhanced to set/clear that=20
> value when setting/clearing context->bct?

It would be better but it is currently not really needed. Currently the
furthest boot_data_version field is on T124/T132 at an offset of 1744
bytes. Still quiet far from the 4080 bytes that are needed for the
smallest BCT.

Alban

--Sig_/FSl.xLEh7lZOKUi6UNoYiQc
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWZXK7AAoJEHSUmkuduC28Z9IQAIu/rgv9AoqRfTn5b0AfqD7n
Dmjn26EWqAHEffmOhvHxL88Eoc76Sa69d6goYYex14YeFTLpQTHOfvcTAU3GaF4c
UZ3TJFHlel9dumAsTzTx7KtwF1weeeLO0CzR4uWvkWNvstWigtjudmalo++yGLT9
0lcCpsHGjfrhIAlUSvdSjDmDrmN7Lk2Qe0TJdo8z4i4TSnVmr8hIOhp2oQcmoeAD
Vwnk6MVQn02bV3oY0At8UQwLtKM7oBFH7xLch+kcKayJdhBKy6bn32PiEPPLdUDP
lH3qpfStwN6Zy2PP1e4z2vbFWRqz0B9hZrHkxaRxdRW0JzBfSD7U4naqxVvpyi/U
cfJrUT2TIOCS8Bg6eSmX0cYhbPOOjgqhdi+HxR1zcWPxGebzy4uYsQKl44SNio47
CrlEhwrSFxZS5pL5ximKdeTJvlLyPDmJkSRU6zm2PhV6yenC0CaRn9c+OwF5Ehii
Az+tIWX9DcDnPXkE2SUC90WOWL6Nfx9c37dFZDD/y1zuFt42eR7chAMwiGRusv3d
7+xCCa51z5NOf7gFwWLxYKM1atJ6zQcTwwIqFtwyzuGACuEDyi2QYjBfLwoPzelq
G778Sc/sYcrFTZ0rhj4//jUkZrZKGL8uKJ/ccOKCED7dvRT6vAwElU4PtwzhDIpC
+CcoyQm/XU1wYagxwm8V
=0TzE
-----END PGP SIGNATURE-----

--Sig_/FSl.xLEh7lZOKUi6UNoYiQc--
