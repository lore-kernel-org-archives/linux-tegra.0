From: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] gpio: tegra186: export MODULE_DEVICE_TABLE
Date: Tue, 5 May 2020 18:18:57 +0200
Message-ID: <CAMpxmJXp9uZp=Q5Sm==_d720mg=aYSC1K1=V-P5Tz10gnLYuUQ@mail.gmail.com>
References: <20200505084501.13170-1-ykaukab@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200505084501.13170-1-ykaukab-l3A5Bk7waGM@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mian Yousaf Kaukab <ykaukab-l3A5Bk7waGM@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-gpio <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

wt., 5 maj 2020 o 10:45 Mian Yousaf Kaukab <ykaukab-l3A5Bk7waGM@public.gmane.org> napisa=C5=82(a=
):
>
> Export MODULE_DEVICE_TABLE since the driver can be built as a module.
>
> Signed-off-by: Mian Yousaf Kaukab <ykaukab-l3A5Bk7waGM@public.gmane.org>
> ---
>  drivers/gpio/gpio-tegra186.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index 79b553dc39a3..178e9128ded0 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -894,6 +894,7 @@ static const struct of_device_id tegra186_gpio_of_mat=
ch[] =3D {
>                 /* sentinel */
>         }
>  };
> +MODULE_DEVICE_TABLE(of, tegra186_gpio_of_match);
>
>  static struct platform_driver tegra186_gpio_driver =3D {
>         .driver =3D {
> --
> 2.25.0
>

Patch applied, thanks!

Bart
