From: Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] i2c: i2c-tegra: fix possible race condition after tx
Date: Thu, 21 Jul 2011 17:06:08 -0700
Message-ID: <CANVmJFmsHc20=OfENikX-XJw8bRtDfAD6prXQTgphLzC1XA=hQ@mail.gmail.com>
References: <1303251276-18768-1-git-send-email-vpalatin@chromium.org>
 <BANLkTikeTQi6zz+yb4USWwaROFZJW2cfog@mail.gmail.com> <74CDBE0F657A3D45AFBB94109FB122FF0498E1C887@HQMAIL01.nvidia.com>
 <BANLkTin_ypRamBbdmE1unWyovVc-h_nSa5jDkNkfc2S+n4fwdg@mail.gmail.com> <74CDBE0F657A3D45AFBB94109FB122FF0498E1C896@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF0498E1C896-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Cc: Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Ben,

can this fix for tegra I2C go in 3.1 ?
It has approved and tested by Stephen.

Thanks,
--=20
Vincent

On Fri, Jun 3, 2011 at 15:33, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote=
:
> Vincent Palatin wrote at Friday, June 03, 2011 4:19 PM:
>> On Fri, Jun 3, 2011 at 18:01, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
>> >Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> >
>> > (using code based on 3.0-rc1, on Harmony, ran "speaker-test -c 2",=
 and
>> > then adjusted the volume a lot using alsamixer, thus causing quite=
 a few
>> > I2C transactions)
>>
>> Thanks for the testing and the review !
>>
>> >> > @@ -213,38 +213,41 @@ static int tegra_i2c_empty_rx_fifo(struct
>> tegra_i2c_dev *i2c_dev)
>> >> > =E1 =E1 =E1 =E1u32 val;
>> >> > =E1 =E1 =E1 =E1int rx_fifo_avail;
>> >> > =E1 =E1 =E1 =E1u8 *buf =3D i2c_dev->msg_buf;
>> >> > - =E1 =E1 =E1 size_t buf_remaining =3D i2c_dev->msg_buf_remaini=
ng;
>> >
>> > The old code read msg_buf_remaining once up front and did everythi=
ng
>> > based on that.
>> >
>> >> > =E1 =E1 =E1 =E1int words_to_transfer;
>> >> > + =E1 =E1 =E1 int bytes_to_transfer;
>> >> >
>> >> > =E1 =E1 =E1 =E1val =3D i2c_readl(i2c_dev, I2C_FIFO_STATUS);
>> >> > =E1 =E1 =E1 =E1rx_fifo_avail =3D (val & I2C_FIFO_STATUS_RX_MASK=
) >>
>> >> > =E1 =E1 =E1 =E1 =E1 =E1 =E1 =E1I2C_FIFO_STATUS_RX_SHIFT;
>> >> >
>> >> > =E1 =E1 =E1 =E1/* Rounds down to not include partial word at th=
e end of buf
>> */
>> >> > - =E1 =E1 =E1 words_to_transfer =3D buf_remaining / BYTES_PER_F=
IFO_WORD;
>> >> > + =E1 =E1 =E1 words_to_transfer =3D atomic_read(&i2c_dev->msg_b=
uf_remaining)
>> /
>> >> > + =E1 =E1 =E1 =E1 =E1 =E1 =E1 BYTES_PER_FIFO_WORD;
>> >
>> > Whereas the new code reads msg_buf_remaining once here...
>> >
>> >> > =E1 =E1 =E1 =E1if (words_to_transfer > rx_fifo_avail)
>> >> > =E1 =E1 =E1 =E1 =E1 =E1 =E1 =E1words_to_transfer =3D rx_fifo_av=
ail;
>> >> >
>> >> > + =E1 =E1 =E1 atomic_sub(words_to_transfer * BYTES_PER_FIFO_WOR=
D,
>> >> > + =E1 =E1 =E1 =E1 =E1 =E1 =E1 &i2c_dev->msg_buf_remaining);
>> >> > =E1 =E1 =E1 =E1i2c_readsl(i2c_dev, buf, I2C_RX_FIFO, words_to_t=
ransfer);
>> >> >
>> >> > =E1 =E1 =E1 =E1buf +=3D words_to_transfer * BYTES_PER_FIFO_WORD=
;
>> >> > - =E1 =E1 =E1 buf_remaining -=3D words_to_transfer * BYTES_PER_=
=46IFO_WORD;
>> >> > =E1 =E1 =E1 =E1rx_fifo_avail -=3D words_to_transfer;
>> >> >
>> >> > =E1 =E1 =E1 =E1/*
>> >> > =E1 =E1 =E1 =E1 * If there is a partial word at the end of buf,=
 handle it manually to
>> >> > =E1 =E1 =E1 =E1 * prevent overwriting past the end of buf
>> >> > =E1 =E1 =E1 =E1 */
>> >> > - =E1 =E1 =E1 if (rx_fifo_avail > 0 && buf_remaining > 0) {
>> >> > - =E1 =E1 =E1 =E1 =E1 =E1 =E1 BUG_ON(buf_remaining > 3);
>> >> > + =E1 =E1 =E1 bytes_to_transfer =3D atomic_read(&i2c_dev->msg_b=
uf_remaining);
>> >
>> > And again here...
>> >
>> >> > + =E1 =E1 =E1 if (rx_fifo_avail > 0 && bytes_to_transfer > 0) {
>> >> > + =E1 =E1 =E1 =E1 =E1 =E1 =E1 BUG_ON(bytes_to_transfer > 3);
>> >
>> > That means that if msg_buf_remaining increases between those two r=
eads,
>> > this BUG_ON could trigger.
>> >
>> > I assume this isn't possible, because the I2C core only sends one
>> > transaction to the I2C driver and doesn't send any more requests d=
own
>> > until the previous is complete. If so, then the new code seems fin=
e, but
>> > I did want to double-check this.
>>
>> The transfers are serialized in the i2c_transfer function of the cor=
e
>> (which calls the tegra_i2c_xfer callback) and msg_buf_remaining can
>> only increase when it is set at the beginning of tegra_i2c_xfer_msg.
>> So yes we have at most one transaction and I don't think we can
>> trigger this BUG_ON.
>
> Great, that's what I figured. So, the change looks good to me, so
>
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> too!
>
> --
> nvpublic
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra=
" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
