From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 3/3] gpio: tegra: Add support for gpio debounce
Date: Mon, 18 Apr 2016 22:36:18 +0530
Message-ID: <5715140A.6030502@nvidia.com>
References: <1460969178-20914-1-git-send-email-ldewangan@nvidia.com> <1460969178-20914-3-git-send-email-ldewangan@nvidia.com> <57150D8C.7020100@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <57150D8C.7020100@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, linus.walleij@linaro.org
Cc: gnurou@gmail.com, thierry.reding@gmail.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On Monday 18 April 2016 10:08 PM, Stephen Warren wrote:
> On 04/18/2016 02:46 AM, Laxman Dewangan wrote:
>
>>
>> +
>> +    /* There is only one debounce count register per port and hence
>> +     * set the maximum of current and requested debounce time.
>> +     */
>> +    max_dbc = tegra_gpio_readl(GPIO_DBC_CNT(offset));
>
> What if the system boots with random values in that register, or some 
> code that runs before the kernel programs large values into the 
> register? That would (incorrectly) impose a lower bound on the 
> possible values the kernel driver can impose. Perhaps the kernel 
> should clear the DBC_CNT registers at probe(), or should store a 
> shadow copy of the DBC_CNT register, use that value here rather than 
> re-reading the registers, and clear that SW shadow at probe().
>

Clearing in probe is better option than shadowing it. If we shadow then 
need loop as there is only one register per port which have 8 pins and 
this function get called per pin basis.




>> +    max_dbc = max(max_dbc, debounce_ms);
>
> I wonder if there should be more discussion of how to honor 
> conflicting requests. Perhaps we should only allow exactly equal 
> values (someone might strictly care about latency, and increasing the 
> latency of GPIO X1 just because GPIO X5 wanted a longer debounce 
> period might not be acceptable). Does the GPIO subsystem define 
> explicit semantics for this case?
>


Not seen form  GOIO subsystem as GOIO subsystem assume this 
configuration is per GPIO, not for group of GPIO.

However, everywhere, the debounce parameter should be provided as 
platform specific from DT and on this case, the platform developer knows 
what is best common value.


>> + tegra_gpio_mask_write(GPIO_MSK_DBC_EN(offset), offset, 1);
>> +    tegra_gpio_writel(max_dbc, GPIO_DBC_CNT(offset));
>
> I think DBC_CNT should be written first; the debounce process uses 
> that data to configure itself. The process shouldn't be enabled before 
> it's configured.
>

OK, make sense as safe game.
The debounce is in effect when any change in the pin and this call 
should be happen before any state change in pin.


