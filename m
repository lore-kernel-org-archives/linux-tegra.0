From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 0/3] Tegra GPIO: Minor code clean up
Date: Thu, 19 Dec 2019 18:26:08 +0300
Message-ID: <aff1c503-f4da-275d-b867-ca14c86a00db@gmail.com>
References: <20191215183047.9414-1-digetx@gmail.com>
 <20191219145341.GL1440537@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191219145341.GL1440537@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

19.12.2019 17:53, Thierry Reding пишет:
> On Sun, Dec 15, 2019 at 09:30:44PM +0300, Dmitry Osipenko wrote:
>> Hello,
>>
>> I was investigating why CPU hangs during of GPIO driver suspend and in
>> the end it turned out that it is a Broadcom WiFi driver problem because
>> it keeps OOB wake-interrupt enabled while WLAN interface is DOWN and this
>> may cause a bit weird CPU hang on writing to INT_ENB register during of
>> GPIO driver suspend. Meanwhile I also noticed that a few things could be
>> improved in the driver, that's what this small series addresses.
>>
>> Dmitry Osipenko (3):
>>   gpio: tegra: Use generic readl_relaxed/writel_relaxed accessors
>>   gpio: tegra: Properly handle irq_set_irq_wake() error
>>   gpio: tegra: Use NOIRQ phase for suspend/resume
>>
>>  drivers/gpio/gpio-tegra.c | 21 ++++++++++-----------
>>  1 file changed, 10 insertions(+), 11 deletions(-)
> 
> Patches look good:
> 
> Reviewed-by: Thierry Reding <treding@nvidia.com>
> 
> I also applied this series on top of v5.5-rc1 and ran it through our
> test system:
> 
>     Test results:
>         13 builds:  13 pass, 0 fail
>         22 boots:   22 pass, 0 fail
>         34 tests:   34 pass, 0 fail
> 
>     Linux version:  5.5.0-rc1-g3d0b4fced39e
>     Boards tested:  tegra124-jetson-tk1, tegra186-p2771-0000,
>                     tegra194-p2972-0000, tegra20-ventana,
>                     tegra210-p2371-2180, tegra30-cardhu-a04
> 
> All tests passing, so:
> 
> Tested-by: Thierry Reding <treding@nvidia.com>
> 

Thank you very much!
