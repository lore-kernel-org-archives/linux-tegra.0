From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: proper handling of error cases
Date: Fri, 15 Apr 2016 16:15:58 +0200
Message-ID: <20160415141558.GC3472@ulmo.ba.sec>
References: <1460726507-9170-1-git-send-email-smohammed@nvdiia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0vzXIDBeUiKkjNJl"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1460726507-9170-1-git-send-email-smohammed-85njD5c96MTQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shardar Shariff Md <smohammed-85njD5c96MTQT0dZR+AlfA@public.gmane.org>
Cc: ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--0vzXIDBeUiKkjNJl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 15, 2016 at 06:51:47PM +0530, Shardar Shariff Md wrote:
> From: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> To summarize the issue observed in error cases:
>=20
> In SW: For i2c message transfer, packet header
> and data payload is posted and then required
> error/packet completion interrupts are enabled
> later.
>=20
> In HW flow: HW process the packet just after
> packet header is posted, if ARB lost/NACK error
> occurs (SW will not handle immediately when error
> happens as error interrupts are not enabled at
> this point). HW assumes error is acknowledged and
> clears current data in FIFO, But SW here posts the
> remaining data payload which still stays in FIFO
> as stale data (data without packet header).
>=20
> Now once the interrupts are enabled, SW handles
> ARB lost/NACK error by clearing the ARB lost/NACK
> interrupt. Now HW assumes that SW attended the error
> and will parse/process stale data (data without packet
> header) present in FIFO which causes invalid NACK errors.
>=20
> Fix: Enable the error interrupts before posting the
> packet into FIFO which make sure HW to not clear the
> fifo. Also disable the packet mode before acknowledging
> errors (ARB lost/NACK error) to not process any stale
> data.
>=20
> As error interrupts are enabled before posting the
> packet header use spinlock to avoid preempting.

Please try to use up the full 78 characters per line in the commit
message (with the exception being the subject line that should be
shorter).

> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
[...]
> @@ -423,12 +424,31 @@ static inline void tegra_i2c_clock_disable(struct t=
egra_i2c_dev *i2c_dev)
>  		clk_disable(i2c_dev->fast_clk);
>  }
> =20
> +static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
> +{
> +	unsigned long timeout;
> +
> +	if (i2c_dev->hw->has_config_load_reg) {
> +		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
> +		timeout =3D jiffies + msecs_to_jiffies(1000);
> +		while (i2c_readl(i2c_dev, I2C_CONFIG_LOAD) !=3D 0) {
> +			if (time_after(jiffies, timeout)) {
> +				dev_warn(i2c_dev->dev,
> +					"timeout waiting for config load\n");

Nit: since you're already changing this, perhaps make the arguments on
subsequent lines align with the first argument on the first line? Like
so:

				dev_warn(i2c_dev->dev,
					 "timeout waiting for config load\n");

Note the extra space used for padding.

> +				return -ETIMEDOUT;
> +			}
> +			msleep(1);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>  {
>  	u32 val;
>  	int err =3D 0;
>  	u32 clk_divisor;
> -	unsigned long timeout =3D jiffies + HZ;
> =20
>  	err =3D tegra_i2c_clock_enable(i2c_dev);
>  	if (err < 0) {
> @@ -477,20 +497,13 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c=
_dev)
>  	if (i2c_dev->is_multimaster_mode && i2c_dev->hw->has_slcg_override_reg)
>  		i2c_writel(i2c_dev, I2C_MST_CORE_CLKEN_OVR, I2C_CLKEN_OVERRIDE);
> =20
> -	if (i2c_dev->hw->has_config_load_reg) {
> -		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
> -		while (i2c_readl(i2c_dev, I2C_CONFIG_LOAD) !=3D 0) {
> -			if (time_after(jiffies, timeout)) {
> -				dev_warn(i2c_dev->dev,
> -					"timeout waiting for config load\n");
> -				return -ETIMEDOUT;
> -			}
> -			msleep(1);
> -		}
> -	}
> +	err =3D tegra_i2c_wait_for_config_load(i2c_dev);
> =20
>  	tegra_i2c_clock_disable(i2c_dev);
> =20
> +	if (err)
> +		return err;
> +

The behaviour here is now different, though I assume it's really a fix
that disables the I2C clock in case the timeout happens. Given that I
suspect this would be better off in a separate patch (factor out the
tegra_i2c_wait_for_config_load() function and return error after the
clocks have been disabled).

>  	if (i2c_dev->irq_disabled) {
>  		i2c_dev->irq_disabled =3D 0;
>  		enable_irq(i2c_dev->irq);
> @@ -499,14 +512,28 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c=
_dev)
>  	return err;
>  }
> =20
> +static int tegra_i2c_disable_packet_mode(struct tegra_i2c_dev *i2c_dev)
> +{
> +	u32 cnfg;
> +
> +	cnfg =3D i2c_readl(i2c_dev, I2C_CNFG);
> +	if (cnfg & I2C_CNFG_PACKET_MODE_EN)
> +		i2c_writel(i2c_dev, cnfg & (~I2C_CNFG_PACKET_MODE_EN),

Parentheses are not necessary here.

> +				I2C_CNFG);

If you drop the parentheses above this can be moved into the previous
line because it will fit within 80 columns.

> +
> +	return tegra_i2c_wait_for_config_load(i2c_dev);
> +}
> +
>  static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>  {
>  	u32 status;
>  	const u32 status_err =3D I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
>  	struct tegra_i2c_dev *i2c_dev =3D dev_id;
> +	unsigned long flags;
> =20
>  	status =3D i2c_readl(i2c_dev, I2C_INT_STATUS);
> =20
> +	spin_lock_irqsave(&i2c_dev->xfer_lock, flags);
>  	if (status =3D=3D 0) {
>  		dev_warn(i2c_dev->dev, "irq status 0 %08x %08x %08x\n",
>  			 i2c_readl(i2c_dev, I2C_PACKET_TRANSFER_STATUS),
> @@ -522,6 +549,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_i=
d)
>  	}
> =20
>  	if (unlikely(status & status_err)) {
> +		tegra_i2c_disable_packet_mode(i2c_dev);

If you don't care about the return value it'd be better to reflect that
by making the function return void. I presume ignoring the error here is
safe?

> @@ -583,6 +614,11 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *=
i2c_dev,
>  	i2c_dev->msg_read =3D (msg->flags & I2C_M_RD);
>  	reinit_completion(&i2c_dev->msg_complete);
> =20
> +	spin_lock_irqsave(&i2c_dev->xfer_lock, flags);
> +
> +	int_mask =3D I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
> +	tegra_i2c_unmask_irq(i2c_dev, int_mask);
> +
>  	packet_header =3D (0 << PACKET_HEADER0_HEADER_SIZE_SHIFT) |
>  			PACKET_HEADER0_PROTOCOL_I2C |
>  			(i2c_dev->cont_id << PACKET_HEADER0_CONT_ID_SHIFT) |
> @@ -612,14 +648,15 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev =
*i2c_dev,
>  	if (!(msg->flags & I2C_M_RD))
>  		tegra_i2c_fill_tx_fifo(i2c_dev);
> =20
> -	int_mask =3D I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
>  	if (i2c_dev->hw->has_per_pkt_xfer_complete_irq)
>  		int_mask |=3D I2C_INT_PACKET_XFER_COMPLETE;
>  	if (msg->flags & I2C_M_RD)
>  		int_mask |=3D I2C_INT_RX_FIFO_DATA_REQ;
>  	else if (i2c_dev->msg_buf_remaining)
>  		int_mask |=3D I2C_INT_TX_FIFO_DATA_REQ;
> +
>  	tegra_i2c_unmask_irq(i2c_dev, int_mask);

Can this line be removed? The NO_ACK and ARBITRATION_LOST interrupts are
already unmasked earlier.

Thierry

--0vzXIDBeUiKkjNJl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXEPebAAoJEN0jrNd/PrOhExQQAJv2l2M12XUgTQPdNGuw/98J
3//kSXYFnILtUVNdGVwChuJ0DqFiwCJy8GCg08kZINFz1QLAjeJDBWJ2uSBVwhq1
Sr7HnSVep/a+9Z4kcIwGG/g8drE+7CjjI+zy6aEcccUeEvAaGrNjCeVX+YZBUvSp
+WR9KiVm+Vg420LWX6/x1YHozrCWhaWtXEnxsveWaF1JuyFO6XfrCEcz4kmoDzJQ
bu992CpESyv8jTp+iOP34Vbhh4lKtUz+NC6TRyRg4O4jQzBPmrZiBd/jCiK3qE9J
h25YstnuK06NVMq4+GU3tug6x+FXN5WyHwq197kv5f/b925mDZGGIu1vSLsL9Ixf
g3O0sK1i5yU1HHMSHumJlfPKRyVW5KnUoOoSgbR80JZNPcys3VoN383qJZbPc809
w6Dy/WlY1PNV2IabAqUdPsgKyhcN3lFOh5WFZ+48Hho+h87wtF02J7YfRSE2HohM
CKc7QHBY/wstf5CNONQ9XK5cYRcM3eyRPqy+pRqoM4U3wU1Tb4L0ugw0bf38iNGJ
aQ5dlhOCuZc0ppz5eO9/96jB61irA5iOQKz9pmYjacQqdOitu+nNuDOWnxtabkjq
cO+LuZPIBxzrkYewcRvSlsG93qpGC+mLvmVlEOfCFhmtaiCONLiObXe6b7DGDVcl
OYumBFplr2Luj9i7gMAi
=2GEN
-----END PGP SIGNATURE-----

--0vzXIDBeUiKkjNJl--
