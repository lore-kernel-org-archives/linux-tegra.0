From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: nyan: Mark all USB ports as host
Date: Tue, 08 Nov 2016 10:09:24 +0100
Message-ID: <1478596164.2045.2.camel@paulk.fr>
References: <20160918102852.6593-1-contact@paulk.fr>
         <20161107132854.GF12559@ulmo.ba.sec>
         <13e7ff98-8bc2-ccf7-94bb-4e1d3c61b20d@nvidia.com>
         <20161108085420.GG2478@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-5Vn7iimBs6YXTAY5PWg3"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161108085420.GG2478-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--=-5Vn7iimBs6YXTAY5PWg3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 08 novembre 2016 =C3=A0 10:54 +0200, Peter De Schrijver a =C3=A9cr=
it=C2=A0:
> On Mon, Nov 07, 2016 at 02:09:31PM +0000, Jon Hunter wrote:
> >=20
> > On 07/11/16 13:28, Thierry Reding wrote:
> > > * PGP Signed by an unknown key
> > >=20
> > > On Sun, Sep 18, 2016 at 12:28:52PM +0200, Paul Kocialkowski wrote:
> > > > Nyan boards only have host USB ports (2 external, 1 internal), ther=
e is
> > > > no OTG-enabled connector.
> > > >=20
> > > > Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> > > > ---
> > > > =C2=A0arch/arm/boot/dts/tegra124-nyan.dtsi | 2 +-
> > > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > Where is this information coming from? I don't have one of the Nyans
> > > myself, but one of the Tegra132 devices I have, which I think was
> > > derived from one of the Nyans uses one of the external host ports as
> > > forced recovery port, for which it would need OTG.
> > >=20
> > > I suspect that the way to get U-Boot onto the Nyans is via tegrarcm?
> > > In that case I think one of the ports must be OTG.
> >=20
> > It is true that the port on the back on the nyan-big can be used with
> > recovery mode. I was thinking that this is not a true OTG port as it is
> > just a 4-pin type A socket and does not have an ID pin. Thinking some
> > more about this the USB spec does include a "Host Negotiation Protocol
> > (HNP)" that allows a host and device to swap roles and so keeping it as
> > OTG seems valid afterall.
>=20
> I don't think the bootrom implements that though. I expect recovery mode
> to just program the controller in device mode, without performing any
> negotiation.

That would make sense.

However, if there's a way (even not implemented yet, but a possible way) to=
 have
the kernel configure this port as USB device instead of host dynamically (e=
.g.
without changing this bit in the dts), then I think it makes sense to keep =
the
OTG marking and drop this patch.

After all, switching to USB device mode doesn't necessarily have to come fr=
om
the ID pin.

--=20
Paul Kocialkowski, developer of free digital technology at the lower levels

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
--=-5Vn7iimBs6YXTAY5PWg3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYIZZGAAoJEIT9weqP7pUMFoAP/11a0uqqCHwlTd55ILYS6xOl
Bin3uYkLs9w+DoCae4SmPcKK+xJCF7y+VdcoJqCexexlm01AVHWP6pvdpz/4+zeU
nIHVJpF0Bx8aEQbwubWv0jLiyeCxVk0fHOx/D1o4iMEi363aY6SNwRHPPgiBb2Pf
+AnnVl+tZ7zCvH/fivB76p+N3gN1yY1my/7mw9x9lPIVIzK3tYUToGo59v7p1O4g
ymjDOQKgXSre+fdmAQHj0uV3dShhdhqurdFxKeMDvVWacVql1Q0c/GOJ1Ih43Lg6
bKE5znLYryC1E3vV2thFD4OAFu09SIhbhvd/SNCieBFeRScVwheO2MfQDPc0Ii9o
oaOcyf+Tdc4qcLB68MMGAK1Ba6PMfyemYlIY3XTZFpydMCqIHJkEqWipG7d84YCk
hhcInjo3d0gKPwl7Ewq3Jpi/2htsKeKPwO8TNgjpqEEnuSGXBetd0ol72RM1Y3kJ
7fE0BPKD7VH/whgqzcIsC16fy6Ijcny7NObNQuGAGaOAJa+1IpkvJaH+z158sk+A
Iu0lDWWYKzmUImc5doVcv27PnEov5YXSnfzBw46yzvXypgyOQuLju14LnIa9xqzo
NK9XpLfYL4Zp62RnPgwBj7IkSGSBGT3xGxv3HwPF5G7wsGWK4tG4p1Qy2MAjZ2ou
yG3x4V9FMhvN1IKFNd3U
=LCEA
-----END PGP SIGNATURE-----

--=-5Vn7iimBs6YXTAY5PWg3--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
