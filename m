From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: Add Tegra30 host1x support
Date: Tue, 13 Nov 2012 08:53:48 +0100
Message-ID: <20121113075348.GC8409@avionic-0098.mockup.avionic-design.de>
References: <1352467202-27903-1-git-send-email-thierry.reding@avionic-design.de>
 <1352467202-27903-3-git-send-email-thierry.reding@avionic-design.de>
 <50A1FAB0.8040700@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Uq4LBwYP4y1W6pO"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50A1FAB0.8040700-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--/Uq4LBwYP4y1W6pO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 13, 2012 at 03:45:52PM +0800, Mark Zhang wrote:
> On 11/09/2012 09:20 PM, Thierry Reding wrote:
[...]
> > @@ -1337,6 +1337,9 @@ struct clk_duplicate tegra_clk_duplicates[] =3D {
> >         CLK_DUPLICATE("pll_p_out3", "tegra-i2c.2", "fast-clk"),
> >         CLK_DUPLICATE("pll_p_out3", "tegra-i2c.3", "fast-clk"),
> >         CLK_DUPLICATE("pll_p_out3", "tegra-i2c.4", "fast-clk"),
> > +       CLK_DUPLICATE("pll_p", "tegra-dc.0", "parent"),
> > +       CLK_DUPLICATE("pll_p", "tegra-dc.1", "parent"),
> > +       CLK_DUPLICATE("pll_d2_out0", "tegra-hdmi", "parent"),
> >  };
>=20
> The tegra-dc.1's parent should be pll_d2_out0.

I've explained this my reply to the Tegra20 support patch.

Thierry

--/Uq4LBwYP4y1W6pO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQofyMAAoJEN0jrNd/PrOhvDYP/3CPS5KecOvh6oAUbb6dc8SH
BrdqxKkj3YjXH/27xFG06m/XUIqcDGDQ9kyAxvYw4nAC7ydRPVBjfZViW3Zi+8dw
Ihmy4TcawZR2oyVdxGJYetEKKxBTcGb8jBpJkJZr9kS9YJH5bqrJa+wKjdJtSIxG
Ix57he97cn00CCfuxBGC9DepsAigeAx+VSGiVzvQKR84qx3J54eHntcYAVo8j9/c
WA+FClBjvcn/BQw5Zt6akwQ6APWTYmCLfoyko7ApnH4cl48bT2h36XdfmPOufDVf
6CaMi50SPCpTD378JHAG4ewNZ0Q1VzqodkQDxWMiEtSTjzx6H4Yft8eNjZONOSTY
v/7f+6owVxNPXUYrnJxBb6W8JgfZJgo11/h1YPxidFHE8YGMOojHKLa0Nwf23+/B
Whei1HU80W9tRhvJwuTorO46XsJalK4w3cKY8Df6GhM0Lmg4VO5y6iOqdBzY0YEo
R373onKge2PATOcduPtw+MRa10P4jLLBysYV0250ebI1zy1I2fhUxV14+so9GnAv
NO88ePLRWDLaHMJoojdumcX/JJIUQhHZD0ecClf0eBwSHi6qvs4U7ioHe2hfWdev
FKgNd+Rp/dYhMcW0y7BX1XuhPHOqs6p1VhdYdud0q5wKJjk4qlbI8lFK71DP5CYk
/2kGdRfewjzGaGwDmyl7
=iIF1
-----END PGP SIGNATURE-----

--/Uq4LBwYP4y1W6pO--
