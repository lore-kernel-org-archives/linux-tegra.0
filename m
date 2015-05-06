From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: How to encode being an I2C slave in DT?
Date: Wed, 6 May 2015 19:47:57 +0200
Message-ID: <20150506174757.GZ25193@pengutronix.de>
References: <1427745615-5428-1-git-send-email-danindrey@mail.ru>
 <20150505105513.GA1841@katana>
 <20150506065928.GP25193@pengutronix.de>
 <3394114.re5da8pjTi@fb07-iapwap2>
 <20150506080951.GS25193@pengutronix.de>
 <554A39F1.9060507@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <554A39F1.9060507-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello Stephen,

On Wed, May 06, 2015 at 09:57:37AM -0600, Stephen Warren wrote:
> On 05/06/2015 02:09 AM, Uwe Kleine-K=F6nig wrote:
> >On Wed, May 06, 2015 at 09:53:55AM +0200, Marc Dietrich wrote:
> >>Am Mittwoch, 6. Mai 2015, 08:59:28 schrieb Uwe Kleine-K=F6nig:
> >>>On Tue, May 05, 2015 at 12:55:13PM +0200, Wolfram Sang wrote:
> >>>>So what about adding a new property "i2c-slave-reg"? This does no=
t only
> >>>>prevent the confusion above, but also makes it very clear that th=
is node
> >>>>is an I2C slave without the need to encode that somehow in the
> >>>>compatible property (although it probably should be described the=
re as
> >>>>well, still).
> >>>
> >>>I admit I didn't follow the discussions referenced in the footnote=
s, but
> >>>I wonder if the slave part should be added to the device tree at a=
ll.
> >>>AFAICT it could (and so should) be completely userspace-defined wh=
ich
> >>>slave driver is used on which address. I imagine that for most
> >>>controllers the bus addresses to use can be chosen more or less fr=
eely.
> >>>So what am I missing?
> >>
> >>if you had read the footnotes you would know :-) Our usecase is con=
nect an
> >>embeedded controller via i2c to the host soc, similar to cros-ec, b=
ut here the
> >>ec is the i2c master. The ec connects keyboard, mouse, pwrmngt, and=
 other
> >>stuff, for which the drivers are best implemented in kernel code AF=
AIK.
> >
> >Right, the driver might sensibly be implemented in kernel space. But=
 I'd
> >vote that you still need to do the binding of these drivers to your
> >slave controller from userspace. Then there is no need to specify
> >anything in your dtb.
>=20
> I think the set of I2C slave devices that are implemented by the
> Linux system can reasonably be considered part of the HW definition.
> Most DT content to date has been a definition of the HW that's
> available to SW, but at least in this case, this I2C slave device is
> something that must be implemented (admittedly in conjunction with
> SW) using the I2C slave HW on the main SoC, in order for the overall
> HW to work as intended.
I'm not convinced. Why must it be implemented? And is it too late if th=
e
setup is done by userspace?
The devicetree description of a flash chip doesn't include the rootfs
content either, although a working rootfs is critical for most operatin=
g
systems. The devicetree description of an ethernet adapter doesn't
include its network setup although an ethernet adapter hardly makes any
sense without an IP.
=20
> BTW, I believe devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org was created to
> address subsystem-level DT schema questions like this. It's much
> lower volume, so perhaps the thread would get noticed by the DT
> maintainers if posted there (or perhaps just CC them)?
I added them to Cc.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
