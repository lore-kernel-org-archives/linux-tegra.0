From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] ARM: Tegra: Seaboard board updates for audio
Date: Tue, 12 Apr 2011 12:00:44 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF0493EB3EA2@HQMAIL01.nvidia.com>
References: <1302629547-2368-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1302629547-2368-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Stephen Warren wrote at Tuesday, April 12, 2011 11:32 AM:
> * Initialize clock tree for audio
> * Add GPIO base definitions
> * Add audio GPIO definitions
> * Define platform data for WM8903 and ASoC machine driver
> * Add special case for Kaen to handle HP_MUTE GPIO
> * Register platform devices for audio
> * Update pinmux to cater for new GPIOs used for audio
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I forgot to point out that this patch depends on the series "[PATCH 0/3]
Rename Tegra ASoC driver" having been merged first.

-- 
nvpublic
