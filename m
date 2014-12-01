From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [RESEND PATCH nouveau 3/3] volt: add support for GK20A
Date: Tue, 2 Dec 2014 09:18:24 +1000
Message-ID: <CACAvsv6dOhO46snBH_g+f2K1XvzPvqouF1ZBGF5GBbmoDaYnjQ@mail.gmail.com>
References: <1417173180-21726-1-git-send-email-vinceh@nvidia.com>
	<1417173180-21726-3-git-send-email-vinceh@nvidia.com>
	<547CF2F9.6040905@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <547CF2F9.6040905-GANU6spQydw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Cc: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Dec 2, 2014 at 9:00 AM, Martin Peres <martin.peres-GANU6spQydw@public.gmane.org> wrote:
> On 28/11/2014 12:13, Vince Hsu wrote:
>>
>> The voltage value are calculated by the hardware characterized
>> result.
>>
>> Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>
>> Resend this patch with the fuse change and proper patch prefix
>> per Thierry's request.
>
> Since the voltage table really is per-chipset, it would be insane
> to add that to the DT. If it was not the case, it is still easier to
> move to the DT instead of doing the opposite.
>
One thing that needs fixing is that this breaks the build on non-tegra arches.

> Acked-by: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
