From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH V5 9/9] ARM: dts: tegra: add the PM configurations of PMC
Date: Wed, 3 Apr 2013 09:04:23 +0200
Message-ID: <20130403070423.GB22867@avionic-0098.mockup.avionic-design.de>
References: <1364901613-25080-1-git-send-email-josephl@nvidia.com>
 <1364901613-25080-10-git-send-email-josephl@nvidia.com>
 <515B38F7.5050606@wwwdotorg.org>
 <20130403055935.GB6764@avionic-0098.mockup.avionic-design.de>
 <1364970865.16957.21.camel@jlo-ubuntu-64.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y7xTucakfITjPcLV"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1364970865.16957.21.camel-yx3yKKdKkHfc7b1ADBJPm0n48jw8i0AO@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Y7xTucakfITjPcLV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 03, 2013 at 02:34:25PM +0800, Joseph Lo wrote:
> On Wed, 2013-04-03 at 13:59 +0800, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Tue, Apr 02, 2013 at 02:00:55PM -0600, Stephen Warren wrote:
> > > On 04/02/2013 05:20 AM, Joseph Lo wrote:
> > > > Adding the PM configuration of PMC when the platform support suspend
> > > > function.
> > >=20
> > > For this patch, some more boards could be supported, but I think we'll
> > > have to rely on other people (Lucas, Thierry) to send patches for the=
m,
> > > since they know the details of the board. It's fine to leave suspend
> > > disabled on those boards until later.
> >=20
> > I'm not sure what would be the best way to get the Tamonten devices out
> > of suspend again. For Plutux and TEC we have a power button that could
> > possibly be reused. There's a WAKEUP pin on the Tamonten connector which
> > goes to GPIO PV2, but the mechanism to trigger it is carrier-board
> > dependent.
> >=20
> > For the Medcom-Wide we don't have a power button, but it could possibly
> > use the WAKEUP pin if that's connected. It seems like in all designs it
> > goes to the CPLD, but I need to check with engineering if there's a way
> > to manipulate it.
> >=20
> > So yes, I think for now we can leave suspend disabled on Tamonten and I
> > can send patches to enable it once I've clarified with engineering.
> >=20
> Hi Thierry,
>=20
> I just recall I still need at least "nvidia,cpu-pwr-good-time" and
> "nvidia,cpu-pwr-off-time" two properties to make CPU idle power-down
> mode (same with LP2) work normally after this series.
>=20
> So can you provide me that or point me out where is your downstream
> kernel source? There data would be come from DT after this series.

We don't have suspend support in downstream kernels either. However
since the Tamonten was derived from the Harmony reference design I
suppose the same values can be reused.

That said, the binding document says that those values are only required
if nvidia,suspend-mode is set. So if we don't add it for the Tamonten
boards why would you need the cpu-pwr-good-time and cpu-pwr-off-time
values. Or maybe the binding document is wrong?

Thierry

--Y7xTucakfITjPcLV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRW9R3AAoJEN0jrNd/PrOhdTQP/iqT6wJEiZ4Y2o07eNZ5zPIr
LeLi41DBy70NgWY/pnxG/cNqdDqryJyljwr4d4NPzTmkDpRAqB/IuOjhsAgz96UR
G4WiBtvPSG2y6JQ5Mw5peKFw9tF4p86NIIATRWnW8TpJ0qA1UbSeNm/DYSex2+YJ
Rs4RLz853h8nE6FtPttsQURit/EB+xOS9bZefTc4d8wg3HlimMNUwgIVPbLWpWPC
oAPV/zZaurC+Ao1eHu4O7Mytk2Lp7kZlLHoluw+mCZTkNgdahOdnmQE9A+cbjrt5
G6qecnO26cs8Y+bWWj4qjQcNcS+W1zBxYpBh0LYtnhWiPDnm41qo/qk9cHUOVWHZ
aPHRkZyULcBYNcgz2YQxX1cXsZPCuIIALGf/iarWEBsVvlNOhy+Xb6JFyHe7AJ4j
KlyQByrxm2Fl92yTRSad8uRjdXV8oU8T2oqOPm/UUbLxv8UTuYoaoHoGl9CgW3al
tlAKANoF2zgmhDsnVqNLJ15bmOMrJLg8al9g/rPIU9pGUkgoK7/crl1SN2dNxWNY
SO/k+DZdNvE0VkrsVvIjLPwrakehoK/C/GLMqGvk0pE971Fyz9jBhTKFL68kw+vE
RVEPmQBnPd+MFbGz8kbSZOLtCYF5wwTb2jHZ7JEFkxQu52AiVvxhDAkpZiry2tkd
hw4jSZYQXMwbTf/r3kzL
=2Yin
-----END PGP SIGNATURE-----

--Y7xTucakfITjPcLV--
