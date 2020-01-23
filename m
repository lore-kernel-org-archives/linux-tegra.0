From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: Restore pinmux on system resume
Date: Thu, 23 Jan 2020 18:10:19 +0300
Message-ID: <a9a5eb76-03f9-04d8-1b6c-115ec73fdebf@gmail.com>
References: <20191213134417.222720-1-thierry.reding@gmail.com>
 <20200123111927.GH1105@ninjato>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200123111927.GH1105@ninjato>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

23.01.2020 14:19, Wolfram Sang пишет:
> On Fri, Dec 13, 2019 at 02:44:17PM +0100, Thierry Reding wrote:
>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Depending on the board design, the I2C controllers found on Tegra SoCs
>> may require pinmuxing in order to function. This is done as part of the
>> driver's runtime suspend/resume operations. However, the PM core does
>> not allow devices to go into runtime suspend during system sleep to
>> avoid potential races with the suspend/resume of their parents.
>>
>> As a result of this, when Tegra SoCs resume from system suspend, their
>> I2C controllers may have lost the pinmux state in hardware, whereas the
>> pinctrl subsystem is not aware of this. To fix this, make sure that if
>> the I2C controller is not runtime suspended, the runtime suspend code is
>> still executed in order to disable the module clock (which we don't need
>> to be enabled during sleep) and set the pinmux to the idle state.
>>
>> Conversely, make sure that the I2C controller is properly resumed when
>> waking up from sleep so that pinmux settings are properly restored.
>>
>> This fixes a bug seen with DDC transactions to an HDMI monitor timing
>> out when resuming from system suspend.
>>
>> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Do we still need this after I applied "[PATCH v5 0/8] NVIDIA Tegra I2C
> driver fixes and improvements" ?
> 

No, it shouldn't be needed.
