From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 0/2] Device tree updates for host1x support
Date: Fri, 9 Nov 2012 19:44:09 +0100
Message-ID: <20121109184409.GB7663@avionic-0098.mockup.avionic-design.de>
References: <1352467202-27903-1-git-send-email-thierry.reding@avionic-design.de>
 <509D3EB1.8040703@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WYTEVAkct0FjGQmd"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <509D3EB1.8040703-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--WYTEVAkct0FjGQmd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 09, 2012 at 10:34:41AM -0700, Stephen Warren wrote:
> On 11/09/2012 06:20 AM, Thierry Reding wrote:
> > This set of patches are in preparation for the Tegra DRM driver. They
> > add the necessary nodes to the DTSI files and setup the clocks necessary
> > for host1x and the display controllers to work properly. The AUXDATA
> > table is updated with the entries for the newly added nodes and the PLL
> > frequency tables are extended with some frequencies required to make a
> > few of the more common LVDS panel and HDMI display modes work.
> >=20
> > By default, all output resources (RGB, HDMI, DSI and TVO) are disabled,
> > and individual boards need to enable those that they require.
> >=20
> > Note that there has been talk to replace the frequency tables by an
> > algorithmic computation of the dividers in order to avoid endless
> > additions to these tables. No code has surfaced yet, but eventually this
> > should replace the static tables.
>=20
> This basically looks reasonable.
>=20
> I assume the DT bindings are documented in the tegradrm driver series? I
> haven't looked at that yet.
>=20
> I'd like to see explicit acks for the DT changes from e.g. Terje and
> Mark Zhang, and anyone else involved in previous discussions about them.
>=20
> Could you please split up the patches a little differently? I'd like to s=
ee:
>=20
> 1) Changes to the clock driver
> 2) Changes to add AUXDATA
> 3) Changes to .dts files
>=20
> The reason being that these are logically separate changes. (1) and (2)
> would be applied to the "soc" branch, and (3) to the "dt" branch.

I'll split the patches up some more then.

> Finally, I'd prefer not to rename the match parameters in the clock
> drivers any more; just set up the AUXDATA to match whatever driver names
> the clock driver is expecting. That will reduce churn to the clock
> driver.

I updated the table mainly because the devices were named very
inconsistently. For instance, the output resources and host1x didn't
have the tegra- prefix, but the display controllers did. I still think
there's enough value in having a consistent set of device names, but
this is your tree, so I'll drop those changes and update the AUXDATA
table if that's what you want.

> I really hope soon that Tegra will support DT bindings for
> clocks so we can get rid of the AUXDATA, but unfortunately I haven't
> seen any movement towards this:-(

Oh yes, please. We wouldn't have any of the above problem if we had
proper DT bindings for this. Who needs to be prodded to speed this up?

Thierry

--WYTEVAkct0FjGQmd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQnU75AAoJEN0jrNd/PrOhikcP/imTeun/w4o79HgeleR5LFRR
zshbGliiPKxzChMBKdd19bcik/VSHXqB/J3QFVVg8cRRuP+MH8aYQHFl3hrUZqOi
3vJgxDq8qy/ZsyCb5AjIB25qXCr5Y84cVNeWoOmW49z/mqFXHT4wnsBQcWWUlitj
nyuNdSCUJGcWdj8D50KSgXvjuSHgNGjdqcDYWl/KKMyYZnZLVDvD6S5WF0FwPsG8
HYnNff2qhl49JxPCwfGytJxexewUfP3dIa1GvPm5BqDa+/+sAtWFJlTLmt6eDkl/
ySQOkd7sGk2rzuPNOeq2gV9O2PJpSEUejBSvbKhcVChkYr6SKZNPE5auokxjnLLC
Gjf+KJbeSvT022m4Xh+jM7IMpVvyHsw9DrNkQ+xj94iZBz8QwRSXT055dEKccS74
TmE9l5GKvURtxNd9XAr1cN9h3QWoJMX320lM/rCxjUU+n2XbHWEaiTTqE2HEhL0C
3q4SzFRZtTubYOqw9CNmMUaIKEVZIXwPNMo9SY3r9wecCBl687pNipanb/W0fO4D
d03nIhNB0vhKVg4LpeFkt1l4BB1zaj2Si56UhoC6xzclwa0Yl6j6SQg10EVlIKT8
sD31uCDHcWxfsY0M1voQKKPAhFkNAFFIaZ83CqGIOwgiznjM+Ijo4qolxM1AvaW0
3elT3DpFLRTe1YljA3LS
=Q1Wt
-----END PGP SIGNATURE-----

--WYTEVAkct0FjGQmd--
