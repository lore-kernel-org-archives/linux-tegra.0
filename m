From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] arm/tegra: dma: fix buildbreak for
 !CONFIG_TEGRA_SYSTEM_DMA
Date: Thu, 22 Dec 2011 16:09:22 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF176CC74343@HQMAIL01.nvidia.com>
References: <1324598592-9855-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1324598592-9855-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Thursday, December 22, 2011 5:03 PM:
> There's no need to keep the DMA_REQ_SEL defines inside the ifdef.
> 
> Fixes the following build break with CONFIG_TEGRA_SYSTEM_DMA=n:
> 
> arch/arm/mach-tegra/devices.c:645: error: 'TEGRA_DMA_REQ_SEL_I2S_1' undeclared here (not in a
> function)
> arch/arm/mach-tegra/devices.c:663: error: 'TEGRA_DMA_REQ_SEL_I2S2_1' undeclared here (not in a
> function)
> arch/arm/mach-tegra/devices.c:663: error: initializer element is not constant
> arch/arm/mach-tegra/devices.c:663: error: (near initialization for 'i2s_resource2[1].start')
> arch/arm/mach-tegra/devices.c:664: error: initializer element is not constant
> arch/arm/mach-tegra/devices.c:664: error: (near initialization for 'i2s_resource2[1].end')
> 
> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

-- 
nvpublic
