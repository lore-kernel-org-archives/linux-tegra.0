From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 05/10] ARM: tegra: Enable eDP for Venice2
Date: Fri, 20 Dec 2013 11:20:25 +0100
Message-ID: <20131220102024.GI27787@ulmo.nvidia.com>
References: <1387469182-14398-1-git-send-email-treding@nvidia.com>
 <1387469182-14398-6-git-send-email-treding@nvidia.com>
 <52B367C7.9010301@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gTY1JhLGodeuSBqf"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52B367C7.9010301-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--gTY1JhLGodeuSBqf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2013 at 02:40:23PM -0700, Stephen Warren wrote:
> On 12/19/2013 09:06 AM, Thierry Reding wrote:
> > Venice2 has a 12.9" (2560x1700) panel connected to the eDP output of the
> > Tegra124. The panel has an EDID to describe the video timings but needs
> > a few extra nodes to get the backlight to come up.
>=20
> I started with next-20131219, merged your latest drm/for-next branch,
> and this doesn't seem to work.
>=20
> With Laxman's regulator patch applied and your 1/10 dropped since it's a
> duplicate, the LCD backlight doesn't light up. I extracted the following
> from this patch to fix Laxman's regulator definitions:
>=20
>                         gpio =3D <&gpio TEGRA_GPIO(P, 2) GPIO_ACTIVE_LOW>;
> +                       enable-active-high;
>                 };
>=20
> and the backlight does light up, but that's all.
>=20
> With Laxman's regulator patch reverted and your patch 1/10 applied to
> replace it, I see the backlight working without having to manually fix
> up the device tree. However, that's still all; nothing is actually
> displayed.

Nothing's displayed because the driver isn't actually there yet. It's
still stuck in internal review for some reason.

I should've probably been explicit about that.

> Again, can you please rebase this whole series on the latest Tegra
> for-3.14/dt and sort out the issues? Thanks.

Grmpf... yes, I suppose I'll go do that then. That's exactly the reason
why I said the other day that we shouldn't be adding regulators
willy-nilly without any means of actually testing.

We've seen this happen on Dalmore before, and it's now happening with
Venice2. The same applies to pinmux. If we keep having to correct the
DTS files because it was all applied at once "to avoid churn" we're not
actually gaining anything.

Thierry

--gTY1JhLGodeuSBqf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJStBnoAAoJEN0jrNd/PrOhisoP/3DnjjgMob+JzscK/rPAUqXZ
1UPW2wmclVOtCLdDhndajFRQ9GB+rdXpAKBuGABS5qM/51x/KfU6npdTnojm0eGY
GxU3yJFcaNzrLWFoptrzrtzn4xEjyRjCVNoga/LcWrnSaP+pE3oqw7pwlztJ2bBi
6I7MhJPEcnDaK6dD8Feb+Ul9/vEf6xvMWLrKFOJ7cWHi069cYN0tqiheCIap+Ye6
gBZjAfazZbkr4CVP7eG2svyZvUgDKaZe2AxRs+Y2WeYvSTKZIKGb5na+S/Us7IMY
9/zZ9FS3C+i9jddlCrSR5lMpXAP0wKRHXbpnytynOpjRvJQgGumchVAKfXtINkCt
uCUX8vcq0oWW0VMV3mrTUpMBhruTyfxXVeNMalNLSAruGju8uoe1whTAyCNM3+cb
vnrL9Wo61XAOA0LeqmDv83VmJV1ukmISwxXlbyLdPKittAxjImQk3L8v8FfRu9W6
cmvsGlmhAX7Rwds0fkDewYasCo5u1VDpLhAsKGxtu/+FTxIw5ZZTwyL3r1TWlEqT
YM+tNMm/vsQjjELx+PZGPCzIV9dlc+aYUYepAu6GPtpnc6OuOB+gssqxzgiI0e8v
hP36TQLyjAsi+/nUdUyq9dzhOPBYQMzi+pjUSutCM1YMV6AtLiyJ94jyvr2fD5GW
cWWagHQmMLPVIfiKNHvf
=WEtb
-----END PGP SIGNATURE-----

--gTY1JhLGodeuSBqf--
