From: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [cbootimage PATCH 3/3] Add support to read and write rsa
 related fields on t124
Date: Wed, 11 Nov 2015 17:56:03 +0100
Message-ID: <20151111175603.43a21403@avionic-0020>
References: <1446739402-14238-1-git-send-email-alban.bedel@avionic-design.de>
	<1446739402-14238-4-git-send-email-alban.bedel@avionic-design.de>
	<56436FA4.3070906@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/._EkFVM7k0f=EKoXwe1yKNK"; protocol="application/pgp-signature"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56436FA4.3070906-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--Sig_/._EkFVM7k0f=EKoXwe1yKNK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 11 Nov 2015 09:41:08 -0700
Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:

> On 11/05/2015 09:03 AM, Alban Bedel wrote:
> > This allow creating and reading signed images for secure boot on t124.
>=20
> This patch looks like it's identical to the equivalent code for T210.=20
> Does it depend on your other two patches, or is it independent, such=20
> that I can apply it now?

Yes, this can be applied without the rest.

> It'd be nice if we could share code between src/tNNN/nvbctlib_tNNN.c=20
> somehow rather than duplicating it all, but that's not a problem this=20
> patch introduces, so no need to attempt that now.

That would be quiet nice, but that would probably require quiet a large
rework of the current abstraction. I suspect it would need to move to
some description of the BCT that include the offset of each field. That
way the parsers/set/get functions wouldn't need to be reimplemented for
each BCT version.

Alban

--Sig_/._EkFVM7k0f=EKoXwe1yKNK
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWQ3MjAAoJEHSUmkuduC28p5IQALOrUX0Tm5P1SiZCu7bIQWRX
FUFwE4lkDtuuHV8lFFrzq7g1oOdXlb1eWnmxhkH+G8X8s6ptSqJpqbmohBdj7nho
68CMcqGwMz1OFUa5V5UrZYAaCrQaz7JHle8FuJO2lQmB22TYRdbhQVAag8anUd74
nZMCqDFdKcNwzFTH5Xmie72JUOiqDrkzK5ttml42s82Lv1wkOSgfv8t6GhjfdeeY
AeM96kq+YF3W64vNtDgRM79sGFYUWOD4rdQxu1tN6ktL1I3poK5TY157xXTF/jS5
RZghrfyRIjfw7oOYN5JtU6/ffkK00ZibetD6aVopzkW5gaPslO1cvMdvaIwz7BXy
bTqgbaMtQxXHi6QlOlrKmBv7QUIH66iseeLPy4wmdRR9e4DvwPCMNvYzD2V904Gi
o/6sAyaN4Re80FxWxhTueOutdb4VUQGYs8xHBwx4Zj+Rb1NH+4H2dPWlw9bLDnPd
rgznxQfA7jyKuEldTUdxXoCwkv7LshEr2R3Ldv3AGdmtVIBhNz0zjm3FoiizH8Yz
bxECFK2fkGD6L3drRlqtbp429HI/hjQMjR8aDlaV+qHPYjSCbQRoeZjtH9N1ItF1
8WdITpBSkHJwE1bWLgxxE/YTXP3CqhV7KXGXE63VmJlE+4gwomqxX6maDnPiSM6g
qNc7jCBp7oTq88u1kNST
=O/U0
-----END PGP SIGNATURE-----

--Sig_/._EkFVM7k0f=EKoXwe1yKNK--
