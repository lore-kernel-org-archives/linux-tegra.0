From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] i2c: tegra: fix a possible NULL dereference
Date: Thu, 12 Nov 2015 14:45:20 +0100
Message-ID: <20151112134519.GJ24008@pengutronix.de>
References: <1447313163-23848-1-git-send-email-clabbe.montjoie@gmail.com>
 <20151112122923.GA31671@ulmo>
 <20151112125422.GA3758@Red>
 <20151112132837.GF31671@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151112132837.GF31671@ulmo>
Sender: linux-i2c-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: LABBE Corentin <montjoie.mailing@gmail.com>, LABBE Corentin <clabbe.montjoie@gmail.com>, gnurou@gmail.com, ldewangan@nvidia.com, swarren@wwwdotorg.org, wsa@the-dreams.de, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Nov 12, 2015 at 02:28:37PM +0100, Thierry Reding wrote:
> On Thu, Nov 12, 2015 at 01:54:22PM +0100, LABBE Corentin wrote:
> > On Thu, Nov 12, 2015 at 01:29:23PM +0100, Thierry Reding wrote:
> > > On Thu, Nov 12, 2015 at 08:26:03AM +0100, LABBE Corentin wrote:
> > > > of_match_device could return NULL, and so cause a NULL pointer
> > >=20
> > > No. There is no way that of_match_device() can ever fail. The dri=
ver
> > > core uses the same table to match the OF device to the driver, so=
 the
> > > only case where of_match_device() would return NULL is if no matc=
h was
> > > found, in which case the tegra_i2c_probe() function would never h=
ave
> > > been called in the first place.
> > >=20
> > > Thierry
> > >=20
> >=20
> > In a parallel thread for i2c-rcar, the conclusion was different.
> > https://lkml.org/lkml/2015/11/12/83
>=20
> The conclusion was the same: there should be no case where this happe=
ns.
> The example that Uwe gave is hypothetical and not valid DT in the fir=
st
> place. So instead of chickening out I think it'd be better to just cr=
ash
> to make sure people fix the DT.

It depends in your trust in the DT. Just because it's not advisable to
do something that is not documented usually isn't a good excuse to not
handle broken input. That't the case for webserver requests, arguments
to system calls and several more. I admit DT is a bit special because
you have to assume it's trusted, but still handling errors in a sane wa=
y
is IMHO nice.

> On a side-note I think that platform_match() should be stricter and d=
o
> something like this instead:
>=20
> 	if (dev->of_node) {
> 		if (of_driver_match_device(dev, drv))
> 			return 1;
>=20
> 		return 0;
> 	}
That's equivalent to

	if (dev->of_node)
		return of_driver_match_device(dev, drv);

and was already suggested in the thread referenced from my reply to
http://article.gmane.org/gmane.linux.kernel/2083641 :-)

Best regards
Uwe=20

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
