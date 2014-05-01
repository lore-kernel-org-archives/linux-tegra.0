From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 0/9] drm/nouveau: support for GK20A, cont'd
Date: Thu, 1 May 2014 16:14:56 +0900
Message-ID: <5361F470.5050306@nvidia.com>
References: <1398410396-23338-1-git-send-email-acourbot@nvidia.com>
 <CACAvsv5x6uZcTGUTa3-wBRo0sJ-557sJ_d8r0kscODhr18yzBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACAvsv5x6uZcTGUTa3-wBRo0sJ-557sJ_d8r0kscODhr18yzBA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/01/2014 04:11 PM, Ben Skeggs wrote:
> On Fri, Apr 25, 2014 at 5:19 PM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> Changes since v2:
>> - Enabled software class
>> - Removed unneeded changes to nouveau_accel_init()
>> - Replaced use of architecture-private pfn_to_dma() and dma_to_pfn() with
>>    the portable page_to_phys()/phys_to_page()
> page_to_phys() looks well defined and used everywhere, phys_to_page()
> not so much (including on amd64) :(

Argh, dammit. Now I *really* wonder what one is supposed to use in such 
cases...

Let me come with a v4 then. I will address the other issue with external 
firmware at the same time.

Sorry for the inconvenience.

>
>> - Fixed incorrect comment/commit log talking about bytes instead of words
>>
>> Hope this looks good! Once this gets merged the next set will be to use this
>> driver on Jetson and Venice2 boards.
>>
>> Cheers,
>>
>> Alexandre Courbot (9):
>>    drm/nouveau/bar: only ioremap BAR3 if it exists
>>    drm/nouveau/bar/nvc0: support chips without BAR3
>>    drm/nouveau/ibus: add GK20A support
>>    drm/nouveau/fb: add GK20A support
>>    drm/nouveau/fifo: add GK20A support
>>    drm/nouveau/graph: enable when using external firmware
>>    drm/nouveau/graph: pad firmware code at load time
>>    drm/nouveau/graph: add GK20A support
>>    drm/nouveau: support for probing GK20A
>>
>>   drivers/gpu/drm/nouveau/Makefile                   |   6 +
>>   drivers/gpu/drm/nouveau/core/engine/device/nve0.c  |  17 +++
>>   drivers/gpu/drm/nouveau/core/engine/fifo/gk20a.c   |  35 +++++
>>   drivers/gpu/drm/nouveau/core/engine/fifo/nve0.h    |   1 +
>>   .../gpu/drm/nouveau/core/engine/graph/ctxgk20a.c   |  53 +++++++
>>   .../gpu/drm/nouveau/core/engine/graph/ctxnvc0.h    |   9 ++
>>   .../gpu/drm/nouveau/core/engine/graph/ctxnve4.c    |  14 +-
>>   drivers/gpu/drm/nouveau/core/engine/graph/gk20a.c  |  47 ++++++
>>   drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c   |  13 +-
>>   drivers/gpu/drm/nouveau/core/engine/graph/nvc0.h   |   2 +
>>   drivers/gpu/drm/nouveau/core/engine/graph/nve4.c   |   4 +-
>>   drivers/gpu/drm/nouveau/core/include/engine/fifo.h |   1 +
>>   .../gpu/drm/nouveau/core/include/engine/graph.h    |   1 +
>>   drivers/gpu/drm/nouveau/core/include/subdev/fb.h   |   1 +
>>   drivers/gpu/drm/nouveau/core/include/subdev/ibus.h |   1 +
>>   drivers/gpu/drm/nouveau/core/subdev/bar/base.c     |   6 +-
>>   drivers/gpu/drm/nouveau/core/subdev/bar/nvc0.c     | 114 +++++++-------
>>   drivers/gpu/drm/nouveau/core/subdev/fb/gk20a.c     |  56 +++++++
>>   drivers/gpu/drm/nouveau/core/subdev/fb/priv.h      |   1 +
>>   drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c  | 167 +++++++++++++++++++++
>>   drivers/gpu/drm/nouveau/core/subdev/ibus/gk20a.c   | 103 +++++++++++++
>>   21 files changed, 583 insertions(+), 69 deletions(-)
>>   create mode 100644 drivers/gpu/drm/nouveau/core/engine/fifo/gk20a.c
>>   create mode 100644 drivers/gpu/drm/nouveau/core/engine/graph/ctxgk20a.c
>>   create mode 100644 drivers/gpu/drm/nouveau/core/engine/graph/gk20a.c
>>   create mode 100644 drivers/gpu/drm/nouveau/core/subdev/fb/gk20a.c
>>   create mode 100644 drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c
>>   create mode 100644 drivers/gpu/drm/nouveau/core/subdev/ibus/gk20a.c
>>
>> --
>> 1.9.2
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
