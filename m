From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] host1x: mipi: Include clock lanes in mipi calibrate
Date: Mon, 25 Aug 2014 08:33:55 +0200
Message-ID: <20140825063353.GA12209@ulmo.nvidia.com>
References: <1407391907-19488-1-git-send-email-seanpaul@chromium.org>
 <1407391907-19488-4-git-send-email-seanpaul@chromium.org>
 <20140807083429.GA13315@ulmo.nvidia.com>
 <CAOw6vbJPtzCesuMVjv06Abe-2PpdhmdJ75EHYU1N+TCfUVssNQ@mail.gmail.com>
 <CAOw6vbJw8S477S+7L_+ozF2aoxUw+TT7=KQObTz6HYXpzPhr5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOw6vbJw8S477S+7L_+ozF2aoxUw+TT7=KQObTz6HYXpzPhr5Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2014 at 10:54:50AM -0700, Sean Paul wrote:
> On Thu, Aug 7, 2014 at 10:14 AM, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>=20
> > On Thu, Aug 7, 2014 at 4:34 AM, Thierry Reding <thierry.reding-Re5JQEeQqe8@public.gmane.org=
m>
> > wrote:
> > > On Thu, Aug 07, 2014 at 02:11:46AM -0400, Sean Paul wrote:
> > >> When calibrating the mipi phy, also include the clock lanes
> > >> in the calibration.
> > >>
> > >> Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > >> ---
> > >>  drivers/gpu/host1x/mipi.c | 70
> > +++++++++++++++++++++++++++++++++++++----------
> > >>  1 file changed, 56 insertions(+), 14 deletions(-)
> > >>
> > >> diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
> > >> index 0af2892..80578dc 100644
> > >> --- a/drivers/gpu/host1x/mipi.c
> > >> +++ b/drivers/gpu/host1x/mipi.c
> > >> @@ -49,10 +49,18 @@
> > >>  #define MIPI_CAL_CONFIG_DSIC         0x10
> > >>  #define MIPI_CAL_CONFIG_DSID         0x11
> > >>
> > >> +#define MIPI_CAL_CONFIG_DSIAB_CLK    0x19
> > >> +#define MIPI_CAL_CONFIG_DSICD_CLK    0x1a
> > >> +#define MIPI_CAL_CONFIG_CSIAB_CLK    0x1b
> > >> +#define MIPI_CAL_CONFIG_CSICD_CLK    0x1c
> > >> +#define MIPI_CAL_CONFIG_CSIE_CLK     0x1d
> > >> +
> > >
> > > These registers don't seem to exist on Tegra114 and earlier. It also
> > > seems like MIPI_CAL_CONFIG_DSIC and MIPI_CAL_CONFIG_DSID no longer ex=
ist
> > > on Tegra124 and later. And CSIC and CSID seem to be shared with DSIB
> > > (channel A and B) now.
> > >
> > > So I think we'll need something more elaborate than this. It should be
> > > differentiating between SoC revisions to allow checking for valid pad
> > > selection when calibrating.
> > >
> >
> > Yeah, definitely now that you point that out, we'll need something
> > better. I've altered the patch so the regs available depends on
> > compatible value. I'll wait on the following before re-posting.
> >
> > > I'll see if I can find out what's up with the change between Tegra114
> > > and Tegra124 regarding the DSIC and DSID pads. It looks to me like th=
ey
> > > were merged to match the DSIA and DSIB controllers, whereas before DS=
IA
> > > and DSIB were used for controller DSIA and DSIC and DSID were used for
> > > controller DSIB.
> > >
> >
> > Thanks for checking in on this. It would be useful to know which clock
> > lanes need to be configured for which pads. The documentation isn't
> > particularly good on this, so it's possible that my mapping between
> > data lane/clock lane in the modules array is incorrect.
> >
> >
> Hi Thierry,
> Any update on this?

I don't have any definitive answers yet, but from doing a bit of
research it seems that the D-PHY for DSI (and CSI) can be configured to
run in two modes, one where the 4 lanes are used as a single channel and
another where they can drive two channels. My understanding is that that
is what the channels refer to. That is, the D-PHY for controller DSI is
calibrated using the MIPI_CAL_CONFIG_DSIA register (0x0e/0x38) for data
lanes and MIPI_CAL_CONFIG_DSIA_A (0x19/0x64) and MIPI_CAL_CONFIG_DSIA_B
(0x1a/0x68) for clock lanes. For controller DSIB the registers are
MIPI_CAL_CONFIG_DSIB (0x0f/0x3c) and MIPI_CAL_CONFIG_DSIB_A (0x1b/0x6c)
as well as MIPI_CAL_CONFIG_DSIB_B (0x1c/0x70). The second controller
also shares the pads with CSIC and CSID.

As for the difference between Tegra114 and Tegra124 it seems that clock
lane calibration is new in Tegra124 (or perhaps it was done as part of
the data lane calibration on Tegra114), but DSIA and DSIB on Tegra114
refer to DSI channels A and B, whereas DSIC and DSID refer to channels A
and B of DSIB.

The above is still mostly guesswork, though perhaps more educated than
before. I've filed an internal bug to get confirmation from some of our
hardware engineers and clarify this in the TRM. I'll let you know when I
have more information.

Thierry

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT+tjRAAoJEN0jrNd/PrOhPxoP/R1wS3AdCpvjbUb2Yjpy1wvR
tR8otO87OMun2XKdhHeIBSpB498AHV9OmeB+9nNxlD66CmVjLLq3DxfmWYr4n9vR
aZbN0O3ukqTOS4Pv7iX7hJ1D/INXu4JB8bx1kJ1whk7O93RWwrcICVrHaeyJyHNt
vko3xRAVlnEWS5AC988vguUbSRETChNECGr3P5zKchnBoGcBU3ULnEPdTp32nqLb
A9ISSY1XnPTYTYGAUsSYU39Mea58aWZ2E0ywl8cCU2I5+3kHIw56EoHb9flXA4pD
fNb0NBCD5oWFOfHVY7t//dlqg0jplPNBpMoUX4L397Rk20C5idluJyvZQMzQgRCr
cBNHQ+pn8LNh6eF06Z27C77ung+1f5XnfViAruKgeG3gc5SPQ5XvXEA1gCy7IJ1F
Tx4LolrbFXlACgeVytS1r5lcuZkRiw4bx6IxCnrmXkiOV6lFbMqVkOBxaTBmLGK7
W55a09jDBv+Juaz8mmUGOOk8BzWcNVvetzTfhn9zOTxSZZSsrMDHI1GkMHZrAwP7
c7E7tcsOV74COJtmPj+V0xQdwLYpIneslk1SdlklhmqWhowDHfMjeZLRF6Z/QSP2
0kqED4zdqNBx1VzYyx91jeBzaM41WU7h4vp3nJBWGj7hbbBQRrUYpu2NDdoDap+W
LbNcyOr7ZnfOwLflKMlF
=W0Xh
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
