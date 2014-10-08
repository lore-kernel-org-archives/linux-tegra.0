From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1] PCI: tegra: Enable root port specific features
Date: Wed, 8 Oct 2014 09:47:39 +0200
Message-ID: <20141008074738.GE4999@ulmo>
References: <1412677678-12011-1-git-send-email-vidyas@nvidia.com>
 <20141008074404.GC4999@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M/SuVGWktc5uNpra"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141008074404.GC4999@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--M/SuVGWktc5uNpra
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2014 at 09:44:05AM +0200, Thierry Reding wrote:
> On Tue, Oct 07, 2014 at 03:57:58PM +0530, Vidya Sagar wrote:
[...]
> > +static inline void rp_writel(struct tegra_pcie_port *port, u32 value,
> > +							 unsigned long offset)
> > +{
> > +	writel(value, offset + port->base);
> > +}
> > +
> > +static inline unsigned int rp_readl(struct tegra_pcie_port *port,
>=20
> readl() returns u32 and so should rp_readl().
>=20
> > +							unsigned long offset)
> > +{
> > +	return readl(offset + port->base);
> > +}
>=20
> I don't see much use in these, but if you really want to add them,
> please also replace any of the open-coded occurrences of this. Also
> please fix the alignment of function arguments on subsequent lines.
> They should align with the first argument on the first line.

Oh, and perhaps make it a separate (precursory) patch so that this
patch can focus on the PM features.

Thierry

--M/SuVGWktc5uNpra
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUNOwaAAoJEN0jrNd/PrOhST4QALUDzJ6d7NRI7w2XTnK8cYPQ
Ws9LgIoVDlh2374mkuzcBJPy2z1fSY6sScR0Ng+mj/KYKyU3F6mT4pOCu0iioTTA
S+RZTPVqymbTpxzfqKiI+EWuOBGisy3E0BunoSDiVgTbbnER5Vl3XUKd4vQvGdZY
NyD5f1rio8JBMyu84yqPDrmgrw6iQ8q1+S4IrHmrO1+B1uTXt2ICMoBF52df0SNo
Q+WUwx8yo+mCtdLJ+yGVfx6uZ8pvO4pTCOX6ndLfshFMRuL1WmtfC9LaHUzCpNXs
i12bRL1NMgWfnWd8LTphjmrZhPTORrftiHi4axPjKCu594ShF25XCl4EZ2sOKGwQ
eoD159GkZKeHgMPTSjE0eq3kBYj+QS8EsCAbFSMucZ8O9T+VHeEqUyGL8zueDCG1
PFTd27rS+gtKRWnUYpJwxvPNYufM78ByT3mG1uleaRlbN7D1oSOKkuen08hjIoWk
r0CcSQicHt8mMo8nPikrEGwSgd5XGs7ItcKJk9bVKXPM8Q7mXxsgDSDizfcBkMmZ
x4P7VSK3q1/LqXjkYxd7HIy7JIbBjqpotgAtoE+OSiCkgYGGEBXDKibqz0x4nIrx
QGqoMjcsizcM+dE9YY2DTENy7pcQwnbTxOL3O1LSZ6EJtwNRqjY+ZViKERcJU89G
gr7BpX/kPE8bpVa1fojN
=UX7i
-----END PGP SIGNATURE-----

--M/SuVGWktc5uNpra--
