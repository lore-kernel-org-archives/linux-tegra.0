From: Benson Leung <bleung-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 1/2] mfd: cros ec: spi: Don't send first message too
 soon
Date: Sat, 18 Nov 2017 22:09:58 -0800
Message-ID: <20171119060958.GA51565@decatoncale.mtv.corp.google.com>
References: <1510670608-19594-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1510670608-19594-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Shawn Nematbakhsh <shawnn-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jon,

On Tue, Nov 14, 2017 at 02:43:27PM +0000, Jon Hunter wrote:
> On the Tegra124 Nyan-Big chromebook the very first SPI message sent to
> the EC is failing.
>=20
> The Tegra SPI driver configures the SPI chip-selects to be active-high
> by default (and always has for many years). The EC SPI requires an
> active-low chip-select and so the Tegra chip-select is reconfigured to
> be active-low when the EC SPI driver calls spi_setup(). The problem is
> that if the first SPI message to the EC is sent too soon after
> reconfiguring the SPI chip-select, it fails.
>=20
> The EC SPI driver prevents back-to-back SPI messages being sent too
> soon by keeping track of the time the last transfer was sent via the
> variable 'last_transfer_ns'. To prevent the very first transfer being
> sent too soon, initialise the 'last_transfer_ns' variable after calling
> spi_setup() and before sending the first SPI message.
>=20
> Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Acked-by: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
Chromium OS Project
bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJaESA2AAoJEB8J9XsKL+ZYeO4QAIfvZ7JvGyAAAyCii6ZnVaDk
a808+u6i3WszujujcrtSgu3Y5PZpZHivyL+OFWhQ9VJaF6dJ+N3/vhewA/C9izgI
P6Hu47XDNsdmj3t2185OpkZpe8p/HFScQmfN6dBasGX9GxKyxFksZPn953nJavAa
k8DosACfQEAD27CHUDhvUyR28FNdmAGA0luk+rgwcBfpm9hnbXStopfGBN7IVSH1
jbqItD4+eqZGFxKz7U9Tj/TRnSbP3sUEL95xaegCAnK8eoWOBaAosl/SFiBb1/mZ
34NtEyxME+XCh6vlFv0Syfa2wcTrlUt0DlIWYIbnWnFGAJm1MuPbh03C1gip9Ikl
mJ9RVSlwJl2lnzhI1z9pUvkq1+C22w/W5EzO3U/xjsjntNrorOz/oP5SZZ9ZLCUz
zZAfaDkJR3gath/I7C0b4PnzG4CNUBAPrDGKD6/ZCgXSh4MokOsGu0yfzvU//u9i
O30eCh/Cfd+0RJr5Zo7nd974+tX8NSo02AdhvgnuT/uCnF4dzvwa2Prq+ws4wfYQ
xq+8u7QQoXA2bZcnfYU7dxb4QoM6Pk0Lvagv8Q8rPP3v5uxXGudUwAJxCN+OXikX
v78KRsAXFViEUboO3cvwORXRDSfivslq0eHjzWKfYPbDa4TfkRfaTezJ2lOGGrDb
oItmXpAf+ZjbQDdVAd+r
=okKd
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
