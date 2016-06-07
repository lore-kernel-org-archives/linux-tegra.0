From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: max77620: Fix FPS switch statements
Date: Tue, 7 Jun 2016 09:05:38 +0100
Message-ID: <20160607080538.GG1525@dell>
References: <1463075104-26924-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1463075104-26924-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, 12 May 2016, Rhyland Klein wrote:

> When configuring FPS during probe, assuming a DT node is present for
> FPS, the code can run into a problem with the switch statements in
> max77620_config_fps() and max77620_get_fps_period_reg_value(). Namely=
,
> in the case of chip->chip_id =3D=3D MAX77620, it will set
> fps_[mix|max]_period but then fall through to the default switch case
> and return -EINVAL. Returning this from max77620_config_fps() will
> cause probe to fail.
>=20
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
> ---
>  drivers/mfd/max77620.c | 2 ++
>  1 file changed, 2 insertions(+)

Applied to -fixes with Thierry and Laxman's Acks.

> diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
> index 199d261990be..f32fbb8e8129 100644
> --- a/drivers/mfd/max77620.c
> +++ b/drivers/mfd/max77620.c
> @@ -203,6 +203,7 @@ static int max77620_get_fps_period_reg_value(stru=
ct max77620_chip *chip,
>  		break;
>  	case MAX77620:
>  		fps_min_period =3D MAX77620_FPS_PERIOD_MIN_US;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -236,6 +237,7 @@ static int max77620_config_fps(struct max77620_ch=
ip *chip,
>  		break;
>  	case MAX77620:
>  		fps_max_period =3D MAX77620_FPS_PERIOD_MAX_US;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
