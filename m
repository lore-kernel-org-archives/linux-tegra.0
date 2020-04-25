From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
Date: Sun, 26 Apr 2020 01:08:02 +0300
Message-ID: <e5602c48-a73e-8e71-188d-6a53ebf8e4a4@gmail.com>
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
 <3155e0d2-94b0-6e0a-bf35-b3560c201039@gmail.com>
 <fffc09d1-a25f-2d6e-83bd-f7657dd2ff16@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <fffc09d1-a25f-2d6e-83bd-f7657dd2ff16-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

25.04.2020 01:00, Sowjanya Komatineni пишет:
> 
> On 4/24/20 8:07 AM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 24.04.2020 06:55, Sowjanya Komatineni пишет:
>>
>> Is this driver compiled as a single kernel module file?
>>
>>> +MODULE_AUTHOR("Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
>>> +MODULE_DESCRIPTION("NVIDIA Tegra CSI Device Driver");
>>> +MODULE_LICENSE("GPL v2");
>> ...
>>> +MODULE_AUTHOR("Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
>>> +MODULE_DESCRIPTION("NVIDIA Tegra Video Input Device Driver");
>>> +MODULE_LICENSE("GPL v2");
>> I don't think that these macros are needed in that case.
>> The video.c should be enough, isn't it?
> yes these can be removed

It will be nice to factor out the Tegra210-specific VI/CSI OPS into a
separate driver module (say tegra210-vi) to ease supporting of other
Tegra versions. Of course this could be done later on, although I
suppose the amount of hassle could be reduced if it's done from the start.
