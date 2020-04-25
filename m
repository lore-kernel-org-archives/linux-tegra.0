From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
Date: Sat, 25 Apr 2020 16:19:47 -0700
Message-ID: <d6b92c10-92d6-b0e6-1475-429b63ff61d7@nvidia.com>
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
 <fd5300fd-33af-babe-95d0-9669b66a8c06@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <fd5300fd-33af-babe-95d0-9669b66a8c06@gmail.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc: sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 4/25/20 4:13 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 24.04.2020 06:55, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> +static int __maybe_unused vi_runtime_resume(struct device *dev)
>> +{
>> +     struct tegra_vi *vi =3D dev_get_drvdata(dev);
>> +     int ret;
>> +
>> +     ret =3D regulator_enable(vi->vdd);
>> +     if (ret) {
>> +             dev_err(dev, "failed to enable VDD supply: %d\n", ret);
>> +             return ret;
>> +     }
>> +
>> +     ret =3D clk_set_rate(vi->clk, vi->soc->vi_max_clk_hz);
>> +     if (ret) {
>> +             dev_err(dev, "failed to set vi clock rate: %d\n", ret);
>> +             goto disable_vdd;
>> +     }
> Isn't setting clock rate using assigned-clocks in a device-tree enough?
> Could you please clarify why this vi_max_clk_hz is needed?

Max clock rate with sensor support will be 998Mhz.

Later when sensor support is added, based on TPG or Sensor mode clock=20
rate will be set here
