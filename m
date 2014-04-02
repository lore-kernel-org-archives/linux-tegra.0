From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [PATCH 09/12] drm/nouveau/graph: pad firmware code at
 load time
Date: Wed, 2 Apr 2014 22:54:45 +0900
Message-ID: <CAAVeFuLbwqGRbE1LFJh54_4FE601w=czHOfBB=ETZ0RtFqdicQ@mail.gmail.com>
References: <1395650554-31925-1-git-send-email-acourbot@nvidia.com>
 <1395650554-31925-10-git-send-email-acourbot@nvidia.com> <CACAvsv6eCoWEU7ZNd5158-V3n=ZVo5O04CZa2EWE78e_tZEXPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACAvsv6eCoWEU7ZNd5158-V3n=ZVo5O04CZa2EWE78e_tZEXPA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Mar 26, 2014 at 1:22 PM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, Mar 24, 2014 at 6:42 PM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> Pad the microcode to a multiple of 0x40, otherwise firmware will fail to
>> run from non-prepadded firmware files.
>>
>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c b/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
>> index f997a18f5760..367e72daf8b1 100644
>> --- a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
>> +++ b/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
>> @@ -768,6 +768,10 @@ nvc0_graph_init_fw(struct nvc0_graph_priv *priv, u32 fuc_base,
>>                         nv_wr32(priv, fuc_base + 0x0188, i >> 6);
>>                 nv_wr32(priv, fuc_base + 0x0184, code->data[i]);
>>         }
>> +
>> +       /* code must be padded to 0x40 */
>> +       for (; i < (((code->size / 4) + 0x3f) & ~0x3f); i++)
> "for (; i & 0x3f; i++)" would work just as well :)

Indeed. >_<
