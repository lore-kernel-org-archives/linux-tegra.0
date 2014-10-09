From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] drm/exynos: fix vblank handling during dpms off
Date: Thu, 9 Oct 2014 11:58:52 +0200
Message-ID: <20141009095850.GA3718@ulmo.nvidia.com>
References: <542B9A0E.7020206@samsung.com>
 <1412151287-12845-1-git-send-email-a.hajda@samsung.com>
 <542D13CC.5000304@samsung.com>
 <542D2E7C.1020904@samsung.com>
 <542D3C96.7000400@samsung.com>
 <54362066.9000504@nvidia.com>
 <20141009085258.GI5182@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <20141009085258.GI5182@n2100.arm.linux.org.uk>
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-samsung-soc@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 09, 2014 at 09:52:58AM +0100, Russell King - ARM Linux wrote:
> On Thu, Oct 09, 2014 at 02:43:02PM +0900, Alexandre Courbot wrote:
> > But there might be another issue, which is that calls to =20
> > drm_vblank_get() will return -EINVAL if invoked between drm_blank_off =
=20
> > and drm_blank_on. Is this really the desired behavior? Can it at least =
=20
> > happen? If so, how are drivers supposed to react to this situation?
>=20
> I've not yet seen the commit which causes this problem, but I hope
> that drm_wait_vblank() isn't affected by this.  In current mainline,
> drm_vblank_get() is used inside drm_wait_vblank(), which is called as
> a result of userspace calling DRM_IOCTL_WAIT_VBLANK.
>=20
> So, what is the effect of this change on user applications making use
> of the vblank wait ioctl - and is that change intended?

There's no effect on user applications if the driver behaves properly.
As far as I can tell, every driver that calls drm_vblank_off() but not
drm_vblank_on() will break. You can easily test this by running libdrm
modetest -s ... -v, which instead of toggling between the test pattern
and an all-gray framebuffer will switch to the gray one once and then
hang.

I guess that was probably not intended, but according to the new rules
all these drivers have now become buggy. So before merging this patch I
think we need to fix existing drivers to avoid regressions.

Thierry

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUNlxaAAoJEN0jrNd/PrOhHm0P/idjK6mO0UDq2yjIyuT4mcea
RHHhgyAY2knxfhkzF13ms4vjr5gHLZmu1G5GOztvk3SEdHSsTwGIxRWtGqUHMEG+
/NvwxLtx/+kQ57hIAV8uRcZ7m+5wExEkHOseIAcWJedpU0qa80hcCTQjl3/rE4Io
TbKgj5gJYkWSuKuj9AfwNXb38jpHzxLXMgZ/xcvTzaNvzxtmHlv2utw1RMZzLOV9
hgG1BeDBs3L2TO5+c93agNVJi4vAyuhL8KtYY0o6wmZVnT4id2Dlf8GdXkmjb2eo
Kq1xaAyvbx1dj357Ees3q67GztVe3mTTXmoAluMUPLu0x/48/7gppH+3jf/Ci4af
DUM8mjX43w6EIeJY2KEonhvRLsttef1BfBdpVDRob+s03NKHHDrF690AVrMBCUYj
TKZ5XYlPszh/SUs3w78J+iEd8dS9ea3Hq/tq3NtbHvIu10ngKrNPA2VnxMlVOlEt
uDqSD8M+nK19bLqHduBxPmyRe/f/lL4juAS6zIWIuIilFszKpNmsidFqTYX1KzfB
EKC7o5gZxf3yIhkZybNHOB6B3oq4YIb2bV/OtheF1z0LOatHfJhzBBhy8tQS6W9t
hFju0qARoe/U84KoOD4BJYe527WYQkxtHUSDZOAxaUHo7d3fSmbtmU+Ve6S4seoR
1noQAPgpWnHsVCNK+D1J
=UBQa
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--
