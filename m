From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: Fix crash caused by reference count imbalance
Date: Wed, 18 May 2016 10:18:52 +0100
Message-ID: <573C337C.3030009@nvidia.com>
References: <1463502435-29217-1-git-send-email-jonathanh@nvidia.com>
 <20160517164632.GT27098@phenom.ffwll.local> <573B54F2.4010300@nvidia.com>
 <CAKMK7uHNKPfKAQ49rboWSiXe_OrxK6On6ZrFrtSaCwmU7VfQGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKMK7uHNKPfKAQ49rboWSiXe_OrxK6On6ZrFrtSaCwmU7VfQGA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 17/05/16 18:36, Daniel Vetter wrote:
> On Tue, May 17, 2016 at 7:29 PM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>>> @@ -764,6 +769,9 @@ tegra_dsi_connector_duplicate_state(struct drm_connector *connector)
>>>>      if (!copy)
>>>>              return NULL;
>>>>
>>>> +    if (copy->base.crtc)
>>>> +            drm_connector_reference(connector);
>>>> +
>>>
>>> Please use __drm_atomic_helper_connector_duplicate_state instead of
>>> open-coding it.
>>
>> Unfortunately, tegra is allocating and duplicating memory for the entire
>> tegra_dsi_state structure (of which drm_connector_state is a member) in
>> this function and so I was not able to do that. However, may be Thierry
>> can comment on whether that is completely necessary and if we can move
>> to using __drm_atomic_helper_connector_duplicate_state() instead.
> 
> Check out how other drivers are using this helper - it is explicitly
> for the case where you duplicate the entire struct, and it just
> initializes the core part from drm. You can then add your own fixup
> code afterwards. It also doesn't matter whether you do kmalloc or
> kcalloc or kmemdup - it does a memcpy of its own to make sure state
> gets copied.

I had a look but I don't see anyone using the
__drm_atomic_helper_connector_duplicate_state() helper, I only see that
 drivers are using drm_atomic_helper_connector_duplicate_state()
directly.  

Yes I understand that this helper is doing an explicit copy of the
entire drm_connector_state struct and yes I could do something like the
following ...

 static struct drm_connector_state *
 tegra_dsi_connector_duplicate_state(struct drm_connector *connector)
 {
         struct tegra_dsi_state *state = to_dsi_state(connector->state);
         struct tegra_dsi_state *copy;
 
         copy = kmemdup(state, sizeof(*state), GFP_KERNEL);
         if (!copy)
                 return NULL;

         __drm_atomic_helper_connector_duplicate_state(connector,
						       &copy->base);
 
         return &copy->base;
 }

... however, this means that I am copying the drm_connector_state twice
and this is what I was trying to avoid. Sorry if I am misunderstanding
you here, but I don't see how I can avoid the 2nd copy if I use 
__drm_atomic_helper_connector_duplicate_state().

Cheers
Jon

-- 
nvpublic
