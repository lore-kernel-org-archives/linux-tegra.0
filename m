From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
Date: Sun, 26 Apr 2020 02:44:58 +0300
Message-ID: <3f2916eb-dcd4-58c3-4d45-7f88620d4a83@gmail.com>
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
 <fd5300fd-33af-babe-95d0-9669b66a8c06@gmail.com>
 <2983577f-fec9-f24c-0563-6d1f0e1dd5d8@gmail.com>
 <32e30b7f-865b-282e-5e19-e4c8cf217e63@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <32e30b7f-865b-282e-5e19-e4c8cf217e63-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

26.04.2020 02:27, Sowjanya Komatineni пишет:
> 
> On 4/25/20 4:25 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 26.04.2020 02:13, Dmitry Osipenko пишет:
>>> 24.04.2020 06:55, Sowjanya Komatineni пишет:
>>>> +static int __maybe_unused vi_runtime_resume(struct device *dev)
>>>> +{
>>>> +    struct tegra_vi *vi = dev_get_drvdata(dev);
>>>> +    int ret;
>>>> +
>>>> +    ret = regulator_enable(vi->vdd);
>>>> +    if (ret) {
>>>> +            dev_err(dev, "failed to enable VDD supply: %d\n", ret);
>>>> +            return ret;
>>>> +    }
>>>> +
>>>> +    ret = clk_set_rate(vi->clk, vi->soc->vi_max_clk_hz);
>>>> +    if (ret) {
>>>> +            dev_err(dev, "failed to set vi clock rate: %d\n", ret);
>>>> +            goto disable_vdd;
>>>> +    }
>>> Isn't setting clock rate using assigned-clocks in a device-tree enough?
>>> Could you please clarify why this vi_max_clk_hz is needed?
>>>
>> In that case it should be wrong to set the clock rate in the RPM
>> callback because RPM works asynchronously and RPM may not be suspended
>> on TGP -> sensor source switch.
> 
> Driver will not do TPG and Sensor switch dynamically.
> 
> Based on kconfig, it will only do TPG or Sensor and sensor will be
> default all the time once sensor support is added in next series.
> 

Doesn't V4L have a native support for the capture source selection? Why
it needs to be a compile-time option?

I think other drivers use a generic V4L "Image Processing Controls" with
a configurable test_pattern option.
