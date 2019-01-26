From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V3 1/3] i2c: tegra: Sort all the include headers
 alphabetically
Date: Sat, 26 Jan 2019 20:29:24 +0300
Message-ID: <df091b4b-58a1-13ce-2041-0557759c6d8e@gmail.com>
References: <1548475073-12408-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548475073-12408-1-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

26.01.2019 6:57, Sowjanya Komatineni пишет:
> -#include <linux/kernel.h>
> -#include <linux/init.h>
> -#include <linux/platform_device.h>
>  #include <linux/clk.h>
> +#include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/i2c.h>
> -#include <linux/io.h>
> +#include <linux/init.h>
>  #include <linux/interrupt.h>
> -#include <linux/delay.h>
> -#include <linux/slab.h>
> -#include <linux/of_device.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/reset.h>
> +#include <linux/of_device.h>
>  #include <linux/pinctrl/consumer.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> -#include <linux/iopoll.h>
> -
> -#include <asm/unaligned.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>

<linux/slab.h> isn't needed too.
