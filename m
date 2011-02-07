From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] [ARM] tegra: Add i2c support
Date: Mon, 7 Feb 2011 09:45:01 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF0310F5FC90@HQMAIL01.nvidia.com>
References: <1283466103-20889-1-git-send-email-ccross@android.com>
 <AANLkTimYURYGix-0Xk3wdf1A-XEAJbBXR_JDn1BFw_uq@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ben Dooks (embedded platforms)" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: "mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org" <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, "gadiyar-l0cyMroinI0@public.gmane.org" <gadiyar-l0cyMroinI0@public.gmane.org>, "Jean Delvare (PC drivers, core)" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Stephen Warren wrote at Sent: Monday, January 31, 2011 3:49 PM:
>=20
> Colin Cross wrote at Tuesday, December 21, 2010 5:12 PM:
> >
> > On Thu, Sep 2, 2010 at 3:21 PM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wr=
ote:
> > > Signed-off-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
> > > ---
> > > =A0drivers/i2c/busses/Kconfig =A0 =A0 | =A0 =A07 +
> > > =A0drivers/i2c/busses/Makefile =A0 =A0| =A0 =A01 +
> > > =A0drivers/i2c/busses/i2c-tegra.c | =A0665 ++++++++++++++++++++++=
++++++++++++++++++
> > > =A0include/linux/i2c-tegra.h =A0 =A0 =A0| =A0 25 ++
> > > =A04 files changed, 698 insertions(+), 0 deletions(-)
> > > =A0create mode 100644 drivers/i2c/busses/i2c-tegra.c
> > > =A0create mode 100644 include/linux/i2c-tegra.h
> > >
> > Ben, this didn't make it into 2.6.37?  Can it go into next-i2c?
>=20
> I didn't see any response to this request, at least not in the linux-=
tegra
> archives.

Ben, did Colin's latest patch look good; could it be applied?

Colin, perhaps you could repost the patch in case it's fallen out of Be=
n's
inbox.

As background, I'd really like this patch to show up in 2.6.39; the ASo=
C
driver I've upstreamed for Tegra Harmony (and which will be in 2.6.39) =
relies
on this I2C driver to provide communication with the audio codec. Hence=
, the
ASoC driver is useless without the I2C driver also merged.

Thanks.

--=20
nvpublic
