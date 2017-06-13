From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 07/22] drm/tegra: Remove module ownership from the
 tegra_fb_ops
Date: Tue, 13 Jun 2017 17:00:28 +0300
Message-ID: <827dcffe-b25c-75b1-d988-5977de1dd83f@gmail.com>
References: <cover.1495498184.git.digetx@gmail.com>
 <b90497ec1e9ee182cdd4a19466c516e3b0553939.1495498184.git.digetx@gmail.com>
 <20170613134340.GG16758@ulmo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170613134340.GG16758-m5CkvRiFyV9wFLYp8hBm2A@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 13.06.2017 16:43, Thierry Reding wrote:
> On Tue, May 23, 2017 at 03:14:22AM +0300, Dmitry Osipenko wrote:
>> The framebuffers console fbcon_startup() increments the tegra_drm module
>> 'use' refcount via try_module_get(), causing an interlock of the DRM subsys
>> and the tegra_drm modules. In result, the tegra_drm module can't be unloaded
>> using rmmod.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/gpu/drm/tegra/fb.c | 1 -
>>  1 file changed, 1 deletion(-)
> 
> That's done on purpose because otherwise you could just rip out the
> driver from under the framebuffer emulation and things would crash.
> 
> My understanding is that the right way to unload a module is to unbind
> the driver first (which will cause the framebuffer to be removed and
> hence the reference to be dropped) before the rmmod.
> 
> Thierry
> 

Aha, interesting. I'll try the unbinding and will drop this patch from the
series, thank you for the clarification. I haven't observed any crashes on a
module reloading (framebuffer detached/attached just fine), maybe I was lucky then.

-- 
Dmitry
