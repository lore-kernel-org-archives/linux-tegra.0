From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 8/9] usb: host: ehci-tegra: fix PHY error handling
Date: Mon, 18 Mar 2013 10:02:45 +0200
Message-ID: <20130318080245.GI17135@arwen.pp.htv.fi>
References: <1363338730-14581-1-git-send-email-balbi@ti.com>
 <1363338730-14581-9-git-send-email-balbi@ti.com>
 <51438EA8.1060301@wwwdotorg.org>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pMCBjikF2xGw87uL"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51438EA8.1060301-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--pMCBjikF2xGw87uL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 15, 2013 at 03:12:08PM -0600, Stephen Warren wrote:
> On 03/15/2013 03:12 AM, Felipe Balbi wrote:
> > PHY layer no longer returns NULL, we must
> > switch from IS_ERR_OR_NULL() to IS_ERR().
>=20
> This change will definitely conflict with some Tegra EHCI/USB-PHY
> changes that Venu plans to submit very soon, for 3.10. This is relevant

but this is such a small change that, even if it conflicts, resolution
will be trivial.

> since we'd previously discussed you ack'ing Venu's patches, and my
> applying them to the Tegra tree, due to dependencies between the Tegra
> device tree files and his USB changes.
>=20
> To resolve this, we can do the following:
>=20
> 1) I will create a tiny topic branch containing just the Tegra DT
> changes that must happen before the USB driver changes. This can be
> based on v3.9-rc1 or similar, and be entirely self-contained.
>=20
> 2) You can merge that topic branch into your USB tree, so that the
> changes are present there.
>=20
> 3) I will merge that topic branch into the Tegra tree.
>=20
> (2) and (3) are both needed so that the exact same commit ID is present
> in each of our branches. It's needed in yours as a pre-cursor to Venu's
> changes. It's needed in Tegra's because I still hope to activate usage
> of the C pre-processor on the Tegra DT files, and that needs to build on
> top of the same DT change of Venu's that you also need.
>=20
> 4) Once you've done that, you can take Venu's USB patches through your
> USB tree rather than my applying them to the Tegra tree. This will allow
> you to resolve any conflicts between your changes and Venu's changes
> entirely within your branch simply by applying the patches one after the
> other. Nice and simple, and just like any other USB change.
>=20
> However, this goes against your statement that you "don't accept pull
> requests". Perhaps you can make an exception for this case?

Greg won't like seeing merges from my pull request and I kinda agree
with him. We can sort out the conflicts later.

Greg ?

--=20
balbi

--pMCBjikF2xGw87uL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRRsolAAoJEIaOsuA1yqRENCkP/2Zt03Bd6pIs05jeaUoSXm/a
KI9quwNmEppHMdxugmq6UT4Qifc1henKuqxH/lg6bS7mf0DlJ6MjwbBFEVpoSG0j
3Eh1J+ntWQAOnbEXoBfSNoPvft4WYLCOH7Lh9XgWLqG4jb4J4GJK63eDW+meNr6P
wDAFbtlm5CshA18cPCbPGk+aSFd/5xgq96Qex+FId++kJw8IeQhKDv1aatvsp0le
uyZsZ7OIrIgT1sKLbTGtQ+5MZnHAYLcm1xBA5hE8e5NurKZe+VAuToJ59B2fNnGC
W0Hwl0b6eeng8F1t+LTStRtjFceU1WMlmC/DTiF8JU19S2o5WDss1Bv9z1NXrlHU
XnUa1ID8nVoNT4YC5njgjo+NaeZciDPOkZKti2Ie6+jLcQh2T0ckX0FsOuTrKaQB
SIaa2QtxoAPDpa/bT5rSD3k2Vu/g/7coV0f62XS+aKv7o44TuTEKsw34MJv6gPi3
YCxlJNLzsWLwbFXm2QqdshfIBQpMuguTzWJiFyjJJgE4aUZVjiZau6t195vKe5y/
JNm6/EQZZP9pIz1uSQQ5c+sSAMMBsVT7C1bw8vxU0Vpo3DOBSisu2HaC30VuD5RG
0S90+iLWnLgU9vvDZQ/49Oz9kbMLNJ49TnkJArLZxu7HzmciAtYNEmRxjigybdtX
h3lDzp5DPeXBBHNwAxk2
=ULuQ
-----END PGP SIGNATURE-----

--pMCBjikF2xGw87uL--
