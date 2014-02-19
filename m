From: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] host1x: export host1x_syncpt_incr_max function
Date: Wed, 19 Feb 2014 14:27:33 -0800
Message-ID: <CAK5ve-LEnjWwWJnGva9WwtLaWrjgEh3P9PZa36N1OaagH_eosQ@mail.gmail.com>
References: <1392848608-15056-1-git-send-email-cooloney@gmail.com> <53052F34.4000009@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53052F34.4000009-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 19, 2014 at 2:24 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 02/19/2014 03:23 PM, Bryan Wu wrote:
>> Tegra V4L2 camera driver needs this function to do frame capture.
>
> Does it need to be EXPORT_SYMBOL()d too, in case things are modules?
>

Sure, I will update this patch to export symbol of it.
Thanks,
-Bryan
