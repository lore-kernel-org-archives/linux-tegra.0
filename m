From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 1/4] clk: tegra: Move mipi-cal initialization into clk-tegra1[12]4.c
Date: Tue, 7 Oct 2014 13:07:29 -0700
Message-ID: <CAOw6vbKozeDR+2KCTwhwRoNY7+k=FB96Vc7sHXKy4SFYMVEeHQ@mail.gmail.com>
References: <1410360725-4286-1-git-send-email-seanpaul@chromium.org>
 <1410360725-4286-2-git-send-email-seanpaul@chromium.org> <541079A8.9080304@wwwdotorg.org>
 <20140918112621.GK26779@tbergstrom-lnx.Nvidia.com> <CAOw6vb+pyD9fk63rQHV5S3ar2hrWKb-HRf6ZP8odxbvz7FJ+Vw@mail.gmail.com>
 <20140919112802.GO26779@tbergstrom-lnx.Nvidia.com> <CAOw6vbLxNXSw3xfLZk4KKXGSJhbrHR9LEAPJ3hKHZMCN6WeV0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOw6vbLxNXSw3xfLZk4KKXGSJhbrHR9LEAPJ3hKHZMCN6WeV0w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Oct 1, 2014 at 11:38 AM, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> On Fri, Sep 19, 2014 at 7:28 AM, Peter De Schrijver
> <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> On Thu, Sep 18, 2014 at 08:59:53PM +0200, Sean Paul wrote:
>>> On Thu, Sep 18, 2014 at 7:26 AM, Peter De Schrijver
>>> <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>> > On Wed, Sep 10, 2014 at 06:17:44PM +0200, Stephen Warren wrote:
>>> >> On 09/10/2014 08:52 AM, Sean Paul wrote:
>>> >> > This patch moves the mipi-cal gate registration down into the SoC
>>> >> > specific files to reflect the different in parent between them.
>>> >> >
>>> >> > Without this change, MIPI calibration will fail on K1 devices if
>>> >> > the 72MHz clock is off.
>>> >>
>>> >> This isn't a problem with this patch per se, but I notice that what's
>>> >> removed from clk-tegra-periph.c is data in a table, whereas open-coded
>>> >> calls are added to clk-tegra*.c. It'd be nice if the open-coded calls in
>>> >> clk-tegra*.c could be converted to a table (simply with SoC-specific
>>> >> data) and processed by the same function. Peter, would that make sense?
>>> >
>>> > Maybe yes. I will look into this. For this patch, it would make more sense
>>> > to keep the entry in clk-tegra-periph.c as it can be used by both Tegra124
>>> > and Tegra132.
>>> >
>>>
>>> How do you suggest we switch the parent based on 124 vs 132 if it
>>> remains in clk-tegra-periph.c?
>>>
>>
>> I would change the parent of mipi-cal in clk-tegra-periph.c to clk72mhz and
>> use a different mechanism for Tegra114.
>>
>
> Hi Peter,
> Sorry for the delay, I'm just getting back to this now.
>
> I'm still unclear on how you propose we alter mipi-cal in tegra114.
> AFAICT, we can't re-parent it since it's a gate clock. Can you please
> be a little more specific (and forgive my ignorance wrt this driver,
> it's still new to me)?
>

Ping. Can I get some advice on this?

I've also got 2 other outstanding tegra clock patches that have not
received a response:
- clk: tegra124: Add init data for dsi lp clocks
- clk/tegra: Fix mux typo, s/pll_m/clk_m/

Sean


> Sean
>
>
>
>> Cheers,
>>
>> Peter.
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
