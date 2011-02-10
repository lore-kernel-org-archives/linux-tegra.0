From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v4 10/15] ARM: tegra: iomap: Add missing devices, fix
 use of SZ_8, SZ_64
Date: Thu, 10 Feb 2011 08:45:21 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF0310F60414@HQMAIL01.nvidia.com>
References: <1297320204-31882-1-git-send-email-ccross@android.com>
 <1297320204-31882-11-git-send-email-ccross@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1297320204-31882-11-git-send-email-ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Colin Cross wrote at Wednesday, February 09, 2011 11:43 PM:
> 
> From: Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Adds gart, hdmi, avp, host1x, and pwm controllers to mach/iomap.h
> There is no SZ_8 or SZ_64, replace them with constants

Can't we add those SZ_* constants?

-- 
nvpublic

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
