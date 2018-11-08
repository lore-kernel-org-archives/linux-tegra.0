From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [GIT PULL 0/3] arm64: tegra: Updates for v4.20-rc2
Date: Thu, 8 Nov 2018 13:16:27 +0100
Message-ID: <20181108121627.GA1340@ulmo>
References: <20181107145350.29127-1-thierry.reding@gmail.com>
 <CAOesGMjcOQif8H6b5afKBwYstkbzGC7wuUcN2Srz=vJz11qSnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6301532644236165150=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOesGMjcOQif8H6b5afKBwYstkbzGC7wuUcN2Srz=vJz11qSnA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>
Cc: linux-tegra@vger.kernel.org, ARM-SoC Maintainers <arm@kernel.org>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============6301532644236165150==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 07, 2018 at 08:31:55AM -0800, Olof Johansson wrote:
> Hi Thierry,
>=20
> On Wed, Nov 7, 2018 at 6:53 AM Thierry Reding <thierry.reding@gmail.com> =
wrote:
> >
> > Hi ARM SoC maintainers,
> >
> > These pull requests are some follow-up changes to finally enable the
> > generic power domains for the Tegra XUSB block. This builds on top of
> > changes that were merged into v4.20-rc1, but because of some non-
> > trivial runtime dependencies I decided to hold back on these until
> > after the dust had settled.
> >
> > Do you think it would be possible to merge these in for v4.20-rc2? I
> > realize that they are not actually fixes, but they merely add a couple
> > of lines to enable the power domains for XUSB as well as the
> > corresponding DT bindings.
>=20
> Is anything broken without these changes, or is it more that the
> dependency have landed and you're itching to get things enabled?
>=20
> If it's the former we should chat (since it's an unfortunate
> situation). If it's the latter I'm happy to queue them up for the next
> merge window.

Nothing's broken without these changes, but I figured that these two
dozen lines could still make it into v4.20. I know that this has
occasionally been done in the past for very small enablement patches
if they were small enough. I could've communicated this a little
earlier, so that this wouldn't have come as a bit of a surprise.

If you prefer to defer this to v4.21 that's totally fine. I can queue
them up in my tree for the next merge window, no need for you to pick
this up in pieces.

Thierry

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlvkKRQACgkQ3SOs138+
s6Ee8Q//QXesCSLThHiCqfDVwS3N5iJS0f2iurEIhY9OhCeAPCX3e2hkHNlpZunS
DCIaXoZRcQvzCa/RD4wxQV3KAdCmYVzTkY32cyJxYTpUlPyOMcA8Lj3kLfz9cpSl
yR9npizzmi/W7laSkuDmxLzNQlPoS0IHLw41WTVUKz4dIjczKUC10Fg7HL3fl50N
yQjrTpGQLvKOLYzMXVKNgc8PsWFTlXez1mE+yn8jewn9w/JxG4QxjRfmzpY4rdCX
TCTefi1hlIaW3pN1OF91QIaCDYH3EVCV0Fgfz/8y8EDGr1itqwNDBa1wft4Mp29R
YtL9GrUvqOhaigOVZdxp6C/HVrUD991tOdVVhMfEllYgrXhQEDwvDR8tsX2ZKRjx
v++EFLKAs/HGE+wneYy049/Iqj+kv9/iu8r6CSv+fl+p3h4JzLteDzja/Plmabwg
2YGehyT+LhTK0vo6JRTzjoyvMzJ4E8JP9s7iYeS+kLYNE416h70p0ig6wm58Zq/G
uDnAsZ8+rS7lWK4dM3ZA/cTkhphqTpnvwpETowyPbWQxwOohzl28fTXjYkvO8RW8
uVr5rcXeQrjupfd53VuswzgJoXSLMgCUpR5VLpBUUghO3h9lC1VgC59BHbrhFw4a
TZnrPTCPZOrIwBX7bRyE6QQcYVhj4PANELblxDUis2499V5FHuE=
=vIMz
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--


--===============6301532644236165150==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6301532644236165150==--
