From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 15/17] ASoC: tegra: add tegra30-i2s driver
Date: Sat, 31 Mar 2012 20:17:10 -0600
Message-ID: <4F77BAA6.7060304@wwwdotorg.org>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
	<1333148852-17806-16-git-send-email-swarren@wwwdotorg.org>
	<20120331213401.GP5012@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20120331213401.GP5012@opensource.wolfsonmicro.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Liam Girdwood <lrg@ti.com>
List-Id: linux-tegra@vger.kernel.org

On 03/31/2012 03:34 PM, Mark Brown wrote:
> On Fri, Mar 30, 2012 at 05:07:30PM -0600, Stephen Warren wrote:
> 
>> +#ifdef CONFIG_DEBUG_FS
>> +static int tegra30_i2s_show(struct seq_file *s, void *unused)
>> +{
> 
> Abstraction please - this is open coded in several of your drivers.

There's very little code here; unifying it would require passing the
clock enable/disable and register read functions to any common code,
which would end up making everything rather more complex. Sometimes
there are multiple register read functions for different chunks of the
address space. I guess if we did have regmap for MMIO, these debugfs
files would pretty much come for free. Is that what you're looking for here?

>> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>> +		ret = tegra30_ahub_allocate_tx_fifo(&i2s->txcif,
>> +					&i2s->playback_dma_data.addr,
>> +					&i2s->playback_dma_data.req_sel);
>> +		i2s->playback_dma_data.wrap = 4;
>> +		i2s->playback_dma_data.width = 32;
>> +		tegra30_ahub_set_rx_cif_source(
>> +				TEGRA30_AHUB_RXCIF_I2S0_RX0 + i2s->cif_id,
>> +				i2s->txcif);
> 
> So.  This is all fairly straightforward, simple and non-invasive for
> CPU<->I2S streams but obviously it's locking out any loopbacks within
> the AHUB which is a bit sad.

Yes, I certainly foresee the way the DAIs interact with AHUB changing
when adding more advanced features, such as if representing AHUB as a CODEC.

Our downstream kernels do have some code that sets up loopbacks between
I2S modules, and it's all derived from these patches as a starting
point. The downstream solution probably isn't upstreamable though; it
wasn't written with upstream approaches in mind:-(

> Looking at this it seems like all that's required is to propagate stream
> events back up the chain and do the routing, there doesn't seem to be
> much other interaction between the AHUB and the interfaces?

I suspect that's pretty much what representing AHUB as a CODEC would
turn into, or very similar anyway. Is it OK to get the basic
functionality in first and then refactor this, or would you prefer going
straight to the complete solution?
