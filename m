From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH v2 07/10] drm/nouveau/graph: pad firmware code at load time
Date: Mon, 21 Apr 2014 14:03:02 -0400
Message-ID: <CAKb7UviQ6s8wRqwLVnE_A0NOw=WcVdFXG_wWmnZypwuaW_hnuw@mail.gmail.com>
References: <1398060142-7937-1-git-send-email-acourbot@nvidia.com>
 <1398060142-7937-8-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1398060142-7937-8-git-send-email-acourbot@nvidia.com>
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
Cc: Alexandre Courbot <gnurou@gmail.com>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 21, 2014 at 2:02 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:
> Pad the microcode to a multiple of 0x40 bytes, otherwise firmware will

bytes or u32's? From the code, I'm guessing the latter. (Similar
concern about comment in the code.)

> fail to run from non-prepadded firmware files.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c b/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
> index e5b75f189988..013475c62986 100644
> --- a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
> +++ b/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
> @@ -894,6 +894,10 @@ nvc0_graph_init_fw(struct nvc0_graph_priv *priv, u32 fuc_base,
>                         nv_wr32(priv, fuc_base + 0x0188, i >> 6);
>                 nv_wr32(priv, fuc_base + 0x0184, code->data[i]);
>         }
> +
> +       /* code must be padded to 0x40 bytes */
> +       for (; i & 0x3f; i++)
> +               nv_wr32(priv, fuc_base + 0x0184, 0);
>  }
>
>  static void
> --
> 1.9.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
