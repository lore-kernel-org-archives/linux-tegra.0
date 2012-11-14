From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Add Tegra20 host1x support
Date: Wed, 14 Nov 2012 16:01:25 +0100
Message-ID: <20121114150125.GA11050@avionic-0098.mockup.avionic-design.de>
References: <1352467202-27903-1-git-send-email-thierry.reding@avionic-design.de>
 <1352467202-27903-2-git-send-email-thierry.reding@avionic-design.de>
 <50A357D3.9080002@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50A357D3.9080002-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 14, 2012 at 10:35:31AM +0200, Terje Bergstr=C3=B6m wrote:
> On 09.11.2012 15:20, Thierry Reding wrote:
> > This commit adds the host1x node along with its children to the Tegra20
> > DTSI. Furthermore the OF auxiliary data table is updated to have proper
> > names assigned to the platform devices instantiated from the device
> > tree. Moreover, the clocks required by host1x and the two display
> > controllers are initialized and the pll_d frequency table is completed
> > with a few entries to support common HDMI and LVDS display modes.
>=20
> I tried to add nvhost on top of your patches and I noticed a glitch.
>=20
> > +       { "host1x",     "pll_c",        144000000,      false },
>=20
> This line causes host1x not to operate correctly. I don't know why this
> is so, but when I try to initialize host1x, it hangs with this change,
> but everything works without this line.
>=20
> If you could fix that,

Funny. I just tested with this line removed and I also get the freeze.
With the line I don't get the freeze. Does the freeze only occur with
additional patches on top? If so I think we should keep the line in for
now because it is what most people have tested against and which has
proven to work. We can fix any remaining issues with host1x specific
things when actual patches emerge.

Thierry

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQo7JFAAoJEN0jrNd/PrOhQBwP/3SP7Jw0mZAIGA4iuohnwsn2
GC+IwpKnvh8yNCchFknaVp/1zN06dXj0lHkW/uigkoVtFAU9yE9FKa6rFqz30GSC
fuIeakCwLxPONtdKiTlDjW+Bq3kNMkE8E3Pmw8vZ901QFu+fsfHWvvxmnS1GRVtX
7qkKNoxUnhk5CIeJR4cI7rpMwtVNYvMIGVZTDk5Uk1lnUtpHdM/h0iGQSvn/o+ku
hNP60rRdTuex1buYd8PEtHm5Ew2y3rpdxdX2DfAn2FQ17g164yM/kQu3hu1rsELk
7J+7kpLrnz6W/SiCXhjqtNmuXHDtMwa/MngEb/XgYh68XrGXsDxigc1yf2Zvht07
y4s/I3qh1P2B2pRdWQI/78UdN/wKOLTo3vuYUJYNskQRYkaUZ39A0RtU71M/PZ5q
fpEUCianteAep7V9bNgHvwf8C7Llqj4S28Jj2N8aHW6KKh4wveDKXNYm8rNaJB5c
V3z5IYp32XrcPu1JqfoPQ6YGcrStgOnaeCf7Xbdwxj7BskejPpYrnMW5Gn+ocGOj
t0xuNl1EfPM1RC26KiP1+OMJTzD1Lz8rLbxjvQTDD0ttxHQSCN7rjfXuSsAyzZPx
STvxr2KRL1cw+5JDJnBU8UqqUIA98GIHVa/EUxegX24AUiB1mMs5tvFWnuIdsASK
agyHbyCI5+3/BAx9N6Je
=82cI
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
