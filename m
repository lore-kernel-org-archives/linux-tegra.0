From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC 1/5] PCI: tegra: Overhaul regulator usage
Date: Tue, 8 Apr 2014 21:52:41 +0200
Message-ID: <20140408195240.GA21978@ulmo.nvidia.com>
References: <1396622969-17837-1-git-send-email-treding@nvidia.com>
 <1396622969-17837-2-git-send-email-treding@nvidia.com>
 <53444AE3.6030603@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53444AE3.6030603-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 08, 2014 at 09:15:47PM +0200, Stephen Warren wrote:
> On 04/04/2014 08:49 AM, Thierry Reding wrote:
> > The current usage of regulators for the Tegra PCIe block is wrong. It
> > doesn't accurately reflect the actual supply inputs of the IP block and
> > therefore isn't as flexible as it should be. Rectify this by describing
> > all possible supply inputs in the device tree binding documentation and
> > deprecate the old supply properties.
>=20
> > diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.=
txt b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
>=20
> > +Power supplies for Tegra30:
> ...
> > +- Optional:
> > +  - If port 0 is enabled:
> > +    - avdd-pexa-supply: Power supply for analog PCIe logic. Must suppl=
y 1.05 V.
> > +    - vdd-pexa-supply: Power supply for digital PCIe I/O. Must supply =
1.05 V.
> > +  - If at least one of ports 1 and 2 is enabled:
> > +    - avdd-pexb-supply: Power supply for analog PCIe logic. Must suppl=
y 1.05 V.
> > +    - vdd-pexb-supply: Power supply for digital PCIe I/O. Must supply =
1.05 V.
>=20
> Did you get confirmation from HW/... that the mapping from pexa/b to
> PCIe ports you document above is correct? IIRC the two supplies might be
> related to lanes rather than ports?

Not yet, which is the primary reason this is still RFC. Just wanted to
get early feedback on the general direction of the series.

Thierry

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTRFOIAAoJEN0jrNd/PrOhZU0P/iltRyWXE6iWnZZVX1EYUVAb
LNiPmwwHPktFIa74iifEeb9wqzNT52Pb3StDa8gM93AtuBtpDtgUC/Rgs3drxj/B
S+ZSNuk/x0jJeoao8GhdGI1Pg1eAVUoI+rTXdMZ3JMT32cJp2KlQdFP5vUYy7DYw
DWygqk5WaiXt++hRpAIrpc2RwlHzcdPJt2q0zv6CUzCpguQQckMALr0MpbWYMZBG
rbvIQoI/yyaJ1/ikjwLWPFsAOzIAy2S9U87I9t0dmS/e3kdls8JI+T5zqe6OGBPn
CWsynOu4wWtKUudt6nPwQhozuHHuOz9h+4EFCwKBz/rCC5cyRx8Fx6e1CVpVzy8J
nWPEYQ2lDaCGRZpTLp/KcRRJFmAa6rwQHUySW6u/FKWmjqb9/UI1xC/c7et7s17h
w8c3AVSDi6gdBk5i2YFWSR6r3jNSJRo8g9NuAIntmuGEdorL20T7LK/W37s9IMCE
Zm7/QB58+PGbVoFR0BleFccNmgYR/JmCho+F7LKfTUdh4up+GRwp3PR9l3UrQ6bn
+2dWm2rk4P4iemQqDLWMuC+Jaevbqbuz/GehABwk5mpllTIiEaHYOrJQCtgizSLj
ZTXZCWKeDmGc63UzKqweAOpRQMc5hJh6x397+ZpgCdyv7E8OIlF4P8ng24TrIEyB
7MuIwe+tUg+xnpqWVhVd
=wgYI
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
