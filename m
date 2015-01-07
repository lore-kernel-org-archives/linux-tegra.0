From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 0/2] arm64: first set of Kconfig patches for Tegra132
 support
Date: Wed, 7 Jan 2015 15:25:21 +0100
Message-ID: <20150107142520.GB1621@ulmo>
References: <20150107081638.14381.42444.stgit@dusk.lan>
 <20150107110738.GF7485@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2884227519793655042=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20150107110738.GF7485@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Will Deacon <will.deacon@arm.com>
Cc: Mark Rutland <Mark.Rutland@arm.com>, Paul Walmsley <paul@pwsan.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Paul Walmsley <pwalmsley@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org


--===============2884227519793655042==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1LKvkjL3sHcu1TtY"
Content-Disposition: inline


--1LKvkjL3sHcu1TtY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 07, 2015 at 11:07:38AM +0000, Will Deacon wrote:
> On Wed, Jan 07, 2015 at 08:17:29AM +0000, Paul Walmsley wrote:
> > Hi Catalin & Will,
>=20
> Hi Paul,
>=20
> > These patches start the ARM64 Kconfig and defconfig changes to
> > support the Tegra132 (aka Tegra K1 64-bit) SoC and the NVIDIA
> > Norrin64 FFD board.
> >=20
> > Tegra132 support is made conditional on CONFIG_BROKEN, since
> > there are some patches pending for other maintainers to fix
> > compilation when CONFIG_ARCH_TEGRA is set during an ARM64 build.
> > Once those patches have been merged, a subsequent patch will be
> > sent to remove the CONFIG_BROKEN dependency and to make a few other
> > defconfig changes that are dependent on CONFIG_ARCH_TEGRA.
> >=20
> > These patches apply on the arm64 fixes/core branch, commit
> > 5d96e0cba263.  They have been boot-tested on QEMU 2.2.0 AArch64,
> > and (after other patches have been applied) have been boot-tested
> > on the Tegra132 Norrin64 FFD board.
>=20
> Whilst I'm happy to take the second patch for 3.20 (getting those
> dependencies building and keeping them building is a Good Thing), can we
> hold off on the first patch until it's not broken? Having an unconditional
> depends on BROKEN isn't really that useful.

The two patches that require the BROKEN dependency are fairly trivial,
so I don't think it would be a stretch to merge them for 3.20. But they
apply to different trees (one to the clocksource tree, the other to the
Tegra tree).

How do you usually handle the ARM64 patches? Do you manually pick up the
patches that touch arch/arm64 or would you prefer for me to collect them
in a pull request?

Either way I could probably provide a stable branch for you to pull into
the arm64 tree to resolve the build dependencies provided that Daniel or
Thomas will ack the clocksource patch.

Thierry

--1LKvkjL3sHcu1TtY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUrUHQAAoJEN0jrNd/PrOhq/AP/RR3m53eS6FrSHHzWjOuwKnZ
EPKv3IZotcKf8X/CiQ2WYKpoYID2k3JVz/NEeKQ7EMIaRhzCRwGdRfBtaVpuyZfX
FDHaXDdylm5Hd7lTUR+QHVz8mSJ8BUCJoPxU0XDVjIsbG+36SJMfylzOiHUT6n7I
hNAOpsgM6qBRa5/+ndeQhnqNpA8PIObBwRafEkOkmwNFE9Lej08dgoK4amWqQtO0
o56c3wB89Ycfsc2BXqwpWSnH7POrMlwD1lg72+7LtcBYGFaK0bMG7FmICt/8P97N
01VdZ+eR02W/nvcGdFAOftMoi9ZGkTqlkKVTL0yajUjc+NRI3FNjO/RG5gxuCEHU
Tt6+SNzF97rljKlG1Dm4bY+4tmJGYpxIiD6e2Nmv33lejOadE9R/ZsJWxqzc+siZ
H7Z4mqyrESYOvxrpKKrRUx9tmhZHdv3sczJWSykZOwwYTsGy0umRiPcSFzqGhRFo
scRTtv9V+v+RV+UCOuLL83OWPcI20uv6UW2fWrU/Mce/7uAsSu5ReBGKqBzmgCNK
cC67bNMJlba5fpPK/cS4Ig0VVZ+ra0u6DbGADg3PtILdS8U+HAN5rEXvFO6v74/c
V/MDmL2gto71jbNbOR5FuvK9JJCZK+o2PZ20d8mtB0NgcbwbpSRc4LiefD0QmZFI
4/tKklsDF2uKAFRVFafM
=MXO1
-----END PGP SIGNATURE-----

--1LKvkjL3sHcu1TtY--


--===============2884227519793655042==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2884227519793655042==--
