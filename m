From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/4] ARM: tegra: GPU WPR region support
Date: Wed, 28 Oct 2015 18:13:16 +0900
Message-ID: <CAAVeFuKdUag3dqED9ViB0Nb3vicVVp7oayZ8Uv44Zv-osPWMig@mail.gmail.com>
References: <1445230624-30314-1-git-send-email-acourbot@nvidia.com>
 <CAAVeFuLENPfjy1k2ZTUArTph_6wbAxXninZ2Tmp6-MV4zVgaHw@mail.gmail.com> <caa39e0a12454046a1638aae190f0161@HQMAIL104.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <caa39e0a12454046a1638aae190f0161-wO81nVYWzR66sJks/06JalaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org" <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Oct 28, 2015 at 12:57 AM, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Sorry, Alex. Missed these.
>
>> -----Original Message-----
>> From: Alexandre Courbot [mailto:gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
>> Sent: Sunday, October 25, 2015 10:50 PM
>> To: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Cc: Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>; Stephen Warren
>> <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>; Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>; u-
>> boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Subject: Re: [PATCH 0/4] ARM: tegra: GPU WPR region support
>>
>> Ping Tom, how does this look to you?
> Looks pretty good, but what about saving the security_carveout reg settings back to the BCT or scratch regs so those settings will be restored on LP0 resume?

Absolutely - I am not familiar at all with BCT or scratch registers
(and U-boot in general :) ) though, could you point me to some part of
the code which I could use as a reference for this?

Also, how can I decide which mechanism to use over the other?

Thanks,
Alex.
