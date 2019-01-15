From: Matthias Reichl <hias@horus.com>
Subject: Re: [alsa-devel] [PATCH v1 3/3] ASoC: soc-core: fix platform name
 vs. of_node assignement
Date: Tue, 15 Jan 2019 19:07:17 +0100
Message-ID: <20190115180716.55a6uvdrfhb7b7ux@camel2.lan>
References: <52f5f2cf-9260-f9c5-f73d-3c3d5debc86b@nvidia.com>
 <20190109141439.GE10405@sirena.org.uk>
 <875zuxb9uy.wl-kuninori.morimoto.gx@renesas.com>
 <a2068291-e554-cc4f-9af9-0022f3c4de34@nvidia.com>
 <871s5kqb43.wl-kuninori.morimoto.gx@renesas.com>
 <dfdc497f-9e52-99d7-208c-d8eef31fe61d@nvidia.com>
 <87h8efpoxh.wl-kuninori.morimoto.gx@renesas.com>
 <ea6b6a3a-b4eb-1d29-51fd-330b2b170005@nvidia.com>
 <20190114230255.GK11073@sirena.org.uk>
 <312f8e32-36ed-cadb-77cb-54267680fefb@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <312f8e32-36ed-cadb-77cb-54267680fefb@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mark Brown <broonie@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Marcel Ziswiler <marcel@ziswiler.com>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 15, 2019 at 03:26:42PM +0000, Jon Hunter wrote:
> 
> On 14/01/2019 23:02, Mark Brown wrote:
> > On Fri, Jan 11, 2019 at 09:15:42AM +0000, Jon Hunter wrote:
> >> On 11/01/2019 08:51, Kuninori Morimoto wrote:
> > 
> >>> So, can you agree about these ?
> >>> 1) Add enough information/documentation about legacy/modern style and its plan.
> >>> 2) Add dirty pointer fixup patch as workaround
> >>> 3) switch to modern style as much as possible
> > 
> >> I think that Mark needs to decided on whether use your 'dirty pointer'
> >> fix or not.
> > 
> > I've gone ahead with Curtis' version of Morimoto-san's patch just now -
> > hopefully that's fine for v5.0.  Like we've been saying neither approach
> > is ideal, thanks Jon and Morimoto-san for your efforts analyzing this
> > and your proposals.
> 
> Thanks! Works for me.

Thanks alot, works here, too on 4.20 and 5.0-rc2!

so long,

Hias
