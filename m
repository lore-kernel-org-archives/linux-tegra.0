From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 1/7] mfd: cros_ec: spi: calculate delay between
 transfers correctly
Date: Tue, 20 May 2014 09:43:58 +0100
Message-ID: <20140520084358.GB24991@lee--X1>
References: <1398879850-9111-1-git-send-email-dianders@chromium.org>
 <1398879850-9111-2-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1398879850-9111-2-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: swarren@nvidia.com, wsa@the-dreams.de, abrestic@chromium.org, dgreid@chromium.org, olof@lixom.net, sjg@chromium.org, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, David Hendricks <dhendrix@chromium.org>, sameo@linux.intel.com, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

> From: David Hendricks <dhendrix@chromium.org>
>=20
> To avoid spamming the EC we calculate the time between the previous
> transfer and the current transfer and force a delay if the time delta
> is too small.
>=20
> However, a small miscalculation causes the delay period to be
> far too short. Most noticably this impacts commands with a long
> turnaround time such as EC firmware reads and writes.
>=20
> Signed-off-by: David Hendricks <dhendrix@chromium.org>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Tested-by: Andrew Bresticker <abrestic@chromium.org>
> Tested-by: Stephen Warren <swarren@nvidia.com>
> ---
> Changes in v3: None
> Changes in v2: None
>=20
>  drivers/mfd/cros_ec_spi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

> diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
> index 84af8d7..c185eb6 100644
> --- a/drivers/mfd/cros_ec_spi.c
> +++ b/drivers/mfd/cros_ec_spi.c
> @@ -219,7 +219,7 @@ static int cros_ec_command_spi_xfer(struct cros_e=
c_device *ec_dev,
>  		ktime_get_ts(&ts);
>  		delay =3D timespec_to_ns(&ts) - ec_spi->last_transfer_ns;
>  		if (delay < EC_SPI_RECOVERY_TIME_NS)
> -			ndelay(delay);
> +			ndelay(EC_SPI_RECOVERY_TIME_NS - delay);
>  	}
> =20
>  	/* Transmit phase - send our message */

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
