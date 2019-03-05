From: Embedded Engineer <embed786@gmail.com>
Subject: Re: Unstable Kernel behavior on an ARM based board
Date: Tue, 5 Mar 2019 16:05:14 +0500
Message-ID: <CA+_ZnZTzTGbVggEVMVkwJRAXrjg36Cms_3MiQciucRmMUpi2Hw@mail.gmail.com>
References: <CA+_ZnZR_aTubOh3PJEVK0hbcDxxfK3vW1eLoknVo1yRBExawsw@mail.gmail.com>
 <20190302115729.zbowssfwf4j7jf22@shell.armlinux.org.uk>
 <CA+_ZnZS48d0OOTQJjktieO-yf09Ch6MRQLFoCjRtUgcXMrjWmg@mail.gmail.com>
 <20190302123907.qoe46qs6qmx7qnjs@shell.armlinux.org.uk>
 <453072a9-52e2-7591-750f-624ca27e0bbf@gmx.net>
 <CA+_ZnZTrGCzPLKWZdxBzV1Z9b+c-Sp27DeUeV2XFW0+ZNZipGw@mail.gmail.com>
 <e530ec49-942d-a993-9081-901c0ce29c75@arm.com>
 <CA+_ZnZTCtghS+oUdXGW+h6SVD6nMPfsyDAvOwEugrhx6NJ3yFg@mail.gmail.com>
 <20190304142546.GB24676@ulmo>
 <CA+_ZnZQRV_7ytmbQZvWZUuyYiai0+Yo-pqV19RKebWAwSQokxQ@mail.gmail.com>
 <20190305103222.GB26369@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190305103222.GB26369@ulmo>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Vladimir Murzin <vladimir.murzin@arm.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 5, 2019 at 3:32 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> One thing besides memory timings in BCT that comes to mind that could be
> causing memory corruption are power supplies. Are you sure they're all
> correctly configured and enabled as required?

This part is 100% same as the Jetson TK1 on hardware end. And in
device tree, the node 'vdd_1v35_lp0: sd2' has already
'regulator-always-on' property. We also tried once by using
oscilloscope to check if the power drops/fluctuates during operation
but noticed that DDR chips were getting stable power.

> Does the upstream kernel and DTB boot reliably, even if it doesn't get
> you to a login prompt? Or does it also behave erratically like the
> downstream kernel and DTB that you have?

2 out of 10 times it behaved erratically, i.e. one time it stuck at
'Starting kernel ...' and the other time it stuck after following
prints:

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.0.0-rc8-next-20190304-dirty
(teresol@ubuntu) (gcc version 6.1.1 20160711 (Linaro GCC 6.1-2016.08))
#2 SMP PREEMPT Tue Mar 5 02:15:14 PST 2019
[    0.000000] CPU: ARMv7 Processor [413fc0f3] revision 3 (ARMv7), cr=10c5387d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction cache
[    0.000000] OF: fdt: Machine model: NVIDIA Tegra124 Jetson TK1
[    0.000000] earlycon: uart0 at MMIO 0x70006300 (options '115200n8')
[    0.000000] printk: bootconsole [uart0] enabled
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] cma: Reserved 64 MiB at 0xac000000
