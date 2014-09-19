From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/2] pinctrl: tegra: Add MIPI pad control
Date: Fri, 19 Sep 2014 10:29:07 -0700
Message-ID: <CACRpkdbasvyc1M6ODpBoyTvri55gqQ=8Hc6Vi71p-r2sV_B5ow@mail.gmail.com>
References: <54088B53.6040802@wwwdotorg.org>
	<1410292726-9179-1-git-send-email-seanpaul@chromium.org>
	<54107770.708@wwwdotorg.org>
	<CAOw6vbJimj8QfQSSgurQdX5rtwB78bJzsHdd7su6ORJ_H988yw@mail.gmail.com>
	<541B35B2.9050509@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <541B35B2.9050509-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, davidriley-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Sep 18, 2014 at 12:42 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 09/18/2014 12:56 PM, Sean Paul wrote:

>> I don't have any board .dts patches ready for upstream consumption
>> quite yet. Feel free to use whichever path to mainline you see fit.
>
> I've actually just sent the Tegra pull requests for 3.18 today. Linus, if
> you want to take this whole series (or at least patch 1/2) through the
> pinctrl tree, that would be great.

I've applied patch 1/2 to the pinctrl tree

> The patches will then already be there
> when we need them as a basis for any DT patches in the Tegra tree for 3.19.
>
> Patch 2,
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I prefer not to take DTS patches through pinctrl, I'll let this go through
the tegra tree next cycle.

But I take it that I can put your ACK on patch 1/2.

Yours,
Linus Walleij
