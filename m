From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 2/7] mfd: cros_ec: spi: Add mutex to cros_ec_spi
Date: Tue, 20 May 2014 09:44:29 +0100
Message-ID: <20140520084429.GC24991@lee--X1>
References: <1398879850-9111-1-git-send-email-dianders@chromium.org>
 <1398879850-9111-3-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1398879850-9111-3-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: swarren@nvidia.com, wsa@the-dreams.de, abrestic@chromium.org, dgreid@chromium.org, olof@lixom.net, sjg@chromium.org, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, sameo@linux.intel.com, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, 30 Apr 2014, Doug Anderson wrote:

> The main transfer function for cros_ec_spi can be called by more than
> one client at a time.  Make sure that those clients don't stomp on
> each other by locking the bus for the duration of the transfer
> function.
>=20
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Tested-by: Andrew Bresticker <abrestic@chromium.org>
> Tested-by: Stephen Warren <swarren@nvidia.com>
> ---
> Changes in v3: None
> Changes in v2: None
>=20
>  drivers/mfd/cros_ec_spi.c | 26 +++++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)

Applied, thanks.
=20
> diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
> index c185eb6..a2a605d 100644
> --- a/drivers/mfd/cros_ec_spi.c
> +++ b/drivers/mfd/cros_ec_spi.c
> @@ -65,11 +65,13 @@
>   *	if no record
>   * @end_of_msg_delay: used to set the delay_usecs on the spi_transfe=
r that
>   *      is sent when we want to turn off CS at the end of a transact=
ion.
> + * @lock: mutex to ensure only one user of cros_ec_command_spi_xfer =
at a time
>   */
>  struct cros_ec_spi {
>  	struct spi_device *spi;
>  	s64 last_transfer_ns;
>  	unsigned int end_of_msg_delay;
> +	struct mutex lock;
>  };
> =20
>  static void debug_packet(struct device *dev, const char *name, u8 *p=
tr,
> @@ -208,6 +210,13 @@ static int cros_ec_command_spi_xfer(struct cros_=
ec_device *ec_dev,
>  	int ret =3D 0, final_ret;
>  	struct timespec ts;
> =20
> +	/*
> +	 * We have the shared ec_dev buffer plus we do lots of separate spi=
_sync
> +	 * calls, so we need to make sure only one person is using this at =
a
> +	 * time.
> +	 */
> +	mutex_lock(&ec_spi->lock);
> +
>  	len =3D cros_ec_prepare_tx(ec_dev, ec_msg);
>  	dev_dbg(ec_dev->dev, "prepared, len=3D%d\n", len);
> =20
> @@ -260,7 +269,7 @@ static int cros_ec_command_spi_xfer(struct cros_e=
c_device *ec_dev,
>  		ret =3D final_ret;
>  	if (ret < 0) {
>  		dev_err(ec_dev->dev, "spi transfer failed: %d\n", ret);
> -		return ret;
> +		goto exit;
>  	}
> =20
>  	/* check response error code */
> @@ -269,14 +278,16 @@ static int cros_ec_command_spi_xfer(struct cros=
_ec_device *ec_dev,
>  		dev_warn(ec_dev->dev, "command 0x%02x returned an error %d\n",
>  			 ec_msg->cmd, ptr[0]);
>  		debug_packet(ec_dev->dev, "in_err", ptr, len);
> -		return -EINVAL;
> +		ret =3D -EINVAL;
> +		goto exit;
>  	}
>  	len =3D ptr[1];
>  	sum =3D ptr[0] + ptr[1];
>  	if (len > ec_msg->in_len) {
>  		dev_err(ec_dev->dev, "packet too long (%d bytes, expected %d)",
>  			len, ec_msg->in_len);
> -		return -ENOSPC;
> +		ret =3D -ENOSPC;
> +		goto exit;
>  	}
> =20
>  	/* copy response packet payload and compute checksum */
> @@ -293,10 +304,14 @@ static int cros_ec_command_spi_xfer(struct cros=
_ec_device *ec_dev,
>  		dev_err(ec_dev->dev,
>  			"bad packet checksum, expected %02x, got %02x\n",
>  			sum, ptr[len + 2]);
> -		return -EBADMSG;
> +		ret =3D -EBADMSG;
> +		goto exit;
>  	}
> =20
> -	return 0;
> +	ret =3D 0;
> +exit:
> +	mutex_unlock(&ec_spi->lock);
> +	return ret;
>  }
> =20
>  static void cros_ec_spi_dt_probe(struct cros_ec_spi *ec_spi, struct =
device *dev)
> @@ -327,6 +342,7 @@ static int cros_ec_spi_probe(struct spi_device *s=
pi)
>  	if (ec_spi =3D=3D NULL)
>  		return -ENOMEM;
>  	ec_spi->spi =3D spi;
> +	mutex_init(&ec_spi->lock);
>  	ec_dev =3D devm_kzalloc(dev, sizeof(*ec_dev), GFP_KERNEL);
>  	if (!ec_dev)
>  		return -ENOMEM;

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
