From: kbuild test robot <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: [arm-tegra:for-3.9/arm-timer-rework 11/12]
 arch/arm/mach-imx/imx31-dt.c:36:2: warning: initialization from
 incompatible pointer type
Date: Wed, 30 Jan 2013 02:55:57 +0800
Message-ID: <51081b3d.Rfc8JxYDG0uLRpnk%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git for-3.9/arm-timer-rework
head:   ae278a935f086775e8ae31a8ec9f7224ea25ea3c
commit: 6bb27d7349db51b50c40534710fe164ca0d58902 [11/12] ARM: delete struct sys_timer
config: make ARCH=arm imx_v6_v7_defconfig

All warnings:

>> arch/arm/mach-imx/imx31-dt.c:36:2: warning: initialization from incompatible pointer type [enabled by default]
>> arch/arm/mach-imx/imx31-dt.c:36:2: warning: (near initialization for '__mach_desc_IMX31_DT.init_time') [enabled by default]

vim +36 arch/arm/mach-imx/imx31-dt.c

    20	
    21	static const struct of_dev_auxdata imx31_auxdata_lookup[] __initconst = {
    22		OF_DEV_AUXDATA("fsl,imx31-uart", MX31_UART1_BASE_ADDR,
    23				"imx21-uart.0", NULL),
    24		OF_DEV_AUXDATA("fsl,imx31-uart", MX31_UART2_BASE_ADDR,
    25				"imx21-uart.1", NULL),
    26		OF_DEV_AUXDATA("fsl,imx31-uart", MX31_UART3_BASE_ADDR,
    27				"imx21-uart.2", NULL),
    28		OF_DEV_AUXDATA("fsl,imx31-uart", MX31_UART4_BASE_ADDR,
    29				"imx21-uart.3", NULL),
    30		OF_DEV_AUXDATA("fsl,imx31-uart", MX31_UART5_BASE_ADDR,
    31				"imx21-uart.4", NULL),
    32		{ /* sentinel */ }
    33	};
    34	
    35	static void __init imx31_dt_init(void)
  > 36	{
    37		of_platform_populate(NULL, of_default_bus_match_table,
    38				     imx31_auxdata_lookup, NULL);
    39	}
    40	
    41	static const char *imx31_dt_board_compat[] __initdata = {
    42		"fsl,imx31",
    43		NULL
    44	};

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
