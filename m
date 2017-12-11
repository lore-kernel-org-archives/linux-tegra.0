From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1] usb: phy: tegra: Increase PHY clock stabilization
 timeout
Date: Mon, 11 Dec 2017 17:20:36 +0300
Message-ID: <3690dece-c1a2-e7d5-1634-dfdf17c303c4@gmail.com>
References: <20171210225535.8532-1-digetx@gmail.com>
 <20171211095322.GC10671@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171211095322.GC10671@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11.12.2017 12:53, Thierry Reding wrote:
> On Mon, Dec 11, 2017 at 01:55:35AM +0300, Dmitry Osipenko wrote:
>> This fixes "utmi_phy_clk_enable: timeout waiting for phy to stabilize"
>> error message.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/usb/phy/phy-tegra-usb.c | 13 ++++---------
>>  1 file changed, 4 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
>> index f668bfb708d3..7d5db625f800 100644
>> --- a/drivers/usb/phy/phy-tegra-usb.c
>> +++ b/drivers/usb/phy/phy-tegra-usb.c
>> @@ -16,7 +16,7 @@
>>  #include <linux/export.h>
>>  #include <linux/module.h>
>>  #include <linux/platform_device.h>
>> -#include <linux/io.h>
>> +#include <linux/iopoll.h>
>>  #include <linux/gpio.h>
>>  #include <linux/of.h>
>>  #include <linux/of_device.h>
>> @@ -305,14 +305,9 @@ static int utmip_pad_power_off(struct tegra_usb_phy *phy)
>>  
>>  static int utmi_wait_register(void __iomem *reg, u32 mask, u32 result)
>>  {
>> -	unsigned long timeout = 2000;
>> -	do {
>> -		if ((readl(reg) & mask) == result)
>> -			return 0;
>> -		udelay(1);
>> -		timeout--;
>> -	} while (timeout);
>> -	return -1;
>> +	u32 tmp;
>> +
>> +	return readl_poll_timeout(reg, tmp, (tmp & mask) == result, 1, 5000);
> 
> Technically I think this should be readl_poll_timeout_atomic() because
> the above used to use udelay() instead of usleep_range(). But since the
> function is never used inside atomic context, this looks fine.
> 
> You may want to bump the sleep time between reads to something like 10
> or 20. usleep_range() doesn't always work well with very short values,
> and given that you already bump the timeout from 2 ms to 5 ms indicates
> to me that we're actually spending a lot of time in this loop, and
> iterating somewhere between 2000 and 5000 times isn't any good. We only
> use this function to wait for the USB_PHY_CLK_VALID bit which happens
> during clock enable and disable, which isn't going to be very often, so
> even in the best case (where the clock is immediately valid) there's no
> need to return within a microsecond.

Thank you very much for the suggestion. Given that 2ms isn't enough, it should
be fine increase sleep time even to 1-2ms.
