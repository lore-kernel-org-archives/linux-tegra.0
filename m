From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] i2c: tegra: proper handling of error cases
Date: Mon, 18 Apr 2016 16:17:05 +0200
Message-ID: <20160418141705.GB20508@ulmo.ba.sec>
References: <1460985355-28901-1-git-send-email-smohammed@nvidia.com>
 <1460985355-28901-2-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="61jdw2sOBCFtR2d/"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1460985355-28901-2-git-send-email-smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--61jdw2sOBCFtR2d/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 18, 2016 at 06:45:55PM +0530, Shardar Shariff Md wrote:
> To summarize the issue observed in error cases:
>=20
> SW Flow: For i2c message transfer, packet header and data payload is
> posted and then required error/packet completion interrupts are enabled
> later.
>=20
> HW flow: HW process the packet just after packet header is posted, if
> ARB lost/NACK error occurs (SW will not handle immediately when error
> happens as error interrupts are not enabled at this point). HW assumes
> error is acknowledged and clears current data in FIFO, But SW here posts
> the remaining data payload which still stays in FIFO as stale data
> (data without packet header).
>=20
> Now once the interrupts are enabled, SW handles ARB lost/NACK error by
> clearing the ARB lost/NACK interrupt. Now HW assumes that SW attended
> the error and will parse/process stale data (data without packet header)
> present in FIFO which causes invalid NACK errors.
>=20
> Fix: Enable the error interrupts before posting the packet into FIFO
> which make sure HW to not clear the fifo. Also disable the packet mode
> before acknowledging errors (ARB lost/NACK error) to not process any
> stale data. As error interrupts are enabled before posting the packet
> header use spinlock to avoid preempting.
>=20
> Signed-off-by: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Changes since v1:
> - Align the commit message to 72 characters per line.
> - Removing unnecessary paranthesis.
> - Printing error if tegra_i2c_disable_packet_mode() fails
>   is already present and handling error is not taken cared
>   in ISR which was done in v2.

I think I didn't express myself very clearly, or gave insufficient
information. The changelog reads easier if you have one entry per
revision. The above would then read:

Changes in v3:
- Printing error if tegra_i2c_disable_packet_mode() fails
  is already present and handling error is not taken cared
  in ISR which was done in v2.

Changes in v2:
- Align the commit message to 72 characters per line.
- Removing unnecessary paranthesis.

And it should go below the --- separator.

One more nitpick below.

> ---
>  drivers/i2c/busses/i2c-tegra.c | 28 ++++++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index 6235f16..7922892 100644
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
> @@ -510,14 +511,27 @@ err:
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

Since you no longer use the return value you might as well just make the
function return void. I don't feel very strongly about it, though, so
I'll defer to Wolfram.

Thierry

--61jdw2sOBCFtR2d/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXFOxhAAoJEN0jrNd/PrOhiQQP/jR9dv5aUEdLqoO/1BKEX3v2
AF4Cx+6YlIYZ9KUuDvyav0pEydKXSYirWVG8ruRGr96ZH95EXyJ2JM/d1NVmun8t
SYnaUnJeJZ40TkzQPkR2EfarKzoxkT+FeDfRpK3UUcPuVk3al9C7Rhth+mwkjV8h
CkLs80vAdMCkYYdTKZ7992+quNh3M2/BG4CcPI357xGeeCWTGGGWFq/ZtF7ZbaGH
Fet0xj8SYNq3RJRb3W9dPYV43TdRqF6ECisyaWukDZQQ8fX51Oip0NXJFUuQIoU9
gGUVlNDJI92C+m9gGTjZjVZAiIV48mSC0kgFIvNIp5LfXjc9d0MWnI5qTq3PGGrA
V7R5WwbtQbegPKv7o4zQ+AuJ50rilP/ph6IQw39H8Quxla1lqq/T+YRSWnn73JYH
2rFurqCiGD0caXalKLmcT3T0WoalS7bzwFcstLJm5LVet15zG91EHusSqHVPm5UH
/CZ31hbNcBCNnhV7XAqXxwQGcafO32rRJlgsBqi05h8JbbWn2jGNAh07tRqhkIzS
+sjwt4o9a0YcWsNl4CfLGuOoahYdUGrEdBuGyP9olIRc2fh4Ui1Debw4gteBPrUS
+RbjSAWPePRNLRwDSwdGTmMz2isr24YEGUr+jD47KP7EAdRBreD6xYWxdyqIy2FO
vh+mNgO+NffpnJvCmWHI
=rtI0
-----END PGP SIGNATURE-----

--61jdw2sOBCFtR2d/--
