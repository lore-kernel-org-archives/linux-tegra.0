From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH REPOST] usb: phy: tegra remove include of <mach/iomap.h>
Date: Tue, 16 Oct 2012 12:54:16 +0300
Message-ID: <20121016095416.GE5548@arwen.pp.htv.fi>
References: <1350324996-30838-1-git-send-email-swarren@wwwdotorg.org>
 <20121015192240.GB373@arwen.pp.htv.fi>
 <507C7E7F.9090605@wwwdotorg.org>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y2zxS2PfCDLh6JVG"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <507C7E7F.9090605-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--y2zxS2PfCDLh6JVG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 15, 2012 at 03:22:07PM -0600, Stephen Warren wrote:
> On 10/15/2012 01:22 PM, Felipe Balbi wrote:
> > hi,
> >=20
> > On Mon, Oct 15, 2012 at 12:16:36PM -0600, Stephen Warren wrote:
> >> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>=20
> >> Almost nothing from this file is used, and the file will
> >> hopefully be deleted soon. Copy the tiny portions that are used
> >> directly into tegra_usb_phy.c. I believe that Venu Byravarasu is
> >> working on cleaning up our USB driver, and those cleanups will
> >> remove the need for these constants.
> >>=20
> >> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> Acked-by: Venu
> >> Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> --- Felipe, Greg,
> >>=20
> >> This patch is needed in the Tegra branch, since it's a dependency
> >> for cleanup required to support single zImage.
> >>=20
> >> However, I suspect/hope there will be significant improvements to
> >> the Tegra USB driver in 3.8, and this change may merge-conflict
> >> with those. It may be simplest if this patch can /also/ be taken
> >> through the USB tree and so act as a baseline for any Tegra USB
> >> work.
> >>=20
> >> As such, may I please request this patch be merged into a
> >> separate branch/tag in the USB tree, which is then merged into
> >> both the Tegra and USB trees.
> >=20
> > I can take this through my transceiver branch, but I would really
> > like to see v3.8 having a real (platform_)driver ready. The current
> > state of that code is quite bad IMHO and needs some love.
>=20
> Thanks for getting back on this. Please don't *just* take this through
> your tree though. What I'm asking for above is a topic branch
> containing just this commit, so that commit and branch can be merged
> into both your USB branch and my Tegra branch.

done. Already available on my xceiv branch. Here's a pull request:

The following changes since commit ddffeb8c4d0331609ef2581d84de4d763607bd37:

  Linux 3.7-rc1 (2012-10-14 14:41:04 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tegra-header-=
cleanup

for you to fetch changes up to 8355b0208a44904741dbd78fea6f203c3556699a:

  usb: phy: tegra remove include of <mach/iomap.h> (2012-10-16 12:48:38 +03=
00)

----------------------------------------------------------------
Stephen Warren (1):
      usb: phy: tegra remove include of <mach/iomap.h>

 drivers/usb/phy/tegra_usb_phy.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

--=20
balbi

--y2zxS2PfCDLh6JVG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQfS7HAAoJEIaOsuA1yqREgdwP/06RIrGTHNv4uFYnISyYsl22
xLBloZXFqQILz1QUXU0mUKhlH56r8gDGNSXrcvlmFEpKKALpVkvL4CNsECxFjLlJ
nDYUbiBhW9ofEeDe3wAMUIGpK+6mADgHgtHX6CPVx8YTEVLtmVJlzZ9KBpbwzV0e
afFSthY4aX1ZsTm3f/ELx7J6+jzbaHqe+ssn6saGRkFNXIS5ZPCK4bkfGNo115s4
D/VEKmYBbIA6FqUO+MuxDpS0g05nik0KwAdRpPwVjI7P4sBTc5usmdkEy94Ua2q/
6osKwwcLatukC/TlVuHMU31DwiMoUayuWf+DfPWSjfOQ3yeFgzfl4BpF6haWT+Yq
by0CdeF3Iq/LBwxT5Kt2hTRta0LsUvO44P4BCsvk+wZ0T2DpQhSytzToPfhMwh/L
ZKutPMexWkK7g01M20JltcBh4RXu6nr1Y2NwCvn23XkjxKv7daUGUdx3e/aLbekS
ygV3iFi3/nsYyo4anNgNbibZGmhe0FOLyBy2YCOffc3LF+ePKpxScnNTV6T/2TC4
MoG8gohxrF9m/gqZ9GGzgLg+Bzx1jN7Md+XgUYuHq5/VxyO8dxaqQA01h4Sh/i81
ozfBXc0rLwp2PRaCVHFAZsJrA7a1sCTc2wqGPbQbbqCiCbfRQFhdtp0HSIipVjat
VDtzpnkat5g30YC/g9g5
=8THI
-----END PGP SIGNATURE-----

--y2zxS2PfCDLh6JVG--
