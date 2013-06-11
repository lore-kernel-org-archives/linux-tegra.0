From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 2/4] ARM: tegra: pcie: Add tegra3 support
Date: Tue, 11 Jun 2013 12:16:11 +0200
Message-ID: <20130611101610.GB932@manwe>
References: <1370372252-4332-1-git-send-email-jagarwal@nvidia.com>
 <1370372252-4332-2-git-send-email-jagarwal@nvidia.com>
 <51AE3D3B.6080102@wwwdotorg.org>
 <20130610195028.GB25859@mithrandir>
 <C79B248886DD134989C8FF6B096A91AB91B616BEED@BGMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xXmbgvnjoT4axfJE"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <C79B248886DD134989C8FF6B096A91AB91B616BEED-kdsAE/FnitNDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jay Agarwal <jagarwal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Juha Tukkinen <jtukkinen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krishna Thota <kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--xXmbgvnjoT4axfJE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2013 at 10:13:38AM +0530, Jay Agarwal wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Tue, Jun 04, 2013 at 01:17:15PM -0600, Stephen Warren wrote:
> > > On 06/04/2013 12:57 PM, Jay Agarwal wrote:
> > [...]
> > > >  struct tegra_pcie_port {
> > > > @@ -384,7 +408,7 @@ static int tegra_pcie_read_conf(struct pci_bus
> > *bus, unsigned int devfn,
> > > >  		struct tegra_pcie_port *port;
> > > >
> > > >  		list_for_each_entry(port, &pcie->ports, list) {
> > > > -			if (port->index + 1 =3D=3D slot) {
> > > > +			if (port->index =3D=3D slot) {
> > >
> > > This and the equivalent change in tegra_pcie_write_conf() seem like a
> > > bug-fix unrelated to the addition of Tegra30 support. Hence, they
> > > should be a separate patch.
> >=20
> > What exactly is this change supposed to fix? The description doesn't pr=
ovide
> > any details about why this is required. Furthermore this was done on
> > purpose to model the Tegra PCIe controller according to what typical Li=
nux
> > systems provide.
>=20
> I have mentioned it in description as -> "Corrected logic in read/write c=
onfig space to display right device number on bus 0"
>=20
> > Device 0:00.0 is usually the root complex, and device 0:01.0, 0:02.0 et=
c are
> > the root ports. The change proposed above makes 0:00.0 the first root p=
ort,
> > therefore breaking what systems usually expect.
> >=20
> I was seeing root port 2 in cardhu being enumerated as pci_bus 0000:03, w=
hich I thought should be pci_bus 0000:02, so made this change.

Yes, that's done on purpose to mirror what a typical PCI tree looks
like, as I already explained. So unless this fixes a real bug I'll just
drop it while applying.

Thierry

--xXmbgvnjoT4axfJE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRtvjqAAoJEN0jrNd/PrOhgJ8P+QGmdhGRl0aBHM85DO7rCaVu
oC/g/uBhZbTJ+QBEin7GWFTQ5phHyalwpw+VdrxWcVuHCQcmCF12w+l2c31+IzGo
phgLru47RrAgx7ahHw+pyxq16COVypYprBSg2HKnDO7sQlimNFge4feqc98n4osj
M6MvdNGBS+RtY+JSIOS+Q8myDG4qJR37ATpGTHBJh5Sja1bYmG3mJ6bmiNgqHzNv
ikvIaOodgypsxs+IvDTgMskxlagTY1gXTJu316IaqwTrkKU2kMiiLgxgSiOAWcOc
y4LwtWV3NNBn5mYQyiwShSSV3q2u/Y0lYK4plqjdW1RfGifkVCeFkM0xE2EuGFE/
FfuUDov2f9JycA0COHwoz3nItz1NJ3eS4KCh/sQwqBdf1ie9x600qhDTj3RKCMZ+
qBqD/hBbKkUkJ2Xs1VOhqmVwpD7rST6zYbyAvBhhzSv0eKdMHimOEkQrYQzWo3or
ocm1iZd++nmsjKpRBJkkjahR/1gSUEjonI1n7rt3bXew3/BAX+BvU+x04vXT6c0W
lHqwWJaHRlQfOK4zI3PhSb8nUfbmhSVFcHIyBFMO1IYUXPI+HeeVRZWGXbLK+6CO
S3YTeREvI+krLemFXDF20Pckcd/hjFSk/V3jRtjxEo4QWCBLQFJ5PS/mi0fDqRGh
YMb4BCXkmBX8V1Xbrj9n
=8OXp
-----END PGP SIGNATURE-----

--xXmbgvnjoT4axfJE--
