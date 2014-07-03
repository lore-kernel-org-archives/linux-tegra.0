From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 1/4] drm/dsi: Add flag for continuous clock behavior
Date: Thu, 03 Jul 2014 10:23:55 +0200
Message-ID: <53B5131B.1060702@samsung.com>
References: <1404303560-32209-1-git-send-email-acourbot@nvidia.com>
 <1404303560-32209-2-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1404303560-32209-2-git-send-email-acourbot@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandre Courbot <acourbot@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Terje Bergstrom <tbergstrom@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


Hi Alexandre,

Thanks for the patch.

On 07/02/2014 02:19 PM, Alexandre Courbot wrote:
> As per section 5.6.1 of the DSI specification, all DSI transmitters must
> support continuous clock behavior on the clock lane, while non-continuous
> mode support is only optional. Add a flag that allows devices to indicate
> that they require continuous clock mode to operate properly.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  include/drm/drm_mipi_dsi.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 944f33f..5913ef4 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -94,6 +94,8 @@ void mipi_dsi_host_unregister(struct mipi_dsi_host *host);
>  #define MIPI_DSI_MODE_VSYNC_FLUSH	BIT(8)
>  /* disable EoT packets in HS mode */
>  #define MIPI_DSI_MODE_EOT_PACKET	BIT(9)
> +/* use continuous clock behavior on the clock lane */
> +#define MIPI_DSI_MODE_CLOCK_CONTINUOUS	BIT(10)
>  

According to MIPI DSI specification "All DSI transmitters and receivers
shall support continuous clock behavior on the Clock Lane, and
optionally may support non-continuous clock behavior". It suggests that
continuous clock should be default behavior. So maybe better is to
introduce sth like:
+#define MIPI_DSI_MODE_CLOCK_NON_CONTINUOUS	BIT(10)


Regards
Andrzej
