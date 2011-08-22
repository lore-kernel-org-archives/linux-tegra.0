From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: error: implicit declaration of function 'machine_is_ventana'
Date: Mon, 22 Aug 2011 16:11:50 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04B24A376A@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Russell King - ARM Linux (linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org)" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Russell,

Commit 46dcfc806a9f6834e6007449eac175f781058c49 "ARM: Update mach-types"
removed the entry for Ventana (2927). In turn, this broke compilation of
sound/soc/tegra/tegra_wm8903.c, since that calls machine_is_ventana().
It looks like the machine is still registered at
http://www.arm.linux.org.uk/developer/machines/. Can you explain what the
removal policy is for arch/arm/tools/mach-types?

Thanks!

-- 
nvpublic
