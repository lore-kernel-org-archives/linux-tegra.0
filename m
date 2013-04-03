From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] sound: soc: tegra: do not provide PAUSE/RESUME in hardware
 info
Date: Wed, 3 Apr 2013 15:03:11 +0530
Message-ID: <515BF757.3030507@nvidia.com>
References: <1364980781-2204-1-git-send-email-ldewangan@nvidia.com> <515C03BC.3040301@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <515C03BC.3040301-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: "broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "tiwai-l3A5Bk7waGM@public.gmane.org" <tiwai-l3A5Bk7waGM@public.gmane.org>, "perex-/Fr2/VpizcU@public.gmane.org" <perex-/Fr2/VpizcU@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 03 April 2013 03:56 PM, Lars-Peter Clausen wrote:
> On 04/03/2013 11:19 AM, Laxman Dewangan wrote:
>> Tegra PCM driver uses the dmaengine based DMA driver and Tegra DMA
>> driver does not support the pause/resume functionality as hardware
>> does not support it.
>>
>> ALSA driver support the sw based pause/resume functionality if hardware
>> does not support it and in this case, hw driver should not provide
>> the hardware info with PAUSE/RESUME bit enable.
>>
>> Remmoving the SNDRV_PCM_INFO_PAUSE and SNDRV_PCM_INFO_RESUME from hardware
>> info and using the snd_dmaengine_pcm_trigger() for pcm_trigger callback.
>>
>> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Hm, I sent out the same patch just half an our or so ago.
>


Then I lost the race. I was struggling with sdcard  until I bought the 
new one.
