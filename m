From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 05/10] dt-bindings: PCI: tegra: Add device tree support
 for T194
Date: Tue, 2 Apr 2019 16:20:31 +0200
Message-ID: <20190402142031.GC8017@ulmo>
References: <1553613207-3988-1-git-send-email-vidyas@nvidia.com>
 <1553613207-3988-6-git-send-email-vidyas@nvidia.com>
 <5ca06149.1c69fb81.720fd.79e1@mx.google.com>
 <5ef50168-2476-1088-7156-8a4488d7a2e1@nvidia.com>
 <20190401143138.GA4874@ulmo>
 <67f9b726-c075-0291-7777-8f10ecc9e29d@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TiqCXmo5T1hvSQQg"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <67f9b726-c075-0291-7777-8f10ecc9e29d@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, bhelgaas@google.com, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, lorenzo.pieralisi@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, tiwai@suse.de, spujar@nvidia.com, skomatineni@nvidia.com, liviu.dudau@arm.com, krzk@kernel.org, heiko@sntech.de, horms+renesas@verge.net.au, olof@lixom.net, maxime.ripard@bootlin.com, andy.gross@linaro.org, bjorn.andersson@linaro.org, jagan@amarulasolutions.com, enric.balletbo@collabora.com, ezequiel@collabora.com, stefan.wahren@i2se.com, marc.w.gonzalez@free.fr, l.stach@pengutronix.de, tpiepho@impinj.com, hayashi.kunihiko@socionext.com, yue.wang@amlogic.com, shawn.lin@rock-chips.com, xiaowei.bao@nxp.com, linux
List-Id: linux-tegra@vger.kernel.org


--TiqCXmo5T1hvSQQg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 02, 2019 at 02:46:27PM +0530, Vidya Sagar wrote:
> On 4/1/2019 8:01 PM, Thierry Reding wrote:
> > On Mon, Apr 01, 2019 at 04:48:42PM +0530, Vidya Sagar wrote:
> > > On 3/31/2019 12:12 PM, Rob Herring wrote:
> > > > On Tue, Mar 26, 2019 at 08:43:22PM +0530, Vidya Sagar wrote:
[...]
> > > > > +Optional properties:
> > > > > +- nvidia,max-speed: limits controllers max speed to this value.
> > > > > +    1 - Gen-1 (2.5 GT/s)
> > > > > +    2 - Gen-2 (5 GT/s)
> > > > > +    3 - Gen-3 (8 GT/s)
> > > > > +    4 - Gen-4 (16 GT/s)
> > > > > +- nvidia,init-speed: limits controllers init speed to this value.
> > > > > +    1 - Gen-1 (2. 5 GT/s)
> > > > > +    2 - Gen-2 (5 GT/s)
> > > > > +    3 - Gen-3 (8 GT/s)
> > > > > +    4 - Gen-4 (16 GT/s)
> > > >=20
> > > > Don't we have standard speed properties?
> > > Not that I'm aware of. If you come across any, please do let me know =
and
> > > I'll change these.
> >=20
> > See Documentation/devicetree/bindings/pci/pci.txt, max-link-speed.
> > There's a standard of_pci_get_max_link_speed() property that reads it
> > from device tree.
> Thanks for the pointer. I'll switch to this in the next patch.
>=20
> >=20
> > > > Why do we need 2 values?
> > > max-speed configures the controller to advertise the speed mentioned =
through
> > > this flag, whereas, init-speed gets the link up at this speed and sof=
tware
> > > can further take the link speed to a different speed by retraining th=
e link.
> > > This is to give flexibility to developers depending on the platform.
> >=20
> > This seems to me like overcomplicating things. Couldn't we do something
> > like start in the slowest mode by default and then upgrade if endpoints
> > support higher speeds?
> >=20
> > I'm assuming that the maximum speed is already fixed by the IP hardware
> > instantiation, so why would we want to limit it additionally? Similarly,
> > what's the use-case for setting the initial link speed to something
> > other than the lowest speed?
> You are right that maximum speed supported by hardware is fixed and throu=
gh
> max-link-speed DT option, flexibility is given to limit it to the desired=
 speed
