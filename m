From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] i2c: i2c-tegra: fix possible race condition after tx
Date: Fri, 3 Jun 2011 15:01:49 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF0498E1C887@HQMAIL01.nvidia.com>
References: <1303251276-18768-1-git-send-email-vpalatin@chromium.org>
 <BANLkTikeTQi6zz+yb4USWwaROFZJW2cfog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BANLkTikeTQi6zz+yb4USWwaROFZJW2cfog-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Olof Johansson <olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Vincent Palatin wrote at Thursday, June 02, 2011 7:32 AM:
> Anyone has a comment on that patch ?
> The I2C driver has been reworked but this issue seems to still exist

Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

(using code based on 3.0-rc1, on Harmony, ran "speaker-test -c 2", and
then adjusted the volume a lot using alsamixer, thus causing quite a fe=
w
I2C transactions)

One question inline below though.

> On Tue, Apr 19, 2011 at 18:14, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org=
> wrote:
> > In tegra_i2c_fill_tx_fifo, once we have finished pushing all the by=
tes
> > to the I2C hardware controller, the interrupt might happen before w=
e
> > have updated i2c_dev->msg_buf_remaining at the end of the function.
> > Then, in tegra_i2c_isr, we will call again tegra_i2c_fill_tx_fifo
> > triggering weird behaviour.
> > Of course, this is unlikely since the I2C bus is slow and thus the =
ISR
> > is called several hundreds of microseconds after the last register
> > write.
> >
> > Signed-off-by: Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > ---
> > =A0drivers/i2c/busses/i2c-tegra.c | =A0 54 ++++++++++++++++++++++--=
---------------
> > =A01 files changed, 30 insertions(+), 24 deletions(-)
=2E..
> > @@ -213,38 +213,41 @@ static int tegra_i2c_empty_rx_fifo(struct teg=
ra_i2c_dev *i2c_dev)
> > =A0 =A0 =A0 =A0u32 val;
> > =A0 =A0 =A0 =A0int rx_fifo_avail;
> > =A0 =A0 =A0 =A0u8 *buf =3D i2c_dev->msg_buf;
> > - =A0 =A0 =A0 size_t buf_remaining =3D i2c_dev->msg_buf_remaining;

The old code read msg_buf_remaining once up front and did everything
based on that.

> > =A0 =A0 =A0 =A0int words_to_transfer;
> > + =A0 =A0 =A0 int bytes_to_transfer;
> >
> > =A0 =A0 =A0 =A0val =3D i2c_readl(i2c_dev, I2C_FIFO_STATUS);
> > =A0 =A0 =A0 =A0rx_fifo_avail =3D (val & I2C_FIFO_STATUS_RX_MASK) >>
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0I2C_FIFO_STATUS_RX_SHIFT;
> >
> > =A0 =A0 =A0 =A0/* Rounds down to not include partial word at the en=
d of buf */
> > - =A0 =A0 =A0 words_to_transfer =3D buf_remaining / BYTES_PER_FIFO_=
WORD;
> > + =A0 =A0 =A0 words_to_transfer =3D atomic_read(&i2c_dev->msg_buf_r=
emaining) /
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 BYTES_PER_FIFO_WORD;

Whereas the new code reads msg_buf_remaining once here...

> > =A0 =A0 =A0 =A0if (words_to_transfer > rx_fifo_avail)
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0words_to_transfer =3D rx_fifo_avail;
> >
> > + =A0 =A0 =A0 atomic_sub(words_to_transfer * BYTES_PER_FIFO_WORD,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 &i2c_dev->msg_buf_remaining);
> > =A0 =A0 =A0 =A0i2c_readsl(i2c_dev, buf, I2C_RX_FIFO, words_to_trans=
fer);
> >
> > =A0 =A0 =A0 =A0buf +=3D words_to_transfer * BYTES_PER_FIFO_WORD;
> > - =A0 =A0 =A0 buf_remaining -=3D words_to_transfer * BYTES_PER_FIFO=
_WORD;
> > =A0 =A0 =A0 =A0rx_fifo_avail -=3D words_to_transfer;
> >
> > =A0 =A0 =A0 =A0/*
> > =A0 =A0 =A0 =A0 * If there is a partial word at the end of buf, han=
dle it manually to
> > =A0 =A0 =A0 =A0 * prevent overwriting past the end of buf
> > =A0 =A0 =A0 =A0 */
> > - =A0 =A0 =A0 if (rx_fifo_avail > 0 && buf_remaining > 0) {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 BUG_ON(buf_remaining > 3);
> > + =A0 =A0 =A0 bytes_to_transfer =3D atomic_read(&i2c_dev->msg_buf_r=
emaining);

And again here...

> > + =A0 =A0 =A0 if (rx_fifo_avail > 0 && bytes_to_transfer > 0) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 BUG_ON(bytes_to_transfer > 3);

That means that if msg_buf_remaining increases between those two reads,
this BUG_ON could trigger.

I assume this isn't possible, because the I2C core only sends one
transaction to the I2C driver and doesn't send any more requests down
until the previous is complete. If so, then the new code seems fine, bu=
t
I did want to double-check this.

Thanks.

> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 atomic_set(&i2c_dev->msg_buf_remainin=
g, 0);
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0val =3D i2c_readl(i2c_dev, I2C_RX_FI=
=46O);
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 memcpy(buf, &val, buf_remaining);
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 buf_remaining =3D 0;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 memcpy(buf, &val, bytes_to_transfer);
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rx_fifo_avail--;
> > =A0 =A0 =A0 =A0}
> >
> > - =A0 =A0 =A0 BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
> > - =A0 =A0 =A0 i2c_dev->msg_buf_remaining =3D buf_remaining;
> > + =A0 =A0 =A0 BUG_ON(rx_fifo_avail > 0 &&
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 atomic_read(&i2c_dev->msg_buf_remaini=
ng) > 0);
> > =A0 =A0 =A0 =A0i2c_dev->msg_buf =3D buf;
> > =A0 =A0 =A0 =A0return 0;
> > =A0}

--=20
nvpublic
