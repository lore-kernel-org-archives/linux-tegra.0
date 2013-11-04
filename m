From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] clk: tegra: Properly setup PWM clock on Tegra30
Date: Mon, 4 Nov 2013 09:41:40 +0100
Message-ID: <20131104084139.GC27445@ulmo.nvidia.com>
References: <1383061872-27899-1-git-send-email-treding@nvidia.com>
 <1383061872-27899-3-git-send-email-treding@nvidia.com>
 <52701062.30405@wwwdotorg.org>
 <20131030210023.GB7686@mithrandir>
 <52717C4F.6000202@wwwdotorg.org>
 <20131030225443.GB6939@mithrandir>
 <20131031153923.GW22111@tbergstrom-lnx.Nvidia.com>
 <20131101093840.GF27864@ulmo.nvidia.com>
 <20131101164709.GA22111@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="c3bfwLpm8qysLVxt"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131101164709.GA22111-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--c3bfwLpm8qysLVxt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 01, 2013 at 06:47:09PM +0200, Peter De Schrijver wrote:
> > >=20
> > > And also not validated. Also by policy PLLC2 and PLLC3 are used for s=
caling
> > > IP blocks. So I don't think it makes sense to use them for PWM?
> >=20
> > But the policy is already defined in the clock initialization tables, so
> > we could still setup the clock to exhibit all the possible HW choices
> > and simply not use those excluded "by policy".
> >=20
>=20
> That's only the 'default'. Nothing prevents a driver from doing a
> clk_set_parent().

Well, I think this is one of the rare cases where it would even make
sense for the driver to impose policy. I would still rather see the
driver expose all possible hardware options and leave up any policy to
other code.

If you really feel strongly about not exposing PLLC2 and PLLC3, can we
at least have a comment in the driver describing why they aren't exposed
so that if people stumble over this again they know why?

Thierry

--c3bfwLpm8qysLVxt
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSd13DAAoJEN0jrNd/PrOh4c8QAIJ4VeEKne/B9zfqW6a+qgBx
U2PEF0mgHRk9m4hZwVzH9DoDdffItcjgrxtPDadHWAC1HGnPXimzgvST4aeM/LVa
Pj3V+95HM7FwvIqaaAJQJ/GOewbdHda32SXDXiXGQ8vtrnjZoFlZUfA5qVpPBLBF
SWl08bWSEZFAo5JpG1i3WIewtR+xW4AYW5jphmutO92y57kFk98wf4FmlSzkPTUs
D7Y71NsAP3zRoY3ovY37aw13ZECGYM8hAGHziABh0eqXhC9n7hlXf6VpNE8/2aUI
SeKFv/3WBfiYxyNaK+IYTMijQzOgamrIomRRlMTHawMTK5+8Sud1MP6oeUnuS7g4
7F8vjii5W5g/OqcfL/NSHBUoq1fQlul7XzqSjZ+0ir64+0iK4+jq6DX7Y0oPf60w
giGSfAcNF3mGA0SkQJ+kWzbdecOGrlY5kFESAbMzsbz98Aue4bQNY8ORc4rjU34E
58hlWW8QEPCfmGZ552P4FMAxwDbxm+oaFTlhRMu0jAdlJv1mFJ9bBmlXTv7Xe1UA
LbMoqDG/EpTBtpVAu0wUNy3YgvO5cttohcZKkvIGKfz4VBDTI6xifYp3HInPF9Cm
1uFcrBVhifgvt0wEBmLN0u44z39s31yZSLjZL375TtySl7zI6c47TVCH13KmmpjG
mMYVvpx6tKVHj8YlyOyk
=M61Q
-----END PGP SIGNATURE-----

--c3bfwLpm8qysLVxt--
