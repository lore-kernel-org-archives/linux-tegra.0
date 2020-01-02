From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] ASoC: rt5640: Fix NULL dereference on module unload
Date: Thu, 2 Jan 2020 18:57:14 +0300
Message-ID: <03ccf221-697e-bc34-f4ba-bf191aecd675@gmail.com>
References: <20191229150454.2127-1-digetx@gmail.com>
 <20191231001719.GC3897@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191231001719.GC3897@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Jaroslav Kysela <perex@perex.cz>, Bard Liao <bardliao@realtek.com>, Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

31.12.2019 03:17, Mark Brown пишет:
> On Sun, Dec 29, 2019 at 06:04:54PM +0300, Dmitry Osipenko wrote:
>> The rt5640->jack is NULL if jack is already disabled at the time of
>> driver's module unloading.
>>
>>  Unable to handle kernel NULL pointer dereference at virtual address 00000024
>>  ...
>>  (rt5640_set_jack [snd_soc_rt5640]) from [<bf86f7ed>] (snd_soc_component_set_jack+0x11/0x1c [snd_soc_core])
>>  (snd_soc_component_set_jack [snd_soc_core]) from [<bf8675cf>] (soc_remove_component+0x1b/0x54 [snd_soc_core])
>>  (soc_remove_component [snd_soc_core]) from [<bf868859>] (soc_cleanup_card_resources+0xad/0x1cc [snd_soc_core])
> 
> In addition to what Takashi said:
> 
> Please think hard before including complete backtraces in upstream
> reports, they are very large and contain almost no useful information
> relative to their size so often obscure the relevant content in your
> message. If part of the backtrace is usefully illustrative then it's
> usually better to pull out the relevant sections.

Yeah, perhaps it's not really useful to have backtrace in the commit's
description for the case of this patch in particular. But in general it
is very useful to have backtraces somewhere near the patch such that
online search engines, like google, could pick it up. I'll move the
backtrace below --- in v2, thanks.
