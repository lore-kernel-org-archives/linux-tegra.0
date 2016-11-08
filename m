From: Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [PATCH] ARM: tegra: nyan: Mark all USB ports as host
Date: Tue, 08 Nov 2016 14:02:38 +0100
Message-ID: <1478610158.853.1.camel@paulk.fr>
References: <20160918102852.6593-1-contact@paulk.fr>
         <20161107132854.GF12559@ulmo.ba.sec>
         <13e7ff98-8bc2-ccf7-94bb-4e1d3c61b20d@nvidia.com>
         <20161108085420.GG2478@tbergstrom-lnx.Nvidia.com>
         <58046fbb-8e19-e629-770a-940a40ca6ef9@nvidia.com>
         <20161108110735.GA13098@ulmo.ba.sec>
         <3fbd3fb9-1dc5-a46d-355b-f7c94b3c43ef@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-DWgfa25UGIKfFbl3odNQ"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3fbd3fb9-1dc5-a46d-355b-f7c94b3c43ef@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, devicetree@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--=-DWgfa25UGIKfFbl3odNQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 08 novembre 2016 =C3=A0 11:09 +0000, Jon Hunter a =C3=A9crit=C2=A0=
:
> On 08/11/16 11:07, Thierry Reding wrote:
> >=20
> > * PGP Signed by an unknown key
> >=20
> > On Tue, Nov 08, 2016 at 09:47:42AM +0000, Jon Hunter wrote:
> > >=20
> > >=20
> > > On 08/11/16 08:54, Peter De Schrijver wrote:
> > > >=20
> > > > On Mon, Nov 07, 2016 at 02:09:31PM +0000, Jon Hunter wrote:
> > > > >=20
> > > > >=20
> > > > > On 07/11/16 13:28, Thierry Reding wrote:
> > > > > >=20
> > > > > > >=20
> > > > > > > Old Signed by an unknown key
> > > > > >=20
> > > > > > On Sun, Sep 18, 2016 at 12:28:52PM +0200, Paul Kocialkowski wro=
te:
> > > > > > >=20
> > > > > > > Nyan boards only have host USB ports (2 external, 1 internal)=
,
> > > > > > > there is
> > > > > > > no OTG-enabled connector.
> > > > > > >=20
> > > > > > > Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
> > > > > > > ---
> > > > > > > =C2=A0arch/arm/boot/dts/tegra124-nyan.dtsi | 2 +-
> > > > > > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >=20
> > > > > > Where is this information coming from? I don't have one of the =
Nyans
> > > > > > myself, but one of the Tegra132 devices I have, which I think w=
as
> > > > > > derived from one of the Nyans uses one of the external host por=
ts as
> > > > > > forced recovery port, for which it would need OTG.
> > > > > >=20
> > > > > > I suspect that the way to get U-Boot onto the Nyans is via tegr=
arcm?
> > > > > > In that case I think one of the ports must be OTG.
> > > > >=20
> > > > > It is true that the port on the back on the nyan-big can be used =
with
> > > > > recovery mode. I was thinking that this is not a true OTG port as=
 it
> > > > > is
> > > > > just a 4-pin type A socket and does not have an ID pin. Thinking =
some
> > > > > more about this the USB spec does include a "Host Negotiation Pro=
tocol
> > > > > (HNP)" that allows a host and device to swap roles and so keeping=
 it
> > > > > as
> > > > > OTG seems valid afterall.
> > > >=20
> > > > I don't think the bootrom implements that though. I expect recovery=
 mode
> > > > to just program the controller in device mode, without performing a=
ny
> > > > negotiation.
> > >=20
> > > I am not talking about the bootrom and I would not expect the bootrom=
 to
> > > do that. However, the kernel could.
> >=20
> > Either way, configuring the controller in device mode is enough to make
> > the host detect it, otherwise tegrarcm wouldn't work.
> >=20
> > From the point of view of the binding I think "otg" is the most accurat=
e
> > option because we know that the controller can operate in both modes. I=
f
> > it currently doesn't or how exactly switching modes is done is outside
> > the scope of this property.
> >=20
> > Is everyone okay with just dropping this patch?
>=20
> Fine with me.

Same here.

--=20
Paul Kocialkowski, developer of low-level free software for embedded device=
s

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
--=-DWgfa25UGIKfFbl3odNQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYIczvAAoJEIT9weqP7pUMb6QP/RDLvBpkvSPK4+aHkxKspJMU
vZO/tcTn7gvEQdLP/BDxopydNOx36up+WAynJsnj3m7IzGvooc6isPIsyDf1a0Sd
nhPLL/8sBty3XAlWqx2hwb86yoeizjdxmqV9bp2IsHppDPHeRzmqKjo57fGKMcOQ
MmgJXtYwyLB8CEXgXMmMNag3TNH43sJmZlVv2LVki9C11+ZPniiun4nYtQYXiMJ8
outBBe2KAsxLOsUdFixuZBW878rCNqaBx6vALZ4mYMmLgu7ggBSO3ULIXUPNa5F7
dymLBYJ17LFfTxmcBf+1jzy5BOqyTuZsvRuxgs8wpMOlpSuNGK0VvDS884q88LE+
Na/QJWCZa2BHQWZZ+gWU4Jvobg4IhQueIIAP9eInWyJw2SG7UWNnGI6XwK5K0nVc
fmXKN33jZsDXCwir7AOs7DcygQqyHKlFdtIsmxS/kF8Zvcz6qwmuxqyl843mCnwA
11dIRqiqXYj5QKOMY3KJWC1lMbcW89sQRk/LKlBd80o34cTf8QYYMSAC1rxYwJOf
E88oJAo4KM9JuJAgCi7GtOXouYSDQTl3v9dJbjoHr7sXOAr7KJDozb/9thHqVq5d
1TGqXyxjOj5qL/cdbBM71sTTxTKEOfJKO6hwaKnfblGx4RGQqd9huEvVcRsoHMc2
19eWM2EY3FxSalYUs3ld
=rWpd
-----END PGP SIGNATURE-----

--=-DWgfa25UGIKfFbl3odNQ--
