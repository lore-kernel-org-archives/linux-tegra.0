From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 10/10] ARM: tegra: Enable USB on Venice2
Date: Fri, 20 Dec 2013 12:53:03 +0100
Message-ID: <20131220115302.GN27787@ulmo.nvidia.com>
References: <1387469182-14398-1-git-send-email-treding@nvidia.com>
 <1387469182-14398-11-git-send-email-treding@nvidia.com>
 <52B36720.8080205@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dPW7zu3hTOhZvCDO"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52B36720.8080205-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--dPW7zu3hTOhZvCDO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2013 at 02:37:36PM -0700, Stephen Warren wrote:
> On 12/19/2013 09:06 AM, Thierry Reding wrote:
> > USB1 and USB3 are routed to two external connectors, while USB2 is used
> > for the integrated webcam.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > Note: connecting a USB mouse to USB3 works properly and lsusb also dete=
cts
> > the integrated webcam, though I haven't tested whether the camera actua=
lly
> > works.
> >=20
> > USB1 doesn't seem to work, but I suspect that might just be because it's
> > used for recovery mode and we can't switch it around at runtime yet.
>=20
> The two regulators you added don't actually hook up to any GPIOs for
> control of VBUS, so perhaps this isn't surprising. The regulators added
> for VBUS control by Laxman's patch (which I already applied) *do* have
> some gpio properties. However, testing indicates:
>=20
> * With Laxman's patch applied, and your patch 1/10 not applied since
> it's a duplicate, this patch doesn't work, i.e. I see no USB devices.
>=20
> * With Laxman's patch reverted and your patch 1/10 replacing it, I do
> see USB devices, and they work. However, then we're not actually
> controlling VBUS, so USB1 doesn't work.
>=20
> Can you please rebase this whole series on the latest Tegra for-3.14/dt
> and sort out the issues? Thanks.

I've looked into this a bit, but I don't see why it isn't working. The
PN4 and PN5 are the correct GPIOs for USB1 and USB3 VBUS, but hooking
them up indeed breaks things. For some reason adding those even causes
the camera on USB2 to not work properly.

Thierry

--dPW7zu3hTOhZvCDO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJStC+eAAoJEN0jrNd/PrOhZSIP/0orIHn6kQjPIqqSjHmZyLI/
t0IM1LlrS+UUhXtcY+bgs+XolEoEav7FBL/nSVvXR99wXgtDrFcpL1JvbTPRjPjW
EUkCodACBqXPt8cHrWi3Jqc9YezANtxU3cYkSw2L/ClL+ZBiRUFnWJzmD91Namzj
6dhXCvrlFfLYrmS8p5pjezjpFK+FZcGeqV8oBTdKdHgLbq/SuaKsiry+9sPksLz/
uN3VfnYBAKf30tkNr8QfgxCnvFRG8mHCSpvzHYVzwW95iljcqewjgEstEP3hhTun
P1cQw8Y5684OJcYAIc/iNnYdEDq5IWfCAjHpskcbM/iOUmYBztdJqx49aNLmwiNh
tkcoiTuf+n94JFBcrfAVznbvVLZ2UO5QrPPUUbF3mf7HyfoVS92eZoEbmWP4UIG1
7RDMoKTeL2BGm5zUdvS5HUGiSRi4ybdOM9U4dMuvxAOhCGKaN7T61J7hrgktWY7m
wvTNS/PpLveFey2xOc/+g/XF4gqz5AV1FeAdV/T6Vdca2/kxp6D2S17/hMjAhqWi
nQLyfpacse/zyKyJA269tlWOJcl8a+FaR0lXFi0WRxi8Uc2kDNFKy53KfRI98oJD
X+r+v3xiPIdFJYOlbrTMpXiL6Wsn7XXAJd5zsVDMXMbIMzhUO7Ha0vx0BIzy6N7s
GnAKv2fI84P+nuv3+sYo
=xIrv
-----END PGP SIGNATURE-----

--dPW7zu3hTOhZvCDO--
