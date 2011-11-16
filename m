From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 0/23] mach/vmalloc.h removal, and ioremap optimization
Date: Wed, 16 Nov 2011 09:13:42 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF1740D748BE@HQMAIL01.nvidia.com>
References: <1321422521-1138-1-git-send-email-nico@fluxnic.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1321422521-1138-1-git-send-email-nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Nicolas Pitre wrote at Tuesday, November 15, 2011 10:48 PM:
> This patch series removes all instances of mach/vmalloc.h in order to
> have a more unified memory map across all ARM architectures. ...

For Tegra, the series:

Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

(On Seaboard/Springbank, booted DT, booted non-DT and tested audio, both
with root filesystem on SD card)

-- 
nvpublic
