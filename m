From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] ASoC: rt5640: Fix NULL dereference on module unload
Date: Sat, 4 Jan 2020 03:37:08 +0300
Message-ID: <059becd2-4a91-23b3-59e1-0c4b0f3c0844@gmail.com>
References: <20191229150454.2127-1-digetx@gmail.com>
 <20191231001719.GC3897@sirena.org.uk>
 <03ccf221-697e-bc34-f4ba-bf191aecd675@gmail.com>
 <20200103005424.GF3897@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200103005424.GF3897@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Jaroslav Kysela <perex@perex.cz>, Bard Liao <bardliao@realtek.com>, Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

03.01.2020 03:54, Mark Brown пишет:
> On Thu, Jan 02, 2020 at 06:57:14PM +0300, Dmitry Osipenko wrote:
>> 31.12.2019 03:17, Mark Brown пишет:
> 
>>> Please think hard before including complete backtraces in upstream
>>> reports, they are very large and contain almost no useful information
>>> relative to their size so often obscure the relevant content in your
>>> message. If part of the backtrace is usefully illustrative then it's
>>> usually better to pull out the relevant sections.
> 
>> Yeah, perhaps it's not really useful to have backtrace in the commit's
>> description for the case of this patch in particular. But in general it
>> is very useful to have backtraces somewhere near the patch such that
>> online search engines, like google, could pick it up. I'll move the
>> backtrace below --- in v2, thanks.
> 
> Right, this is more directed at just pasting in the entire
> backtrace (which can be huge with lots of generic bits before the
> small number that are relevant) but some edited highlights can
> definitely be helpful for search engines and for explaining the
> problem.  I'll modify what I'm saying there to clarify this.

Thank you for the clarification.
