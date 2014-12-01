From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [RESEND V2 PATCH 1/3] soc/tegra: fuse: export
 tegra_sku_info for module use
Date: Tue, 2 Dec 2014 08:23:12 +1000
Message-ID: <CACAvsv72dwfT_7SBrXR1xOFFvW2_kM-CiwAfWQUhVNrwPPX-vA@mail.gmail.com>
References: <1417173180-21726-1-git-send-email-vinceh@nvidia.com>
	<20141201100100.GB20174@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141201100100.GB20174@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Dec 1, 2014 at 8:01 PM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> I think the subject doesn't need "for module use" because that's
> implicit in exporting a symbol.
>
> On Fri, Nov 28, 2014 at 07:12:58PM +0800, Vince Hsu wrote:
>> Some Tegra drivers might be complied as kernel modules, and
>
> "compiled"
>
>> they need the fuse information for initialization. One
>> example is the GK20A Nouveau driver. It needs the GPU speedo
>> value to calculate frequency-voltage table. So export
>> the tegra_sku_info.
>
> Also please wrap the commit message at around 72 characters. If you make
> the lines too short it becomes almost as difficult to readable as if
> they're too long.
>
> Other than these small nitpicks this looks like a reasonable change to
> me.
>
>>
>> Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>
>> v2: add more description why we need this patch
>>
>>  drivers/soc/tegra/fuse/fuse-tegra.c | 1 +
>>  1 file changed, 1 insertion(+)
>
> Ben, patch 3/3 has a dependency on this one. Would you prefer to merge
> this as part of the Nouveau tree or do you want me to provide a stable
> branch that you can pull in to resolve the dependency?
I'll take the patch, seems the simplest option :)

Thanks,
Ben.

>
> In case of the former:
>
> Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
