From: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 1/3] ARM: add cpufreq transiton notifier to adjust
 loops_per_jiffy for smp
Date: Tue, 11 Sep 2012 17:29:05 +0530
Message-ID: <504F2789.1070006@nvidia.com>
References: <1344577046-14847-1-git-send-email-shawn.guo@linaro.org> <1344577046-14847-2-git-send-email-shawn.guo@linaro.org> <5049252D.9000802@wwwdotorg.org> <20120907025847.GI26709@S2101-09.ap.freescale.net> <504A26E4.4070600@wwwdotorg.org> <20120910011741.GP26709@S2101-09.ap.freescale.net> <504E20BE.8050107@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <504E20BE.8050107-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Kevin Hilman <khilman-l0cyMroinI0@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "cpufreq-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <cpufreq-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shilimkar Santosh <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Richard Zhao <richard.zhao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Monday 10 September 2012 10:47 PM, Stephen Warren wrote:
> On 09/09/2012 07:17 PM, Shawn Guo wrote:
>> On Fri, Sep 07, 2012 at 10:55:00AM -0600, Stephen Warren wrote:
>>> Yes, that does solve the problem (well, with s/late_init/late_initcall/).
>>>
>>> As you imply, that change wouldn't help if cpu-tegra.c was built as a
>>> module.
>> I doubt that.  Have you confirmed it with testing?  When you install
>> module cpu-tegra, the pcie initialization has been done, right?
> Never mind, the code can't be built as a module anyway.
>
> Aside from that, I misinterpreted your test patch, and thought that it
> was moving the Tegra cpufreq driver initialization earlier, but it's
> actually moving it later, and in fact by chance after PCIe
> initialization, which explains why it solves the issue.
>
> I think the root of the problem is that cpufreq is lowering the CPU
> frequency, yet the patch which converted Tegra to the common clock
> framework removed the code that actually changes the CPU clock rate. So,
> cpufreq thinks the CPU is running at e.g. 216MHz, but it's actually
> still running at 1.0GHz, and hence re-calculating the delay loops breaks
> things, since delays aren't as long as the system thinks they are. The
> variability is due to whether lowering the CPU frequency just happens to
> occur before or after the PCIe controller is initialized.
>
> Prashant, are you able to fix the clock driver deficiency within the
> next 2-3 days or so (so I can include the fix in the pull requests I
> send for 3.7, which need to be sent before the end of the week)? Or, do
> we need to disable cpufreq for Tegra because of this?

Your fix looks good to me except the concern I have mentioned in reply to that patch.
