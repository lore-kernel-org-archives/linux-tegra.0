From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 0/7] add Tegra194 XUSB host and pad controller support
Date: Tue, 8 Oct 2019 13:29:07 +0200
Message-ID: <20191008112907.GC228118@ulmo>
References: <20191004162906.4818-1-jckuo@nvidia.com>
 <20191007110311.GA614644@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GPJrCs/72TxItFYR"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191007110311.GA614644@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: JC Kuo <jckuo@nvidia.com>, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com
List-Id: linux-tegra@vger.kernel.org


--GPJrCs/72TxItFYR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2019 at 01:03:11PM +0200, Greg KH wrote:
> On Sat, Oct 05, 2019 at 12:28:59AM +0800, JC Kuo wrote:
> > Hi,
> >=20
> > This series introduces support for Tegra194 XUSB host and pad
> > controller. Tegra194 XUSB host and pad controller are highly
> > similar to the controllers found on Tegra186. Therefore, it's
> > possible to resue xhci-tegra.c and xusb-tegra186.c for Tegra194.
>=20
> I've taken patches 1 and 2 through my USB tree.  If you want/need me to
> take the others, please get acks from those maintainers on them so I can
> do so.

I can pick up patches 6 and 7 into the Tegra tree. There are a few
patches in there already that conflict with the DT changes in this
series and those will be easier to resolve in the Tegra tree.

JC, I noticed that you didn't Cc Kishon as the PHY subsystem maintainer.
Please resend the series with Kishon added in the To: line to make sure
he sees them and can apply or ack them.

Given that Greg's already applied patches 1 and 2, maybe leave them out
of the series.

Thierry

--GPJrCs/72TxItFYR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2ccwIACgkQ3SOs138+
s6EHqhAAtp/qnbVEMpUPdQ4QZrf6zUalRDl5LzyC8TQdSl+FMfbcFe9thXOQNkKN
w69TNE00wHz9llCeHLB7cXYKnXZkRjxjJg+0JRt5ULV6ijZH+vRG1ICs/FG5KPxZ
RFODotu9nCMcbFmszhYTHP5TtvVObWylAhjQ8lBBWFRutILCsaYwY2qA5cd+JAAW
itNCCKSIAhqksYpL0hmfFr28bUoMZ4fh51Lnie/RP0lHV6HHa1LPYXJQ10lx9x2u
E+BanUgNYaNTpgnoZgQUsc0kjnrU8+watMHZGNAT2qOOtm71Xs1iOxkLR28z35Jm
L8oTrS9DZAoob0ewxpWPH8dJMwrF8yxp+8Pp+C8NG0KpHpdiOM7woEq6VXEHaY+d
6sfngywiY6YvY/dH18hH6Ds0tPWCaEwzDBdEenZAm2+H35cz4mFKBR/mxy2EkZJq
cgRBJVLrKgG84Bnujfq8hNXkrGp3I3KCk+ENeq4tC+EpgDc3i1He7mS1G9ppSdxD
lEMfnZqBD9Rj4zAQPoAVtkMdXGi93LL2YPIMZhEGbyl07ZejfsC+jomAXhmWpk+8
r+3zZj10fXH7xGsdRAHIzra36DYVe8hsYJrMtyIr4yiDgebpDr5Ofvc0jdWq/eRU
kxbyY8RANaFfs+vH7hIoB1ta6y0X+0SXeixsk+PuzqYfvDq6fV8=
=mEdr
-----END PGP SIGNATURE-----

--GPJrCs/72TxItFYR--
