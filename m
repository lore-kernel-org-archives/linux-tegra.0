From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nouveau: add coherent BO attribute
Date: Fri, 13 Mar 2015 15:39:46 +0900
Message-ID: <CAAVeFuL2XFnTGkfOB3hotVdzWxHGaTiSftkk_x-Vv3qNnmEsVA@mail.gmail.com>
References: <1426228051-20298-1-git-send-email-acourbot@nvidia.com> <CAKb7Uvg7zNZ9a05QQZfKTwQftsRg0R+TK4rU7zD1LieD_sDi=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKb7Uvg7zNZ9a05QQZfKTwQftsRg0R+TK4rU7zD1LieD_sDi=w@mail.gmail.com>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Mar 13, 2015 at 3:36 PM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> Doesn't this require a kernel version that has your other patch? What
> happens when this runs on an older kernel? Does it get silently
> ignored, or does it end up erroring out? If it errors out, that's
> fine. Otherwise some sort of version check should be put in, no?

The corresponding kernel patch is already merged in Ben's tree. If
running with an older kernel, this flag will be a no-op, which is fine
since GK20A's GPU (the reason for this patch as you have guessed :))
is not enabled for these kernels.

I am fine with adding a version check if you think it is necessary.
