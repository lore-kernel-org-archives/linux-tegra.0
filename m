From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] arm/tegra: add support for tegra30 interrupts
Date: Wed, 2 Nov 2011 22:40:07 +0200
Message-ID: <20111102204006.GA14564@legolas.emea.dhcp.ti.com>
References: <1320248292-22736-1-git-send-email-pdeschrijver@nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF173F9A46E5@HQMAIL01.nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF173F9A4758@HQMAIL01.nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF173F9A47A7@HQMAIL01.nvidia.com>
 <20111102192112.GC12913@n2100.arm.linux.org.uk>
 <20111102192625.GD14372@legolas.emea.dhcp.ti.com>
 <20111102193947.GD12913@n2100.arm.linux.org.uk>
 <20111102194827.GF14372@legolas.emea.dhcp.ti.com>
 <20111102195404.GF12913@n2100.arm.linux.org.uk>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111102195404.GF12913-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 02, 2011 at 07:54:04PM +0000, Russell King - ARM Linux wrote:
> On Wed, Nov 02, 2011 at 09:48:28PM +0200, Felipe Balbi wrote:
> > Hi,
> >=20
> > you forgot to comment on the fact that gpio_desc shouldn't be held in an
> > array. Any comments ?
>=20
> I did not comment on that because that's someone elses problem.

fair enough.

> > What I mean is that, just like irq_descs, we should be able to allocate
> > them dynamically. Maybe, just like irq_descs, hold them in a radix tree
> > and maybe even have a matching API "gpio_alloc_descs()".
>=20
> Probably - I expect Grant would really like to see some patches along
> those lines.  As I say, someone elses problem.
>=20
> But what is _our_ problem is what to do with all the ARCH_NR_GPIOs
> that we have now, and stop them increasing.  There is a trivial solution
> to that which I outlined which can be used until GPIO gets something
> along your idea - and which doesn't involve me having to argue with
> those who think that the kernel should remain as small as possible.

k, I'll see if I can cook something up.

--=20
balbi

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJOsaqmAAoJEIaOsuA1yqREUr8QAJiK5oZtuebZJGO/VGU67GoQ
XCiJ7GNqE+SxPauXi8gmkBXAZ/OzCIp2EIhCQZr0twXFG6e8NrYoYu8qf7ahEGAr
qpBkYaAOMn8udQg+TPvN+P6Etg2lud28eBV0YAlMuRWyZ+cCXORXNkKR6h+Krdz4
hVOPeDDF5q/tRvW/0yAiMVBSuvNXVMnY8+bFVjJTjHtIWCNj266Wj21rYrmSQ4hH
9da7kDP7X4EAyTRAHns7csQMD3oI+qIFvVl4u06EIRaj+Y5cn54OQTLFa/rI0rkT
FyCt97kj4w8bl09MdOidowLNAwUuk7S6VyVI7dQU16UT8O3C1B8rN2Bljp1PQLeS
o++8GBZJtJJRyyHfARHzmHGAG+CGnMPiqr7GEGKxpqu6BHxBK1x2DAFDPXEeHOPO
IMcMDVom8yU2vXz4kBqw9wfUDOgt3DcDWyGRSWbAu+4Sy6f/di8ZUmeukECuVLBU
q7+2gXdunTgCH/+wAzJsUeiC6LdA+Gh8NF+jJqoSm6HkIKvue7LqFTRExt7fV2/e
YAcfcwYxQ4mXvt7TSGSGUqzGG9IvTlYkIMdjRA0hO5UqwCmLmZwTOuHsmB0G3PU/
xZ5qBVblOljb+p9AWvBhfmq8fvUM9Ntws6uUE0ymy4YOArG0oZ1K2OHxKLrDpgeL
WrtfRFg/h6xTtDJdp1n0
=7wnv
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
