From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: How to encode being an I2C slave in DT?
Date: Wed, 6 May 2015 10:09:51 +0200
Message-ID: <20150506080951.GS25193@pengutronix.de>
References: <1427745615-5428-1-git-send-email-danindrey@mail.ru>
 <20150505105513.GA1841@katana>
 <20150506065928.GP25193@pengutronix.de>
 <3394114.re5da8pjTi@fb07-iapwap2>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3394114.re5da8pjTi@fb07-iapwap2>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello Marc,

On Wed, May 06, 2015 at 09:53:55AM +0200, Marc Dietrich wrote:
> Am Mittwoch, 6. Mai 2015, 08:59:28 schrieb Uwe Kleine-K=F6nig:
> > On Tue, May 05, 2015 at 12:55:13PM +0200, Wolfram Sang wrote:
> > > So what about adding a new property "i2c-slave-reg"? This does no=
t only
> > > prevent the confusion above, but also makes it very clear that th=
is node
> > > is an I2C slave without the need to encode that somehow in the
> > > compatible property (although it probably should be described the=
re as
> > > well, still).
> >=20
> > I admit I didn't follow the discussions referenced in the footnotes=
, but
> > I wonder if the slave part should be added to the device tree at al=
l.
> > AFAICT it could (and so should) be completely userspace-defined whi=
ch
> > slave driver is used on which address. I imagine that for most
> > controllers the bus addresses to use can be chosen more or less fre=
ely.
> > So what am I missing?
>=20
> if you had read the footnotes you would know :-) Our usecase is conne=
ct an=20
> embeedded controller via i2c to the host soc, similar to cros-ec, but=
 here the=20
> ec is the i2c master. The ec connects keyboard, mouse, pwrmngt, and o=
ther=20
> stuff, for which the drivers are best implemented in kernel code AFAI=
K.=20
Right, the driver might sensibly be implemented in kernel space. But I'=
d
vote that you still need to do the binding of these drivers to your
slave controller from userspace. Then there is no need to specify
anything in your dtb.

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
