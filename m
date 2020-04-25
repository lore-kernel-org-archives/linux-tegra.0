From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
Date: Sat, 25 Apr 2020 16:27:48 -0700
Message-ID: <32e30b7f-865b-282e-5e19-e4c8cf217e63@nvidia.com>
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
 <fd5300fd-33af-babe-95d0-9669b66a8c06@gmail.com>
 <2983577f-fec9-f24c-0563-6d1f0e1dd5d8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2983577f-fec9-f24c-0563-6d1f0e1dd5d8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 4/25/20 4:25 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 26.04.2020 02:13, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> 24.04.2020 06:55, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> +static int __maybe_unused vi_runtime_resume(struct device *dev)
>>> +{
>>> +    struct tegra_vi *vi =3D dev_get_drvdata(dev);
>>> +    int ret;
>>> +
>>> +    ret =3D regulator_enable(vi->vdd);
>>> +    if (ret) {
>>> +            dev_err(dev, "failed to enable VDD supply: %d\n", ret);
>>> +            return ret;
>>> +    }
>>> +
>>> +    ret =3D clk_set_rate(vi->clk, vi->soc->vi_max_clk_hz);
>>> +    if (ret) {
>>> +            dev_err(dev, "failed to set vi clock rate: %d\n", ret);
>>> +            goto disable_vdd;
>>> +    }
>> Isn't setting clock rate using assigned-clocks in a device-tree enough?
>> Could you please clarify why this vi_max_clk_hz is needed?
>>
> In that case it should be wrong to set the clock rate in the RPM
> callback because RPM works asynchronously and RPM may not be suspended
> on TGP -> sensor source switch.

Driver will not do TPG and Sensor switch dynamically.

Based on kconfig, it will only do TPG or Sensor and sensor will be=20
default all the time once sensor support is added in next series.
