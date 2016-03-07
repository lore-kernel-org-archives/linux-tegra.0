From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v10 1/9] dt-bindings: phy: Add NVIDIA Tegra XUSB pad
 controller binding
Date: Mon, 7 Mar 2016 12:24:18 +0100
Message-ID: <20160307112418.GA11152@ulmo.nvidia.com>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
 <20160305043145.GL13525@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160305043145.GL13525@rob-hp-laptop>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 04, 2016 at 10:31:45PM -0600, Rob Herring wrote:
> On Fri, Mar 04, 2016 at 05:19:31PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > The NVIDIA Tegra XUSB pad controller provides a set of pads, each with a
> > set of lanes that are used for PCIe, SATA and USB.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > Changes in v10:
> > - clarify that the hardware documentation means something different when
> >   referring to a "port" (intra-SoC connectivity)
> >=20
> > Changes in v9:
> > - rename UTMI -> USB2 to match hardware documentation
> > - reword according to suggestions by Stephen Warren
> > - make Tegra132 compatible string list consistent
> > - remove mailbox support
> >=20
> >  .../bindings/phy/nvidia,tegra124-xusb-padctl.txt   | 376 +++++++++++++=
++++++++
> >  .../pinctrl/nvidia,tegra124-xusb-padctl.txt        |   5 +
> >  2 files changed, 381 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra1=
24-xusb-padctl.txt
>=20
> Without really understanding the h/w here, looks okay to me.
>=20
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>=20
> > +SoC include:
> > +
> > +	padctl@0,7009f000 {
>=20
> Drop the comma. Commas should only be used if there are distinct fields.
>=20
> If I get my dtc patch done, these are going to start warning, so you=20
> might want to go fix dts files (assuming that's where this is coming=20
> from).

I noticed that in today's next the updated DTC already complains about a
lot of things in existing DTS files. For Tegra that's primarily the
memory node, because it has a reg property but no unit name. Any hints
as to how to solve that? I think I remember from way back that memory
was supposed to be an exception, perhaps DTC needs to be taught that?

Thierry

--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJW3WTfAAoJEN0jrNd/PrOhi5IQALhVr9h9uBANbRMXYlcW0T3K
coqmhlVo4xAWR0pOO+/8deZoS8q61wgEP/I5EG0o9fDPkZsBfmtMs67HRv1sp068
DbBFywOl+S09EFR6SvDNoKCY2FKbSdaNmlHRD6gjKnYhoXU4o0j1ZImgUEjFXFxg
+2CtGox2kwFAFLcXK9NHJXRJ7WgaFJLSD8YnlaXvKq14pMuxsOQIh+u/mXBCCBz2
E9PveL208HqB0PXQ0YdyIKLYKi7AiHkR3r/bMQkpndTIhtX1JJMEFrWducqygSu6
okT96RuW0YvciniHdmv0opRXd5Vg+d+SJ4BK0d5dvfcaZMTkkxRspQ62ABMYrr5Y
jpAPZBWwOgx/nrnWWbFlszKuJniUSqvyDORk1Flkau6coftAMj8O6ZlOu2518CwW
/Jg7EbplM09uI68IzJgboU10W5NXXbHy+Shsdlo4/eXSySoYkPZ2EK98YLucjoWR
UBEl26BQFj6Ve6P6yK6hfTb8G+DTBCRIaNAf5MARg1iwuZm4yRgaNQXrycEx0lkD
dD4fq+ruKIQeyrmfqfKNseBmLWfDmUBQxxOTuO/ljwsJoyKCxRxQUMyhSKpsRuip
Wu03b08MeEp3WD3koQipY/Ny4yA/n5wKzejx1m1tdLLNBg/+2l5nkzB6y43aMKLW
wfUCFQ0HEw//5oMpBmL3
=D435
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--
