From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] i2c: tegra: proper handling of error cases
Date: Mon, 18 Apr 2016 09:26:06 +0200
Message-ID: <20160418072606.GB13078@ulmo.ba.sec>
References: <1460726507-9170-1-git-send-email-smohammed@nvdiia.com>
 <20160415141558.GC3472@ulmo.ba.sec>
 <73535dcc422441d3a981208dae1a2bad@bgmail102.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wzJLGUyc3ArbnUjN"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <73535dcc422441d3a981208dae1a2bad@bgmail102.nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shardar Mohammed <smohammed@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "wsa@the-dreams.de" <wsa@the-dreams.de>, "gnurou@gmail.com" <gnurou@gmail.com>
List-Id: linux-tegra@vger.kernel.org


--wzJLGUyc3ArbnUjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 16, 2016 at 08:08:50AM +0000, Shardar Mohammed wrote:
[...]
> > >  	if (!(msg->flags & I2C_M_RD))
> > >  		tegra_i2c_fill_tx_fifo(i2c_dev);
> > >
> > > -	int_mask =3D I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
> > >  	if (i2c_dev->hw->has_per_pkt_xfer_complete_irq)
> > >  		int_mask |=3D I2C_INT_PACKET_XFER_COMPLETE;
> > >  	if (msg->flags & I2C_M_RD)
> > >  		int_mask |=3D I2C_INT_RX_FIFO_DATA_REQ;
> > >  	else if (i2c_dev->msg_buf_remaining)
> > >  		int_mask |=3D I2C_INT_TX_FIFO_DATA_REQ;
> > > +
> > >  	tegra_i2c_unmask_irq(i2c_dev, int_mask);
> >=20
> > Can this line be removed? The NO_ACK and ARBITRATION_LOST interrupts
> > are already unmasked earlier.
>=20
> [Shardar] unmask_irq() here is enabling other interrupts
> (PACKET_XFER_COMPLETE/TX_FIFO_DATA_REQ/RX_FIFO_DATA_REQ). please let
> me know if my understanding is wrong from your comment.

You're right, I obviously wasn't looking closely enough.

Thierry

--wzJLGUyc3ArbnUjN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXFIwLAAoJEN0jrNd/PrOhdW0P/Rhpv/akkjgYuW5DoyFo+dR1
t9a51ZUkzlkb4xsSm71Kd3BwxHaxN3xR3lPCxYA4xPEbZw1N7EvsZmcpnGk7JuH7
iL746n7T0IoUr4CvCpHBguiJinvOv5dHvFZkyJVfiHae4/UiTnHTM1g3pJ11EMj/
z/2dW6wbChIWz1A+UnE8MSxr8Bwozg7vNgV9bnnf5NMIjag3DSwyPxGKWr0T2B7E
FWTumxI00U/wXIiKgtaEMB4wd5ZszqOeRX5WgaI9DyZLPOwgB70IHFkwp/Ln4FAR
gEGqD6Ru9wpwSYPYfTBtvEb2ctDM100ABOvBa/O4jbInVwyvbADZskr6f8DYPbOF
I4Qvfr8XT6P61xH63xLL9p1BgEZuqMlC151Rf5cTDuNUb4lkCWvIXOPis0fsY2E1
AeQGMwiBUGslQKNJVyqhYQjJbFMq2176FBrIJZTAUKHvWxRoDKBo0FpfYQjCCyUi
w+cmykIs0+QOgEuiwNGKNu69I32VIABdeJcdRAK31NMiCXw/XxJQlbPD0qKOciBB
dRcGTsmQGE+rULCglri1wF6eQN7d+Cy0GmhIxIHqUMpqucL8wXDkNSJ+DFegKWyy
BZHy2B/hhwPvB5OAuv0Tdq96EXsMUynVJBymwpF0p8pIHaJeRg3ys1IzeG69xhyY
161PrsrSCzLkd5I8CWMi
=qFSH
-----END PGP SIGNATURE-----

--wzJLGUyc3ArbnUjN--