> for a controller on a given platform. As mentioned in the documentation f=
or max-link-speed,
> this is a strategy to avoid unnecessary operation for unsupported link sp=
eed.
> There is no real use-case as such even for setting the initial link speed=
, but it is
> there to give flexibility (for any debugging) to get the link up at a cer=
tain speed
> and then take it to a higher speed at a later point of time. Please note =
that, hardware
> as such already has the capability to take the link to maximum speed agre=
ed by both
> upstream and downstream ports. 'nvidia,init-speed' is only to give more f=
lexibility
> while debugging. I'm OK to remove it if this is not adding much value her=
e.

If this is primarily used for debugging or troubleshooting, maybe making
it a module parameter is a better choice?

I can see how max-link-speed might be good in certain situations where a
board layout may mandate that a link speed slower than the one supported
by the hardware is used, but I can't imagine a case where the initial
link speed would have to be limited based on the hardware designe.

Rob, do you know of any other cases where something like this is being
used?

> > > > > +- nvidia,disable-aspm-states : controls advertisement of ASPM st=
ates
> > > > > +    bit-0 to '1' : disables advertisement of ASPM-L0s
> > > > > +    bit-1 to '1' : disables advertisement of ASPM-L1. This also =
disables
> > > > > +                 advertisement of ASPM-L1.1 and ASPM-L1.2
> > > > > +    bit-2 to '1' : disables advertisement of ASPM-L1.1
> > > > > +    bit-3 to '1' : disables advertisement of ASPM-L1.2
> > > >=20
> > > > Seems like these too should be common.
> > > This flag controls the advertisement of different ASPM states by root=
 port.
> > > Again, I'm not aware of any common method for this.
> >=20
> > rockchip-pcie-host.txt documents an "aspm-no-l0s" property that prevents
> > the root complex from advertising L0s. Sounds like maybe following a
> > similar scheme would be best for consistency. I think we'll also want
> > these to be non-NVIDIA specific, so drop the "nvidia," prefix and maybe
> > document them in pci.txt so that they can be more broadly used.
> Since we have ASPM-L0s, L1, L1.1 and L1.2 states, I prefer to have just o=
ne entry
> with different bit positions indicating which particular state should not=
 be
> advertised by root port. Do you see any particular advantage to have 4 di=
fferent options?
> If having one options is fine, I'll remove "nvidia," and document it in p=
ci.txt.

I don't care strongly either way. It's really up to Rob to decide.

Thierry

--TiqCXmo5T1hvSQQg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyjb68ACgkQ3SOs138+
s6FD5w/+Ph9LQU8GQsXjPzIJIldfOH1kjDq6hK38fLuzrABjWSsrRFvEIA9bHgJq
Nsd7KXtwEaqoL22mL9NfByIWWiWlnGBeAMdHJ/XXZOwAUp/O9+VVs3W9DEynSffr
Y75gYnUoI4u0OmQKGHRyKItqY/X6ZgiOfUEZikk6FEgFqMB+POTnWIFVtFj7sal+
B6BRmyX7JG6/7uj+5fR4D8s86QFLkhGbLLvH4pCk/4j+BoMtgxWkfnm4UwIohI3M
JUJ498e50Wkv4b22K6EfgRWm3UTIlEqYvi5UA2dc2WPX0YftobDjnOzxM+xTmaG6
jTqMI54S01tmj+pZ1MYb4v+rWfcnZzBYdFU1kYww6YD9iUtZRfZ0xlEx4x5/4yRK
Yc7jXQIdcPe0Cim7i4Gynu+LgnIm15rwXX0o3MzvYze2GdQ1KRu3enOvJI0OqavQ
wiF2X2835v6dvgFMlYM6RQRG2prakluLnop4EeWe/kZR0Dq/F1wcNR6mSht/7QjN
lmbOTOPhc3FCpjV7iZp3ljEeRllOB7Ri4C6s+Byzy7Vix4wDlatEc7fHqDqVMlYz
rnGvFY5WvmuBX5nzyYzy27R/u2VBKwzYO1aTid7FSAVO39cFV8BScHZSxIncnwSH
q49nsxqe58i6IIFB2rI3iT+an+TBypraHkp7inpQdULp2Jcnj3U=
=BIli
-----END PGP SIGNATURE-----

--TiqCXmo5T1hvSQQg--
