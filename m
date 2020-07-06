From: Naresh Kamboju <naresh.kamboju-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [qemu] boot failed: Unable to handle kernel NULL pointer
 dereference at virtual address 0000000000000000
Date: Mon, 6 Jul 2020 23:06:58 +0530
Message-ID: <CA+G9fYvEqr8Wdi6vCTyAFT8eq3yL53E+WW4_Tzeea_HMKSOjQA@mail.gmail.com>
References: <CA+G9fYvqW-RQxt3kSoNkh5Y2REoe0QQB_dTz_KPzhJzcwiM5OA@mail.gmail.com>
 <CAK8P3a1Lda8HhsDvDREf-cOgb4RkCgEKK5Q-Zj+UhK8tsAaBLw@mail.gmail.com> <51d6e5bb-3de1-36dc-15a4-c341b23ca8cd@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51d6e5bb-3de1-36dc-15a4-c341b23ca8cd-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Jiang <dave.jiang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-serial-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jiri Slaby <jslaby-IBi9RG/b67k@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, jirislaby-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Andy Gross <agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Qian Cai <cai-J5quhbR+WMc@public.gmane.org>, lkft-triage-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

> Arnd,
> I'm looking at the pl001_dma_probe(), I think we could make it more robust if it
> uses IS_ERR_OR_NULL(chan) instead of IS_ERR(). Should I send a patch for it? I
> suppose looking at the comment header for dma_request_chan() it does say return
> chan ptr or error ptr. Sorry I missed that.
>
>
> Vinod,
> It looks like the only fix for dmaengine for the patch is where Arnd pointed out
> as far as I can tell after auditing it. Let me know how you want to handle this.
> Thanks!

This proposed fix patch applied on top of linux next ( 20200706 tag )
and boot test PASS.

The reported problem got fixed.

Reported-by: Naresh Kamboju <naresh.kamboju-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Tested-by: Naresh Kamboju <naresh.kamboju-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

>
> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index 0d6529eff66f..48e159e83cf5 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -852,7 +852,7 @@ struct dma_chan *dma_request_chan(struct device *dev, const
> char *name)
>          mutex_lock(&dma_list_mutex);
>          if (list_empty(&dma_device_list)) {
>                  mutex_unlock(&dma_list_mutex);
> -               return NULL;
> +               return ERR_PTR(-ENODEV);
>          }
>
>          list_for_each_entry_safe(d, _d, &dma_device_list, global_node) {

ref:
https://lkft.validation.linaro.org/scheduler/job/1542630#L510

-- 
Linaro LKFT
https://lkft.linaro.org
