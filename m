From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: defconfig updates
Date: Wed, 15 Aug 2012 22:10:41 +0200
Message-ID: <20120815201041.GE12870@avionic-0098.mockup.avionic-design.de>
References: <1345052375-13374-1-git-send-email-swarren@wwwdotorg.org>
 <502BE0F2.7080903@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cYtjc4pxslFTELvY"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <502BE0F2.7080903-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--cYtjc4pxslFTELvY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 15, 2012 at 11:48:34AM -0600, Stephen Warren wrote:
> On 08/15/2012 11:39 AM, Stephen Warren wrote:
> > From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Removed:
> >=20
> > * MACH_HARMONY
> > * MACH_PAZ00
> > * MACH_TRIMSLICE
> >=20
> >   These used to enable board support for individual boards. Now that we
> >   only support device tree, these options have been removed.
> >=20
> > Added:
> >=20
> > * TEGRA_PCI
> >=20
> >   This used to be selected by the board options above. Select this
> >   explicitly now that the board options have been removed.
> >=20
> > * TEGRA_DEBUG_UART_AUTO_ODMDATA
> >=20
> >   This makes the kernel automatically pick a UART for earlyprintk. It's
> >   likely to be a useful option for everyone.
> >=20
> > * PWM
> > * PWM_TEGRA
> >=20
> >   Enable the new PWM subsystem, and the Tegra driver within it.
> >=20
> > * GPIO_PCA953X
> > * GPIO_PCA953X_IRQ
> > * MFD_MAX8907
> > * REGULATOR_MAX8907
> > * RTC_DRV_MAX8907
> >=20
> >   Various drivers required for the Whistler board.
>=20
> I went ahead and applied this immediately to Tegra's for-3.7/defconfig.
> If anyone objects, I can easily pull it out or rework it.

Just for the record, I have no objections. Those changes all make
perfect sense.

Thierry

--cYtjc4pxslFTELvY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQLAJBAAoJEN0jrNd/PrOhrk0P/Axxx1BxR+i8nE3d/0T6FGS/
wYSBZsuBTItfYfupHqQXBLqNT7jSK/qg2p7Sd4fTxFLvoMuajKvV4Qhbkw8BPUlN
OymJ6C4P/bgDc75104hjXN2QyPi18BMKLlpARrOVN56lxixng+MP7mRPulDCKoou
xFhUGbLwXGnmhQpiUTWg0jJZZPi1U8YL3qYPHguRwc4hcfVtNp7RN3lKFb3rH5vj
w+ZiCdeXVIs4t0lOBhE8ieONIJruSZlSRF3MAhhvMif3/QlogoyVMNnokJ3H6CD2
flq4popAGCBTcVgXKMzckLSaSlkntmD8S1BnAZqygPMRqH3c+9r/EnlN0DzEHEMo
CsoSfbTSk9kS9VLroBY7ZRzGKPsRoa+3nFbab2MuU776YVLGWDGLcYU7t7JhpPhr
gNfRQvtNUHrygv0+Q+E7zj6Xc1sv3IGS8JdYghMLTVzGReY0TSJCvyL2IpUxcmEd
3slEg/3kaUlJ34bnDqCmLtreeuveB1IpynnW5kB5yV1cEO1vuUmWOnnr+NlDQWuA
6jlXuGWLX1/ftmOoNbXJLPokqOzopi2ECFTbCo+Xj2s7RH1qUwB0l+jTv5I7aDLS
HztcEOvtofOvlKRbgYBbY7lbWTRqIt6JYyNSuAJQk0Zw80/GLVOLxc6lGZAqqWDq
XcBSHn8QXARZxciChntd
=HCdN
-----END PGP SIGNATURE-----

--cYtjc4pxslFTELvY--
