From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: disable LP2 cpuidle state if PCIe is enabled
Date: Tue, 7 May 2013 15:08:50 +0200
Message-ID: <20130507130850.GA11202@avionic-0098.adnet.avionic-design.de>
References: <1367872744-25002-1-git-send-email-swarren@wwwdotorg.org>
 <20130507124849.GM7949@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130507124849.GM7949-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jay Agarwal <jagarwal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2013 at 03:48:49PM +0300, Peter De Schrijver wrote:
> On Mon, May 06, 2013 at 10:39:04PM +0200, Stephen Warren wrote:
> > From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Tegra20 HW appears to have a bug such that PCIe device interrupts, whet=
her
> > they are legacy IRQs or MSI, are lost when LP2 is enabled. To work arou=
nd
> > this, simply disable LP2 if the PCI driver and DT node are both enabled.
> >=20
>=20
> Wouldn't it make more sense to disable LP2 when we actually detect a PCIe
> device?

I'm not sure a patch to do so would be as simple as this one. For one,
the cpuidle framework will already have been initialized when PCIe
enumeration completes. So some way of permanently disabling one state at
runtime would be required and I don't think cpuidle provides an API to
do so. I know the latter isn't really a good reason, but I don't think
adding that kind of API just because Tegra20 seems to have a bug would
be appropriate.

Furthermore, it is quite likely that the PCIe controller will only be
enabled in DT for devices that actually have a PCIe device hooked up.

Thierry

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRiPzhAAoJEN0jrNd/PrOhq+EQAKXDzn/NjPINdIgZVL5JBXKZ
v49l1G1sDqrCwlS3Jg4DTRJAbMYQYJGakbDld/+86QE9LbiugnswZKah3jXcT6lU
hPes5q+vp0P7+t6HSCh6yjCCYGQXSHi8F3CRl+uzsNRaP53f2bYpMVFmjAQZxYeF
yp0VkW0WWkfD5/0SmjmmV0egQqlsbGrFL8jnoBjv8Bv7ajVmTQqzTgGTFwGkxV51
RfEVJprW/homohFAGV+guxc7l1seD3M/ZuGP+7XdocuoczuGBDioC8Kn0NpTof2S
wTITvoEIwqFvUWzuK7DaXONA+KwUN1wGyAgJW94RSJV5MzV9vkmN2epdoPOReeZB
W0QiJ+cvn5wxz9bm6coopFOgjZCk2aogLNruZ2EM9wCeFlvy80WVja/HSfeOyxhc
r7aY1hmAQIAjskqBt/pcR0l7JM8OZ/+Qgap/7FLq5I4vaEi6TfvlrWOJNbUbpdt6
mU8jy3YYlnhDTC88rkokD48Y81xveuhDdeQtJiZ7pWvHp8Dh6621PmLePZP2HwXS
+7VfTOQfWzje9ftK5e+lJxPcR9KR7819jKEDQSo5vkm4ieHuKTde2OXtg1KSKnVd
BsUwL2s5w45Mxm47NYmhY/J+83OTJAwI+ku3OEb2PDxhnwOVYxouVzWSBQRpSJXo
m7AtX8z6QWmAIkLhJRK1
=93+C
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--
