From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v3 0/5] ARM: Tegra: cleanup patches from Arnd Bergmann
Date: Fri, 2 Mar 2012 14:30:14 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17BE861AAB@HQMAIL01.nvidia.com>
References: <1330721884-8495-1-git-send-email-alan@signal11.us>
 <1330727075-10974-1-git-send-email-alan@signal11.us>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1330727075-10974-1-git-send-email-alan-yzvJWuRpmD1zbRFIqnYvSA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Ott <alan-yzvJWuRpmD1zbRFIqnYvSA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Lucas De Marchi <lucas.demarchi-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Alan Ott wrote at Friday, March 02, 2012 3:25 PM:
> Version 3 of the patch set.
> 
> Changes:
> 	* change of logic (and commit message change) for
> 	  "select USB_ULPI if USB is selected"
> 	* dropped THUMB2 patch
> 
> Arnd Bergmann (5):
>   ARM: tegra: do not hide dma declarations
>   ARM: tegra: select CPU_FREQ_TABLE
>   ARM: tegra: build localtimer support only when needed
>   ARM: tegra: select USB_ULPI if USB is selected
>   ARM: tegra: export usb phy symbols

The series,

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks Arnd and Alan for cleaning Tegra up!

-- 
nvpublic
