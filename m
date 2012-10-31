From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH REPOST] usb: host: tegra remove include of <mach/iomap.h>
Date: Wed, 31 Oct 2012 14:51:31 +0200
Message-ID: <20121031125131.GJ10998@arwen.pp.htv.fi>
References: <1351106941-869-1-git-send-email-swarren@wwwdotorg.org>
 <508EB654.8030502@wwwdotorg.org>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d6iqOn7HZPWKXx18"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <508EB654.8030502-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--d6iqOn7HZPWKXx18
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 29, 2012 at 11:01:08AM -0600, Stephen Warren wrote:
> On 10/24/2012 01:29 PM, Stephen Warren wrote:
> > Almost nothing from this file is used, and the file will hopefully be
> > deleted soon. Copy the tiny portions that are used directly into
> > ehci-tegra.c. I believe that Venu Byravarasu is working on cleaning up
> > our USB driver, and those cleanups will remove the need for these
> > constants.
>=20
> Per suggestion from Greg, I have applied this to the Tegra tree for 3.8.

so I need not take this patch in my tree, right ?

just making sure.

--=20
balbi

--d6iqOn7HZPWKXx18
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQkR7TAAoJEIaOsuA1yqREk6cP/jqFFqvDolOanIB1wDje6RGE
xXOXEPoLHvIeI83xqz5iSV07aJxzKrrdFjF6VA4/himVIjWbZuI4Z1VYHxwln/9+
uV2BI26TSNV/bnlwrghmx/8p38rYu3CqhVRQjqhsULAjwTySMk8dPFzn7a4OZRLQ
YRgwqmiOsaSgAbKcq7q4GZMEAwa7V5iHgvroLPqvvtJahEycyQJ27gbtHz5iCTWl
YlRcfJJvF4MsOoyzY1WbFFDJa9KsmdKWueyvbEssovCwU3Hqrz4sywzcxbz//+XB
TWB6PzAIyQ+LdZlyhvUwjB8h0g0/dezR0yDoeIRl2STKTcP/c2dANT34E1+6tks7
1EsnjVLD3pXC8ysOQQqsfxXw5F/XLtF2vt7dHDnR0CD/EleihVMMjYg+1sFgraXj
mmbx5/iry+/jweQg68K8TvklP5BCxyk2I2Z/5t7M7iw14hDQT0x19EU8Vgk+usyY
niqnLwpgUboMtVtykhqGyNMTQby9vBRR4YB7RiOzx+bTUFxxhwWnCS1vM1RyQi/B
uIPONdONoaRaRlHburc+2whtE1v0DGnF+m1liDOhiEC56C755kfsm3e/1c6ZLZ5v
RO75WIIOg/D75TV9Osj6G5M+YCfvdqfvrzPyBDnJPD2dJ88++Ek0kD/jBabbIa1I
j7E/Y8/XDUwJJwAWM6cP
=Faym
-----END PGP SIGNATURE-----

--d6iqOn7HZPWKXx18--
