From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v1 0/2] Support headset on Tegra boards that use WM8903
Date: Thu, 9 Apr 2020 10:54:42 -0600
Message-ID: <848cc6c5-e8e4-2796-3ee1-3e12a3e92c54@wwwdotorg.org>
References: <20200330204011.18465-1-digetx@gmail.com>
 <5c9c995a-a571-e543-e680-30739cb1561c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5c9c995a-a571-e543-e680-30739cb1561c-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 4/9/20 8:52 AM, Dmitry Osipenko wrote:
> 30.03.2020 23:40, Dmitry Osipenko пишет:
>> Hello,
>>
>> Some devices have a 4-pin jack instead of a 3-pin and currently the
>> WM8903 configuration is hardcoded to the case of 3-pin jack in the
>> Tegra's ASoC driver. A new device-tree property is required in order
>> to convey that hardware has a 4-pin jack, and thus, microphone's
>> detection needs to be done in a different way.
>>
>> In particular this is needed for Acer A500 tablet device that has
>> a 4-pin headset jack, otherwise userspace sees headset instead of
>> headphones and internal microphone isn't enabled by ALSA UCM rule
>> when it should be. Please review and apply, thanks in advance.
>>
>> Dmitry Osipenko (2):
>>   dt-bindings: sound: tegra-wm8903: Document new nvidia,headset property
>>   ASoC: tegra: tegra_wm8903: Support nvidia,headset property
>>
>>  .../devicetree/bindings/sound/nvidia,tegra-audio-wm8903.txt | 1 +
>>  sound/soc/tegra/tegra_wm8903.c                              | 6 +++++-
>>  2 files changed, 6 insertions(+), 1 deletion(-)
>>
> 
> Jon / Stephen, are you okay with this patchset? Could you please ack it?
> Thanks in advance.

It looks plausible based on commit descriptions, but I don't remember
the details of those APIs well enough to actually review the code change.
