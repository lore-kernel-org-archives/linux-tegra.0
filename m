From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 01/31] ARM: tegra: add missing clock documentation to DT
 bindings
Date: Mon, 2 Dec 2013 09:52:58 +0100
Message-ID: <20131202085257.GA17834@ulmo.nvidia.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-2-git-send-email-swarren@wwwdotorg.org>
 <20131129114900.GN22771@ulmo.nvidia.com>
 <529B8888.3010801@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <529B8888.3010801-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 01, 2013 at 12:05:44PM -0700, Stephen Warren wrote:
> On 11/29/2013 04:49 AM, Thierry Reding wrote:
> > On Fri, Nov 15, 2013 at 01:53:56PM -0700, Stephen Warren wrote:=20
> > [...]
> >> @@ -60,6 +81,12 @@ of the following host1x client modules: -
> >> compatible: "nvidia,tegra<chip>-dc" - reg: Physical base address
> >> and length of the controller's registers. - interrupts: The
> >> interrupt outputs from the controller. +  - clocks : Must contain
> >> an entry for each entry in clock-names. +    See
> >> ../clocks/clock-bindings.txt for details. +  - clock-names : Must
> >> include the following entries: +    - disp1 or disp2 (depending
> >> on the controller instance)
> >=20
> > I'm not sure if this makes sense. The name could be the same
> > independent of which controller uses it. If it isn't then the
> > driver would need additional code to find out which instance it is
> > and construct a dynamic string.
> >=20
> > Any objection to just make this entry "disp", or "dc"?
>=20
> This patch simply documents the binding that the various drivers
> already require and/or whatever is already in the DT files if there
> are any clocks the drivers don't currently use. I did consider fixing
> up all the current usage to actually be sane, but that would require
> even more driver changes (in addition to those required for the reset
> framework patches).

Okay, I understand. I still think we should change the usage for this
particular use-case subsequently. In retrospect the entry in clock-names
wasn't thought out very well. It seems like the reason for using disp1
and disp2 respectively was so that it would match the system-wide clock
name, rather than the clock's label within the display controller's
context.

Just to clarify what I mean, if we stick to the above, then we'll need
to add code to the driver along the lines of:

	char clock_name[6];

	if (regs->start =3D=3D 0x54200000)
		index =3D 1;
	else
		index =3D 2;

	sprintf(clock_name, "disp%u", index);

	clk =3D devm_clk_get(&pdev->dev, clock_name);

rather than the much more simple and elegant:

	clk =3D devm_clk_get(&pdev->dev, "disp");

The whole purpose of the clock consumer ID is to be generic and as such
independent of the specific IP block or instance thereof.

> >> diff --git
> >> a/Documentation/devicetree/bindings/spi/nvidia,tegra114-spi.txt
> >> b/Documentation/devicetree/bindings/spi/nvidia,tegra114-spi.txt=20
> >> index 91ff771c7e77..d4f2d534934b 100644 ---
> >> a/Documentation/devicetree/bindings/spi/nvidia,tegra114-spi.txt=20
> >> +++
> >> b/Documentation/devicetree/bindings/spi/nvidia,tegra114-spi.txt=20
> >> @@ -6,8 +6,10 @@ Required properties: - interrupts: Should
> >> contain SPI interrupts. - nvidia,dma-request-selector : The Tegra
> >> DMA controller's phandle and request selector for this SPI
> >> controller. -- This is also require clock named "spi" as per
> >> binding document -
> >> Documentation/devicetree/bindings/clock/clock-bindings.txt +-
> >> clocks : Must contain an entry for each entry in clock-names. +
> >> See ../clocks/clock-bindings.txt for details. +- clock-names :
> >> Must include the following entries: +  - spi
> >=20
> > This is inconsistent with other bindings that require only a
> > single clock entry. I suppose that this is required because of the
> > driver requesting a specifically named clock, in which case that's
> > fine.
>=20
> This driver does clk_get(dev, "spi") rather than clk_get(dev, NULL),
> so this requires a specific name. Again, I did consider updating all
> drivers to use names, but decided I didn't want to do even more driver
> changes, but instead just document what was currently required.

Yes, I realized that as well. Oh well, I guess that's part of the "pain"
for not doing it right from the start. Although, admittedly, this really
isn't a big issue.

Thierry

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSnEppAAoJEN0jrNd/PrOhtbMP/R9Mx90PVhzoDwouqIuwekjO
7cwFXZdnYDT+5xSa23nBsl4BhbJ/altdBemuYomNpe6/qbJFDozV6lcqEbzKAwaN
gv2zCbPTVGU+1ZkNxh+KxVbagW8svwpjDqeVKP+YeymNquiJ8RU6p3U4NmDXblcs
KZ/+rJpzD+nBc8PthLMPFel6NoRZ9bcgCnbnMa6U/AVA1nB7uT/4jjHnpUeliz8Y
QK+beoibNhpdbTTpSv1+ZYh6LIqYlWQ9Z7JZXzA8lX3yr5it77D8oA6xLIN3HAOV
+NOn0twglu4uLjE3+fLobTW3cRfjGVoWHy8bCpckBCusFz4bvR0eQoFLooG1Bgvb
eZPzK6nOxoJxi8ux4TKCFNsKWdh9FKsUCCLRC3wtLYk3jC/trDZfHhIoVJAA5k2j
tZQ1me79G1dtT6R/b8MPA6jnhe2JQUIWEWh62jTFchF3p0nJ5lBOd1NWLmaExBGj
lespdQsn/lnmqOhBXVl6yoTL5Ss/9x248dIWYnFgKLzU3DYkVokppOMHikqC6lpK
ZpsZh1xwdcsFXvSoP4Wgquwdb6DckzvnHCfczJl6m6St36fp/MUyEmwPxSZ2QdTR
DAGmZmZRDo0s1ZLGn0PEQL0m61vTKzUZU3UoJqvt7V9CHBzZIf39jqwmHgERSQEH
oMBx0czvcoHocHS1th0X
=MXaT
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
