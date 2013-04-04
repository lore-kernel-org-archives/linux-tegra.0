From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH tegra-cbootimage-configs] Add Tegra20 Tamonten
 configurations
Date: Thu, 4 Apr 2013 21:25:43 +0200
Message-ID: <20130404192543.GA13569@avionic-0098.mockup.avionic-design.de>
References: <1365067814-12925-1-git-send-email-thierry.reding@avionic-design.de>
 <515DBD7F.1010800@wwwdotorg.org>
 <20130404185929.GA13407@avionic-0098.mockup.avionic-design.de>
 <515DD042.5000200@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <515DD042.5000200-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 04, 2013 at 01:10:58PM -0600, Stephen Warren wrote:
> On 04/04/2013 12:59 PM, Thierry Reding wrote:
> > On Thu, Apr 04, 2013 at 11:50:55AM -0600, Stephen Warren wrote:
> >> On 04/04/2013 03:30 AM, Thierry Reding wrote:
> >>> In addition to providing the BCT configuration that is common
> >>> for all Tegra20 Tamonten-derived boards, add scripts to build
> >>> images that can be flashed to NAND for the Plutux, Medcom-Wide
> >>> and TEC boards.
> >>=20
> >> I wonder why there's a need for board-specific sub-directories?
> >> After all, those boards all use the same BCT file, and the image
> >> config files are all identical.
> >=20
> > I could probably rework it to just generate one image that uses
> > the standard BCT and the u-boot.bin binary/symlink, which should
> > work just as well. So if the user wanted to build for different
> > boards they'd need to replace u-boot.bin and rerun the script.
> >=20
> > Does that sound any better?
>=20
> That sounds better.
>=20
> Either that, or perhaps create a separate top-level directory for each
> board, and just symlink the BCT file from one common directory, or
> even duplicate it. That would still allow the user to have one
> directory of binaries per board, so remove the need to multiplex.

I'm not sure I understand correctly. Is this what you're proposing?

	tegra20-tamonten
	|-- tegra20-tamonten.bct.cfg
	|-- tegra20-tamonten.img.cfg
	tegra20-plutux
	|-- tegra20-tamonten.bct.cfg --> ../tegra20-tamonten/tegra20-tamonten.bct.=
cfg
	|-- tegra20-tamonten.img.cfg --> ../tegra20-tamonten/tegra20-tamonten.img.=
cfg
	|-- build.sh
	|-- u-boot.bin --> /path/to/u-boot-dtb-tegra.bin

And build.sh would generate the tegra20-tamonten.bct and build it into
tegra20-tamonten.img using tegra20-tamonten.img.cfg and u-boot.bin. Is
that it?

How is that be different from the current method? What is the advantage
over what the current scripts do?

Thierry

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRXdO3AAoJEN0jrNd/PrOhb5EP/jwvFIziQwyxaFk5VgtmvXfb
mgEn8NafAd0Plek+l6Ene5KPIm0IpdSBZw0YTD1Iqiccv3aZJfTkJitM+zwsxp8q
M4HaZND9tZ19g+HNo0D8byZhzZthepxrGKRe1I3Y6WDkoHC/spLHMQ5IKgOOOUPq
i2WczvyFR7Q5ZR65GlG2hQUe91XHaivi0Xtu5r92AzTCVc1Af2FmTQMm55NVq+vo
otnPYvsUN+GL29xv6Ozdys8d2DOFRhPcxuaKEC61ywX16rtX4RNdMyyjD4aC6HrN
2u/XxS7DFVpWCZIDXy8ZL9cmDzf2lfp++fM4BtVFJZjKsKRaftbgGlRBZC/wHSkS
a3JpnUMv0oxbrYMyErHvircoOZlmiQzzEwN5Xjgdd+eUMkzB0lKd05xXCEbyt5/C
D15KzQQ9xGEhBTTMEF6fyLJbCk5GD0tr/rI3BfLDth/kk8SPOSNOkrcXRM8Ghgpz
kqEPmPMYRTjOGujkOrYCXCxim/rYOppsbfpiPubptN1syz6NsX24xtsM8M/q/cBu
whzt992nb7kzRQPNJcsStgXsBPl41PgEkumPraEKff8OyriWR9N26Ysjr274TGhC
+X+jvD8IOQ9fMn96Hnbjbz+oh5HqvL4uNZoRzY21NiBgHav1BxPigkGQPoFGY2q3
BIrgoE38loM5N0l9M3a7
=G6BG
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
