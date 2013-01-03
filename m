From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: add kexec support to defconfig
Date: Thu, 3 Jan 2013 22:29:04 +0100
Message-ID: <20130103212903.GA27749@avionic-0098.adnet.avionic-design.de>
References: <1357161141-26430-1-git-send-email-swarren@wwwdotorg.org>
 <20130103210541.GB4412@avionic-0098.adnet.avionic-design.de>
 <50E5F5A3.1060507@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50E5F5A3.1060507-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 03, 2013 at 02:18:27PM -0700, Stephen Warren wrote:
> On 01/03/2013 02:05 PM, Thierry Reding wrote:
> > On Wed, Jan 02, 2013 at 02:12:21PM -0700, Stephen Warren wrote:
> >> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>=20
> >> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> ---=20
> >> arch/arm/configs/tegra_defconfig |    1 + 1 file changed, 1
> >> insertion(+)
> >>=20
> >> diff --git a/arch/arm/configs/tegra_defconfig
> >> b/arch/arm/configs/tegra_defconfig index 742dc41..e621603 100644=20
> >> --- a/arch/arm/configs/tegra_defconfig +++
> >> b/arch/arm/configs/tegra_defconfig @@ -34,6 +34,7 @@
> >> CONFIG_AEABI=3Dy CONFIG_HIGHMEM=3Dy CONFIG_ZBOOT_ROM_TEXT=3D0x0=20
> >> CONFIG_ZBOOT_ROM_BSS=3D0x0 +CONFIG_KEXEC=3Dy CONFIG_CPU_FREQ=3Dy=20
> >> CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=3Dy CONFIG_CPU_IDLE=3Dy
> >=20
> > Interesting. What do you plan to use this for? kdump?
>=20
> I plan to burn a kernel (and a small stub, and a DTB) into flash
> instead of U-Boot, and hence not have to rely on any bootloader.

Why does that require kexec support?

> Even ignoring that, a quick scp of a new kernel to a target followed
> by a kexec is faster than rebooting all the way through U-Boot's
> slower Ethernet support to boot a new kernel.

That sounds like an interesting approach. I wonder if this actually
works with the current state of drivers in mainline. Sounds like this
could speed up development quite a bit by avoiding full reboots.

Thierry

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ5fgfAAoJEN0jrNd/PrOhavYQALsRKOb8xdBmY9pF4cw7HO+/
1WNNCLN1X6GfneQRK8WmbtNvIOscc7Hud3aUZlm1xhLWOqMi4oNp73a+jrLvm8Oc
12OgwB0RXDDFiF9fz9jDl1nm9iWYRcw6zC55MkJ+WrbYOQ6qgWCdSPeiU2Jl/3jB
ZVp59gAVS4xswmzhXqapAKM098pvBWdN5UY584ETqcDzGRDDuHqxOkA3UcTd+dg2
sTR33O1a334rjZXNVyDDhInTZi8C5Sb1t3VqsVxac//+aRTpiFqJs+uQK4ar8Sxq
Kn0BzIAO4BhkUTWEg5M5Ckkzix2Fe+1+ufDPqJCTW17gUZkHnekAbqbKoawYPNq0
X/XC1ErKpRYWpkBEoD9m0BsMV4Rg7G03e9NqLcOUEWxWFjRcwdF3ZQS1OOQyV/bC
J6I9dL1RLgBtyLuKpI3KYpycD/WW8nW1vtKdYZ0ynEUbhcGQCDnnHlxT2xxQEqG9
hM65j4R+/ChhWbj/JosiYP2NB26yARWtqaCWdWxr7q85VPROzRmIiqX8ZDubdIfd
Sb8M/DswEl0Iob+it8IaS4w2nPz6cYpJMXvOAm/mqmfXJ7F0oQIh1fv0x0sTRkTN
2DiLFPXjB8zcSsuO5qv3Q53LTdolUGIsQ/i3cv4n8D63rspMZNQXawrPayQ2Kbtq
GGW9QO2JUzn/FFnXs/Zg
=1Dge
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
