From: Liam Girdwood <lrg@ti.com>
Subject: Re: [PATCH 1/3] ASoC: Tegra:
 tegra_pcm_deallocate_dma_buffer: Don't OOPS
Date: Mon, 8 Aug 2011 16:43:46 +0100
Message-ID: <1312818226.3314.0.camel@CNA0741383>
References: <1312497884-1599-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1312497884-1599-1-git-send-email-swarren@nvidia.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Stephen Warren <swarren@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>
List-Id: linux-tegra@vger.kernel.org

On Fri, 2011-08-05 at 00:44 +0200, Stephen Warren wrote:
> Not all PCM devices have all sub-streams. Specifically, the SPDIF driver
> only supports playback and hence has no capture substream. Check whether
> a substream exists before dereferencing it, when de-allocating DMA
> buffers in tegra_pcm_deallocate_dma_buffer.
> 
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---

All 

Acked-by: Liam Girdwood <lrg@ti.com>
