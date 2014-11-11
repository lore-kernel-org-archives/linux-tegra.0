From: =?windows-1252?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/3] Add support for Tegra Activity Monitor
Date: Tue, 11 Nov 2014 08:57:30 +0200
Message-ID: <5461B35A.3080604@nvidia.com>
References: <1414594232-15684-1-git-send-email-tomeu.vizoso@collabora.com>
 <545C8BCC.3090908@nvidia.com> <545CBC87.7050404@collabora.com>
 <546190BA.7050502@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <546190BA.7050502-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11.11.2014 06:29, Alexandre Courbot wrote:
> I think (after a quick look at devfreq's source) that you can avoid
> polling altogether if you set polling_ms to 0 in your
> devfreq_dev_profile instance. Then it is up to you to call
> update_devfreq() from your custom governor whenever it sees fit.
> 
> ACTMON support seems to overlap between being a governor (which reacts
> to ACTMON interrupts and calls update_devfreq() when needed) and part of
> a devfreq_dev_profile (get_dev_status() needs to use the actmon
> counters). If we keep your current design where the driver simply
> controls a clock, you could have the ACTMON driver obtain that clock,
> register its governor, create a non-polling devfreq_dev_profile that
> controls that clock, and just call devfreq_add_device() with both. Then
> we will have the benefit of being able to use ACTMON as well as the
> performance and powersave governors on EMC, and switch policies
> dynamically.

Another way to use it is that governor is just a governor. It takes in
load values and generates new target frequencies, and doesn't know
anything about HW.

Device profile is the one that enables threshold interrupts and disables
polling. Device profile receives the interrupt, retrieves new load
number from hardware, and calls update_devfreq().

This way we keep all HW specific code in device profile, and there's
potential to use a generic governor instead of writing your own.
