From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ASoC: tegra: fix maxburst settings in
	dmaengine code
Date: Fri, 7 Sep 2012 09:51:57 +0800
Message-ID: <20120907015155.GA6827@opensource.wolfsonmicro.com>
References: <1346975253-2935-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <1346975253-2935-1-git-send-email-swarren@wwwdotorg.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Laxman Dewangan <ldewangan@nvidia.com>, Stephen Warren <swarren@nvidia.com>, Liam Girdwood <lrg@ti.com>
List-Id: linux-tegra@vger.kernel.org

On Thu, Sep 06, 2012 at 05:47:33PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
> 
> The I2S controllers are programmed with an "attention" level of 4 DWORDs.
> This must match the configuration passed to the DMA driver, so that when
> they burst in data, they don't overflow the available FIFO space. Also,
> the burst size is relevant to the destination for playback, and source
> for capture, not vice-versa as originally written.

Applied, thanks.
