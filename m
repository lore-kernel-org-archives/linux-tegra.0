From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Remove 0, prefix from unit-addresses
Date: Tue, 12 Apr 2016 16:39:46 +0200
Message-ID: <20160412143946.GB25160@ulmo.ba.sec>
References: <1460383271-27306-2-git-send-email-thierry.reding@gmail.com>
 <570BCB41.2030504@wwwdotorg.org>
 <CAL_JsqLASP+cytYA7rWn-Ox2W47rkf3t+n3KwBexvBQNc4J_RQ@mail.gmail.com>
 <570BF13B.4060108@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <570BF13B.4060108-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 11, 2016 at 12:47:23PM -0600, Stephen Warren wrote:
> On 04/11/2016 12:32 PM, Rob Herring wrote:
> > On Mon, Apr 11, 2016 at 11:05 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org=
> wrote:
> > > On 04/11/2016 08:01 AM, Thierry Reding wrote:
> > > >=20
> > > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > >=20
> > > > When Tegra124 support was first merged the unit-addresses of all de=
vices
> > > > were listed with a "0," prefix to encode the reg property's second =
cell.
> > > > It turns out that this notation is not correct, and the "," separat=
or is
> > > > only used to separate fields in the unit address (such as the devic=
e and
> > > > function number in PCI devices), not individual cells for addresses=
 with
> > > > more than one cell.
> > >=20
> > >=20
> > > > diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
> > > > b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
> > >=20
> > >=20
> > > > -       gpu@0,57000000 {
> > > > +       gpu@57000000 {
> > > >                  /*
> > > >                   * Node left disabled on purpose - the bootloader =
will
> > > > enable
> > > >                   * it after having set the VPR up
> > >=20
> > >=20
> > > So the bootloader doesn't actually do that for the new node name at p=
resent.
> > > I have written a patch to make it do so, but haven't sent it yet sinc=
e I
> > > wrote it in the middle of a large cleanup of U-Boot. I expect I can s=
huffle
> > > it to the front of the series and send it soon though. Without a new
> > > bootloader that contains this change, IIUC all graphics will be
> > > non-operative if this change is applied.
> >=20
> > Then you should leave this one alone for a while.
> >=20
> > I also found this looking at u-boot:
> >=20
> > arch/arm/dts/tegra124.dtsi:     gpu@57000000 {
>=20
> FWIW, that's because the U-Boot DTs use #address-cells=3D<1> on this chip=
 so
> there was no question of using commas in the unit address or not. That may
> have been because U-Boot imported the DTs (or parts of them) from Linux
> before Linux switched to #address-cells=3D<2> on this chip.

I thought the reason had been that U-Boot didn't support any more than
32-bits for addresses on 32-bit ARM anyway, hence we never bothered to
sync with the kernel DTS files regarding #address-cells.

Technically it would be possible for someone to write a DTS file with a
GPU node with yet another name (the binding after all doesn't specify
what the node name should be) so I think better matching would be safer
in any case.

Thierry

--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXDQiyAAoJEN0jrNd/PrOhctYP/2iK4M8XcUSi+fgBOpe3v+Kz
ep83htBJosjLddloirDA4Wmo7Po0+CSKRqIx7LbSpyXpILEcaDuRMlfgQSxvdFga
3WfPf2FzBBKzdDOQJIeOuXp1P+lSKEt4bw3bAViaEMGlFLhG2WkROvTQjumHyYxU
kmTvOB541YwRj1TXhrWOAPxGQ0xRqatWvLdyNaTH61IMcySJ4Yq3ljhHxVrWYrHR
JSWoqcqUINV0zMIMNYKstkgimMDmOsZMjrlBGikJDzLVzyZjHqIAejGzd4xCMJ1v
h2tVJhaRUY312u4QR9BmFuxMg0HqyBCcGPR0uld2JatydWXoek3F6XFL+DHcDvK3
IVHJZJ7vWiKDvdz64NlTSWi/L84A5wW3CxtmMbPN9GOpOrOrPx682YXM58p65Eiy
awXmYUJpxfSbyz1xLeKA5rGRvL1Hhw8GA7dCwqoy8lASenOtxdBJcXbWeDvqhbZb
t+tIjH0TSwVJOhCp3CdjJ3BzH0LK7Z5jfWQcE7NG7Q1KS8gA1ygFiyH3hieqin6M
j4rzbpqrwh5wXaFzQsSF13pFX4Z2Mv7aQEazhHIIiIfO7bVqYH8UKYYknCK6xHLG
bvE2dHz4CEYjbclP7njD4kZGbMM/PMjXcvxrSB1GCC/VrsGPdb0nc9b/Xc4d5q4Q
c3PJJ/RDKamlhxCPCjuG
=cnTt
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--
