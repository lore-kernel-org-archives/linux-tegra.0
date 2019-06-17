From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V3] i2c: busses: tegra: Add suspend-resume support
Date: Mon, 17 Jun 2019 09:09:35 +0200
Message-ID: <20190617070935.GB30126@ulmo>
References: <1559885867-10190-1-git-send-email-bbiswas@nvidia.com>
 <20190614211129.GG17899@ninjato>
 <758d6dc2-f044-6be3-6896-196ef477d393@nvidia.com>
 <20190615045405.GA1023@kunai>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cmJC7u66zC7hs+87"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190615045405.GA1023@kunai>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>, Bitan Biswas <bbiswas@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--cmJC7u66zC7hs+87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 15, 2019 at 06:54:05AM +0200, Wolfram Sang wrote:
>=20
> > > Without a maintainer ack, this is an exception this time. Should we a=
dd
> > > Dmitry as another maintainer or reviewer at least?
> > >=20
> > I shall followup with Maintainer for ACK in future I2C tegra patches.
>=20
> This comment was not directed at you, sorry if that was not clear. It
> was more for Laxman, Thierry, Jonathan, and Dmitry (if he is
> interested).

I thought I had already acked this. I've certainly been testing this
since I carry it in a local tree. So for what it's worth:

Tested-by: Thierry Reding <treding@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>

Bitan, I don't mind getting the patches to the corporate email address,
but please make sure to also always include the gmail address when
sending patches to the public mailing lists. My workflow is somewhat
quirky that way because I work remotely and for historical reasons.

Thierry

--cmJC7u66zC7hs+87
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0HPK8ACgkQ3SOs138+
s6FohhAAueqXXOLMZn3+hgH+DaEpPrk9LFMEZiSlIPZ7H/nQ7UBUFlw5RL+eMCi8
VdtLa4T3PVlHCWkQB525d+e2Zz59rpsAiLaFpbjnH6rg/1USybHGmXiZonu1q65N
mfia5/uyCp/zOjFI59IUSCWUtDNukWa4Ypy1OIjt/l+kBmPjFALVRNzfdTBDoxli
45IaxfFz0zV/F+1kGSHlcrgPFU14KsFYOdiXsKe2+LS4+dKPmhXf4MALat2f9RRM
QyoniVVfd3a8wMAPuQ7K0KAU4KtnjHglpgxd0WlJ0TN95aTjqi+9cCxIEsshw3T7
FYKWyQqHcZ7j5GPk8UBt9jKHnmsg4z8r2ZMO2+F2+xmMnUvW67vZzFsSNti0KJc7
8IeyHVbhTOQya2fR5pj6pyPDfW7k+kKQ9iQYl98XvaCDrND7k0SdtkB+ctbi/qva
ZqFErPJFPWZggjz2CICICaH98ueKpvKODf/wCDM57ManU7iXO6zx34f4eR758O54
SPvblD8XW6L0RPMq9hnlTmn7mJKw4XhVvGXkABxvwErfKeew+GIcCyJsgz/BsIAZ
SRwKl7WC1FECPHtWQfwN1oWuu33T2eg5Z/nKsJcFQ/mcyk6Kq41Bi0A3NohkJvsp
AkLVEx8ivhD68wLQ/RZQyFcVbiPiUBmxT9OM1BKzZ5utoIsldts=
=e940
-----END PGP SIGNATURE-----

--cmJC7u66zC7hs+87--
