From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v4 22/24] PM / devfreq: tegra30: Include appropriate
 header
Date: Thu, 18 Jul 2019 18:58:50 +0900
Message-ID: <2f317faf-8de0-2717-cda7-b15374039493@samsung.com>
References: <20190707223303.6755-1-digetx@gmail.com>
        <CGME20190707223620epcas4p16538beeb317e2ed0cbecb64147f32b71@epcas4p1.samsung.com>
        <20190707223303.6755-23-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190707223303.6755-23-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 19. 7. 8. 오전 7:33, Dmitry Osipenko wrote:
> It's not very correct to include mod_devicetable.h for the OF device
> drivers and of_device.h should be included instead.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 8a674fad26be..19e872a64148 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -13,7 +13,7 @@
>  #include <linux/io.h>
>  #include <linux/irq.h>
>  #include <linux/module.h>
> -#include <linux/mod_devicetable.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_opp.h>
>  #include <linux/reset.h>
> 

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Is not there other unused header file anymore?

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
