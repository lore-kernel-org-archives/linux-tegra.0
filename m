From: Kai Vehmanen <kai.vehmanen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH v3 0/7] ASoC: soc-pcm cleanup step2
Date: Wed, 19 Feb 2020 19:01:33 +0200 (EET)
Message-ID: <alpine.DEB.2.21.2002191900170.2957@eliteleevi.tm.intel.com>
References: <87d0anceze.wl-kuninori.morimoto.gx@renesas.com> <5d19876d-86a4-a461-f47a-68c7ba1f46ac@gmail.com> <d60ccad5-9c52-551b-ae22-2815ab768a59@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d60ccad5-9c52-551b-ae22-2815ab768a59-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pierre-Louis Bossart <pierre-louis.bossart-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-ALSA <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, Kai Vehmanen <kai.vehmanen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On Wed, 19 Feb 2020, Pierre-Louis Bossart wrote:

>> I'm observing a NULL dereference on NVIDIA Tegra20/30 once PulseAudio is
>> loaded.
>> The offending patch is:
>> 
>>    ASoC: soc-pcm: call snd_soc_component_open/close() once
> 
> We also see a regression Kai bisected to the same patch
> 
> https://github.com/thesofproject/linux/pull/1805#issuecomment-588266014

issue rootcaused -- this relates to the new "opened" tracking, I'll send a 
patch shortly after a few more test rounds.

Br, Kai
