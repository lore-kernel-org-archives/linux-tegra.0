From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Add Tegra20 host1x support
Date: Tue, 13 Nov 2012 09:04:56 +0100
Message-ID: <20121113080456.GB15983@avionic-0098.mockup.avionic-design.de>
References: <1352467202-27903-1-git-send-email-thierry.reding@avionic-design.de>
 <1352467202-27903-2-git-send-email-thierry.reding@avionic-design.de>
 <50A1FA7C.4010507@nvidia.com>
 <20121113075247.GB8409@avionic-0098.mockup.avionic-design.de>
 <50A1FE2F.8000107@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MW5yreqqjyrRcusr"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50A1FE2F.8000107-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 13, 2012 at 04:00:47PM +0800, Mark Zhang wrote:
> On 11/13/2012 03:52 PM, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Tue, Nov 13, 2012 at 03:45:00PM +0800, Mark Zhang wrote:
> >> On 11/09/2012 09:20 PM, Thierry Reding wrote:
> >>> @@ -116,6 +122,9 @@ static __initdata struct tegra_clk_init_table teg=
ra_dt_clk_init_table[] =3D {
> >>>         { "sbc2",       "pll_p",        100000000,      false },
> >>>         { "sbc3",       "pll_p",        100000000,      false },
> >>>         { "sbc4",       "pll_p",        100000000,      false },
> >>> +       { "host1x",     "pll_c",        144000000,      false },
> >>> +       { "disp1",      "pll_p",        600000000,      false },
> >>> +       { "disp2",      "pll_p",        600000000,      false },
> >>
> >> I think here the parent of disp2 should be "pll_d_out0", not "pll_p".
> >> Right now pll_p has not a proper clock setting to make 148.5MHz 1080p
> >> HDMI happy. In addition, you add the 297MHz in pll_d frequency table
> >> next and I think this is for disp2 has a proper clock rate to support =
HDMI.
> > [...]
> >>> @@ -1051,6 +1053,9 @@ static struct clk_duplicate tegra_clk_duplicate=
s[] =3D {
> >>>         CLK_DUPLICATE("pll_p_out3", "tegra-i2c.1", "fast-clk"),
> >>>         CLK_DUPLICATE("pll_p_out3", "tegra-i2c.2", "fast-clk"),
> >>>         CLK_DUPLICATE("pll_p_out3", "tegra-i2c.3", "fast-clk"),
> >>> +       CLK_DUPLICATE("pll_p", "tegra-dc.0", "parent"),
> >>> +       CLK_DUPLICATE("pll_p", "tegra-dc.1", "parent"),
> >>> +       CLK_DUPLICATE("pll_d_out0", "tegra-hdmi", "parent"),
> >>>  };
> >>
> >> The same with my above comments, the tegra-dc.1's parent should be
> >> pll_d_out0.
> >=20
> > The way this works is that for HDMI it is required that the DC and HDMI
> > blocks have the same parent. So what really happens is that once you
> > setup one of the DCs to work with HDMI, its clock will automatically be
> > reparented to the HDMI parent clock, which in this case is "pll_d_out0".
> >=20
>=20
> Are you sure about this? Is this a hardware feature? I know the dc and
> hdmi controller should have the same clock parent but I think this
> should be ensured by device driver...

It's implemented in tegra_output_hdmi_setup_clock().

Thierry

--MW5yreqqjyrRcusr
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIbBAEBAgAGBQJQof8nAAoJEN0jrNd/PrOhg9AP+JxnTsZlUgUWNNA/aFLG368n
WNnRHMhOa7nMB/1qG2sUAtxGwYGUOqEBtuyEF0tHfhWWEeO4Y0ygmI6mZlBTROCJ
6qMxCqNmPd7FBo41426DCYW9Gc3XLN2epowujZEJpco7K/Lr+qJwlvJRLHjFfVw7
g1nGLTSiokr0q6pAZ+5LkvM555OFaBobdu/JHBsKfo44YoDsLeq+iC4vHf2yMj+u
rVMzgkQJjOOvSZes1fjqjehobEw7mJEglA5hDSQgCh2g2K2NxP6EvbcrgfyvWZrz
7y8hvJdmuXWbHGHPFD4iHGv5HjvxGh/GqazrMeXVOTQMqYhFoAN1o/yJwORQq5TX
UC0sJMDldp2bBln6cu1fvkyGZ4dUJq5mD/fSCom/lUmRpVnAOntnRyYwzJK4ZiWC
cClIA8fHGEvEOgERiFkrL9LpA+AQOe6sQcVlk5mCrkkdIv6+ItbitIDBPFt+S+7N
2ysDSVGdL9n69bRXVzOoDLlxUcBtzq2SEExhlRJFNivsmdhQuRoJcpLFREL5zMbT
YnshkrqAsPBCRsE/m6uBdBhpR6ZYVk1NeFKVqAeDxrWN4frLhTNV1DX9tDclL17m
wHIFnXMZdLuDnJ9fM7blT5py0jvse2pad63MDo0BRNi3A2zpQiv4A2xWtNC2sM2H
ZemuHfKUM9y6iuprouo=
=qh22
-----END PGP SIGNATURE-----

--MW5yreqqjyrRcusr--
