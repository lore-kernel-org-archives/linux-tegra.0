From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 2/5] drm/tegra: Add plane support
Date: Tue, 15 Jan 2013 12:19:22 +0100
Message-ID: <20130115111922.GA18119@avionic-0098.adnet.avionic-design.de>
References: <1358179560-26799-1-git-send-email-thierry.reding@avionic-design.de>
 <1358179560-26799-3-git-send-email-thierry.reding@avionic-design.de>
 <1358183024.1524.8.camel@tellur>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1358183024.1524.8.camel@tellur>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 14, 2013 at 06:03:44PM +0100, Lucas Stach wrote:
> Am Montag, den 14.01.2013, 17:05 +0100 schrieb Thierry Reding:
[...]
> > +	value =3D (WIN_A_ACT_REQ << index) | (WIN_A_UPDATE << index);
> > +	tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
> This should be two separate writes to the register. I don't know how
> relevant this is on real HW, but the TRM states: "Restrictions: ACT_REQ
> cannot be programmed at the same time the corresponding "UPDATE" is
> programmed."
>=20
> Better be safe than sorry and split it up.

It doesn't seem to make a difference, but I can split it up anyway.

[...]
> > +	/*
> > +	 * Disable blending and assume Window A is the bottom-most window,
> > +	 * Window C is the top-most window and Window B is in the middle.
> > +	 */
> I would like to see the root window using WIN_C, so we only loose the
> least capable plane (WIN_A: no filtering or YUV conversion) when using a
> plane for the hardware cursor. Maybe you can fold this in, otherwise
> I'll send a patch on top of this series.

On the other hand, doing so will loose a perfectly good video overlay
plane.

[...]
> > +	value =3D (WIN_A_ACT_REQ << index) | (WIN_A_UPDATE << index);
> > +	tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
> Same comment as above.

Done. I'll fold a similar change into the .mode_set_base() patch and
will also add a patch that converts the remaining occurrences in
tegra_crtc_commit().

Thanks,
Thierry

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ9Ts6AAoJEN0jrNd/PrOhFXwQAIqINbtzq28snX9yBm+S/8tk
79P53Kivvk27zSmEdPqoH7hVbCBd2o763p8tm9SjmCI5f5ml4uSZlka+lQB3QG24
RLUSjANl/eL6chg5MuGr5FbjsAdN10CcpaOLySAi1xWlZmhj/aF+9Q/gj18KKngv
7kzs9Mv4ZkWMq7tzbD1BtDZAWkakHLRBA5Kj5BOK6CFQ+F7wUrXy4j9W3L0rQsjU
fGRWJtVyl1oWgOedEDQS/Eg2w24CEDtJJcdmidOyFvzOWFeA/t6Unk0zGLgqbzmA
0TwLZ47YxFm3CYS/dfLKxTak07Wr0gIgFYHibM7JHeF0tmZZNdvo/tDzjJfVQtsy
mcGTp4cQW994+Iho5v/mG1YgsBrBLpRh2nKqPVcw2lh33X4jiaAs2OIj7rcovRPQ
V+o69GWDFtcpw/OaledyEEL6dMFmN1BhVUrCidktg3P/ExuFzkvU3Q0l2d5Tc5eE
Ckqr+EEM0x/9+S5VfCjiXaKZ4fnZf+t6paUjQgve6M3KnMJeoPfpUBCa+cKch/NP
1MU7UhLQbjYBDS2WTRNwlUwzPv0dG2gWDmVnELpl14XVMS9UJVcUOQjUDpVyP3MV
OGhoSZILXdSxkuxluNbMCnkXib4KMm6D046r9Uf31y3LCwdn4a1pggKsMu9xbq8M
e2DpWn8UnJUHOMfHvjQd
=ZuZr
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
