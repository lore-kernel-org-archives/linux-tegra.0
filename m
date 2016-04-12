From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Remove 0, prefix from unit-addresses
Date: Tue, 12 Apr 2016 16:34:07 +0200
Message-ID: <20160412143407.GA25160@ulmo.ba.sec>
References: <1460383271-27306-2-git-send-email-thierry.reding@gmail.com>
 <570BCB41.2030504@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <570BCB41.2030504-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 11, 2016 at 10:05:21AM -0600, Stephen Warren wrote:
> On 04/11/2016 08:01 AM, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > When Tegra124 support was first merged the unit-addresses of all devices
> > were listed with a "0," prefix to encode the reg property's second cell.
> > It turns out that this notation is not correct, and the "," separator is
> > only used to separate fields in the unit address (such as the device and
> > function number in PCI devices), not individual cells for addresses with
> > more than one cell.
>=20
> > diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/=
dts/tegra124-jetson-tk1.dts
>=20
> > -	gpu@0,57000000 {
> > +	gpu@57000000 {
> >   		/*
> >   		 * Node left disabled on purpose - the bootloader will enable
> >   		 * it after having set the VPR up
>=20
> So the bootloader doesn't actually do that for the new node name at prese=
nt.
> I have written a patch to make it do so, but haven't sent it yet since I
> wrote it in the middle of a large cleanup of U-Boot. I expect I can shuff=
le
> it to the front of the series and send it soon though. Without a new
> bootloader that contains this change, IIUC all graphics will be
> non-operative if this change is applied.

Ah, that's unfortunate. Would it be possible to make the bootloader look
at the reg property for the matching, rather than at the node name? That
might prevent such issues in the future.

Actually, a match on both the compatible and reg might be necessary. Not
that it's likely that there will ever be two devices at the same address
but perhaps to make it explicit what type of device is being enabled.

I'll hold off on this until a version of U-Boot is released that will
contain a fix for this. Do you think it would make v2016.06?

Thierry

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXDQdfAAoJEN0jrNd/PrOhLjIP/AmpD3/kVPp45uuXgLH0VL0A
n8b69X0DrclLH/f42KeEZvxw5W3H7gQ6fOHIOO016EX5B3LRTlVFSbPKtc9MVFy0
TucRd+AYlhv3mvyRzCcX8YPC/94vJjOaFXMns0KuXFr3oLeCX53IJgbC6jjxgPgP
3jKdIiWDhjfimh5o3qq8qecMaiZ/i87WV1EmtNCGNar5uKpWMBqGXxexCElgYuM3
oV/4wbXcUwm8ny6xhLz+wwxeHOa7gq4MWmLYIHAW7YSuTHdXJZb7l/2WLvGBAOxF
+0vOVAtEsY28nAD/F6Av8YNWP/RK95aWTPDCxhWaFsIfBTB+yYbbOU1/5nnuotxv
qrnFDVhjFzvxnmACOc1SEecRQ1qTryuuoXife3qCWvS6G2rA6ngXnVWfWUjUivLB
KBmURL1FzhRvcnTNLK2PdjxAWYpKzZ2XuihNqM0psA0CX5dN+vmm9jEYTxlDgyl1
9FN2hwaaD2i3ztrXwGchvQ4DAPnvUk9dkCFBIcUAHiSlzBP6aaWBd87oHwKi0BsO
sCRDi1GwlI+SvO5Iy4k/J55lOWVYZwbJO+npmxeo35RsqbIrkYkEvurVpaXx47kB
wuJe9HjBLelzidAm/PpQ6Yblf98inN14exVoY9MNJ71KXVB2zVb6zGKZ4urkJptj
ElLo+387dOpDGJQpUzaQ
=PmKG
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
