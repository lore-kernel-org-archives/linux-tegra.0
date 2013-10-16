From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 02/13] ARM: tegra: Enable LVDS and HDMI on Cardhu
Date: Wed, 16 Oct 2013 13:09:11 +0200
Message-ID: <20131016110911.GH21963@ulmo.nvidia.com>
References: <1381850883-12722-1-git-send-email-treding@nvidia.com>
 <1381850883-12722-3-git-send-email-treding@nvidia.com>
 <525DA807.4010500@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qM81t570OJUP5TU/"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <525DA807.4010500-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--qM81t570OJUP5TU/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2013 at 02:39:35PM -0600, Stephen Warren wrote:
> On 10/15/2013 09:27 AM, Thierry Reding wrote:
> > Add backlight and panel nodes for the Cardhu 10.1" WXGA TFT LCD panel
> > and enable the HDMI output and hotplug detection.
> >=20
> > Note that HDMI doesn't work for some reason and I haven't found out why
> > yet. I remember someone reporting that it worked at some point in time
> > using this set of nodes but that no longer seems to be the case. Running
> > the same kernel on Beaver has working HDMI, though.
>=20
> I'm hesitant to apply this, since we know HDMI doesn't work. Wouldn't it
> be better to just enable the panel, and hold off on HDMI until we've
> located the problem?

Okay, I'll split up the patch so that the LVDS part can be applied and
we can hold off on the HDMI part until it's fixed.

> On the panel side, have the DT bindings been acked by both DT
> maintainers and both bindings and driver by someone involved in CDF. I
> worry that since the simple panel framework overlaps with CDF's goals,
> that people will be upset if we create some alternative to it. Still,
> there's a lot to be said for code that exists and works right now, so I
> hope there won't be any issue here, but it'd be good to be sure.

I haven't received any response from any of the DT maintainers so far,
even though the relevant patches had been posted to the devicetree
mailing list some time ago. I also don't think that anyone from the CDF
people has looked at the panel drivers so far. They must have seen the
patches because at least some of them are subscribed to the dri-devel
mailing list where the patches were posted.

I do have an IRC ACK from Dave Airlie to merge the DRM panel patches
though the Tegra tree, though. Furthermore there was some serious
pushback on the CDF patches from key DRM people in earlier discussions,
so I don't think we'll be finding any common ground here anytime soon.
That said it has been suggested that if CDF ever becomes a reality, a
DRM panel driver could be written as glue between the CDF and DRM if
that should ever prove to be valuable.

As for the bindings, I don't think the underlying kernel implementation
should have any influence on it. Furthermore the bindings are trivially
simple, so I really don't see how anybody could object. I mean, it's a
compatible string, a power supply and an enable GPIO. There's nothing
ground-breakingly new there.

Thierry

--qM81t570OJUP5TU/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSXnPXAAoJEN0jrNd/PrOhTn0P+wQWJxXNQK5r4KY8hEsNjaYf
rQCljhJtcB0p5I6in9sDUteRb33XFvhwsr9XiZ0c17hOHme9mKBrhx2XhY7q4b2e
s3vG5XZ1n3BChrXyTuIXyCpLV/sol/pWOlVZE07PTZy1CPvbDpnMY8K2BW9TFPVo
/mB8ooRAA4IYKQOesulRYO7dJqy5F+JLy3GegpTfMQabT9GY71a/YDn8EOGHlnt9
y5lqAM44yHM5FvIFdz/ak/YBZds4Bp798/IXCwVhl8OQ4mVy6L+jbbVka5MZaSvE
r5quae/mHlWKN6k58+7ACfRu/soT2/gCuik3au4joqoGHI1yT5uBDu8Y/c7OCzOA
5uZquHmO2sLEL+Ntyb7SHZN1jofJu64JMm0RtpEHMr2SjdLS/k9czn7erqTBitXN
GiqhB3Um+Lk/LfhYfiKFz1GiYkl5uikNZnizeoOwW432M2bUoezAJDdkQJHKNfmM
T/vtzKspKJKUx1e2b7IZFiY4S0wdXQ+JAc9xgpevpbhVXco1i4lnSslJpmvX+LoD
9nyMgV8cqF9JQxUB20S9qtmLIxaYmKx5C1lZU3IKa01zaRxVeM8ToQDPZVxl5VvQ
HqBYmf3CMdSCktSWgD1Ffd9kAyHL7Al901aAe+QuspamTgc6Iwx0cF2hNwZEEaXN
cbBtHhAjVuwAFvHlXD1r
=I5Ab
-----END PGP SIGNATURE-----

--qM81t570OJUP5TU/--
