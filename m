From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [PATCH v2 2/5] core: add support for secure boot
Date: Thu, 21 Jan 2016 22:13:46 +1000
Message-ID: <56A0CB7A.9010104@gmail.com>
References: <1453097447-12152-1-git-send-email-acourbot@nvidia.com>
 <1453097447-12152-3-git-send-email-acourbot@nvidia.com>
 <CACvgo50P8JQ5EkCEMmnGQGO4jMsc0O4cRB1QO04V0KQS7Y8AYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="b51RNc033w8xGfcmBBFKjP2Sk8uj3sLOl"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACvgo50P8JQ5EkCEMmnGQGO4jMsc0O4cRB1QO04V0KQS7Y8AYA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--b51RNc033w8xGfcmBBFKjP2Sk8uj3sLOl
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01/21/2016 10:09 PM, Emil Velikov wrote:
> Hi Alexandre,
>=20
> On 18 January 2016 at 06:10, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
>=20
> [snip]
>> +static const char *
>> +managed_falcons_names[] =3D {
>> +       [NVKM_SECBOOT_FALCON_PMU] =3D "PMU",
>> +       [NVKM_SECBOOT_FALCON_RESERVED] =3D "<invalid>",
> "<reserved>" perhaps ? we already have one invalid below.
Does <reserved> really mean: "we don't want to tell you?" here? :)

>=20
>> +       [NVKM_SECBOOT_FALCON_FECS] =3D "FECS",
>> +       [NVKM_SECBOOT_FALCON_GPCCS] =3D "GPCCS",
>> +       [NVKM_SECBOOT_FALCON_END] =3D "<invalid>",
>> +};
>> +
>=20
> [snip]
>> +int
>> +nvkm_secboot_ctor(const struct nvkm_secboot_func *func,
>> +                 struct nvkm_device *device, int index,
>> +                 struct nvkm_secboot *sb)
>> +{
>> +       unsigned long fid;
>> +
>> +       nvkm_subdev_ctor(&nvkm_secboot, device, index, 0, &sb->subdev)=
;
>> +       sb->func =3D func;
>> +
> Move these two after the switch statement ?
They need to be done here to make the failure path cleanup stuff work
correctly, so it's correct as-is.

>=20
>> +       /* setup the performing falcon's base address and masks */
>> +       switch (func->boot_falcon) {
>> +       case NVKM_SECBOOT_FALCON_PMU:
>> +               sb->base =3D 0x10a000;
>> +               sb->irq_mask =3D 0x1000000;
>> +               sb->enable_mask =3D 0x2000;
>> +               break;
>> +       default:
>> +               nvdev_error(device, "invalid secure boot falcon\n");
>> +               return -EINVAL;
>> +       };
>> +
>> +       nvkm_info(&sb->subdev, "securely managed falcons:\n");
>> +       for_each_set_bit(fid, &sb->func->managed_falcons,
>> +                        NVKM_SECBOOT_FALCON_END)
>> +               nvkm_info(&sb->subdev, "- %s\n", managed_falcons_names=
[fid]);
>> +
>> +       return 0;
>> +}
>=20
> Cheers,
> Emil
>=20


--b51RNc033w8xGfcmBBFKjP2Sk8uj3sLOl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWoMt6AAoJEHYLnGJQkpH7q1AQAOX0aAIVQ7XSnRpYLGEbX09L
7en0wmcckOEEDKSjMaLLsNkLdb5lyiG+VeG1sYub9aSCS+sAPPq9LKx+nM0SME9z
DuGLvxYZsip7zo+8ItvdSf2MPNKe5kkVloce2T5297xIo2+0aSr/BIQV4yLY6IUZ
YkPoYHjiRgQEhdIKRvxc7ERv0KMWkfZCvt7vGGzfir+m60iB76NpAWozdkC5HTxk
REED7lCnhqpNvG4V8qGliVAZEkDPvlo2POMBAkJV0g7FI6bx9mtD0EWwkDm8S5Fv
fcavnleiH5Y8Jw01sYFxrnU1gMAsCnxbhaeL89l5YZQsnv4rW+NIMexJN/jJ+jnR
8OVnbgIqCBb7l/+U4rI8cdvHf0fAaMcC1UTc70TppoV/PiUWkUpVH2B/r8omGmpV
FqG0aorgiOdbLWntJtS50kMq83t3IZYnrQQOB0v3a/VgFSxY1e6vul3WWGMChQO5
uIRVgqklVIUJco/0zcEipW4y93iMH5lzbLVFmO38SJ1L4CseSR8FVZhlcbqeA2mK
ESUHrQi9nOJNN4oB9r7sx6PgHR04/itLMS3xiHM2Zix8uAHCkxVc/+d5ql63S/99
r6iX6gqW7QD9wymjDbd0m+/yLIo9WSpEj99yfUVE/5C8qfPbEuj+6cMxpjPgfD/9
OgA8g9gpxUosvpdx6Is6
=RvpX
-----END PGP SIGNATURE-----

--b51RNc033w8xGfcmBBFKjP2Sk8uj3sLOl--
