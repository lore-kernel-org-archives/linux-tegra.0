From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/3] Tegra194 HW Fixes
Date: Mon, 4 May 2020 14:05:07 +0530
Message-ID: <124d4a5c-e198-d8c0-5fb7-65d008852e32@nvidia.com>
References: <1588580176-2801-1-git-send-email-spujar@nvidia.com>
 <s5ho8r4f6hx.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <s5ho8r4f6hx.wl-tiwai-l3A5Bk7waGM@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
Cc: spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 5/4/2020 1:59 PM, Takashi Iwai wrote:
> External email: Use caution opening links or attachments
>
>
> On Mon, 04 May 2020 10:16:13 +0200,
> Sameer Pujar wrote:
>> This series proposes SW workarounds for Tegra194 HDA HW bugs.
>> Following are the two issues seen:
>>   1. GCAP register does not reflect true capability.
>>      The actual number of SDO lines is "4", where as it reflects "2".
>>   2. With 4 SDO line configuration playback fails for,
>>      44.1K/48K, 2-channel, 16-bps audio stream.
>>
>> After fixing [1], issue [2] is uncovered.
>> As per recommendation by Tegra HW team the workarounds are pushed.
>>
>> Testing done
>> ============
>>   * Verify GCAP register after registering HDA sound card
>>   * Verify audio playback for 44.1K/48K, 2-channel, 16-bps.
>>
>> Sameer Pujar (3):
>>    ALSA: hda/tegra: correct number of SDO lines for Tegra194
>>    ALSA: hda: add member to store ratio for stripe control
>>    ALSA: hda/tegra: workaround playback failure on Tegra194
> Through a quick glance, all changes look good.
>
> Is the device already in market, i.e. it had hit users?  If yes, I'm
> going to merge for 5.7, otherwise for 5.8.

Yes the device is in the market. But has not been reported by end users.
During internal resting this has been discovered. I am fine with merging 
this to 5.8.

Thanks,
Sameer.
>
>
> thanks,
>
> Takashi
