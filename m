From: Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: fix possible race condition after tx
Date: Thu, 11 Aug 2011 13:25:26 -0700
Message-ID: <CANVmJFmqyBjJvToZXV8wzs6ES9O49M=1ObHNjhp0dVbho8R8EQ@mail.gmail.com>
References: <1313093946-24559-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1313093946-24559-1-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Rakesh Iyer <riyer-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Lucas De Marchi <lucas.demarchi-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Works nice on both real Tegra2 board and Qemu.

On Thu, Aug 11, 2011 at 13:19, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wr=
ote:
> In tegra_i2c_fill_tx_fifo, once we have finished pushing all the byte=
s
> to the I2C hardware controller, the interrupt might happen before we
> have updated i2c_dev->msg_buf_remaining at the end of the function.
> Then, in tegra_i2c_isr, we will call again tegra_i2c_fill_tx_fifo
> triggering weird behaviour. This has been shown to happen under real
> conditions.
>
> Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Tested-by: Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

> ---
> =A0drivers/i2c/busses/i2c-tegra.c | =A0 46 ++++++++++++++++++++++++++=
+------------
> =A01 files changed, 32 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-=
tegra.c
> index 2440b74..9c5fb75 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -270,14 +270,30 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_=
i2c_dev *i2c_dev)
>
> =A0 =A0 =A0 =A0/* Rounds down to not include partial word at the end =
of buf */
> =A0 =A0 =A0 =A0words_to_transfer =3D buf_remaining / BYTES_PER_FIFO_W=
ORD;
> - =A0 =A0 =A0 if (words_to_transfer > tx_fifo_avail)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 words_to_transfer =3D tx_fifo_avail;
>
> - =A0 =A0 =A0 i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfe=
r);
> -
> - =A0 =A0 =A0 buf +=3D words_to_transfer * BYTES_PER_FIFO_WORD;
> - =A0 =A0 =A0 buf_remaining -=3D words_to_transfer * BYTES_PER_FIFO_W=
ORD;
> - =A0 =A0 =A0 tx_fifo_avail -=3D words_to_transfer;
> + =A0 =A0 =A0 /* It's very common to have < 4 bytes, so optimize that=
 case. */
> + =A0 =A0 =A0 if (words_to_transfer) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (words_to_transfer > tx_fifo_avail)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 words_to_transfer =3D t=
x_fifo_avail;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* Update state before writing to FIF=
O. =A0If this casues us
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* to finish writing all bytes (AKA b=
uf_remaining goes to 0) we
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* have a potential for an interrupt =
(PACKET_XFER_COMPLETE is
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* not maskable). =A0We need to make =
sure that the isr sees
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* buf_remaining as 0 and doesn't cal=
l us back re-entrantly.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 buf_remaining -=3D words_to_transfer * =
BYTES_PER_FIFO_WORD;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tx_fifo_avail -=3D words_to_transfer;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c_dev->msg_buf_remaining =3D buf_rema=
ining;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c_dev->msg_buf =3D buf +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 words_to_transfer * BYT=
ES_PER_FIFO_WORD;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 barrier();
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, =
words_to_transfer);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 buf +=3D words_to_transfer * BYTES_PER_=
=46IFO_WORD;
> + =A0 =A0 =A0 }
>
> =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 * If there is a partial word at the end of buf, handl=
e it manually to
> @@ -287,14 +303,15 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_=
i2c_dev *i2c_dev)
> =A0 =A0 =A0 =A0if (tx_fifo_avail > 0 && buf_remaining > 0) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0BUG_ON(buf_remaining > 3);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0memcpy(&val, buf, buf_remaining);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Again update before writing to FIFO =
to make sure isr sees. */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c_dev->msg_buf_remaining =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c_dev->msg_buf =3D NULL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 barrier();
> +
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0i2c_writel(i2c_dev, val, I2C_TX_FIFO);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 buf_remaining =3D 0;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 tx_fifo_avail--;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 BUG_ON(tx_fifo_avail > 0 && buf_remaining > 0);
> - =A0 =A0 =A0 i2c_dev->msg_buf_remaining =3D buf_remaining;
> - =A0 =A0 =A0 i2c_dev->msg_buf =3D buf;
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> @@ -411,9 +428,10 @@ static irqreturn_t tegra_i2c_isr(int irq, void *=
dev_id)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0tegra_i2c_mask_irq(i2c=
_dev, I2C_INT_TX_FIFO_DATA_REQ);
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 if ((status & I2C_INT_PACKET_XFER_COMPLETE) &&
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 !i2c_dev->msg_buf_remai=
ning)
> + =A0 =A0 =A0 if (status & I2C_INT_PACKET_XFER_COMPLETE) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 BUG_ON(i2c_dev->msg_buf_remaining);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0complete(&i2c_dev->msg_complete);
> + =A0 =A0 =A0 }
>
> =A0 =A0 =A0 =A0i2c_writel(i2c_dev, status, I2C_INT_STATUS);
> =A0 =A0 =A0 =A0if (i2c_dev->is_dvc)
> --
> 1.7.3.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra=
" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
