From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [RFC PATCH 3/3] clk: tegra: Implement Tegra124 shared/cbus clks
Date: Tue, 13 May 2014 14:52:15 -0700
Message-ID: <CAL1qeaHMcUsqsY75584P6vbzex0FiHc1YtsDKbDj923Hxw5Mkw@mail.gmail.com>
References: <1399990023-30318-1-git-send-email-pdeschrijver@nvidia.com>
	<1399990023-30318-4-git-send-email-pdeschrijver@nvidia.com>
	<53725FED.7050303@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53725FED.7050303-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, May 13, 2014 at 11:09 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 05/13/2014 08:06 AM, Peter De Schrijver wrote:
>> Add shared and cbus clocks to the Tegra124 clock implementation.
>
>> diff --git a/include/dt-bindings/clock/tegra124-car.h b/include/dt-bindings/clock/tegra124-car.h
>
>> +#define TEGRA124_CLK_C2BUS 401
>> +#define TEGRA124_CLK_C3BUS 402
>> +#define TEGRA124_CLK_GR3D_CBUS 403
>> +#define TEGRA124_CLK_GR2D_CBUS 404
> ...
>
> I worry about this a bit. IIUC, these clocks don't actually exist in HW,
> but are more a way of SW applying policy to the clock that do exist in
> HW. As such, I'm not convinced it's a good idea to expose these clock
> IDS to DT, since DT is supposed to represent the HW, and not be
> influenced by internal SW implementation details.

The purpose of these IDs, I believe, is to be used in bindings for consumer
devices so that the driver can get() the shared clock.

> Do any DTs actually need to used these new clock IDs?

AFAIK no driver currently supports the use of these shared clocks, but
they could.
In the chromium kernel, for example, we have devices which require an
"emc" clock
in their bindings that the driver uses to vote on SDRAM frequency.  I
guess we could
avoid specifying these clocks in the DT by creating aliases for them,
but I'm not sure
that's any better.

> I don't think we could actually use these value in e.g. tegra124.dtsi's clocks
> properties, since these clocks don't exist in HW.

The DT IDs are simply used to look up the struct clk corresponding to the ID
in the per-SoC clks array.  They aren't used for indexing into a hardware
register or anything like that, though they happen to currently be assigned so
that they match the corresponding clock's hardware ID.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
