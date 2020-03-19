From: LABBE Corentin <clabbe-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: tegra124-jetson-tk1: sata doesnt work since 5.2
Date: Thu, 19 Mar 2020 08:44:01 +0100
Message-ID: <20200319074401.GA4116@Red>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-ide-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello

sata doesnt work on tegra124-jetson-tk1 on next and master and at least since 5.2 (but 5.1 works).
[    0.492810] +5V_SATA: supplied by +5V_SYS
[    0.493230] +12V_SATA: supplied by +VDD_MUX
[    2.088675] tegra-ahci 70027000.sata: 70027000.sata supply ahci not found, using dummy regulator
[    2.097643] tegra-ahci 70027000.sata: 70027000.sata supply phy not found, using dummy regulator
[    3.314776] tegra-ahci 70027000.sata: 70027000.sata supply ahci not found, using dummy regulator
[    3.323658] tegra-ahci 70027000.sata: 70027000.sata supply phy not found, using dummy regulator
[    5.236964] tegra-ahci 70027000.sata: 70027000.sata supply ahci not found, using dummy regulator
[    5.245867] tegra-ahci 70027000.sata: 70027000.sata supply phy not found, using dummy regulator
[    5.254706] tegra-ahci 70027000.sata: 70027000.sata supply target not found, using dummy regulator
[    5.310270] phy phy-sata.6: phy poweron failed --> -110
[    5.315604] tegra-ahci 70027000.sata: failed to power on AHCI controller: -110
[    5.323022] tegra-ahci: probe of 70027000.sata failed with error -110
[   35.694269] +5V_SATA: disabling
[   35.697438] +12V_SATA: disabling

I have bisected this problem:
git bisect start
# bad: [22c58fd70ca48a29505922b1563826593b08cc00] Merge tag 'armsoc-soc' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect bad 22c58fd70ca48a29505922b1563826593b08cc00
# good: [67e38f578aaebf34fc1278bbe45a78ee8c73dd33] ARM: ep93xx: move pinctrl interfaces into include/linux/soc
git bisect good 67e38f578aaebf34fc1278bbe45a78ee8c73dd33
# good: [80f232121b69cc69a31ccb2b38c1665d770b0710] Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next
git bisect good 80f232121b69cc69a31ccb2b38c1665d770b0710
# good: [e57ccca1ba33e1d92cc3bbf8b6304a46948844b0] Merge tag 'sound-5.2-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
git bisect good e57ccca1ba33e1d92cc3bbf8b6304a46948844b0
# bad: [983dfa4b6ee556563f7963348e4e2f97fc8a15b8] Merge tag 'for-linus-5.2-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/rw/uml
git bisect bad 983dfa4b6ee556563f7963348e4e2f97fc8a15b8
# good: [8e4ff713ce313dcabbb60e6ede1ffc193e67631f] Merge tag 'rtc-5.2' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux
git bisect good 8e4ff713ce313dcabbb60e6ede1ffc193e67631f
# bad: [b970afcfcabd63cd3832e95db096439c177c3592] Merge tag 'powerpc-5.2-1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/powerpc/linux
git bisect bad b970afcfcabd63cd3832e95db096439c177c3592
# bad: [601e6bcc4ef02bda2831d5ac8133947b5edf597b] Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net
git bisect bad 601e6bcc4ef02bda2831d5ac8133947b5edf597b
# good: [7e9c62bdb41af76974d594da89854a6aba645e58] Merge branches 'clk-sa', 'clk-aspeed', 'clk-samsung', 'clk-ingenic' and 'clk-zynq' into clk-next
git bisect good 7e9c62bdb41af76974d594da89854a6aba645e58
# bad: [0caf000817353cfc5db22363ecdac63b83d3a3f9] Merge branch 'clk-ti' into clk-next
git bisect bad 0caf000817353cfc5db22363ecdac63b83d3a3f9
# good: [5816b74581b45cf086a84ab14e13354a65e8e22c] Merge branches 'clk-hisi', 'clk-lochnagar', 'clk-allwinner', 'clk-rockchip' and 'clk-qoriq' into clk-next
git bisect good 5816b74581b45cf086a84ab14e13354a65e8e22c
# good: [7b4c162e03d47e037f8ee773c3e300eefb599a83] clk: at91: Mark struct clk_range as const
git bisect good 7b4c162e03d47e037f8ee773c3e300eefb599a83
# bad: [e71f4d385878671991e200083c7d30eb4ca8e99a] clk: tegra: divider: Mark Memory Controller clock as read-only
git bisect bad e71f4d385878671991e200083c7d30eb4ca8e99a
# bad: [924ee3d551c9deb16090230b824988bd37e72aa8] clk: tegra: emc: Don't enable EMC clock manually
git bisect bad 924ee3d551c9deb16090230b824988bd37e72aa8
# bad: [40db569d6769ffa3864fd1b89616b1a7323568a8] clk: tegra: Fix PLLM programming on Tegra124+ when PMC overrides divider
git bisect bad 40db569d6769ffa3864fd1b89616b1a7323568a8
# bad: [bff1cef5f23afbe49f5ebd766980dc612f5e9d0a] clk: tegra: Don't enable already enabled PLLs
git bisect bad bff1cef5f23afbe49f5ebd766980dc612f5e9d0a
# first bad commit: [bff1cef5f23afbe49f5ebd766980dc612f5e9d0a] clk: tegra: Don't enable already enabled PLLs

Basic reverting of this patch is impossible.

Regards
