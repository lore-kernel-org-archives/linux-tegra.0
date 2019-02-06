From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V12 3/5] i2c: tegra: Add DMA support
Date: Wed, 6 Feb 2019 14:13:10 +0100
Message-ID: <20190206131310.GK21676@ulmo>
References: <1549406769-27544-1-git-send-email-skomatineni@nvidia.com>
 <1549406769-27544-3-git-send-email-skomatineni@nvidia.com>
 <85b77477-3175-0501-8753-f39d3b60538e@gmail.com>
 <20190206130909.GJ21676@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VSVNCtZB1QZ8vhj+"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190206130909.GJ21676@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--VSVNCtZB1QZ8vhj+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 06, 2019 at 02:09:09PM +0100, Thierry Reding wrote:
> On Wed, Feb 06, 2019 at 02:55:01PM +0300, Dmitry Osipenko wrote:
[...]
> > Sowjanya, I tried to enforce DMA transferring + setting DMA burst to a =
one word and this combination doesn't work well while it should, if I'm not=
 missing something. Could you please take a look at the problem or explain =
why that happens?
> >=20
> > Here is the change I made:
> >=20
> > -----------------
> > diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-te=
gra.c
> > index c538ed5f8e2c..59e245d4417d 100644
> > --- a/drivers/i2c/busses/i2c-tegra.c
> > +++ b/drivers/i2c/busses/i2c-tegra.c
> > @@ -6,6 +6,8 @@
> >   * Author: Colin Cross <ccross@android.com>
> >   */
> > =20
> > +#define DEBUG
> > +
> >  #include <linux/clk.h>
> >  #include <linux/delay.h>
> >  #include <linux/dmaengine.h>
> > @@ -929,12 +931,7 @@ static void tegra_i2c_config_fifo_trig(struct tegr=
a_i2c_dev *i2c_dev,
> >         val =3D i2c_readl(i2c_dev, reg);
> > =20
> >         if (i2c_dev->is_curr_dma_xfer) {
> > -               if (len & 0xF)
> >                         dma_burst =3D 1;
> > -               else if (len & 0x10)
> > -                       dma_burst =3D 4;
> > -               else
> > -                       dma_burst =3D 8;
> > =20
> >                 if (i2c_dev->msg_read) {
> >                         chan =3D i2c_dev->rx_dma_chan;
> > @@ -1046,8 +1043,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_de=
v *i2c_dev,
> >                 xfer_size =3D msg->len + I2C_PACKET_HEADER_SIZE;
> > =20
> >         xfer_size =3D ALIGN(xfer_size, BYTES_PER_FIFO_WORD);
> > -       i2c_dev->is_curr_dma_xfer =3D (xfer_size > I2C_PIO_MODE_MAX_LEN=
) &&
> > -                                   i2c_dev->dma_buf;
> > +       i2c_dev->is_curr_dma_xfer =3D !!i2c_dev->dma_buf;
> >         tegra_i2c_config_fifo_trig(i2c_dev, xfer_size);
> >         dma =3D i2c_dev->is_curr_dma_xfer
> > -----------------
> >=20
> > And here what happens:
> >=20
> > -----------------
> > ...
> > [    0.761144] tegra_rtc 7000e000.rtc: registered as rtc1
> > [    0.761199] tegra_rtc 7000e000.rtc: Tegra internal Real Time Clock
> > [    0.761406] i2c /dev entries driver
> > [    0.919233] tegra-i2c 7000c000.i2c: starting DMA for length: 16
> > [    0.919246] tegra-i2c 7000c000.i2c: unmasked irq: 0c
> > [    0.919345] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
> > [    0.919355] tegra-i2c 7000c000.i2c: starting DMA for length: 8
> > [    0.919363] tegra-i2c 7000c000.i2c: unmasked irq: 0c
> > [    0.919628] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
> > [    0.919641] tegra-i2c 7000c000.i2c: starting DMA for length: 16
> > [    0.919649] tegra-i2c 7000c000.i2c: unmasked irq: 0c
> > [    0.919746] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
> > [    0.919755] tegra-i2c 7000c000.i2c: starting DMA for length: 112
> > [    0.919763] tegra-i2c 7000c000.i2c: unmasked irq: 0c
> > [    0.923140] tegra-i2c 7000c000.i2c: transfer complete: 11 0 0
> > [    0.923150] atmel_mxt_ts 0-004c: Family: 160 Variant: 0 Firmware V1.=
0.AA Objects: 18
> > [    0.923208] tegra-i2c 7000c000.i2c: starting DMA for length: 16
> > [    0.923217] tegra-i2c 7000c000.i2c: unmasked irq: 0c
> > [    0.923314] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
> > [    0.923323] tegra-i2c 7000c000.i2c: starting DMA for length: 224
> > [    0.923331] tegra-i2c 7000c000.i2c: unmasked irq: 0c
> > [    0.933564] tegra-i2c 7000c000.i2c: transfer complete: 11 0 0
> > [    0.933599] tegra-i2c 7000c000.i2c: starting DMA for length: 16
> > [    0.933609] tegra-i2c 7000c000.i2c: unmasked irq: 0c
> > [    0.933760] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
> > [    0.933770] tegra-i2c 7000c000.i2c: starting DMA for length: 12
> > [    0.933779] tegra-i2c 7000c000.i2c: unmasked irq: 0c
> > [    0.934284] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
> > [    0.934309] tegra-i2c 7000c000.i2c: starting DMA for length: 16
> > [    0.934317] tegra-i2c 7000c000.i2c: unmasked irq: 0c
> > [    0.934500] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
> > [    0.934509] tegra-i2c 7000c000.i2c: starting DMA for length: 12
> > [    0.934518] tegra-i2c 7000c000.i2c: unmasked irq: 0c
> > [    0.935023] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
> > [    0.935081] tegra-i2c 7000c000.i2c: starting DMA for length: 16
> > [    0.935091] tegra-i2c 7000c000.i2c: unmasked irq: 0c
> > [    0.935240] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
> > [    0.935249] tegra-i2c 7000c000.i2c: starting DMA for length: 4
> > [    0.935258] tegra-i2c 7000c000.i2c: unmasked irq: 0c
> > [    0.935399] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
> > [    0.935416] tegra-i2c 7000c000.i2c: starting DMA for length: 16
> > [    0.935424] tegra-i2c 7000c000.i2c: unmasked irq: 0c
> > [    0.935655] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
> > [    0.945445] tegra-i2c 7000d000.i2c: starting DMA for length: 16
> > [    0.945456] tegra-i2c 7000d000.i2c: unmasked irq: 0c
> > [    0.969236] tegra-i2c 7000c000.i2c: starting DMA for length: 16
> > [    0.969245] tegra-i2c 7000c000.i2c: unmasked irq: 0c
> > [    0.969361] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
> > [    0.969370] tegra-i2c 7000c000.i2c: starting DMA for length: 4
> > [    0.969379] tegra-i2c 7000c000.i2c: unmasked irq: 0c
> > [    0.969462] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
> > [    0.982587] tegra-i2c 7000c000.i2c: starting DMA for length: 16
> > [    0.982596] tegra-i2c 7000c000.i2c: unmasked irq: 0c
> > [    0.982722] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
> > [    0.982731] tegra-i2c 7000c000.i2c: starting DMA for length: 12
> > [    0.982740] tegra-i2c 7000c000.i2c: unmasked irq: 0c
> > [    0.983071] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
> > [    0.983090] tegra-i2c 7000c000.i2c: starting DMA for length: 16
> > [    0.983098] tegra-i2c 7000c000.i2c: unmasked irq: 0c
> > [    0.983252] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
> > [    0.983261] tegra-i2c 7000c000.i2c: starting DMA for length: 136
> > [    0.983269] tegra-i2c 7000c000.i2c: unmasked irq: 0c
> > [    0.987605] tegra-i2c 7000c000.i2c: transfer complete: 11 0 0
> > [    0.987623] tegra-i2c 7000c000.i2c: starting DMA for length: 16
> > [    0.987631] tegra-i2c 7000c000.i2c: unmasked irq: 0c
> > [    0.987800] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
> > [    0.987809] tegra-i2c 7000c000.i2c: starting DMA for length: 12
> > [    0.987817] tegra-i2c 7000c000.i2c: unmasked irq: 0c
> > [    0.988324] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
> > [    1.009227] tegra-i2c 7000c000.i2c: starting DMA for length: 16
> > [    1.009236] tegra-i2c 7000c000.i2c: unmasked irq: 0c
> > [    1.009374] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
> > [    1.009383] tegra-i2c 7000c000.i2c: starting DMA for length: 4
> > [    1.009391] tegra-i2c 7000c000.i2c: unmasked irq: 0c
> > [    1.009479] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
> > [    1.009497] atmel_mxt_ts 0-004c: Warning: Info CRC error - device=3D=
0xF436DC file=3D0x000000
> > [    1.009588] tegra-i2c 7000c000.i2c: starting DMA for length: 272
> > [    1.009597] tegra-i2c 7000c000.i2c: unmasked irq: 0c
> > [    1.017483] tegra-i2c 7000c000.i2c: transfer complete: 11 0 0
> > [    1.017496] tegra-i2c 7000c000.i2c: starting DMA for length: 120
> > [    1.017504] tegra-i2c 7000c000.i2c: unmasked irq: 0c
> > [    1.020896] tegra-i2c 7000c000.i2c: transfer complete: 11 0 0
> > [    1.020909] tegra-i2c 7000c000.i2c: starting DMA for length: 16
> > [    1.020918] tegra-i2c 7000c000.i2c: unmasked irq: 0c
> > [    1.021055] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
> > [    1.032230] tegra-i2c 7000c000.i2c: starting DMA for length: 16
> > [    1.032239] tegra-i2c 7000c000.i2c: unmasked irq: 0c
> > [    1.032359] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
> > [    1.032368] tegra-i2c 7000c000.i2c: starting DMA for length: 12
> > [    1.032376] tegra-i2c 7000c000.i2c: unmasked irq: 0c
> > [    1.032704] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
> > [    1.049224] tegra-i2c 7000d000.i2c: i2c transfer timed out
>=20
> That's odd because it suggests that DMA actually completed, but the
> message didn't.
>=20
> I'm not sure I understand how that could happen.
>=20
> What's also weird above is that there doesn't seem to be a DMA that
> is started for that particular message. Or is the timeout message a
> response to the prior transfer (length 10)? Seems like that should
> not be possible because we get the "transfer complete" message.

Wait, those are actually different instances of the I2C controller, so
the relevant log entries are these:

	[    0.945445] tegra-i2c 7000d000.i2c: starting DMA for length: 16
	[    0.945456] tegra-i2c 7000d000.i2c: unmasked irq: 0c
	...
	[    1.049224] tegra-i2c 7000d000.i2c: i2c transfer timed out

And these don't happen if you use higher burst sizes or before the DMA
series?

Thierry

--VSVNCtZB1QZ8vhj+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxa3WYACgkQ3SOs138+
s6F/og//Z+e1KUMDoCy4rlIWrsmZt4ly+W6zsm2LIyuKfUc2cmXtf1J1QbZI/VVA
fZtEmI3Jh3ebPvAK4rsBgcsqXG98KCFbzOxgxYxmzZyWq0F0cPLy+VhUqwGIurY/
/y7TB/x3P6DPtbQrJSX4R+oz+s4sySEctKFmg66sDGDwbYK1IY3OC2aR2r5GM28c
DcxB0rs2a5Bl1HfbxPDZM9/GiC9FNjNtbL+lm7kdCCOsPEuR8X1cLkDGFAcAN4LY
xtXJVA68C2mX0VZjrtkIk+f1v726Y949hwsJyrPjv8Bj++nXSXph0sE481BFholQ
WOSPxd88Dl2bKN+RpEFbLfxCEFZrE0tE7pkLEDi7Y3C4B69D5Nb8n908O6lL846X
kTopJ2JAGtqBZJpZxoT6Wa/6c4x9k3owltZIutG8pnjkTARd6zu6REhKC9rUlPpj
2W2M3pOZuAzmec81e7VDJoWXPVrQ48F9Z90gZt0LS0djPoEPgyHd6WQF4B1Lqy4G
tEGf43TYhYNDhjel67aupR6GB5wZvZjMgvTV+/UWcLP+dyPAi1745Ky7Du7FAiFO
eRMVJfR2aahVPGUOCkzCvh4Qatg9UaJh+NXRxBovC5smrEN7WB5BNf4avXSh9GHw
zgONGDgcq5gH2RSPhKLv8MikVy3Ea8icZjXzQT2Uvh1NGhWArP8=
=z68L
-----END PGP SIGNATURE-----

--VSVNCtZB1QZ8vhj+--
