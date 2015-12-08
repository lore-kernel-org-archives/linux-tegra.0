From: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [cbootimage PATCH 2/3] Fix image update with image smaller than
 10KiB
Date: Tue, 8 Dec 2015 15:27:23 +0100
Message-ID: <20151208152723.6b477e01@avionic-0020>
References: <1446739402-14238-1-git-send-email-alban.bedel@avionic-design.de>
	<1446739402-14238-3-git-send-email-alban.bedel@avionic-design.de>
	<56436E95.8000305@wwwdotorg.org>
	<20151207125123.7c57b5c8@avionic-0020>
	<5665BFF8.5030205@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/R7sXU19.4ZFX71hNoGGsF87"; protocol="application/pgp-signature"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5665BFF8.5030205-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--Sig_/R7sXU19.4ZFX71hNoGGsF87
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 7 Dec 2015 10:20:56 -0700
Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:

> On 12/07/2015 04:51 AM, Alban Bedel wrote:
> > On Wed, 11 Nov 2015 09:36:37 -0700
> > Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> >
> >> On 11/05/2015 09:03 AM, Alban Bedel wrote:
> >>> The BCT size check assume a quiet large image, however if the image
> >>> doesn't contains a bootloader it won't be that large. Change the size
> >>> check to check for the smallest possible BCT size which is currently
> >>
> >>> diff --git a/src/cbootimage.h b/src/cbootimage.h
> >>
> >>> +#define NVBOOT_CONFIG_TABLE_SIZE_MIN 4080
> >>
> >> I think a comment is warranted here. This value needs to be (a) small
> >> enough that it isn't larger than the total BCT size on any chip, and (=
b)
> >> large enough that it includes the bct->boot_data_version field for all
> >> chips. (Hopefully those two constraints can continue to be met with a
> >> single value in the future...)
> >
> > I'll add this in the next patch.
> >
> >>> diff --git a/src/data_layout.c b/src/data_layout.c
> >>
> >>> @@ -1052,7 +1052,7 @@ int get_bct_size_from_image(build_image_context=
 *context)
> >>>    	if (!fp)
> >>>    		return -ENODATA;
> >>>
> >>> -	if (fread(buffer, 1, NVBOOT_CONFIG_TABLE_SIZE_MAX, fp) !=3D NVBOOT_=
CONFIG_TABLE_SIZE_MAX) {
> >>> +	if (fread(buffer, 1, NVBOOT_CONFIG_TABLE_SIZE_MAX, fp) < NVBOOT_CON=
FIG_TABLE_SIZE_MIN) {
> >>
> >> Can you please also update the size of buffer[]:
> >
> > No, we still need to read up to NVBOOT_CONFIG_TABLE_SIZE_MAX if needed.
>=20
> Why? This data that's read is solely used to determine the size of the=20
> BCT, and then thrown away. I don't believe any of the data between=20
> SIZE_MIN and SIZE_MAX should ever be used; observe the following at the=20
> end of the function:
>=20
>          context->bct =3D buffer;
>          if (data_is_valid_bct(context) && g_soc_config->get_bct_size)
>                  bct_size =3D g_soc_config->get_bct_size();
>=20
>          fclose(fp);
>          context->bct =3D 0; <<<<<<<<

Right, I overlooked that, v3 is under way.

Alban


--Sig_/R7sXU19.4ZFX71hNoGGsF87
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWZujLAAoJEHSUmkuduC28+ToQAIY/bCa18QcfqNpiV/LQoDYu
NoANkBEVVsdl8ga358k+0MwJfRbdzslxkj9uWfh5cwZP7VWIiZ0zX3CcD/2X63Z6
Vgzi9ieKaVE4zxWnPG8m5p/rYTyC56Xoq+homv2lEmyOetpiLkuHly1CYrDs7nKm
+aAyzQBFzXa8ZcOjBeAdSC61uBRTHq404wefIbpD5/RndhAkmaLdfdmp1bxR4Zlu
DwKi02VNobRCqzfoEMitsKzGCJ29crTTpB0CfnJ/wrgObRxQvdKHAafLvSBQoop/
ynBsQMQPyU8aob7jm7v4rAoUKjqu9hpWCAtvGMOM0HPeeUrfA6sUtA6x8Obo8ukO
szeis6bbc45IPdLUmtkLp6uNIRFh/SQGohVvozE9C70r7PpQ2RS6fGh62zvhZzwg
HIADEnRjtnzmhdWRdPg51kYzYwj9zVT1DiqsyxZUZNkfAlFSp0AxI2cCyyYRL7kX
Hf/kccHwE62p5Fb23uexFucBINoY9EJPZbiJFIWyh+jXI7d4Io99Ltk7vEkYYqXR
GwEtTHy8Cvq7JZvcRqdIXxjabv9ptiFIqnCj1l0L9LT4173zkKWuvB25fod6tEoR
JIUASif59ReJYnidXPHYe19Kj8cCIx5ls0n4bh5W9/widgUvWZwrvMyKiMAaLV0B
ShVMIylY+fyoizDK3AIe
=C0hz
-----END PGP SIGNATURE-----

--Sig_/R7sXU19.4ZFX71hNoGGsF87--
