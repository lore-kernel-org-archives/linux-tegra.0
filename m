From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [RESEND/PATCH] usb: host: ehci-tegra: fix PHY error handling
Date: Thu, 21 Mar 2013 19:31:00 +0200
Message-ID: <20130321173100.GB16186@arwen.pp.htv.fi>
References: <1363868603-14525-1-git-send-email-balbi@ti.com>
 <514B4137.2020707@wwwdotorg.org>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CdrF4e02JqNVZeln"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <514B4137.2020707-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--CdrF4e02JqNVZeln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 21, 2013 at 11:19:51AM -0600, Stephen Warren wrote:
> On 03/21/2013 06:23 AM, Felipe Balbi wrote:
> > PHY layer no longer returns NULL, we must
> > switch from IS_ERR_OR_NULL() to IS_ERR().
>=20
> The patches that I'll put into my topic branch are not yet complete;
> Venu first posted them a couple days back and there are a number of
> issues that will require a repost.
>=20
> I would suggest that you apply your patch to your tree, and when Venu

alright, in that case, can I get yours or Venu's Acked-by ?

--=20
balbi

--CdrF4e02JqNVZeln
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRS0PUAAoJEIaOsuA1yqREX9wP/0Vl8KIchCif2iNVC5HHGsL2
a1V6o/qQaFpq24kJwv3QzD21TnlpF0RrNLqQGfuySnVeQXH+ecOlCdTfiP9MnmwN
zN8+lhDWtEU0Xcuaiv3ZOc5d6OpHHv/HGPFw+sP/Xhg4n3vXEq2dm493Z3F4jixk
hRT9zOKepzjUdF7XsxjkwAJzDLY0G5hNIjybyh7fWlTUBwRxYb3NoDFeoPDi2OpB
iE4UFzn3JXioxCMxlLzLYnDtkdIsLZefhWJ1qR+GwLP3PksY7QrQax8kfN4nJiHD
5SzggJAhsd4/7LhzSRgTqMBFBsssBCgu9xwzXMw33pDoje8b8c9A/KrxCHnnXTUT
Yr1BhavudrNc2AdIc6tc535PhftBGc5iA4ilSzVMZFZSsaxJsO4Ph7SxbLbgzFOB
GmRwY9xMdqfFkQbKMwFbrza3FWDDJFtQe21bbJDJPCmk2qYpVmbVrGErk9y8/6Uu
eSxcb5sShWNwnyOJ/H5MrtyZf+vJDc/nJEceQ6wBYigblYbYvlyQl2xEH3axWAJn
GOj7M3gWg1o81zqr6+oYufobWHcz0Cf569M70F70BAXhOALG7g3hrsErUKmHKyW/
CW6ojSyZz/1t6LfbpPDDxx+ykW6jcwJLMdJ0tPg6RSPU8hfE4c7YQrg7q6O4QGmB
u7lBtFO4YP42NiXVSiOn
=pbW9
-----END PGP SIGNATURE-----

--CdrF4e02JqNVZeln--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
