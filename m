From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 08/12] drm/nouveau/graph: enable when using external
 firmware
Date: Wed, 2 Apr 2014 22:53:55 +0900
Message-ID: <CAAVeFuKtjmF_ayM5PEnee1DkC7HBxbUFASs2ArSOso-wfW=VHg@mail.gmail.com>
References: <1395650554-31925-1-git-send-email-acourbot@nvidia.com>
 <1395650554-31925-9-git-send-email-acourbot@nvidia.com>
 <20140324225802.GG17218@mithrandir>
 <CACAvsv5yEbMWZnxgyhmY1r3Kp9PU8vXg2BcT4ZMJe7Ti9cHBUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CACAvsv5yEbMWZnxgyhmY1r3Kp9PU8vXg2BcT4ZMJe7Ti9cHBUw@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ben Skeggs <skeggsb@gmail.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Mar 26, 2014 at 1:21 PM, Ben Skeggs <skeggsb@gmail.com> wrote:
> On Tue, Mar 25, 2014 at 8:58 AM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
>> On Mon, Mar 24, 2014 at 05:42:30PM +0900, Alexandre Courbot wrote:
>> [...]
>>> diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c b/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
>>> index 6ef8bf181b2d..f997a18f5760 100644
>>> --- a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
>>> +++ b/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
>>> @@ -1133,10 +1133,14 @@ nvc0_graph_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
>>>       struct nvc0_graph_oclass *oclass = (void *)bclass;
>>>       struct nouveau_device *device = nv_device(parent);
>>>       struct nvc0_graph_priv *priv;
>>> +     bool use_fw;
>>
>> Perhaps "ext_fw" or "use_ext_fw" would be more accurate.
>>
>>>       int ret, i;
>>>
>>> +     use_fw = nouveau_boolopt(device->cfgopt, "NvGrUseFW", false);
>>> +
>>>       ret = nouveau_graph_create(parent, engine, bclass,
>>> -                                (oclass->fecs.ucode != NULL), &priv);
>>> +                                (oclass->fecs.ucode != NULL) || use_fw,
>>> +                                &priv);
>>
>> Or perhaps a more intuitive way would be to name the variable "enable"
>> and have something like:
>>
>>         if (!nouveau_boolopt(device->cfgopt, "NvGrUseFW", false))
>>                 enable = oclass->fecs.ucode != NULL;
>>         else
>>                 enable = true;
>>
>>         ret = nouveau_graph_create(parent, engine, bclass, enable, &priv);
>>         ...
> Agreed, this looks a lot nicer.

Will fix that, thanks!
