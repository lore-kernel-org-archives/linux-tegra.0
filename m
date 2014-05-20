From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/7] mfd: cros_ec: spi: Make the cros_ec_spi timeout
 more reliable
Date: Tue, 20 May 2014 09:45:03 +0100
Message-ID: <20140520084503.GD24991@lee--X1>
References: <1398879850-9111-1-git-send-email-dianders@chromium.org>
 <1398879850-9111-4-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1398879850-9111-4-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, 30 Apr 2014, Doug Anderson wrote:

> The cros_ec_spi transfer had two problems with its timeout code:
>=20
> 1. It looked at the timeout even in the case that it found valid data=
=2E
> 2. If the cros_ec_spi code got switched out for a while, it's possibl=
e
>    it could get a timeout after a single loop.  Let's be paranoid and
>    make sure we do one last transfer after the timeout expires.
>=20
> Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Tested-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v3: None
> Changes in v2: None
>=20
>  drivers/mfd/cros_ec_spi.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)

Applied, thanks.

> diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
> index a2a605d..4f863c3 100644
> --- a/drivers/mfd/cros_ec_spi.c
> +++ b/drivers/mfd/cros_ec_spi.c
> @@ -113,7 +113,9 @@ static int cros_ec_spi_receive_response(struct cr=
os_ec_device *ec_dev,
> =20
>  	/* Receive data until we see the header byte */
>  	deadline =3D jiffies + msecs_to_jiffies(EC_MSG_DEADLINE_MS);
> -	do {
> +	while (true) {
> +		unsigned long start_jiffies =3D jiffies;
> +
>  		memset(&trans, 0, sizeof(trans));
>  		trans.cs_change =3D 1;
>  		trans.rx_buf =3D ptr =3D ec_dev->din;
> @@ -134,12 +136,19 @@ static int cros_ec_spi_receive_response(struct =
cros_ec_device *ec_dev,
>  				break;
>  			}
>  		}
> +		if (ptr !=3D end)
> +			break;
> =20
> -		if (time_after(jiffies, deadline)) {
> +		/*
> +		 * Use the time at the start of the loop as a timeout.  This
> +		 * gives us one last shot at getting the transfer and is useful
> +		 * in case we got context switched out for a while.
> +		 */
> +		if (time_after(start_jiffies, deadline)) {
>  			dev_warn(ec_dev->dev, "EC failed to respond in time\n");
>  			return -ETIMEDOUT;
>  		}
> -	} while (ptr =3D=3D end);
> +	}
> =20
>  	/*
>  	 * ptr now points to the header byte. Copy any valid data to the

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
