From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Only 1 CPU on Jetson TX1
Date: Mon, 27 Mar 2017 18:58:24 +0200
Message-ID: <20170327165824.GA10278@ulmo.ba.sec>
References: <20170323001131.GA7507@jirafa.cyrius.com>
 <6da81dbc-b070-da0f-1589-ec2cb8f453d5@kapsi.fi>
 <20170326224912.GD4723@jirafa.cyrius.com>
 <fe29c677-584f-fd1f-d2f8-ff29c8bebf9c@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fe29c677-584f-fd1f-d2f8-ff29c8bebf9c-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vagrant Cascadian <vagrant-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 27, 2017 at 09:39:43AM -0600, Stephen Warren wrote:
> On 03/26/2017 04:49 PM, Martin Michlmayr wrote:
> > * Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org> [2017-03-25 10:32]:
> > > It appears you need to have
> > >=20
> > >   fdt_copy_node_names=3D/cpus:/psci
> > >   fdt_copy_src_addr=3D0x83080000
> > >=20
> > > in your U-Boot configuration. This is documented somewhere in the mid=
dle of
> > > http://elinux.org/Jetson/TX1_Upstream_Kernel.
> >=20
> > I can confirm that this works with u-boot from L4T R24.2.1.
> >=20
> > However, it doesn't work with mainling u-boot (grepping for fdt_copy_
> > doesn't show anything in the source code).
> >=20
> > Does anyone know how to get all 4 CPUs working with mainline u-boot?
>=20
> Thierry, Jon, do you know?
>=20
> The "fdt_copy" feature of U-Boot isn't upstreamed since I thought it was
> only required to boot the L4T kernel, not mainline. We're also reworking =
L4T
> so this feature won't be needed there either, so I don't expect to upstre=
am
> "fdt_copy".

I vaguely remember that we had discussed this a while ago and I think we
decided that we should hardcode the /psci and /cpus nodes within the DTS
file on the basis that firmware would be considered part of the hardware
as far as the device tree description of it is concerned.

Technically, hard-coding isn't quite correct because someone might end
up not using the firmware that ships with L4T and therefore not have a
working PSCI implementation, but I think it's fairly unlikely that
someone will do that.

Thierry

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljZRK0ACgkQ3SOs138+
s6HIYg/+NeF3i2wFW7UQjmdR4IZ7sU3yLuy/3FcjI5tEmEL6PIO4MXayNLO2e/Zv
d14ufH72XB3Og7uVktDzKXFA7heVNWHz47bRKd7P5o4GozRLlKlYWWUZmZwfOCb9
WVCewHS+LsFp+fV+BuFpmNXUu+og9N3ogPtLKfnU5UAryb/NG4IXEEuPeHd5Ml/F
jbwIL2P+zMJDnhZltPc8uRMFAQelmgtaIUMemhpXLRDM9VxWWXWlAS62HPEVxkSy
5az3g8TUlZudRpXvm9yy4QuQc6Jocp39bc60ZsDwf+OSSpv8jWPjAOYtBnHQ3+zh
YlQi/Bx50BmnOZ0FPmuvDTY5U2I8ABMf0et75vnRkIRW5MDJk3lTSfI/1LBPZoJ0
bXgZ6ji8mrQs1WFLntaRGofwCvUyVvIL8wOaPY7mO6Hb7MQcTvguq7GZQGRh2Xzv
XdYXqoZKan5vfyNqpYrGvxerdg2yWS3zPHQy2h9M1xrsyf5tWs3/6icBuOehYz6a
+q1m/a8hCc7dG6VEC/CKriUV8kAQNWC993Dw+RmMYM3p28ipk1NzTpX/NsUgRIpp
laPcTS5lLxk3Q/REREFgtzylyqWU7Tgt88IjIk/COBQTA1XkpX+IsS3MlGprGyIP
8HNimsD8FXlUSkkYTMitIhAVezDDcyf6oYsiaoLvHSJp2tL7lY4=
=Qk7s
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
