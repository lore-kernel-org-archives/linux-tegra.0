From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 6/6] i2c: drivers: Use generic definitions for bus
 frequencies
Date: Fri, 20 Mar 2020 17:23:25 +0300
Message-ID: <44e50f6f-9674-60e6-9217-aeba96ef011d@gmail.com>
References: <20200316154929.20886-1-andriy.shevchenko@linux.intel.com>
 <20200316154929.20886-6-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <20200316154929.20886-6-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc: Laxman Dewangan <ldewangan@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

16.03.2020 18:49, Andy Shevchenko пишет:
> Since we have generic definitions for bus frequencies, let's use them.

...
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index cbc2ad49043e..4c4d17ddc96b 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -123,10 +123,6 @@
>  #define I2C_THIGH_SHIFT				8
>  #define I2C_INTERFACE_TIMING_1			0x98
>  
> -#define I2C_STANDARD_MODE			100000
> -#define I2C_FAST_MODE				400000
> -#define I2C_FAST_PLUS_MODE			1000000
...

For NVIDIA Tegra I2C:

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
