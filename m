From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v5 6/9] media: tegra: Add Tegra210 Video input driver
Date: Wed, 25 Mar 2020 22:43:22 +0300
Message-ID: <265b13e7-633f-5fa4-8df9-e461bf7e386a@gmail.com>
References: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
 <1584985955-19101-7-git-send-email-skomatineni@nvidia.com>
 <8f44e42d-2008-fe53-f4fb-b57502da91a8@gmail.com>
 <5695fc27-6839-dda3-9d06-77ef36ecfd43@nvidia.com>
 <f59eb7fa-5b26-60e4-771f-f6f9ecfa0b5f@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f59eb7fa-5b26-60e4-771f-f6f9ecfa0b5f-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

25.03.2020 04:15, Sowjanya Komatineni пишет:
> 
> On 3/24/20 6:08 PM, Sowjanya Komatineni wrote:
>>
>> On 3/24/20 5:34 PM, Dmitry Osipenko wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> 23.03.2020 20:52, Sowjanya Komatineni пишет:
>>>> +static void tegra_channel_vi_soft_reset(struct tegra_vi_channel *chan)
>>>> +{
>>>> +     /* disable clock gating to enable continuous clock */
>>>> +     tegra_vi_write(chan, TEGRA_VI_CFG_CG_CTRL, 0);
>>>> +     /*
>>>> +      * Soft reset memory client interface, pixel format logic, sensor
>>>> +      * control logic, and a shadow copy logic to bring VI to clean
>>>> state.
>>>> +      */
>>>> +     vi_csi_write(chan, TEGRA_VI_CSI_SW_RESET, 0xf);
>>>> +     usleep_range(100, 200);
>>>> +     vi_csi_write(chan, TEGRA_VI_CSI_SW_RESET, 0x0);
>>> Is it safe to reset MCCIF without blocking and flushing memory requests
>>> at first?
>> Yes to bring VI to clean state on errors its recommended by HW design
>> team.
> BTW, just to be clear this is Software reset.

Ok
