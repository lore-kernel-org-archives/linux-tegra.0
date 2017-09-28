From: Linus =?utf-8?Q?L=C3=BCssing?= <linus.luessing@c0d3.blue>
Subject: Build error for NVIDIA Tegra DRM since 4.14-rc1
Date: Thu, 28 Sep 2017 09:10:54 +0200
Message-ID: <20170928071054.GD6726@otheros>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
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
Cc: David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi,

Sorry, did not search for the exact commit yet, but since v4.14-rc1
I get a build error when trying to build the ARM multi_v7_defconfig
target:

~~~~~~~~~~
$ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- LOADADDR=0x00208000 zImage uImage modules dtbs
[...]
  CHK     include/config/kernel.release
  CHK     include/generated/uapi/linux/version.h
  CHK     include/generated/utsrelease.h
  CHK     include/generated/bounds.h
  CHK     include/generated/timeconst.h
  CHK     include/generated/asm-offsets.h
  CALL    scripts/checksyscalls.sh
  CHK     scripts/mod/devicetable-offsets.h
  CHK     include/generated/compile.h
  CHK     include/generated/at91_pm_data-offsets.h
  CC      drivers/gpu/drm/tegra/trace.o
In file included from drivers/gpu/drm/tegra/trace.h:68:0,
                 from drivers/gpu/drm/tegra/trace.c:2:
./include/trace/define_trace.h:88:42: fatal error: ./trace.h: No such file or directory
 #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
                                          ^
compilation terminated.
scripts/Makefile.build:311: recipe for target 'drivers/gpu/drm/tegra/trace.o' failed
make[4]: *** [drivers/gpu/drm/tegra/trace.o] Error 1
scripts/Makefile.build:570: recipe for target 'drivers/gpu/drm/tegra' failed
make[3]: *** [drivers/gpu/drm/tegra] Error 2
scripts/Makefile.build:570: recipe for target 'drivers/gpu/drm' failed
make[2]: *** [drivers/gpu/drm] Error 2
scripts/Makefile.build:570: recipe for target 'drivers/gpu' failed
make[1]: *** [drivers/gpu] Error 2
Makefile:1019: recipe for target 'drivers' failed
make: *** [drivers] Error 2
~~~~~~~~~~

v4.14-rc2 fails, too. v4.13.2 and v4.13.3 worked fine with multi_v7_defconfig.

Setting CONFIG_DRM_TEGRA=n for v4.14-rc1 or v4.14-rc2 helps for
the build to succeed, too.

Regards, Linus
