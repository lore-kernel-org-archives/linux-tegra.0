From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 07/10] drm/nouveau/graph: pad firmware code
 at load time
Date: Tue, 22 Apr 2014 11:08:39 +0900
Message-ID: <5355CF27.8000401@nvidia.com>
References: <1398060142-7937-1-git-send-email-acourbot@nvidia.com>	<1398060142-7937-8-git-send-email-acourbot@nvidia.com>	<CAKb7UviQ6s8wRqwLVnE_A0NOw=WcVdFXG_wWmnZypwuaW_hnuw@mail.gmail.com>
 <CACAvsv7J7yUaug=CoUfsPg5PXf=ZmwUD9XvCt4CqAvnamQNN9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACAvsv7J7yUaug=CoUfsPg5PXf=ZmwUD9XvCt4CqAvnamQNN9A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/22/2014 08:48 AM, Ben Skeggs wrote:
> On Tue, Apr 22, 2014 at 4:03 AM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
>> On Mon, Apr 21, 2014 at 2:02 AM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>> Pad the microcode to a multiple of 0x40 bytes, otherwise firmware will
>>
>> bytes or u32's? From the code, I'm guessing the latter. (Similar
>> concern about comment in the code.)
>>
>>> fail to run from non-prepadded firmware files.
>>>
>>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>   drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c b/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
>>> index e5b75f189988..013475c62986 100644
>>> --- a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
>>> +++ b/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
>>> @@ -894,6 +894,10 @@ nvc0_graph_init_fw(struct nvc0_graph_priv *priv, u32 fuc_base,
>>>                          nv_wr32(priv, fuc_base + 0x0188, i >> 6);
>>>                  nv_wr32(priv, fuc_base + 0x0184, code->data[i]);
>>>          }
>>> +
>>> +       /* code must be padded to 0x40 bytes */
>>> +       for (; i & 0x3f; i++)
>>> +               nv_wr32(priv, fuc_base + 0x0184, 0);
> It's 256 bytes indeed.

Fixed, thanks!
