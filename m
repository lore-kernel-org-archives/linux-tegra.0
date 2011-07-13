From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 2/2] ARM: Tegra: Seaboard: Re-order sdhci device
 registration
Date: Wed, 13 Jul 2011 12:31:23 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF049E8347B9@HQMAIL01.nvidia.com>
References: <1306876448-28147-1-git-send-email-swarren@nvidia.com>
 <1306876448-28147-3-git-send-email-swarren@nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF049E834796@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF049E834796-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> Stephen Warren wrote at Wednesday, July 13, 2011 12:56 PM:
> Stephen Warren wrote at Tuesday, May 31, 2011 3:14 PM:
> > Ensure the built-in eMMC is always named mmcblk0.
> 
> Colin, could you please consider this for 3.1?

Never mind, I see this has already been applied; I must have missed the
email saying so, and the local rebase of my branch didn't show it as
already applied since the tegra next branch only got pushed out last
night and isn't in linux-next yet.

Sorry for the noise.

-- 
nvpublic
