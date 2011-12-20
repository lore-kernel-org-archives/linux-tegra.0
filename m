From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] arm/tegra: boards: more __init/__initdata annotations
Date: Tue, 20 Dec 2011 08:26:08 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF176BE92CFB@HQMAIL01.nvidia.com>
References: <1324353802-31774-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1324353802-31774-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Monday, December 19, 2011 9:03 PM:
> Silence a bunch of section warnings, and mark some of the init functions as
> __init.

Is it correct to mark these as __init?

With my recent patch "arm/tegra: Use bus notifiers to trigger pinmux
setup", this data all gets used at pinmux/GPIO device probe time. Still,
I suppose that does all get triggered by tegra_dt_init() which is __init,
so if a device is guaranteed to probe as soon as a device registration
and driver exist for it, then everything you've marked as __init really
is guaranteed to be used then.

-- 
nvpublic
