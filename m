From: Shubhrajyoti Datta <omaplinuxkernel@gmail.com>
Subject: Re: [PATCH v2] i2c: tegra: Add delay before reset the controller
Date: Fri, 10 Feb 2012 15:05:07 +0530
Message-ID: <CAM=Q2cs+myCvph7OXvCDTG7y48oNTfRtjsDzQaKiEXzjdu3pzA@mail.gmail.com>
References: <1324898081-10308-1-git-send-email-alokc@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1324898081-10308-1-git-send-email-alokc@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alok Chauhan <alokc@nvidia.com>
Cc: khali@linux-fr.org, ben-linux@fluff.org, swarren@nvidia.com, olof@lixom.net, bones@secretlab.ca, paul.gortmaker@windriver.com, dgreid@google.com, ldewangan@nvidia.com, linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello Alok,

On Mon, Dec 26, 2011 at 4:44 PM, Alok Chauhan <alokc@nvidia.com> wrote:
> From: Alok Chauhan <alokc@nvidia.com>
>
> In NACK error condition, I2C controller violates
> clock-to-data setup time before stop. In Software,
> because of this reset of controller is happening
> before I2C controller could complete STOP condition.
>
> Added delay of 2 clock period before reset the
> controller in case of NACK error.
>
> Signed-off-by: Alok Chauhan <alokc@nvidia.com>
> ---
> Instead of setting constant value for delay as was in previous patch,=
 now in
> the current modification delay will be calculated based on clock freq=
uency of the bus.
> =A0drivers/i2c/busses/i2c-tegra.c | =A0 =A08 ++++++++
> =A01 files changed, 8 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-=
tegra.c
> index 6381604..62e197c 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -517,6 +517,14 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_d=
ev *i2c_dev,
> =A0 =A0 =A0 =A0if (likely(i2c_dev->msg_err =3D=3D I2C_ERR_NONE))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
>
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* In NACK error condition resetting of I2C controlle=
r happens
> + =A0 =A0 =A0 =A0* before STOP condition is properly completed by I2C=
 controller,
> + =A0 =A0 =A0 =A0* so wait for 2 clock cycle to complete STOP conditi=
on.
> + =A0 =A0 =A0 =A0*/

Why do you need to reset the controller in case of a NACK.
> + =A0 =A0 =A0 if (i2c_dev->msg_err =3D=3D I2C_ERR_NO_ACK)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 udelay(DIV_ROUND_UP(2 * 1000000, i2c_de=
v->bus_clk_rate));
> +
> =A0 =A0 =A0 =A0tegra_i2c_init(i2c_dev);
> =A0 =A0 =A0 =A0if (i2c_dev->msg_err =3D=3D I2C_ERR_NO_ACK) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (msg->flags & I2C_M_IGNORE_NAK)
> --
> 1.7.4.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-i2c" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
