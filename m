From: Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] i2c: i2c-tegra: fix possible race condition after tx
Date: Thu, 2 Jun 2011 09:32:03 -0400
Message-ID: <BANLkTikeTQi6zz+yb4USWwaROFZJW2cfog@mail.gmail.com>
References: <1303251276-18768-1-git-send-email-vpalatin@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1303251276-18768-1-git-send-email-vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Olof Johansson <olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Anyone has a comment on that patch ?
The I2C driver has been reworked but this issue seems to still exist

--=20
Vincent

On Tue, Apr 19, 2011 at 18:14, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> =
wrote:
> In tegra_i2c_fill_tx_fifo, once we have finished pushing all the byte=
s
> to the I2C hardware controller, the interrupt might happen before we
> have updated i2c_dev->msg_buf_remaining at the end of the function.
> Then, in tegra_i2c_isr, we will call again tegra_i2c_fill_tx_fifo
> triggering weird behaviour.
> Of course, this is unlikely since the I2C bus is slow and thus the IS=
R
> is called several hundreds of microseconds after the last register
> write.
>
> Signed-off-by: Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> =A0drivers/i2c/busses/i2c-tegra.c | =A0 54 ++++++++++++++++++++++----=
-------------
> =A01 files changed, 30 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-=
tegra.c
> index b4ab39b..c1b119b 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -125,7 +125,7 @@ struct tegra_i2c_dev {
> =A0 =A0 =A0 =A0struct completion msg_complete;
> =A0 =A0 =A0 =A0int msg_err;
> =A0 =A0 =A0 =A0u8 *msg_buf;
> - =A0 =A0 =A0 size_t msg_buf_remaining;
> + =A0 =A0 =A0 atomic_t msg_buf_remaining;
> =A0 =A0 =A0 =A0int msg_read;
> =A0 =A0 =A0 =A0unsigned long bus_clk_rate;
> =A0 =A0 =A0 =A0bool is_suspended;
> @@ -213,38 +213,41 @@ static int tegra_i2c_empty_rx_fifo(struct tegra=
_i2c_dev *i2c_dev)
> =A0 =A0 =A0 =A0u32 val;
> =A0 =A0 =A0 =A0int rx_fifo_avail;
> =A0 =A0 =A0 =A0u8 *buf =3D i2c_dev->msg_buf;
> - =A0 =A0 =A0 size_t buf_remaining =3D i2c_dev->msg_buf_remaining;
> =A0 =A0 =A0 =A0int words_to_transfer;
> + =A0 =A0 =A0 int bytes_to_transfer;
>
> =A0 =A0 =A0 =A0val =3D i2c_readl(i2c_dev, I2C_FIFO_STATUS);
> =A0 =A0 =A0 =A0rx_fifo_avail =3D (val & I2C_FIFO_STATUS_RX_MASK) >>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0I2C_FIFO_STATUS_RX_SHIFT;
>
> =A0 =A0 =A0 =A0/* Rounds down to not include partial word at the end =
of buf */
> - =A0 =A0 =A0 words_to_transfer =3D buf_remaining / BYTES_PER_FIFO_WO=
RD;
> + =A0 =A0 =A0 words_to_transfer =3D atomic_read(&i2c_dev->msg_buf_rem=
aining) /
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 BYTES_PER_FIFO_WORD;
> =A0 =A0 =A0 =A0if (words_to_transfer > rx_fifo_avail)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0words_to_transfer =3D rx_fifo_avail;
>
> + =A0 =A0 =A0 atomic_sub(words_to_transfer * BYTES_PER_FIFO_WORD,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 &i2c_dev->msg_buf_remaining);
> =A0 =A0 =A0 =A0i2c_readsl(i2c_dev, buf, I2C_RX_FIFO, words_to_transfe=
r);
>
> =A0 =A0 =A0 =A0buf +=3D words_to_transfer * BYTES_PER_FIFO_WORD;
> - =A0 =A0 =A0 buf_remaining -=3D words_to_transfer * BYTES_PER_FIFO_W=
ORD;
> =A0 =A0 =A0 =A0rx_fifo_avail -=3D words_to_transfer;
>
> =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 * If there is a partial word at the end of buf, handl=
e it manually to
> =A0 =A0 =A0 =A0 * prevent overwriting past the end of buf
> =A0 =A0 =A0 =A0 */
> - =A0 =A0 =A0 if (rx_fifo_avail > 0 && buf_remaining > 0) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 BUG_ON(buf_remaining > 3);
> + =A0 =A0 =A0 bytes_to_transfer =3D atomic_read(&i2c_dev->msg_buf_rem=
aining);
> + =A0 =A0 =A0 if (rx_fifo_avail > 0 && bytes_to_transfer > 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 BUG_ON(bytes_to_transfer > 3);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 atomic_set(&i2c_dev->msg_buf_remaining,=
 0);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0val =3D i2c_readl(i2c_dev, I2C_RX_FIFO=
);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 memcpy(buf, &val, buf_remaining);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 buf_remaining =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 memcpy(buf, &val, bytes_to_transfer);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rx_fifo_avail--;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
> - =A0 =A0 =A0 i2c_dev->msg_buf_remaining =3D buf_remaining;
> + =A0 =A0 =A0 BUG_ON(rx_fifo_avail > 0 &&
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 atomic_read(&i2c_dev->msg_buf_remaining=
) > 0);
> =A0 =A0 =A0 =A0i2c_dev->msg_buf =3D buf;
> =A0 =A0 =A0 =A0return 0;
> =A0}
> @@ -254,22 +257,24 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_=
i2c_dev *i2c_dev)
> =A0 =A0 =A0 =A0u32 val;
> =A0 =A0 =A0 =A0int tx_fifo_avail;
> =A0 =A0 =A0 =A0u8 *buf =3D i2c_dev->msg_buf;
> - =A0 =A0 =A0 size_t buf_remaining =3D i2c_dev->msg_buf_remaining;
> =A0 =A0 =A0 =A0int words_to_transfer;
> + =A0 =A0 =A0 int bytes_to_transfer;
>
> =A0 =A0 =A0 =A0val =3D i2c_readl(i2c_dev, I2C_FIFO_STATUS);
> =A0 =A0 =A0 =A0tx_fifo_avail =3D (val & I2C_FIFO_STATUS_TX_MASK) >>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0I2C_FIFO_STATUS_TX_SHIFT;
>
> =A0 =A0 =A0 =A0/* Rounds down to not include partial word at the end =
of buf */
> - =A0 =A0 =A0 words_to_transfer =3D buf_remaining / BYTES_PER_FIFO_WO=
RD;
> + =A0 =A0 =A0 words_to_transfer =3D atomic_read(&i2c_dev->msg_buf_rem=
aining) /
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 BYTES_PER_FIFO_WORD;
> =A0 =A0 =A0 =A0if (words_to_transfer > tx_fifo_avail)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0words_to_transfer =3D tx_fifo_avail;
>
> + =A0 =A0 =A0 atomic_sub(words_to_transfer * BYTES_PER_FIFO_WORD,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 &i2c_dev->msg_buf_remaining);
> =A0 =A0 =A0 =A0i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transf=
er);
>
> =A0 =A0 =A0 =A0buf +=3D words_to_transfer * BYTES_PER_FIFO_WORD;
> - =A0 =A0 =A0 buf_remaining -=3D words_to_transfer * BYTES_PER_FIFO_W=
ORD;
> =A0 =A0 =A0 =A0tx_fifo_avail -=3D words_to_transfer;
>
> =A0 =A0 =A0 =A0/*
> @@ -277,16 +282,17 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_=
i2c_dev *i2c_dev)
> =A0 =A0 =A0 =A0 * prevent reading past the end of buf, which could cr=
oss a page
> =A0 =A0 =A0 =A0 * boundary and fault.
> =A0 =A0 =A0 =A0 */
> - =A0 =A0 =A0 if (tx_fifo_avail > 0 && buf_remaining > 0) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 BUG_ON(buf_remaining > 3);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 memcpy(&val, buf, buf_remaining);
> + =A0 =A0 =A0 bytes_to_transfer =3D atomic_read(&i2c_dev->msg_buf_rem=
aining);
> + =A0 =A0 =A0 if (tx_fifo_avail > 0 && bytes_to_transfer > 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 BUG_ON(bytes_to_transfer > 3);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 memcpy(&val, buf, bytes_to_transfer);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 atomic_set(&i2c_dev->msg_buf_remaining,=
 0);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0i2c_writel(i2c_dev, val, I2C_TX_FIFO);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 buf_remaining =3D 0;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0tx_fifo_avail--;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 BUG_ON(tx_fifo_avail > 0 && buf_remaining > 0);
> - =A0 =A0 =A0 i2c_dev->msg_buf_remaining =3D buf_remaining;
> + =A0 =A0 =A0 BUG_ON(tx_fifo_avail > 0 &&
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 atomic_read(&i2c_dev->msg_buf_remaining=
) > 0);
> =A0 =A0 =A0 =A0i2c_dev->msg_buf =3D buf;
> =A0 =A0 =A0 =A0return 0;
> =A0}
> @@ -364,21 +370,21 @@ static irqreturn_t tegra_i2c_isr(int irq, void =
*dev_id)
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0if (i2c_dev->msg_read && (status & I2C_INT_RX_FIFO_DAT=
A_REQ)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (i2c_dev->msg_buf_remaining)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (atomic_read(&i2c_dev->msg_buf_remai=
ning))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0tegra_i2c_empty_rx_fif=
o(i2c_dev);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0BUG();
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0if (!i2c_dev->msg_read && (status & I2C_INT_TX_FIFO_DA=
TA_REQ)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (i2c_dev->msg_buf_remaining)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (atomic_read(&i2c_dev->msg_buf_remai=
ning))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0tegra_i2c_fill_tx_fifo=
(i2c_dev);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0tegra_i2c_mask_irq(i2c=
_dev, I2C_INT_TX_FIFO_DATA_REQ);
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0if ((status & I2C_INT_PACKET_XFER_COMPLETE) &&
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 !i2c_dev->msg_buf_remai=
ning)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 !atomic_read(&i2c_dev->=
msg_buf_remaining))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0complete(&i2c_dev->msg_complete);
>
> =A0 =A0 =A0 =A0i2c_writel(i2c_dev, status, I2C_INT_STATUS);
> @@ -408,7 +414,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_de=
v *i2c_dev,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
>
> =A0 =A0 =A0 =A0i2c_dev->msg_buf =3D msg->buf;
> - =A0 =A0 =A0 i2c_dev->msg_buf_remaining =3D msg->len;
> + =A0 =A0 =A0 atomic_set(&i2c_dev->msg_buf_remaining, msg->len);
> =A0 =A0 =A0 =A0i2c_dev->msg_err =3D I2C_ERR_NONE;
> =A0 =A0 =A0 =A0i2c_dev->msg_read =3D (msg->flags & I2C_M_RD);
> =A0 =A0 =A0 =A0INIT_COMPLETION(i2c_dev->msg_complete);
> @@ -440,7 +446,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_de=
v *i2c_dev,
> =A0 =A0 =A0 =A0int_mask =3D I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST=
;
> =A0 =A0 =A0 =A0if (msg->flags & I2C_M_RD)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int_mask |=3D I2C_INT_RX_FIFO_DATA_REQ=
;
> - =A0 =A0 =A0 else if (i2c_dev->msg_buf_remaining)
> + =A0 =A0 =A0 else if (atomic_read(&i2c_dev->msg_buf_remaining))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int_mask |=3D I2C_INT_TX_FIFO_DATA_REQ=
;
> =A0 =A0 =A0 =A0tegra_i2c_unmask_irq(i2c_dev, int_mask);
> =A0 =A0 =A0 =A0dev_dbg(i2c_dev->dev, "unmasked irq: %02x\n",
> --
> 1.7.3.1
