From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 1/2] pinctrl: tegra: Add MIPI pad control
Date: Thu, 18 Sep 2014 13:42:42 -0600
Message-ID: <541B35B2.9050509@wwwdotorg.org>
References: <54088B53.6040802@wwwdotorg.org> <1410292726-9179-1-git-send-email-seanpaul@chromium.org> <54107770.708@wwwdotorg.org> <CAOw6vbJimj8QfQSSgurQdX5rtwB78bJzsHdd7su6ORJ_H988yw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOw6vbJimj8QfQSSgurQdX5rtwB78bJzsHdd7su6ORJ_H988yw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, davidriley-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/18/2014 12:56 PM, Sean Paul wrote:
> On Wed, Sep 10, 2014 at 12:08 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> On 09/09/2014 01:58 PM, Sean Paul wrote:
>>>
>>> This patch adds MIPI CSI/DSIB pad control mux register
>>> from the APB misc block to tegra pinctrl.
>>>
>>> Without writing to this register, the dsib pads are
>>> muxed as csi, and cannot be used.
>>>
>>> The register is not yet documented in the TRM, here is
>>> the description:
>>>
>>> 70000820: APB_MISC_GP_MIPI_PAD_CTRL_0
>>>          [31:02] RESERVED
>>>          [01:01] DSIB_MODE       [CSI=0,DSIB=1]
>>>          [00:00] RESERVED
>>
>>
>> These two patches look good to me.
>>
>> I think we need to take both patches through the Tegra tree, since if the
>> Tegra DTs start referencing the new pingroup, the driver must already know
>> about it or it'll error out. So, I hope for an ack from Linus.
>>
>> Of course, this only applies if you're sending patches to board .dts files
>> to use the new feature for 3.18; if not, we can apply the pinctrl driver
>> through the pinctrl tree instead, and wait until 3.19 to use the new
>> pingroup. I assume you'll want to use the new feature soon though:-)
>
> I don't have any board .dts patches ready for upstream consumption
> quite yet. Feel free to use whichever path to mainline you see fit.

I've actually just sent the Tegra pull requests for 3.18 today. Linus, 
if you want to take this whole series (or at least patch 1/2) through 
the pinctrl tree, that would be great. The patches will then already be 
there when we need them as a basis for any DT patches in the Tegra tree 
for 3.19.

Patch 2,
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
