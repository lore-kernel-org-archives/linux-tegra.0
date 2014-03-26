From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [PATCH 12/12] drm/nouveau: support for probing GK20A
Date: Wed, 26 Mar 2014 14:28:04 +1000
Message-ID: <CACAvsv561r73CmL0rf_bvM9JVMV+E7J_VT3ZDuwyCxviJBa8Cw@mail.gmail.com>
References: <1395650554-31925-1-git-send-email-acourbot@nvidia.com>
 <1395650554-31925-13-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1395650554-31925-13-git-send-email-acourbot@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Mar 24, 2014 at 6:42 PM, Alexandre Courbot <acourbot@nvidia.com> wrote:
> Set the correct subdev/engine classes when GK20A (0xea) is probed.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/core/engine/device/nve0.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/core/engine/device/nve0.c b/drivers/gpu/drm/nouveau/core/engine/device/nve0.c
> index 987edbc30a09..8509dd57de1f 100644
> --- a/drivers/gpu/drm/nouveau/core/engine/device/nve0.c
> +++ b/drivers/gpu/drm/nouveau/core/engine/device/nve0.c
> @@ -156,6 +156,26 @@ nve0_identify(struct nouveau_device *device)
>                 device->oclass[NVDEV_ENGINE_PPP    ] = &nvc0_ppp_oclass;
>                 device->oclass[NVDEV_ENGINE_PERFMON] = &nve0_perfmon_oclass;
>                 break;
> +       case 0xea:
> +               device->cname = "GK20A";
> +               device->oclass[NVDEV_SUBDEV_MC     ] =  nvc3_mc_oclass;
> +               device->oclass[NVDEV_SUBDEV_BUS    ] =  nvc0_bus_oclass;
> +               device->oclass[NVDEV_SUBDEV_TIMER  ] = &nv04_timer_oclass;
As per note on the PTIMER patch, can just switch this to
"gk20a_timer_oclass" on the latest code.

> +               device->oclass[NVDEV_SUBDEV_FB     ] =  nvea_fb_oclass;
> +               device->oclass[NVDEV_SUBDEV_IBUS   ] = &nvea_ibus_oclass;
> +               device->oclass[NVDEV_SUBDEV_INSTMEM] = nv50_instmem_oclass;
> +               device->oclass[NVDEV_SUBDEV_VM     ] = &nvc0_vmmgr_oclass;
> +               device->oclass[NVDEV_SUBDEV_BAR    ] = &nvc0_bar_oclass;
> +               device->oclass[NVDEV_ENGINE_DMAOBJ ] = &nvd0_dmaeng_oclass;
> +               device->oclass[NVDEV_ENGINE_FIFO   ] =  nvea_fifo_oclass;
> +               /* TODO will need an implementation for this at some point... */
> +#if 0
> +               device->oclass[NVDEV_ENGINE_SW     ] =  nvc0_software_oclass;
> +#endif
> +               device->oclass[NVDEV_ENGINE_GR     ] =  nvea_graph_oclass;
> +               device->oclass[NVDEV_ENGINE_COPY2  ] = &nve0_copy2_oclass;
> +               device->oclass[NVDEV_ENGINE_PERFMON] = &nve0_perfmon_oclass;
> +               break;
>         case 0xf0:
>                 device->cname = "GK110";
>                 device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
> --
> 1.9.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
