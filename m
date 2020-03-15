From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v4 8/8] arm64: tegra: Add Tegra VI CSI support in
 device tree
Date: Sun, 15 Mar 2020 15:21:36 -0700
Message-ID: <80805c85-a6b0-62c4-877c-6af3831bce1d@nvidia.com>
References: <1584236766-24819-1-git-send-email-skomatineni@nvidia.com>
 <1584236766-24819-9-git-send-email-skomatineni@nvidia.com>
 <b4bbcc1d-d38c-14c5-7205-2f7657ab8712@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b4bbcc1d-d38c-14c5-7205-2f7657ab8712-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 3/15/20 5:54 AM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 15.03.2020 04:46, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Tegra210 contains VI controller for video input capture from MIPI
>> CSI camera sensors and also supports built-in test pattern generator.
>>
>> CSI ports can be one-to-one mapped to VI channels for capturing from
>> an external sensor or from built-in test pattern generator.
>>
>> This patch adds support for VI and CSI and enables them in Tegra210
>> device tree.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
> Hello Sowjanya,
>
> ...
>> +
>> +                     pd_venc: venc {
>> +                             clocks =3D <&tegra_car TEGRA210_CLK_VI>,
>> +                                      <&tegra_car TEGRA210_CLK_CSI>;
>> +                             resets =3D <&tegra_car 20>,
> What is the clock #20?

Hi Dmitry,

20 is VI_RST not defined in include/dt-bindings/reset/tegra210-car.h

Will add define and will fix to use it.



>> +                                      <&tegra_car TEGRA210_CLK_CSI>,
>> +                                      <&mc TEGRA210_MC_RESET_VI>;
> Does this order means that memory controller will be reset *after*
> resetting the CSI/VI hardware? This is incorrect reset sequence.
>
> The memory controller reset should be kept asserted during of the time
> of the hardware resetting procedure.
>
> The correct sequence should be as follows:
>
> 1. Assert MC
> 2. Reset VI
> 3. Deassert MC
Right, will fix order. Thanks
