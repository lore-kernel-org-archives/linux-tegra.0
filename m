From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [RESEND/PATCH] usb: host: ehci-tegra: fix PHY error handling
Date: Tue, 2 Apr 2013 11:36:05 +0300
Message-ID: <20130402083604.GJ30286@arwen.pp.htv.fi>
References: <1363868603-14525-1-git-send-email-balbi@ti.com>
 <514B4137.2020707@wwwdotorg.org>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4vpci17Ql0Nrbul2"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <514B4137.2020707-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--4vpci17Ql0Nrbul2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi again,

On Thu, Mar 21, 2013 at 11:19:51AM -0600, Stephen Warren wrote:
> On 03/21/2013 06:23 AM, Felipe Balbi wrote:
> > PHY layer no longer returns NULL, we must
> > switch from IS_ERR_OR_NULL() to IS_ERR().
>=20
> The patches that I'll put into my topic branch are not yet complete;
> Venu first posted them a couple days back and there are a number of
> issues that will require a repost.

is your topic branch ready now ? I'm about to close my tree for v3.10,
we already have -rc5 tagged and I want to leave my pull request cooking
in next for a while.

--=20
balbi

--4vpci17Ql0Nrbul2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRWph0AAoJEIaOsuA1yqRE8lsP/1kqN2h6EpcXoIWJ4nfNecbt
mktWm5zAf00Msl/m97AF71nApjT2f5WXeCAbeN3OFBpMopp2yWiraUsylF5w9DiW
+ixBHCk12oxu65EANZNNGO08RpV2kaaysKD2Thgpu7TKOwBWJ1B9VNnretKVOvXe
Tu5JNrXAPF7hUx6oKAcVho/+eocQrmoK0PXc9irv30vhgvyiE4zP2ZWRDNNcFTGY
DPQmJh3sp68Ns0IshYCaXOj5+wpskq1XSvsZC7j4UWnU7hA3suH0qUaUS60dKKKF
ayA8AUi7pUAKj1tqb/u0tGaXjDff24Rw0005beaernC8k1OoL2p6RFZv18Ctblnm
d6pDvmJzIWhmJAqR6fJodsZcA9fyQUW7FaEglWfAJVw1H9pzQH8d/wZNgNXOHnvC
61LYc8YgQvf8go2y5rbo3lsOcNaSDbBtZVHKQ9YlfZgBS4pitzh+8c2vgxDd3zLd
HAJR6GNveXsOQ3/WfgTY7Ce5MiUlna/HSqcL6rOWtTXU/tXt7q9DMDcAVJZ/Qxla
1wOq+Z7HlfbtuFOh4msOMaU/a1eA0Knnvm2r7zq6wO7lkpQmjKrzK3z3n0D1zA8u
ef6WVbgcEwQs+UaiLuOSvEOMfsPUN1v2xxlWraKVVUe4+RqiSzMocd5qEbPMYLmE
+ummtdNdvaOADc4m48YM
=CJO0
-----END PGP SIGNATURE-----

--4vpci17Ql0Nrbul2--
