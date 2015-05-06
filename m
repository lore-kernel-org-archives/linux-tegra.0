From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: How to encode being an I2C slave in DT?
Date: Wed, 6 May 2015 08:59:28 +0200
Message-ID: <20150506065928.GP25193@pengutronix.de>
References: <1427745615-5428-1-git-send-email-danindrey@mail.ru>
 <20150403194635.GC2016@katana>
 <1549160.njMIY2NVTi@fb07-iapwap2>
 <20150505105513.GA1841@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150505105513.GA1841@katana>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hello,

On Tue, May 05, 2015 at 12:55:13PM +0200, Wolfram Sang wrote:
> So what about adding a new property "i2c-slave-reg"? This does not on=
ly
> prevent the confusion above, but also makes it very clear that this n=
ode
> is an I2C slave without the need to encode that somehow in the
> compatible property (although it probably should be described there a=
s
> well, still).
I admit I didn't follow the discussions referenced in the footnotes, bu=
t
I wonder if the slave part should be added to the device tree at all.
AFAICT it could (and so should) be completely userspace-defined which
slave driver is used on which address. I imagine that for most
controllers the bus addresses to use can be chosen more or less freely.
So what am I missing?

> > I hope with this post I can join the different discussions somehow =
so we are=20
> > able to find a common sense which is acceptable for all.
>=20
> Thanks for doing this! I changed the subject to maybe raise interest =
a
> bit more.
that worked fine :-)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
