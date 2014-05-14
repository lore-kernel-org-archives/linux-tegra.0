From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 4/7] drivers/base: Add interface framework
Date: Wed, 14 May 2014 17:13:57 +0200
Message-ID: <20140514151356.GD8612@ulmo>
References: <1399995050-28435-1-git-send-email-thierry.reding@gmail.com>
 <1399995050-28435-5-git-send-email-thierry.reding@gmail.com>
 <20140513175713.GS3908@phenom.ffwll.local>
 <20140513213057.GA7239@mithrandir>
 <20140514143421.GG8790@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2012140566=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140514143421.GG8790@phenom.ffwll.local>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Russell King <rmk+kernel@arm.linux.org.uk>, dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, David Herrmann <dh.herrmann@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============2012140566==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kvUQC+jR9YzypDnK"
Content-Disposition: inline


--kvUQC+jR9YzypDnK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2014 at 04:34:21PM +0200, Daniel Vetter wrote:
> On Tue, May 13, 2014 at 11:31:07PM +0200, Thierry Reding wrote:
> > A different solution, which seems to be fairly common for DRM drivers
> > for SoCs, is to instantiate a dummy device so that the DRM driver can
> > bind to it. This can happen in two forms: add the dummy device directly
> > in device tree (which goes against pretty much everything that's been
> > preached about device tree in the past) or the dummy device can be
> > instantiated in code, which is what the current Tegra DRM/host1x driver
> > does.
>=20
> Actually the dummy device seems to be an acceptable solution and iirc was
> even acked by DT maintainers in the last KS. I'm not on top of things, but
> iirc the thinking was that a dummy device which just pulls in all the
> relevant real bits with phandles is justified in the board file since it
> tells you how the board is intended to be used. The justification was that
> on SoCs where assigning stuff between v4l and drm is really flexible (e.g.
> on omap or so where you can assign the display pipes essentially freely)
> the use-case of the board is what matters, and that's a somewhat physical
> property of it (i.e. in what kind of device it's sitting.)

I disagree. If there's a way to derive all that information within the
driver (like we do for Tegra) then there should be no need to add
redundant content to the device tree. Also note that Tegra DRM and its
device tree binding predate the last KS, and prior to that the gospel
was to *not* add this kind of data to the device tree. Hence I was
forced to spend a *lot* of time working out a solution in the driver.
Therefore I hope it's understandable that I don't take well to being
told to just go use a bloody dummy device.

> So in your case you'd have a fake display and a fake video device which
> pulls everything the drm/v4l driver need together. So if the issue is how
> to get at a master device I think that's simple to solve.

But that's completely redundant. The driver is perfectly capable of
determining what devices belong to a DRM device and which should be part
of a V4L2 device.

Fake devices are only workarounds for a problem that we currently have
no better solution for in the kernel. And as a matter of fact we already
do create a dummy device (albeit in the kernel rather than in device
tree) on Tegra. But I consider that suboptimal, hence why I want to find
a better way to do this. This interface framework is the result.

If people don't see a need to fix this then I'll just stick with what I
currently have, since it isn't any worse than what everybody else is
doing.

> If the issue otoh is how the various drivers can get at the bus-like
> services host1x exposes, then I think a real bus driver makes a lot more
> sense. And Greg seems to have ideas about that already.

There aren't really any bus-like services exposed by host1x. It really
just exposes resources such as DMA channels or syncpoints. But that's
not even a problem because we know that host1x children are always,
well, children of host1x and therefore we can simply get access to
host1x via the parent device.

Thierry

--kvUQC+jR9YzypDnK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTc4g0AAoJEN0jrNd/PrOhE/EQAI2/8inih/FldRWfKiKJHhlo
99X/I8nwf7QfUp84u020n8QXTKBueJMkk2bAFyWI4HPdBvKIPQhWyRh8Uc/AA9Al
dDuiExaiX7h6Zo8Pvlv+KRlNDOWwo3m++50udcH2DFipiPXosnakGFfFPz/KisLX
GVNpUsg5nnpHbCPet3V2niRzfDRfjXEq0ZTzoHXcFSjYOb3gMiMksBsLw6dOBjoO
VYpJM/xa0TST6jCDXkX4C9IlACVlYmoq60/8PjOh2VZe+fr3xiwY/d/G2U/MECCG
qODIarhByywsrNg+BW4/ZB58bEuq4A8nb/nWvgpZJ1J7kpfoKKJiCx0BYm1SS5HK
z4NF85kvmmfpp9c/5DNnR3UMtg/Bmz3i/aorCf7tWwroLn0Xb/6oPFRG30c7Xo+J
Ka0N1QMq6PjWKf+Y/7AIYWsGI0nhvBgIIclnyOnHAX2MgKD/JUltcWfjf5NvVEaj
16eE8dogX89ZT0OdXmBomBQqW8ZdAAo+oSbehVkzGW3fGNiTHMdf8QzEL+ZtSMUU
whKLV6tRqwX3mgBXWSfpamScunoPeB9ai1w3s0iLq++5uZTZxkoTmdkq5ef9ZmUJ
9aPDdXbWlLdoav3oX1kIfgj4aaO/e3GEz9YXPE8se9220B8W1XXcjho/KcZGN9H/
ykiXNwB+/s/SQfOR0y5i
=T1ep
-----END PGP SIGNATURE-----

--kvUQC+jR9YzypDnK--

--===============2012140566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2012140566==--
