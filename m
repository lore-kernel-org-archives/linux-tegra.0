From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [Patch v2 1/6] ASoC: Tegra: wm8903 probe: Don't
 call machine_is_*()
Date: Wed, 20 Apr 2011 13:59:02 +0100
Message-ID: <20110420125902.GE4097@opensource.wolfsonmicro.com>
References: <1303248312-22664-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <1303248312-22664-1-git-send-email-swarren@nvidia.com>
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
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, mike@compulab.co.il, lrg@slimlogic.co.uk
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 19, 2011 at 03:25:07PM -0600, Stephen Warren wrote:
> This machine driver is a platform driver, and hence will only be
> instantiated on the correct machines. Hence, there is no need to
> check the current machine during probe.
> 
> (Applying Mark's TrimSlice review comments to the existing driver)

Applied all, thanks.
