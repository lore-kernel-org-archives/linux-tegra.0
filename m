From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] ARM: tegra: nyan: Mark all USB ports as host
Date: Tue, 8 Nov 2016 12:07:35 +0100
Message-ID: <20161108110735.GA13098@ulmo.ba.sec>
References: <20160918102852.6593-1-contact@paulk.fr>
 <20161107132854.GF12559@ulmo.ba.sec>
 <13e7ff98-8bc2-ccf7-94bb-4e1d3c61b20d@nvidia.com>
 <20161108085420.GG2478@tbergstrom-lnx.Nvidia.com>
 <58046fbb-8e19-e629-770a-940a40ca6ef9@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2491869050391619138=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <58046fbb-8e19-e629-770a-940a40ca6ef9@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Paul Kocialkowski <contact@paulk.fr>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============2491869050391619138==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 08, 2016 at 09:47:42AM +0000, Jon Hunter wrote:
>=20
> On 08/11/16 08:54, Peter De Schrijver wrote:
> > On Mon, Nov 07, 2016 at 02:09:31PM +0000, Jon Hunter wrote:
> >>
> >> On 07/11/16 13:28, Thierry Reding wrote:
> >>> * PGP Signed by an unknown key
> >>>
> >>> On Sun, Sep 18, 2016 at 12:28:52PM +0200, Paul Kocialkowski wrote:
> >>>> Nyan boards only have host USB ports (2 external, 1 internal), there=
 is
> >>>> no OTG-enabled connector.
> >>>>
> >>>> Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
> >>>> ---
> >>>>  arch/arm/boot/dts/tegra124-nyan.dtsi | 2 +-
> >>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> Where is this information coming from? I don't have one of the Nyans
> >>> myself, but one of the Tegra132 devices I have, which I think was
> >>> derived from one of the Nyans uses one of the external host ports as
> >>> forced recovery port, for which it would need OTG.
> >>>
> >>> I suspect that the way to get U-Boot onto the Nyans is via tegrarcm?
> >>> In that case I think one of the ports must be OTG.
> >>
> >> It is true that the port on the back on the nyan-big can be used with
> >> recovery mode. I was thinking that this is not a true OTG port as it is
> >> just a 4-pin type A socket and does not have an ID pin. Thinking some
> >> more about this the USB spec does include a "Host Negotiation Protocol
> >> (HNP)" that allows a host and device to swap roles and so keeping it as
> >> OTG seems valid afterall.
> >=20
> > I don't think the bootrom implements that though. I expect recovery mode
> > to just program the controller in device mode, without performing any
> > negotiation.
>=20
> I am not talking about the bootrom and I would not expect the bootrom to
> do that. However, the kernel could.

Either way, configuring the controller in device mode is enough to make
the host detect it, otherwise tegrarcm wouldn't work.

=46rom the point of view of the binding I think "otg" is the most accurate
option because we know that the controller can operate in both modes. If
it currently doesn't or how exactly switching modes is done is outside
the scope of this property.

Is everyone okay with just dropping this patch?

Thierry

--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYIbH0AAoJEN0jrNd/PrOh29sP/3+aaWRVziIIjgkZWYMuASGh
CAsLXuKmvQENkDQb0UJ6IccdHIYMt85yFm39kG3m6qCwT1y1asVygj61wPBsQkPk
DcNdJ5uMT+NNiTfs/IZl2yHkfu5/lld4LamqKP6tlGHdzwk/M4ppaiTv3WEbM/nX
57IcVz4N93NIjM9bv/HyqfsYtUCVZVorFg6ruLXGUrP3bP8P8fUc1s+pbmmmebdM
g5JomvW2yvrupDeIWszUTIw+28sPUoTddumx+x63IcLs20mvRkFFCNv73ndREmEw
cWgtrcnvoWES5MkyOBlh+83HSyST/4/Zw+GeSbAFBELQZ1ZrEE3jhX0c+oKqOts2
e9ei7h6kWQufcbJhckgdemSWUcb3hArVbi9sF34paR+nlH+oaN0p/RZcy6RieVNF
Uth0C37VAfVgpTpCRCeiGJQHtv1MYD4TjzRUWtW6KgX/EawDCWyZvYZB08TkrdXB
lkyA9Xkj6jO7BHdOsm20WRslkdb+IF0OfGYJ5WaCl6J0jjK9gxPnEXKUYcL69KkS
TjlVl1SE3tc0zAVh9JMk8LRGYPJynBQf4vuQfNw1oWmgAt8cqwzF4Ev/W88tmVzz
tgjasdtD4rJTrMqJNdLSjjwv41IBdwXxig4SoiReNsF0mYxiW3T0PbEBYBUyH4AX
GEczRb81nCMfr3NADyNn
=z+5o
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--


--===============2491869050391619138==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2491869050391619138==--
