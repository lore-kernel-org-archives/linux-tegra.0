From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH V1] regulator: tps65910: Sleep control through external
 inputs
Date: Tue, 24 Jan 2012 21:21:44 +0000
Message-ID: <20120124212144.GG1135@opensource.wolfsonmicro.com>
References: <1327395919-32378-1-git-send-email-ldewangan@nvidia.com>
 <20120124115855.GC14888@opensource.wolfsonmicro.com>
 <4F1EA1E8.90104@nvidia.com>
 <20120124122411.GB31839@opensource.wolfsonmicro.com>
 <4F1EA608.3020204@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rMWmSaSbD7nr+du9"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F1EA608.3020204-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "jedu-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <jedu-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--rMWmSaSbD7nr+du9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 24, 2012 at 06:07:28PM +0530, Laxman Dewangan wrote:

> E.g. If cpu power is in VDDCTRL rail and if DVFS mechanism of SOC
> wants that cpu rails to be ON, it will make the control signal
> active and if it wants to disable the rail then it will deactivate
> it.

> The toggling of the control lines depends on how the power
> management controller is designed for a given SOC and how it
> manages.

Hrm, right.  This isn't something that the regulator API usually deals
with - normally we just deal with things that Linux owns and assume that
if the hardware is wired up for something else to own the regulator it
will deal with that completely including the configuration.  If we do
need to do something here we need to make sure that the normal regulator
code doesn't try to do anything clever with the regulator which messes
up the other device.  But I guess this doesn't really have a problem
with that, someone can always add a further patch optionally specifying
GPIOs which won't conflict with this approach.

--rMWmSaSbD7nr+du9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPHyDhAAoJEBus8iNuMP3dcqMP/2igwR+ANMFPX9ZSdBNf8Rso
SkI6/bn704xEZ6YKOnsZVgoSN3Dq/5fxmG/Fm1AlQ8xmI0w/WIvZQveTPPm7+/gW
J+GCrm+XXE3oipuXUb6yQmwV9vSDCLlUR24EpAghRF3ATWpj8S7bVD78ngHmvF4T
Evy1G8lTMWK6kK19SOFcLnAsGhhaUWnE9oAoxiXMhQddBXgBv4cjuEuHhObOvyaF
wHBbBI8ai9VNIPoQrlQdzrUVHmFOSpYgBJRMj6yiPtVltsH0HLc+Pjedv+fo7fCV
T6ykpcnBB+bekRSlvAaF3PqA/Bx+ZVM+042zwE5imRHOemGtR4xFA9+mP5T1hEud
hvqKNK7yiXvtEquT8w9AUk3qtUlh2nGq3fgSw6y19mLNziiC5S23AxXskE1hAa6A
hcDhiXdEax0yp18OtVgr568kD4/ggs6Xf6/zWvE4YbzLC16aQDvT+ADPasy5iXAU
DyqZJ1Ij8AFdr89YoRw95eiDe2owBYIng8Li1LMSQH3fwjqqM9C1u/LA1NA4E4va
VbPZqXoRHub3bQjiZYSWtWCBH1dVrJDxHqFVgbyMz/3LCg0nuXOwMrm/VNJvYfwK
8ihdCiZCDtOUdmwlMagoZeFFs64t6pe2axMztb6spq/D53K+jKFOau/Xo2b3jyFv
A3rosxKorB87DayaFKeN
=Hv+Z
-----END PGP SIGNATURE-----

--rMWmSaSbD7nr+du9--
