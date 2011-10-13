From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] ARM: tegra: devices.c should include devices.h
Date: Thu, 13 Oct 2011 08:48:46 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173BE1A057@HQMAIL01.nvidia.com>
References: <1318467679-11927-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1318467679-11927-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Wednesday, October 12, 2011 7:01 PM:
> Resolves lots of sparse warnings:
> 
> arch/arm/mach-tegra/devices.c:102:24: warning: symbol 'tegra_i2c_device1' was not declared. Should it
> be static?
> arch/arm/mach-tegra/devices.c:112:24: warning: symbol 'tegra_i2c_device2' was not declared. Should it
> be static?
> arch/arm/mach-tegra/devices.c:122:24: warning: symbol 'tegra_i2c_device3' was not declared. Should it
> be static?
> arch/arm/mach-tegra/devices.c:132:24: warning: symbol 'tegra_i2c_device4' was not declared. Should it
> be static?
> [...]
> 
> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

-- 
nvpublic
