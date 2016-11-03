From: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 1/6] clk: tegra: add TEGRA20_CLK_NOR to init table
Date: Thu, 3 Nov 2016 13:30:23 +0100
Message-ID: <CALw8SCWC7RmNLVv4vxO9xw3jHVkgCaevbL61sJcpcva9CiaAVQ@mail.gmail.com>
References: <1477576872-2665-1-git-send-email-mirza.krak@gmail.com>
 <1477576872-2665-2-git-send-email-mirza.krak@gmail.com> <df12a1f0-316d-64a4-54fe-f7559742eeca@nvidia.com>
 <CALw8SCWyLAw=yZ-W_nAFuDAazpa4HJfZuzqLDKQKYLWjV5JzYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALw8SCWyLAw=yZ-W_nAFuDAazpa4HJfZuzqLDKQKYLWjV5JzYw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

2016-11-03 13:26 GMT+01:00 Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> 2016-11-03 11:06 GMT+01:00 Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>:
>> Hi Mirza,
>>
>> On 27/10/16 15:01, Mirza Krak wrote:
>>>
>>> From: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>
>>> Add TEGRA20_CLK_NOR to init table and set default rate to 92 MHz which
>>> is max rate.
>>>
>>> The maximum rate value of 92 MHz is pulled from the downstream L4T
>>> kernel.
>>
>>
>> Thanks for adding this. I assume that this is from an L4T r16 release with a
>> v3.1 kernel. I had a quick poke through the kernel sources for v3.1 but was
>> unable to see where this is set. Obviously v3.1 did not have CCF and so
>> everything seems to be in the arch/arm/mach-tegra directory for setting up
>> clocks. Can you point me to the appropriate sources so I can ACK this?
>
> I use the kernel sources provided by Toradex, and these sources are
> based on L4T r16 release.
>
> http://git.toradex.com/cgit/linux-toradex.git/tree/arch/arm/mach-tegra/tegra2_clocks.c?h=tegra#n2463

Ops, pre-mature send.

I also added Marcel from Toradex on CC.

The link to the source are [1] for Tegra2 and  [2] for Tegra3.

[1]. http://git.toradex.com/cgit/linux-toradex.git/tree/arch/arm/mach-tegra/tegra2_clocks.c?h=tegra#n2463
[2]. http://git.toradex.com/cgit/linux-toradex.git/tree/arch/arm/mach-tegra/tegra3_clocks.c?h=tegra#n4353

Best Regards
Mirza
