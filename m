From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Enable CPUFreq support for Tegra124
 Chromebooks
Date: Fri, 20 Nov 2015 15:20:21 +0000
Message-ID: <564F3A35.3070708@nvidia.com>
References: <1433331821-9648-1-git-send-email-jonathanh@nvidia.com>
 <556EE8B0.2060205@nvidia.com> <55A3B848.2080205@nvidia.com>
 <CAAObsKA0N50gfPA9sMZfnM8N+N9Oo-YHMCDdF7JdWjpxXtFJbA@mail.gmail.com>
 <20150915081234.GA25970@ulmo.nvidia.com>
 <CAAObsKAuJz6KoexA2VHPxxVCZ9PbUAFWUx6tSOmdPYq50u_=-g@mail.gmail.com>
 <5639F728.6090808@nvidia.com> <5639F7EC.2000508@nvidia.com>
 <563A06B4.2070005@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <563A06B4.2070005-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, mikko.perttunen-/1wQRMveznE@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 04/11/15 13:23, Jon Hunter wrote:
> 
> On 04/11/15 12:19, Jon Hunter wrote:
>> Correcting Mikko's email ...
>>
>> On 04/11/15 12:16, Jon Hunter wrote:
>>>
>>> On 15/09/15 10:00, Tomeu Vizoso wrote:
>>>> On 15 September 2015 at 10:12, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>>> On Thu, Sep 03, 2015 at 03:40:45PM +0200, Tomeu Vizoso wrote:
>>>>>> On 13 July 2015 at 15:08, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>>>>>> On 03/06/15 12:44, Jon Hunter wrote:
>>>>>>>> Adding LAKML. Jon
>>>>>>>>
>>>>>>>> On 03/06/15 12:43, Jon Hunter wrote:
>>>>>>>>> Add the device-tree DFLL clock node and CPU regulator phandle for
>>>>>>>>> tegra124 chromebooks to enable CPUFreq support on these boards.
>>>>>>
>>>>>> Ping.
>>>>>>
>>>>>> Thanks,
>>>>>
>>>>> Sorry that this has gone unnoticed for so long. I've applied it now to
>>>>> the for-4.4/dt branch.
>>>>>
>>>>> Tomeu, do you want me to add your Tested-by, Reviewed-by or Acked-by
>>>>> before I push this out?
>>>>
>>>> I haven't done proper tests, but I have tested for several weeks a
>>>> branch containing these changes on a nyan-big and have found no
>>>> issues.
>>>>
>>>> You can add my Reviewed-by though. Sorry for not having made this clear.
>>>
>>> I have noticed that system suspend to LP1 is not working on the nyan-big
>>> with linux-next and never exits suspend. It appears that this patch is
>>> the culprit. I tested cpufreq was changing the frequency as expected but
>>> I did not test suspend.
> 
> By the way, LP2 works fine with this change, it is just when LP1 is
> enabled (which is the default).

Quick update on this ... it appears that the cause of the lock-up is
related to pll_x (default pll that clocks the cpu cluster before
switching to the dfll). On the jetson-tk1 the pll_x is running at 696MHz
where as on the nyan-big it is running at 2.1GHz. Although the pll is
disabled when switching to dfll, having it configured for 2.1GHz on the
nyan-big is causing a hang during suspend if the dfll is running at much
lower frequencies (>1.5GHz) than the pll_x. So seems like the CPU
voltage is too low for the pll_x, however, it should be disabled?!?

If I hack the cpufreq code to set the pll_x to 696MHz after switching to
the dfll on the nyan-big then the problem goes away ...

diff --git a/drivers/cpufreq/tegra124-cpufreq.c
b/drivers/cpufreq/tegra124-cpufreq.c
index 20bcceb58ccc..a87cef4071e8 100644
--- a/drivers/cpufreq/tegra124-cpufreq.c
+++ b/drivers/cpufreq/tegra124-cpufreq.c
@@ -53,6 +53,10 @@ static int tegra124_cpu_switch_to_dfll(struct
tegra124_cpufreq_priv *priv)

        clk_set_parent(priv->cpu_clk, priv->dfll_clk);

+       ret = clk_set_rate(priv->pllx_clk, 696000000);
+       if (ret)
+               return ret;
+
        return 0;

Need to figure out if the suspend code is touching the pll_x.

Jon
