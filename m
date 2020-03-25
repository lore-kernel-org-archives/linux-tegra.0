From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v5 6/9] media: tegra: Add Tegra210 Video input driver
Date: Tue, 24 Mar 2020 18:08:52 -0700
Message-ID: <5695fc27-6839-dda3-9d06-77ef36ecfd43@nvidia.com>
References: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
 <1584985955-19101-7-git-send-email-skomatineni@nvidia.com>
 <8f44e42d-2008-fe53-f4fb-b57502da91a8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8f44e42d-2008-fe53-f4fb-b57502da91a8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 3/24/20 5:34 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 23.03.2020 20:52, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> +static void tegra_channel_vi_soft_reset(struct tegra_vi_channel *chan)
>> +{
>> +     /* disable clock gating to enable continuous clock */
>> +     tegra_vi_write(chan, TEGRA_VI_CFG_CG_CTRL, 0);
>> +     /*
>> +      * Soft reset memory client interface, pixel format logic, sensor
>> +      * control logic, and a shadow copy logic to bring VI to clean sta=
te.
>> +      */
>> +     vi_csi_write(chan, TEGRA_VI_CSI_SW_RESET, 0xf);
>> +     usleep_range(100, 200);
>> +     vi_csi_write(chan, TEGRA_VI_CSI_SW_RESET, 0x0);
> Is it safe to reset MCCIF without blocking and flushing memory requests
> at first?
Yes to bring VI to clean state on errors its recommended by HW design team.
