From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 6/9] ASoC: tegra: add Tegra186 based DSPK driver
Date: Fri, 7 Feb 2020 21:22:51 +0300
Message-ID: <847f4512-7118-e087-1004-685e476e11d8@gmail.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-7-git-send-email-spujar@nvidia.com>
 <f8ed8c4a-af40-44b2-b720-4d3a9b660fda@gmail.com>
 <75a63cb3-7d79-7216-6791-3cec57464cd9@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <75a63cb3-7d79-7216-6791-3cec57464cd9-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

07.02.2020 14:26, Sameer Pujar пишет:
> 
> 
> On 2/6/2020 10:45 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 30.01.2020 13:33, Sameer Pujar пишет:
>>> +static const struct dev_pm_ops tegra186_dspk_pm_ops = {
>>> +     SET_RUNTIME_PM_OPS(tegra186_dspk_runtime_suspend,
>>> +                        tegra186_dspk_runtime_resume, NULL)
>>> +     SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>>> +                                  pm_runtime_force_resume)
>>> +};
>> Could you please explain why drivers need the "late" system sleep?
> 
> It was done to ensure core drivers are suspended first and defer the
> codec driver suspend

Suspend order is opposite to the drivers registration order. If there is
no real problem with that, then you should use the default suspend
level. Please don't try to fix a non-existent problems.
