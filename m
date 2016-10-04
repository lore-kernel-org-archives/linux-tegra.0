From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v8 2/4] drm: Add API for capturing frame CRCs
Date: Tue, 4 Oct 2016 13:38:35 +0100
Message-ID: <960a3dc0-173d-e0ca-d56d-be468b8b5926@nvidia.com>
References: <1473415010-1389-1-git-send-email-tomeu.vizoso@collabora.com>
 <1473415010-1389-3-git-send-email-tomeu.vizoso@collabora.com>
 <48ef75ce-061f-d9b0-d5fb-4503af2e5f71@nvidia.com>
 <CAKMK7uGLhpDt3hWyDG++ey=QepSyi2a8Q4PrZ=8HhETvUbQBCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKMK7uGLhpDt3hWyDG++ey=QepSyi2a8Q4PrZ=8HhETvUbQBCA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 04/10/16 12:25, Daniel Vetter wrote:
> On Tue, Oct 4, 2016 at 12:10 PM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> Looks like crtc is a errno in the above case. I see this function is
>> called by looping through all the crtc and we never check to see if
>> they are valid. Should we?
> 
> Tegra is still using the load/unload hooks. That didn't mesh well with
> Tomeu's patches (and Tomeu's patches have been thrown out meanwhile
> because of that). Still would be neat if tegra could be demidlayered
> and loose it's load/unload hooks. See the kerneldoc in drm_drv.c
> (especially the DOC: section).

Adding Thierry and Alex as this is more their domain and CC'ing linux-tegra.

Cheers
Jon

-- 
nvpublic
