From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v4 10/10] pwm-backlight: Add rudimentary device tree
 support
Date: Tue, 20 Mar 2012 16:08:36 +0000
Message-ID: <20120320160832.GL3445@opensource.wolfsonmicro.com>
References: <1331740593-10807-1-git-send-email-thierry.reding@avionic-design.de>
 <1331740593-10807-11-git-send-email-thierry.reding@avionic-design.de>
 <4F67F2AF.3020404@wwwdotorg.org>
 <20120320083943.GA20249@avionic-0098.adnet.avionic-design.de>
 <4F68A1C8.5080608@wwwdotorg.org>
 <20120320154330.GA8651@avionic-0098.mockup.avionic-design.de>
 <4F68A899.3030009@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="S6vg04ofUPzW4qJg"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F68A899.3030009-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--S6vg04ofUPzW4qJg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 20, 2012 at 09:56:09AM -0600, Stephen Warren wrote:
> On 03/20/2012 09:43 AM, Thierry Reding wrote:

> > What would be a good way to represent this in platform data?

> I think most get subsystems have a get API that works for both DT and
> non-DT, rather than using platform data:

Yes, please - having to have explict handling in drivers to select a
mechanism to look up stuff in the subsystem would be very sad.

> # works in DT right now IIRC:
> regulator_get(dev, supply_name)

Yes, that's totally transparent to the device.

> For board files, this would rely on some table which mapped from the get
> parameters to the returned object. IIRC, most of these tables are
> indexed by (dev_name(dev), name) and probably return the dev_name() of
> the providing device (or whatever internally makes sense to identify the
> device) plus some subsystem-specific data (e.g. PWM index).

That's how regulator and clk do it (I think pinctrl too, and IIO also
does this though it's in staging) - the consumer works with the struct
device and the name of the thing it's requesting and the things doing
the mapping (boards, SoCs, whatever) map this onto the actual device
with a lookup table which works in terms of dev_name() for the
requesting device.  We use dev_name() because many buses don't make a
struct device available until very late in system startup.

--S6vg04ofUPzW4qJg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPaKt5AAoJEBus8iNuMP3dQmsP/R4uyuzgsfFU8Zl7ewIY7Tt6
NQudBshHZIup8kG7+/3gmBa0vacr8O4sFUi+4RupcKDAmMIhlrjx85LRvIj2lOuT
BzaKB+dY3FWsNIOf1V80n+QuGsTVzc7wUwNn91pdc1T//AyqcrHLfLnTpE/oWnKX
aNjBa3L7euhFlGS+j4SBeT+hPn4WPnkuVrFvqwu1jHbBsSGMSbre5qY1vYwwzPcY
FFXKNK9HLjJvjxAGd4gWnVDRacGgu4SYv9OnRYiuRcXBPx1dFN7lBP7tRF/d5NCP
GLsrxmqCsSQDkPEfLIIBVQ1Ij6Cd1IrqKHxXJLXr6DhnonG2blkWNR5ZvIWbdKFI
ovaDBnDnaie89EViMhOBCCo+GBJvUGurDOvDlabpNZjDZuC7bZNXvZT42V67/LYz
dUXw+ctNa8raoQkSu7CC7NkKJFkPH669TLXM3xN9wHvGRT9O2QV+QI13IVfXnBYW
IPcrbR5IHMGay1FS+CCkUH164beOUHV1ArwJ4vk7H1ZYWmuWlkpu8vAZT0mLdgDN
n2sTbTIlq+xjbxqZCpasTWmrrWSNlqzLiDitoE0RF2GOuh1y//QrUN+SenlSqFZj
cCRuy9CmTRPUv6BUx3lLQGC+O2QJ2jHwfw3622ao2dAiKBxPHyy9svqK/jO0VLSY
cxQ5gFyu4ZITvDzapLeU
=zVGz
-----END PGP SIGNATURE-----

--S6vg04ofUPzW4qJg--
