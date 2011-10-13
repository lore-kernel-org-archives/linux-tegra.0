From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] ARM: tegra: update defconfig
Date: Thu, 13 Oct 2011 08:55:22 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173BE1A05A@HQMAIL01.nvidia.com>
References: <1318478219-9462-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1318478219-9462-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Wednesday, October 12, 2011 9:57 PM:
> Refresh tegra_defconfig:
> 
> New options enabled: RTC, SPI, USB and USB_STORAGE together with
> corresponding tegra drivers. Also enable some of the common usb ethernet
> adapters.
> 
> Finally, enable new merged boards (Ventana) and the generic devicetree board.
> 
> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>

This transitively enables USE_OF by default. For Tegra, that's a good
thing. However, it does mean we won't be able to detect code that only
compiles with USE_OF enabled, which might affect other platform's
buildability if we're talking about core code. I'm not sure if we should
be concerned about this or not, or if ARM should select USE_OF now?

-- 
nvpublic
