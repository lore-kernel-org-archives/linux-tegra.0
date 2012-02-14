From: Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2] i2c: tegra: Add delay before reset the controller
Date: Tue, 14 Feb 2012 11:19:48 +0530
Message-ID: <7A0BFCFE3DA5CD47B0FB7984326F201A13689D386F@BGMAIL01.nvidia.com>
References: <1324898081-10308-1-git-send-email-alokc@nvidia.com>
 <CAM=Q2cs+myCvph7OXvCDTG7y48oNTfRtjsDzQaKiEXzjdu3pzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAM=Q2cs+myCvph7OXvCDTG7y48oNTfRtjsDzQaKiEXzjdu3pzA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shubhrajyoti Datta <omaplinuxkernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org" <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, "dgreid-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <dgreid-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Shubhrajyot,

On Mon, Dec 26, 2011 at 4:44 PM, Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> From: Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> In NACK error condition, I2C controller violates clock-to-data setup=20
> time before stop. In Software, because of this reset of controller is=
=20
> happening before I2C controller could complete STOP condition.
>
> Added delay of 2 clock period before reset the controller in case of=20
> NACK error.
>
> Signed-off-by: Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Instead of setting constant value for delay as was in previous patch,=
=20
> now in the current modification delay will be calculated based on clo=
ck frequency of the bus.
> =A0drivers/i2c/busses/i2c-tegra.c | =A0 =A08 ++++++++
> =A01 files changed, 8 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-tegra.c=20
> b/drivers/i2c/busses/i2c-tegra.c index 6381604..62e197c 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -517,6 +517,14 @@ static int tegra_i2c_xfer_msg(struct=20
> tegra_i2c_dev *i2c_dev,
> =A0 =A0 =A0 =A0if (likely(i2c_dev->msg_err =3D=3D I2C_ERR_NONE))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
>
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* In NACK error condition resetting of I2C controlle=
r happens
> + =A0 =A0 =A0 =A0* before STOP condition is properly completed by I2C=
=20
> + controller,
> + =A0 =A0 =A0 =A0* so wait for 2 clock cycle to complete STOP conditi=
on.
> + =A0 =A0 =A0 =A0*/

>>>>Why do you need to reset the controller in case of a NACK.
This is required because of hardware limitations. Without reset we can'=
t flus the internal hardware registers.


> + =A0 =A0 =A0 if (i2c_dev->msg_err =3D=3D I2C_ERR_NO_ACK)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 udelay(DIV_ROUND_UP(2 * 1000000,=20
> + i2c_dev->bus_clk_rate));
> +
> =A0 =A0 =A0 =A0tegra_i2c_init(i2c_dev);
> =A0 =A0 =A0 =A0if (i2c_dev->msg_err =3D=3D I2C_ERR_NO_ACK) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (msg->flags & I2C_M_IGNORE_NAK)
> --
> 1.7.4.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-i2c"=20
> in the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org More majordomo=20
> info at =A0http://vger.kernel.org/majordomo-info.html
