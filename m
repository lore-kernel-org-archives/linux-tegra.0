From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v5 9/9] arm64: tegra: Add Tegra VI CSI support in
 device tree
Date: Wed, 25 Mar 2020 03:22:57 +0300
Message-ID: <b757b06f-3ee1-1c8b-ae47-38211da667bc@gmail.com>
References: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
 <1584985955-19101-10-git-send-email-skomatineni@nvidia.com>
 <672819ea-01d3-2eca-8bb7-84ffd64256d4@gmail.com>
 <a218142f-295e-6bd5-b1d7-47d9ab8eba3e@nvidia.com>
 <fee09e1e-48a3-e0a0-12dc-9aeeb3438ded@gmail.com>
 <7d7c982e-7755-5f3d-cb90-9622f87df283@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7d7c982e-7755-5f3d-cb90-9622f87df283-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

25.03.2020 03:01, Sowjanya Komatineni пишет:
> 
> On 3/24/20 3:48 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 25.03.2020 00:04, Sowjanya Komatineni пишет:
>>> On 3/24/20 12:19 PM, Dmitry Osipenko wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> 23.03.2020 20:52, Sowjanya Komatineni пишет:
>>>> ...
>>>>> +                     pd_venc: venc {
>>>>> +                             clocks = <&tegra_car TEGRA210_CLK_VI>,
>>>>> +                                      <&tegra_car TEGRA210_CLK_CSI>;
>>>>> +                             resets = <&mc TEGRA210_MC_RESET_VI>,
>>>> The MC resetting should be needed only for a hardware hot-resetting. It
>>>> should be wrong to add it to the power domain.
>>> TRM recommends to do MC client hot-reset during VE power gate and
>>> ungate.
>> Could you please tell what TRM it is and what's the page#?
> Tegra TX1 TRM Page 425, Section 12.2.7.14 Procedures for VE Power Domains

Okay, thanks.
