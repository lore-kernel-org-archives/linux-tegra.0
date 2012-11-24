From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 5/6] gpu: drm: tegra: Prime support
Date: Sat, 24 Nov 2012 20:14:45 +0100
Message-ID: <20121124191445.GE26154@avionic-0098.adnet.avionic-design.de>
References: <1353577684-7896-1-git-send-email-tbergstrom@nvidia.com>
 <1353577684-7896-6-git-send-email-tbergstrom@nvidia.com>
 <20121123215528.GB21555@avionic-0098.adnet.avionic-design.de>
 <50B0733D.4040002@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UnaWdueM1EBWVRzC"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50B0733D.4040002-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--UnaWdueM1EBWVRzC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 24, 2012 at 09:11:57AM +0200, Terje Bergstr=C3=B6m wrote:
> On 23.11.2012 23:55, Thierry Reding wrote:
> > Nothing in this patch looks specific to Tegra. This should really be
> > added to the generic GEM CMA helpers.
>=20
> That was actually done at first. But then we started having difficulties
> with duplicate mappings and IOMMU, and mapping memory to correct device.
> We haven't yet figured out how to solve that for the generic case.
> That's we moved the code back to tegradrm.

I still don't see how that's relevant here. IOMMU support has explicitly
been removed as you mentioned in your introductory email and none of the
functionality in this patch is in any way specific to Tegra. Right?

Thierry

--UnaWdueM1EBWVRzC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQsRylAAoJEN0jrNd/PrOhouYP/j+9nMpsTSy/eSHAHJ+TJ+nG
SL4xuX0wZfihO9WnCj1ugcreb9FZQd9QDPSjUfQA6bsS24xnxeM1pkB65aessSBv
6s7IO8GTAu0z82LmCOrWYkLxin7gojnlO1EVvfr6q5duIiflSFZ3aQQ1A1ip1jpp
ciK6Dj9yrr4wN4jm/bzyl1w59BxI5+aY1hPcLc2HsGKXgYAne30K0yuxBdMkl+7w
3v1tRWWPzfH4hcxtTidDMQZNF7Pd3LcNacBHab5Veyonsr8JzBMOILcHkV2p4Ozr
udpg88eFqD22o6qB4kmJL4eztcJv0cVJEE9xtCtX52a69PuwnExcyoMybNOW0ZCt
PT8PYL3RD0C4jMS274Y1+K8FzIvJYIk17DXmpq4egN/A+qKZTJFnWBS6zXdcJ7ar
jnTCbV79fei0dyhW1dhXRwSpbabt1+6QgNr6hFTP4IiRDhSRky+Ak6aH7oa+znno
CF49yBLfHrS2WSpDDqIuiZOlCYtwRAUEmCYcYNr0IrSdwrqKtwAEZMUIi6FwFQiY
JlplZ4BPcksl6pAtTMJTiROm7C0VlICRSJs5vO6drjjy7rOUcKXu9VwLCHNScBlT
jBr3xHWTWPtfW6D6J3gZ+UB72ZfiPngXwEdaPzRBW8nuT/Ni88T7r8Y39bCR+Nil
QDuI7Z4n6pMu3rfsjyha
=3fcO
-----END PGP SIGNATURE-----

--UnaWdueM1EBWVRzC--
