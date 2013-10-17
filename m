From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 00/13] ARM: tegra: Enable DSI, panel and 3D support
Date: Thu, 17 Oct 2013 21:38:02 +0200
Message-ID: <20131017193801.GA7326@mithrandir>
References: <1381850883-12722-1-git-send-email-treding@nvidia.com>
 <52602063.30501@wwwdotorg.org>
 <5260224F.6020509@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5260224F.6020509-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2013 at 11:45:51AM -0600, Stephen Warren wrote:
> On 10/17/2013 11:37 AM, Stephen Warren wrote:
> > On 10/15/2013 09:27 AM, Thierry Reding wrote:
> >> This series enables DSI, HDMI and gr2d support on Dalmore as well as
> >> panel support for Cardhu and Harmony. gr3d support is also enabled on
> >> Tegra20 through Tegra114.
> >>
> >> I think I've addressed all comments from the initial version. A more
> >> notable addition was that of gr3d support and a WIP patch for Tegra114
> >> powergate support. I wanted to get some feedback on how to continue
> >> with the powergate patch (array vs. map, see patch for details) before
> >> finalizing it.
> >=20
> > I have applied the following to Tegra's for-3.13/dt:
> >=20
> >>   ARM: tegra: Mark Tegra30 display controller compatible with Tegra20
> >>   ARM: tegra: Add host1x, DC and HDMI to Tegra114 device tree
> >>   ARM: tegra: Enable HDMI support on Dalmore
> >>   ARM: tegra: Use symbolic names for gr3d clocks
>=20
> Actually, I just dropped the following two again:
>=20
> ARM: tegra: Add host1x, DC and HDMI to Tegra114 device tree
> ARM: tegra: Enable HDMI support on Dalmore
>=20
> With those applied, I see a crash at boot when running Tegra's for-next
> branch. Perhaps that's because the driver hasn't been updated to support
> Tegra114 yet, and it would be fine once the Tegra and DRM trees were
> merged, but I want the Tegra tree to be bisectable on its own.

You wouldn't have a saved copy of the crash around by any chance? Might
be useful to see if there's some problem with the host1x or DRM drivers
that needs to be fixed. Otherwise we might run into this again for
Tegra124 support.

Thierry

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSYDyZAAoJEN0jrNd/PrOhv+YQAJld52QmPVbAkmrNR2njvIzh
Hwl8m7DgLef5voe6xk0OTtp2KphkoFEnuhDLe6QP/3p+H6dGvhSS+gKORRxzupku
GXf39ez/lYnotaba+fofNxxtjPQT5ONMZ5zxZXWLCWDoHInlFzwCt/UI0deQXqZI
tfmNj/woPP54Zox0Fcknl5J2fIqccEc8YdZndpxBwGtlNqK4X5nKwmgq5/QWUtYv
/26oEODPDQrdy9dnw498nc2P8NApm/YuPxwuqY+PjeANv5LQnx5Eekqkg8sRUY8S
LgT5iV8BXgsYxkkROyipIw78R4KQnll5H07q8SfmFLTknzxJyg6b+nqD75myLPlp
ZFRrS+u2dtps3VVWOLdd7lJjQA7knBfsDHByOKgGzOLy8pU5Cvj5NhoLsi8GxdbL
jkbLWWgwliT6Kt8CsRI3yhgd50r2IV4B0M3uVyUEmLnAw0236eLWPJXaZGDgetsU
Bj28cKha5Bz72wzKswOGDpMKj1Fl1dSAF37HptM4QVvZ4Q0Ll6yYW+PZsuwOU9or
mLZ+qtzv+ue1360a5VIoTUqHuqpdRAbgP2JyEZ5QsUTjwRNfs5Pt9CntTHCL41MJ
0L19C9hgJVoimfwbognt+XKRfyLDmQ/quTPGN4zRl3QMQvORNNhR5IqBO6pMG3Dv
JbNO6zems5onDfw2hBMu
=9ooJ
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
