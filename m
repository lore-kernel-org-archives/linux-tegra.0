From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH v8 00/19] Consolidate and improve NVIDIA Tegra CPUIDLE
 driver(s)
Date: Tue, 10 Dec 2019 03:35:49 +0100
Message-ID: <20191210023549.GA15246@qmqm.qmqm.pl>
References: <20191203004116.11771-1-digetx@gmail.com>
 <20191207215216.GA9561@qmqm.qmqm.pl>
 <0b3a861d-e5e8-ddca-ac60-0a3c61a9d9dc@gmail.com>
 <20191209160420.GA24097@qmqm.qmqm.pl>
 <323f5f70-5249-e75a-98cc-7fdca2d375c2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <323f5f70-5249-e75a-98cc-7fdca2d375c2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Dec 10, 2019 at 12:22:18AM +0300, Dmitry Osipenko wrote:
> 09.12.2019 19:04, Michał Mirosław пишет:
> > On Sun, Dec 08, 2019 at 01:56:14AM +0300, Dmitry Osipenko wrote:
> >> 08.12.2019 00:52, Michał Mirosław пишет:
> >>> On Tue, Dec 03, 2019 at 03:40:57AM +0300, Dmitry Osipenko wrote:
> >>>> Hello,
> >>>>
> >>>> This series does the following:
> >>>>
> >>>>   1. Unifies Tegra20/30/114 drivers into a single driver and moves it out
> >>>>      into common drivers/cpuidle/ directory.
> >>>>
> >>>>   2. Enables CPU cluster power-down idling state on Tegra30.
> >>>>
> >>>> In the end there is a quite nice clean up of the Tegra CPUIDLE drivers
> >>>> and of the Tegra's arch code in general. Please review, thanks!
> >>>
> >>> I did a quick smoke test for this series on top of Linus' master:
> >>>  - rebuilding with the patches applied, CONFIG_ARM_TEGRA_CPUIDLE=n - works
> >>>  - building with CONFIG_ARM_TEGRA_CPUIDLE=y - doesn't boot
> >>>
> >>> The hang is somewhere early in the boot process, before simplefb can
> >>> take the console and show any logs. If I get BOOTFB to work again I might
> >>> be able to get some more info.
> >>
> >> Thank you very much for trying these patches!
> >>
> >> Could you please try to make ARM_TEGRA_CPUIDLE "tristate" in the Kconfig
> >> and compile it as a loadable module? That way you'll get framebuffer
> >> shown before the hang happens.
> >>
> >> Does LP2 suspend/resume work for you? There should be
> >> "nvidia,suspend-mode = <2>" in the PMC's node of device-tree.
> > 
> > Not at the moment. I also tried suspend-mode = <1> and <0>, but it
> > made no difference.
> 
> If LP2 doesn't work, then it explains why you're getting the hang.
> 
> Are you using TF300T for the testing? I'm recalling that LP2 worked for
> you sometime ago on TF300T, maybe some offending change was introduced
> since then. Could you please try to do the git bisection or at least
> find out what is the last good kernel version?
> 
> I rebased this series on a recent linux-next and you could find the
> rebased patches here [1].
> 
> [1] https://github.com/grate-driver/linux/commits/master
> 
> With [1] you should be able to remove "nvidia,suspend-mode" property
> from the device-tree to get cpuidle working with the disabled CC6 state
> (LP2). Could you please check that at least disabled CC6 works for you?

I tested suspend with your tree merged, but CONFIG_TEGRA_CPUIDLE=n. LP2
seems to work [1]. The same tree with CONFIG_TEGRA_CPUIDLE=y doesn't
boot. I'll try comparing DTs, but other than that I'm blocked on BOOTFB now.

Best Regards,
Michał Mirosław

[1] rtcwake -s 3 -d /dev/rtc0 -v -m mem

(...)
[ 2710.157919] PM: suspend entry (deep)
[ 2710.161205] Filesystems sync: 0.000 seconds
[ 2710.176677] Freezing user space processes ... (elapsed 0.001 seconds) done.
[ 2710.178342] OOM killer disabled.
[ 2710.178527] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
[ 2710.347871] Disabling non-boot CPUs ...
[ 2710.349160] IRQ 18: no longer affine to CPU1
[ 2710.352499] IRQ 19: no longer affine to CPU2
[ 2710.370059] IRQ 20: no longer affine to CPU3
[ 2710.371284] Entering suspend state LP2
[ 2710.371556] Enabling non-boot CPUs ...
[ 2710.373157] CPU1 is up
[ 2710.374598] CPU2 is up
[ 2710.375996] CPU3 is up
[ 2710.462876] OOM killer enabled.
[ 2710.463018] Restarting tasks ...
[ 2710.463880] tegra-devfreq 6000c800.actmon: Failed to get emc clock
[ 2710.464509] done.
[ 2710.552824] asus-ec 1-0015: model         : ASUS-TF201-PAD
[ 2710.558345] asus-ec 1-0015: FW version    : PAD-EC20T-0216
[ 2710.562942] asus-ec 1-0015: Config format : ECFG-0001
[ 2710.567651] asus-ec 1-0015: HW version    : TF201-PAD-SKU1
[ 2710.572488] asus-ec 1-0015: EC FW behaviour: susb on when system wakeup
[ 2710.769796] atkbd serio1: no of_node; not parsing pinctrl DT
[ 2710.835629] asus-ec 5-0019: model         : ASUS-TF201-DOCK
[ 2710.838686] asus-ec 5-0019: FW version    : DOCK-EC20N-0207
[ 2710.841865] asus-ec 5-0019: Config format : ECFG-0001
[ 2710.844271] asus-ec 5-0019: HW version    : PCBA-SKU-2
[ 2710.847950] asus-ec 5-0019: EC FW behaviour: susb on when receive ec_req
[ 2711.040935] PM: suspend exit
