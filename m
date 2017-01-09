From: Jon Hunter <jonathanh@nvidia.com>
Subject: Tegra baseline test results for v4.10-rc1
Date: Mon, 9 Jan 2017 13:55:11 +0000
Message-ID: <485047a6-faed-c5db-32f4-eab5ce804eb7@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, kernel-build-reports@lists.linaro.org
List-Id: linux-tegra@vger.kernel.org

Here are some basic Tegra test results for Linux v4.10-rc1.
Logs and other details at:

    https://nvtb.github.io//linux/test_v4.10-rc1/20161225163102/


Test summary
------------

Build: zImage:
    Pass: ( 2/ 2): multi_v7_defconfig, tegra_defconfig

Build: Image:
    FAIL: ( 1/ 1): defconfig

Boot to userspace: multi_v7_defconfig:
    Pass: ( 5/ 5): tegra114-dalmore-a04, tegra124-jetson-tk1,
		   tegra124-nyan-big, tegra20-trimslice, tegra30-beaver

Boot to userspace: tegra_defconfig:
    Pass: ( 5/ 5): tegra114-dalmore-a04, tegra124-jetson-tk1,
		   tegra124-nyan-big, tegra20-trimslice, tegra30-beaver

PM: System suspend: multi_v7_defconfig:
    Pass: ( 5/ 5): tegra114-dalmore-a04, tegra124-jetson-tk1,
		   tegra124-nyan-big, tegra20-trimslice, tegra30-beaver

PM: System suspend: tegra_defconfig:
    Pass: ( 5/ 5): tegra114-dalmore-a04, tegra124-jetson-tk1,
		   tegra124-nyan-big, tegra20-trimslice, tegra30-beaver


vmlinux object size
(delta in bytes from test_v4.9 (69973b830859bc6529a7a0468ba0d80ee5117826)):
   text     data      bss    total  kernel
+181036   +83696  +131592  +396324  multi_v7_defconfig
 +89564   +38232     -680  +127116  tegra_defconfig


Boot-time memory difference
(delta in bytes from test_v4.9 (69973b830859bc6529a7a0468ba0d80ee5117826))
    avail    rsrvd     high    freed                board              kconfig                  dtb
    -144k     144k        .        . tegra114-dalmore-a04   multi_v7_defconfig     tegra114-dalmore
      -8k       8k        .        . tegra114-dalmore-a04      tegra_defconfig     tegra114-dalmore
    -144k     144k        .        .  tegra124-jetson-tk1   multi_v7_defconfig  tegra124-jetson-tk1
      -8k       8k        .        .  tegra124-jetson-tk1      tegra_defconfig  tegra124-jetson-tk1
    -144k     144k        .        .    tegra124-nyan-big   multi_v7_defconfig    tegra124-nyan-big
      -8k       8k        .        .    tegra124-nyan-big      tegra_defconfig    tegra124-nyan-big
    -144k     144k        .        .    tegra20-trimslice   multi_v7_defconfig    tegra20-trimslice
      -8k       8k        .        .    tegra20-trimslice      tegra_defconfig    tegra20-trimslice
    -144k     144k        .        .       tegra30-beaver   multi_v7_defconfig       tegra30-beaver
      -8k       8k        .        .       tegra30-beaver      tegra_defconfig       tegra30-beaver
