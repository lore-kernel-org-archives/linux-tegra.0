From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 2/8] clk: tegra: Export functions for EMC clock scaling
Date: Tue, 10 Mar 2020 19:16:15 +0300
Message-ID: <1ac24caf-e4c1-b20e-4c3d-97b328a97ea5@gmail.com>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-3-thierry.reding@gmail.com>
 <8e1f11e9-a95a-500f-ff44-6f44ad990863@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8e1f11e9-a95a-500f-ff44-6f44ad990863-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

10.03.2020 19:13, Dmitry Osipenko пишет:
> 10.03.2020 18:19, Thierry Reding пишет:
>> From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Export functions to allow accessing the CAR register required by EMC
>> clock scaling. These functions will be used to access the CAR register
>> as part of the scaling sequence.
>>
>> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> Changes in v5:
>> - remove tegra210_clk_emc_update_setting() which is no longer needed
>>
> ...
>> +EXPORT_SYMBOL_GPL(tegra210_clk_emc_update_setting);
> ...
>> +extern void tegra210_clk_emc_dll_enable(bool flag);
>> +extern void tegra210_clk_emc_dll_update_setting(u32 emc_dll_src_value);
>> +extern void tegra210_clk_emc_update_setting(u32 emc_src_value);
> 
> Why these exports are needed given that the EMC driver is built-in?
> 

Also, seems changelog doesn't match the patch itself.
