From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] i2c: tegra: proper handling of error cases
Date: Mon, 18 Apr 2016 09:37:57 +0200
Message-ID: <20160418073757.GD13078@ulmo.ba.sec>
References: <1460961282-3532-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HWvPVVuAAfuRc6SZ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1460961282-3532-1-git-send-email-smohammed@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shardar Shariff Md <smohammed@nvidia.com>
Cc: ldewangan@nvidia.com, swarren@wwwdotorg.org, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, wsa@the-dreams.de, gnurou@gmail.com
List-Id: linux-tegra@vger.kernel.org


--HWvPVVuAAfuRc6SZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 18, 2016 at 12:04:42PM +0530, Shardar Shariff Md wrote:
> To summarize the issue observed in error cases:
>=20
> SW Flow: For i2c message transfer, packet header and data payload is post=
ed
> and then required error/packet completion interrupts are enabled later.
>=20
> HW flow: HW process the packet just after packet header is posted, if ARB
> lost/NACK error occurs (SW will not handle immediately when error happens
> as error interrupts are not enabled at this point). HW assumes error is
> acknowledged and clears current data in FIFO, But SW here posts the
> remaining data payload which still stays in FIFO as stale data (without
> packet header).
>=20
> Now once the interrupts are enabled, SW handles ARB lost/NACK error by
> clearing the ARB lost/NACK interrupt. Now HW assumes that SW attended the
> error and will parse/process stale data (data without packet header)
> present in FIFO which causes invalid NACK errors.
>=20
> Fix: Enable the error interrupts before posting the packet into FIFO which
> make sure HW to not clear the fifo. Also disable the packet mode before
> acknowledging errors (ARB lost/NACK error) to not process any stale data.
> As error interrupts are enabled before posting the packet header use
> spinlock to avoid preempting.
>=20
> Signed-off-by: Shardar Shariff Md <smohammed@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 70 ++++++++++++++++++++++++++++++++----=
------
>  1 file changed, 54 insertions(+), 16 deletions(-)

It's customary to include a history of your changes in the patch. This
helps reviewers to reload context. You'd typically include it below the
--- separator (below the Signed-off-by). An example might look like
this:

---
Changes since v1:
- blah
- blub

> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index d764d64..47345ac 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -191,6 +191,7 @@ struct tegra_i2c_dev {
>  	u16 clk_divisor_non_hs_mode;
>  	bool is_suspended;
>  	bool is_multimaster_mode;
> +	spinlock_t xfer_lock;
>  };
> =20
>  static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val, unsigned =
long reg)
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
> +					 "timeout waiting for config load\n");
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
> @@ -477,36 +497,42 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c=
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
> -
> -	tegra_i2c_clock_disable(i2c_dev);
> +	err =3D tegra_i2c_wait_for_config_load(i2c_dev);
> +	if (err)
> +		goto err;

I think it would still be good to split this into multiple patches to
make it more obvious that you're merely extracting this code to a
function. Perhaps you could mention that you do so because subsequent
patches will reuse the code.

> =20
>  	if (i2c_dev->irq_disabled) {
>  		i2c_dev->irq_disabled =3D 0;
>  		enable_irq(i2c_dev->irq);
>  	}
> =20
> +err:
> +	tegra_i2c_clock_disable(i2c_dev);
>  	return err;
>  }
> =20
> +static int tegra_i2c_disable_packet_mode(struct tegra_i2c_dev *i2c_dev)
> +{
> +	u32 cnfg;
> +
> +	cnfg =3D i2c_readl(i2c_dev, I2C_CNFG);
> +	if (cnfg & I2C_CNFG_PACKET_MODE_EN)
> +		i2c_writel(i2c_dev, cnfg & ~I2C_CNFG_PACKET_MODE_EN, I2C_CNFG);
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
> +	int ret;
> =20
>  	status =3D i2c_readl(i2c_dev, I2C_INT_STATUS);
> =20
> +	spin_lock_irqsave(&i2c_dev->xfer_lock, flags);
>  	if (status =3D=3D 0) {
>  		dev_warn(i2c_dev->dev, "irq status 0 %08x %08x %08x\n",
>  			 i2c_readl(i2c_dev, I2C_PACKET_TRANSFER_STATUS),
> @@ -522,6 +548,9 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_i=
d)
>  	}
> =20
>  	if (unlikely(status & status_err)) {
> +		ret =3D tegra_i2c_disable_packet_mode(i2c_dev);
> +		if (ret)
> +			return IRQ_NONE;

That seems like the wrong response to me. You got here because there was
an interrupt, but returning IRQ_NONE means that you couldn't detect that
an interrupt was caused by this device. This is used ultimately by some
code in the IRQ core to determine whether or not an interrupt gets
erroneously triggered and if that happens too frequently it will be
forcibly disabled. Outputting an error message sounds more appropriate,
but otherwise it might be best for the code to continue.

Thierry

--HWvPVVuAAfuRc6SZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXFI7VAAoJEN0jrNd/PrOhs8sQAJOUK/x+qWzpHh93Ucl3DHRe
YcKGCQ480OmiXk7u2z+7KmUKHcfX/efKLmxpPOK+gCdnjeT4iJjKevheE8igYU+6
7jtFizbC/l0EhRAaY87rNEgCyyUti09JbzVr+CrVnnsAZK1T/qlOxfNdyQy6vy5z
ILiGfHyhu4XZPxBEzE1Qi4uH6FsSNXaslHx7nuTBZU656QSfqeT9pmMCoFMAkTni
kcuzNjVe2HGLpAP08gLyM3/7X8t/upuBG+dxrc+zoKAj1zDr9xhMMXhHfCyhtVLa
CizgtAZaNsuyRSnetjj7ATXkFWqcUnBq0H16jbN+E6hrLwa6+pFX4OxPZ6vBjftw
s7d0d71w8TFsVbgtr/5IFES4pMxChmBYJxwZsz/SQpOtR5L8YquTJSyMhQZ9sdAj
GR5Xhryv3rF9WzDQLS0K2QWnoyIUfpaS1XQCBFFV2hGl8Dr4Kvm2VpmlcylPZ8oa
HmKADaBgQ+XJqcN15OTuWLv/DNZo6ke5Gf+nB4gABeX40LNcB5Vb1qWb115A4HES
cHuBazLxX5mnnvIEp3ecTV6RRotLPfRpu94PW37JHWMbjQ8rJvstzwqMaCQy3tZq
ApQEGwKQVdL7f7Wb/hSogYqMre+eZ5aaNuhT3lcpoCP3FMnw+LKDuI8X5k4JXjDh
PapGlHXebuddRXYirdRs
=i0Kl
-----END PGP SIGNATURE-----

--HWvPVVuAAfuRc6SZ--
