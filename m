From: Paul Walmsley <paul@pwsan.com>
Subject: Tegra baseline test results for v4.1-rc5
Date: Tue, 26 May 2015 07:53:56 +0000 (UTC)
Message-ID: <alpine.DEB.2.02.1505260741350.29169@utopia.booyaka.com>
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
To: linux-tegra@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org
List-Id: linux-tegra@vger.kernel.org


Here are some basic Tegra test results for Linux v4.1-rc5.
Logs and other details at:

    http://nvt.pwsan.com/pub/linux/testlogs/test_v4.1-rc5/20150524183102/


Test summary
------------

Build: zImage:
    Pass: ( 2/ 2): multi_v7_defconfig, tegra_defconfig

Build: Image:
    Pass: ( 1/ 1): defconfig

Boot to userspace: defconfig:
    Pass: ( 1/ 1): qemu-vexpress64

Boot to userspace: multi_v7_defconfig:
    Pass: ( 4/ 4): tegra114-dalmore-a04, tegra124-jetson-tk1,
		   tegra20-trimslice, tegra30-beaver

Boot to userspace: tegra_defconfig:
    Pass: ( 4/ 4): tegra114-dalmore-a04, tegra124-jetson-tk1,
		   tegra20-trimslice, tegra30-beaver


vmlinux object size
(delta in bytes from test_v4.1-rc4 (e26081808edadfd257c6c9d81014e3b25e9a6118)):
   text     data      bss    total  kernel
 +33474   +99136        0  +132610  defconfig
 +28162   +52928        0   +81090  multi_v7_defconfig
  +2690        0        0    +2690  tegra_defconfig


Boot-time memory difference
(delta in bytes from test_v4.1-rc4 (e26081808edadfd257c6c9d81014e3b25e9a6118))
    avail    rsrvd     high    freed                board              kconfig                  dtb
        .        .        .        .      qemu-vexpress64            defconfig           __internal
     -76k      76k        .      44k tegra114-dalmore-a04   multi_v7_defconfig     tegra114-dalmore
        .        .        .      -4k tegra114-dalmore-a04      tegra_defconfig     tegra114-dalmore
     -76k      76k        .      44k  tegra124-jetson-tk1   multi_v7_defconfig  tegra124-jetson-tk1
        .        .        .      -4k  tegra124-jetson-tk1      tegra_defconfig  tegra124-jetson-tk1
     -76k      76k        .      44k    tegra20-trimslice   multi_v7_defconfig    tegra20-trimslice
        .        .        .      -4k    tegra20-trimslice      tegra_defconfig    tegra20-trimslice
     -76k      76k        .      44k       tegra30-beaver   multi_v7_defconfig       tegra30-beaver
        .        .        .      -4k       tegra30-beaver      tegra_defconfig       tegra30-beaver
