From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [alsa-devel] [PATCH v1 3/3] ASoC: soc-core: fix platform name vs.
 of_node assignement
Date: Tue, 15 Jan 2019 15:26:42 +0000
Message-ID: <312f8e32-36ed-cadb-77cb-54267680fefb@nvidia.com>
References: <0660a471-3698-2059-4494-ad146518a4ed@nvidia.com>
 <20190109125340.GD10405@sirena.org.uk>
 <52f5f2cf-9260-f9c5-f73d-3c3d5debc86b@nvidia.com>
 <20190109141439.GE10405@sirena.org.uk>
 <875zuxb9uy.wl-kuninori.morimoto.gx@renesas.com>
 <a2068291-e554-cc4f-9af9-0022f3c4de34@nvidia.com>
 <871s5kqb43.wl-kuninori.morimoto.gx@renesas.com>
 <dfdc497f-9e52-99d7-208c-d8eef31fe61d@nvidia.com>
 <87h8efpoxh.wl-kuninori.morimoto.gx@renesas.com>
 <ea6b6a3a-b4eb-1d29-51fd-330b2b170005@nvidia.com>
 <20190114230255.GK11073@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190114230255.GK11073@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-tegra@vger.kernel.org, Matthias Reichl <hias@horus.com>, alsa-devel@alsa-project.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Marcel Ziswiler <marcel@ziswiler.com>
List-Id: linux-tegra@vger.kernel.org


On 14/01/2019 23:02, Mark Brown wrote:
> On Fri, Jan 11, 2019 at 09:15:42AM +0000, Jon Hunter wrote:
>> On 11/01/2019 08:51, Kuninori Morimoto wrote:
> 
>>> So, can you agree about these ?
>>> 1) Add enough information/documentation about legacy/modern style and its plan.
>>> 2) Add dirty pointer fixup patch as workaround
>>> 3) switch to modern style as much as possible
> 
>> I think that Mark needs to decided on whether use your 'dirty pointer'
>> fix or not.
> 
> I've gone ahead with Curtis' version of Morimoto-san's patch just now -
> hopefully that's fine for v5.0.  Like we've been saying neither approach
> is ideal, thanks Jon and Morimoto-san for your efforts analyzing this
> and your proposals.

Thanks! Works for me.

Jon

-- 
nvpublic
