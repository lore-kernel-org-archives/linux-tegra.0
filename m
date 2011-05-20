From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ASoC: Tegra: Fix compile when debugfs not
	enabled
Date: Fri, 20 May 2011 11:20:48 +0100
Message-ID: <20110520102048.GB22711@opensource.wolfsonmicro.com>
References: <1305577167-16152-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <1305577167-16152-1-git-send-email-swarren@nvidia.com>
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
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, lrg@ti.com
List-Id: linux-tegra@vger.kernel.org

On Mon, May 16, 2011 at 02:19:27PM -0600, Stephen Warren wrote:
> The prototype of the inline dummy version of tegra_i2s_debug_add
> was not consistent with the real version.
> 
> Reported-by: Rhyland-Klein < rklein@nvidia.com>
> Signed-off-by: Stephen Warren <swarren@nvidia.com>

Applied, thanks.
