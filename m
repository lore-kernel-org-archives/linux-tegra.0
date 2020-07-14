From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ALSA: hda: Enable sync-write operation as default for all
 controllers
Date: Tue, 14 Jul 2020 10:51:20 +0100
Message-ID: <c2c925ab-5bf7-7f7c-cf30-126b3ba34fff@nvidia.com>
References: <20200618144051.7415-1-tiwai@suse.de>
 <8fc9f086-9a34-4287-8f51-6e0ebc34928f@nvidia.com>
 <s5hy2nmv6qv.wl-tiwai@suse.de>
 <6f7a6d27-127d-9242-0638-abaf10e38410@nvidia.com>
 <s5hr1tev4sw.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <s5hr1tev4sw.wl-tiwai-l3A5Bk7waGM@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 14/07/2020 10:12, Takashi Iwai wrote:

...

>> Did you mean ...
>>
>> diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
>> index 0cc5fad1af8a..5637f0129932 100644
>> --- a/sound/pci/hda/hda_tegra.c
>> +++ b/sound/pci/hda/hda_tegra.c
>> @@ -443,6 +443,7 @@ static int hda_tegra_create(struct snd_card *card,
>>         if (err < 0)
>>                 return err;
>>
>> +       chip->bus.core.sync_write = 0;
>>         chip->bus.core.needs_damn_long_delay = 1;
>>         chip->bus.core.aligned_mmio = 1;
>>
>> The above works for me.
> 
> Yeah, sorry, that was a wrong patch :)
> I'm fine for applying it with some more comments.
> 
> Care to submit a proper patch?


No problem. I will submit a patch.

Jon

-- 
nvpublic
