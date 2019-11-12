From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v3 02/19] ASoC: soc-core: tidyup
 soc_init_dai_link()
Date: Tue, 12 Nov 2019 10:51:48 +0000
Message-ID: <fe4baf43-a06c-f2ac-9b1c-6f0ec5a25cb2@nvidia.com>
References: <87ftj23jph.wl-kuninori.morimoto.gx@renesas.com>
 <87d0e63joh.wl-kuninori.morimoto.gx@renesas.com>
 <c976b330-f635-e818-1feb-f25db42a6ae4@nvidia.com>
 <87sgmu7xhz.wl-kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <87sgmu7xhz.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-tegra <linux-tegra@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
List-Id: linux-tegra@vger.kernel.org


On 12/11/2019 00:24, Kuninori Morimoto wrote:
> 
> Hi Jon
> 
> Thank you for reporting.
> 
>> I am seeing an audio regression on -next and bisect is pointing to
>> this commit. I am seeing the following crash on boot during probe
>> deferral of the soundcard ...
> 
> It seems timing bug.
> I have a plan to post below patch if my current posting patch are accepted,
> but it seems it is necessary immediately.
> I believe your issue will be solved by this patch,
> but can you please test it ?
> I will formally post it with your tested-by if it was OK.
> 
> # It will be more cleanuped in the future,
> # but it needs more other cleanup patches...
> 
> --------------------
> Subject: [PATCH] ASoC: soc-core: care card_probed at soc_cleanup_card_resources()
> 
> soc_cleanup_card_resources() will call card->remove(), but it should be
> called if card->probe() or card->late_probe() are called.
> snd_soc_bind_card() might be error before calling
> card->probe() / card->late_probe().
> In that time, card->remove() will be called.
> This patch adds card_probed parameter to judge it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-core.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)

Thanks! I can confirm that this works, so ...

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
