From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] arch: arm: tegra: Enable headphone detection gpio
Date: Fri, 28 Oct 2011 10:11:48 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173EDAB4E7@HQMAIL01.nvidia.com>
References: <1319819226-19098-1-git-send-email-thutt@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1319819226-19098-1-git-send-email-thutt-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Taylor Hutt <thutt-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Yufeng Shen <miletus-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Taylor Hutt wrote at Friday, October 28, 2011 10:27 AM:
> From: Yufeng Shen <miletus-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> 
> Enable the headphone detection gpio on tegra platform.
> 
> Signed-off-by: Yufeng Shen <miletus-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Aha, that explains why this seemed to have stopped working when I tried
it on Seaboard recently; I guess it never did. Harmony already does this
correctly, and that's where I must have tested the feature initially.

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

-- 
nvpublic
