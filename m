From: Liam Girdwood <lrg@slimlogic.co.uk>
Subject: Re: [Patch v2 1/6] ASoC: Tegra: wm8903 probe: Don't
 call machine_is_*()
Date: Wed, 20 Apr 2011 12:35:03 +0100
Message-ID: <1303299303.3436.4.camel@odin>
References: <1303248312-22664-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
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
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, broonie@opensource.wolfsonmicro.com, mike@compulab.co.il
List-Id: linux-tegra@vger.kernel.org

On Tue, 2011-04-19 at 15:25 -0600, Stephen Warren wrote:
> This machine driver is a platform driver, and hence will only be
> instantiated on the correct machines. Hence, there is no need to
> check the current machine during probe.
> 
> (Applying Mark's TrimSlice review comments to the existing driver)
> 
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
>  sound/soc/tegra/tegra_wm8903.c |    7 -------
>  1 files changed, 0 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
> index 37f6010..1eb0632 100644
> --- a/sound/soc/tegra/tegra_wm8903.c
> +++ b/sound/soc/tegra/tegra_wm8903.c
> @@ -391,13 +391,6 @@ static __devinit int tegra_wm8903_driver_probe(struct platform_device *pdev)
>  	struct tegra_wm8903_platform_data *pdata;
>  	int ret;
>  
> -	if (!machine_is_harmony() && !machine_is_ventana() &&
> -	    !machine_is_seaboard() && !machine_is_kaen() &&
> -	    !machine_is_aebl()) {
> -		dev_err(&pdev->dev, "Not running on a supported board!\n");
> -		return -ENODEV;
> -	}
> -
>  	pdata = pdev->dev.platform_data;
>  	if (!pdata) {
>  		dev_err(&pdev->dev, "No platform data supplied\n");

All

Acked-by: Liam Girdwood <lrg@ti.com>
