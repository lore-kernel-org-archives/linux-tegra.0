From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/5] ARM: tegra: Add slink controller base address
Date: Fri, 19 Oct 2012 14:36:31 +0530
Message-ID: <50811817.1070806@nvidia.com>
References: <1350557795-31487-1-git-send-email-ldewangan@nvidia.com> <1350557795-31487-2-git-send-email-ldewangan@nvidia.com> <50808526.1080504@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50808526.1080504-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 19 October 2012 04:09 AM, Stephen Warren wrote:
> On 10/18/2012 04:56 AM, Laxman Dewangan wrote:
>> Add base address of all slink controller of Tegra20
>> and tegra30.
> Lets not add anything to iomap.h; we're trying to remove it. Instead,
> just put the raw address in the AUXDATA; I assume that's the only place
> these defines end up being used...
OK, I will drop this change and add the base address definition in the 
AUXDATA file only.
