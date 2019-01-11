From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [alsa-devel] [PATCH v1 3/3] ASoC: soc-core: fix platform name vs.
 of_node assignement
Date: Fri, 11 Jan 2019 09:15:42 +0000
Message-ID: <ea6b6a3a-b4eb-1d29-51fd-330b2b170005@nvidia.com>
References: <20181218174040.k7u26vnnoplllnwb@camel2.lan>
 <952471da-b355-6471-6c19-5120d6704f81@nvidia.com>
 <87lg3vuc7p.wl-kuninori.morimoto.gx@renesas.com>
 <b5164c93-8be8-1c3d-9415-c895da6ad622@nvidia.com>
 <d1e41ed2-da7c-b46c-bc6d-64cf3e536771@nvidia.com>
 <865d2a3e-bf6b-1f30-1179-7e922c0d0641@nvidia.com>
 <87k1je38w7.wl-kuninori.morimoto.gx@renesas.com>
 <0660a471-3698-2059-4494-ad146518a4ed@nvidia.com>
 <20190109125340.GD10405@sirena.org.uk>
 <52f5f2cf-9260-f9c5-f73d-3c3d5debc86b@nvidia.com>
 <20190109141439.GE10405@sirena.org.uk>
 <875zuxb9uy.wl-kuninori.morimoto.gx@renesas.com>
 <a2068291-e554-cc4f-9af9-0022f3c4de34@nvidia.com>
 <871s5kqb43.wl-kuninori.morimoto.gx@renesas.com>
 <dfdc497f-9e52-99d7-208c-d8eef31fe61d@nvidia.com>
 <87h8efpoxh.wl-kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87h8efpoxh.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-tegra@vger.kernel.org, Matthias Reichl <hias@horus.com>, alsa-devel@alsa-project.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Marcel Ziswiler <marcel@ziswiler.com>
List-Id: linux-tegra@vger.kernel.org


On 11/01/2019 08:51, Kuninori Morimoto wrote:
>>> Indeed there is such case so far, but my understanding is that current
>>> driver should select "legacy style" or "modern style".
>>> If driver setup it as "legacy", but access to "modern" member,
>>> it is driver side bug, right ?
>>
>> Yes absolutely it is a driver bug, but looking at the snd_soc_dai_link
>> structure today it is not clear what the driver should be setting and
>> what is 'modern' and what is 'legacy'. You need to dig through the git
>> history and code to figure this out. So you could say it is not very
>> well documented/commented from a soc-core perspective and could be easy
>> for a driver writer to get themselves in a pickle/mess. Anyway, that is
>> easy to fix and we could add some comments to clear it up.
> 
> Thank you for your feedback.
> Yes, indeed there is no enough information/documentation about
> legacy/modern style, and its plan
> (= all driver will be switched to modern, legacy will be removed, etc, etc..).
> 
> So, can you agree about these ?
> 1) Add enough information/documentation about legacy/modern style and its plan.
> 2) Add dirty pointer fixup patch as workaround
> 3) switch to modern style as much as possible

I think that Mark needs to decided on whether use your 'dirty pointer'
fix or not.

Jon

-- 
nvpublic
