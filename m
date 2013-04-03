From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH V5 9/9] ARM: dts: tegra: add the PM configurations of PMC
Date: Wed, 3 Apr 2013 07:59:35 +0200
Message-ID: <20130403055935.GB6764@avionic-0098.mockup.avionic-design.de>
References: <1364901613-25080-1-git-send-email-josephl@nvidia.com>
 <1364901613-25080-10-git-send-email-josephl@nvidia.com>
 <515B38F7.5050606@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DBIVS5p969aUjpLe"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <515B38F7.5050606-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--DBIVS5p969aUjpLe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 02, 2013 at 02:00:55PM -0600, Stephen Warren wrote:
> On 04/02/2013 05:20 AM, Joseph Lo wrote:
> > Adding the PM configuration of PMC when the platform support suspend
> > function.
>=20
> For this patch, some more boards could be supported, but I think we'll
> have to rely on other people (Lucas, Thierry) to send patches for them,
> since they know the details of the board. It's fine to leave suspend
> disabled on those boards until later.

I'm not sure what would be the best way to get the Tamonten devices out
of suspend again. For Plutux and TEC we have a power button that could
possibly be reused. There's a WAKEUP pin on the Tamonten connector which
goes to GPIO PV2, but the mechanism to trigger it is carrier-board
dependent.

For the Medcom-Wide we don't have a power button, but it could possibly
use the WAKEUP pin if that's connected. It seems like in all designs it
goes to the CPLD, but I need to check with engineering if there's a way
to manipulate it.

So yes, I think for now we can leave suspend disabled on Tamonten and I
can send patches to enable it once I've clarified with engineering.

Thierry

--DBIVS5p969aUjpLe
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRW8VHAAoJEN0jrNd/PrOhjicQAKkm4q7Y0KkNNoF3FVH3SDdj
fqPm5/I6Xk795LkVSa/j1Xm3zdr1UNqkOT27CnSdZQnr6ZFDCyFkH7zTHNxm+IAe
adklwETvVsidTTv324lELFhZyZoAkdrvMDNk2DJ0kl91lDLRiwjwB8LANrSssmF3
0qX+xU+BeTRmV5It6R0qP74lTQxLXLqQbx8YPpw5LPMsc5Vi8HQ1MVtUMbz8fghd
DkVqj/5kEVg7zBZKANtdt9A5j8/IxlCBk1nL14ea7GYH1p2skfVu685Sp4in6KhX
Pam1m73Dag9clI1wEORPaQ32PcHz22TWGqlaVJlJRghWrFHxXtQcn/hy6yuju3Ye
sPPrg9B8E8VY4+aRI/PcXLVXAoj2GC0MKm0MhCEjLC3sLKfyz7GxQQUFGzDoxl7t
TK1EAGjP8Qd9463h9yopuAM8H04Wmz0V9s1XI9+QY411xUCobkhQAMTxxLSAd6BL
p4/vPVaA8p5qCM2a6v/ANuYsq4+xwLpaq41nyZ9uj+3tKWBDdp0tFuLNE8BqLtaZ
OqJvHNLkgTlg1kl7A4vS29U2MaPMXj3R31sCAEjM/MPPkjS5fn1CThIzv7UGUj7I
6mDuxYFXqCu2W9qnqKuFhb8K8J9zB9hkfN0QaUsuiSqIHMe9C0Di0L2ECWVCAV0I
4xjOOJIsf1zvMxGo+YLm
=4AE8
-----END PGP SIGNATURE-----

--DBIVS5p969aUjpLe--
