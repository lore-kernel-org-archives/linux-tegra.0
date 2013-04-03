From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH V5 9/9] ARM: dts: tegra: add the PM configurations of PMC
Date: Wed, 3 Apr 2013 09:19:32 +0200
Message-ID: <20130403071932.GA23157@avionic-0098.mockup.avionic-design.de>
References: <1364901613-25080-1-git-send-email-josephl@nvidia.com>
 <1364901613-25080-10-git-send-email-josephl@nvidia.com>
 <515B38F7.5050606@wwwdotorg.org>
 <20130403055935.GB6764@avionic-0098.mockup.avionic-design.de>
 <1364970865.16957.21.camel@jlo-ubuntu-64.nvidia.com>
 <20130403070423.GB22867@avionic-0098.mockup.avionic-design.de>
 <1364973077.16957.32.camel@jlo-ubuntu-64.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1364973077.16957.32.camel-yx3yKKdKkHfc7b1ADBJPm0n48jw8i0AO@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 03, 2013 at 03:11:17PM +0800, Joseph Lo wrote:
> On Wed, 2013-04-03 at 15:04 +0800, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Wed, Apr 03, 2013 at 02:34:25PM +0800, Joseph Lo wrote:
> > > On Wed, 2013-04-03 at 13:59 +0800, Thierry Reding wrote:
> > > > > Old Signed by an unknown key
> > > >=20
> > > > On Tue, Apr 02, 2013 at 02:00:55PM -0600, Stephen Warren wrote:
> > > > > On 04/02/2013 05:20 AM, Joseph Lo wrote:
> > > > > > Adding the PM configuration of PMC when the platform support su=
spend
> > > > > > function.
> > > > >=20
> > > > > For this patch, some more boards could be supported, but I think =
we'll
> > > > > have to rely on other people (Lucas, Thierry) to send patches for=
 them,
> > > > > since they know the details of the board. It's fine to leave susp=
end
> > > > > disabled on those boards until later.
> > > >=20
> > > > I'm not sure what would be the best way to get the Tamonten devices=
 out
> > > > of suspend again. For Plutux and TEC we have a power button that co=
uld
> > > > possibly be reused. There's a WAKEUP pin on the Tamonten connector =
which
> > > > goes to GPIO PV2, but the mechanism to trigger it is carrier-board
> > > > dependent.
> > > >=20
> > > > For the Medcom-Wide we don't have a power button, but it could poss=
ibly
> > > > use the WAKEUP pin if that's connected. It seems like in all design=
s it
> > > > goes to the CPLD, but I need to check with engineering if there's a=
 way
> > > > to manipulate it.
> > > >=20
> > > > So yes, I think for now we can leave suspend disabled on Tamonten a=
nd I
> > > > can send patches to enable it once I've clarified with engineering.
> > > >=20
> > > Hi Thierry,
> > >=20
> > > I just recall I still need at least "nvidia,cpu-pwr-good-time" and
> > > "nvidia,cpu-pwr-off-time" two properties to make CPU idle power-down
> > > mode (same with LP2) work normally after this series.
> > >=20
> > > So can you provide me that or point me out where is your downstream
> > > kernel source? There data would be come from DT after this series.
> >=20
> > We don't have suspend support in downstream kernels either. However
> > since the Tamonten was derived from the Harmony reference design I
> > suppose the same values can be reused.
> >=20
> OK. That's enough.
>=20
> > That said, the binding document says that those values are only required
> > if nvidia,suspend-mode is set. So if we don't add it for the Tamonten
> > boards why would you need the cpu-pwr-good-time and cpu-pwr-off-time
> > values. Or maybe the binding document is wrong?
>=20
> Actually, when you support CPU idle power-down mode (LP2), you already
> support suspend function (at least LP2 mode). Just no wake up source
> define in DT for your boards.

Okay, but for CPU idle LP2 we don't need a wakeup source, right? I only
need the wakeup source if I explicitly suspend the device.

> May I add these properties to your boards (same as Harmony)? Then you
> can figure out your wake up source later, at least the RTC can wake up
> your device I believe.

=46rom what I understand there should be no changes in behaviour after
this patch, so it should be fine.

Thierry

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIbBAEBAgAGBQJRW9gEAAoJEN0jrNd/PrOhXM4P+Lb+qGA3xUHGa3ofFT/EzVCp
Xx+S/utDtCoc/4G9TOIz9pH+1hqbVw1mFEepVeGQoo72HlKVjPV/jsm0EM8Zh+Wk
TpohYsV7tue8I6PUsGYvgMXLIcxsC3FBzIvIUVqfMNxNNbnqDsRmX0kufj0vBLak
kQ+8Vfgn9RD0JRESKpQS8qNd2NwXx2gOXK80KP3zgtoNz62jC+MP8Ps+rwXABtRB
UL17UOGN9KxtQRsUlvALymVKNN9053ZO+7k2j414n1LiDH7uWnB67IZVeBPIrrry
aoh640yUoCWDU2lJd2cta+9QEyyOdzgkB5BzVpS8DUVItVTg45R/r0vjBHu0KBwk
F42CbWM/fHu+FyXuCql1kqA5sNRoRR2QexiudAECqsR98XwjmefjJ94WdJNTRtst
diXpgplfqnlX/cVietxd7pz70w/1AWgh/s9Y1RwKOo3uf8Kex8JIe4i4S0UeEgoK
he4vz2k+Z+lO5MrAV3MJt++CXtY4Q5m8rsl+2Z3MKlHvGoBzZOjjdVjgBTkMCd74
UG24gzEBia13hE0e2NeZCswXnCvu2N+60sPWGYPcLQK8Ng+l6n651AU3dnfmmKC8
9Z1dDGYDM2a3QRV9uLLtQFlumb3yUyp43GV7voiHNx4h7DylYDBlHWL8XOhtDFz+
Hv277lqoEAuERopE99Y=
=bmSd
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
