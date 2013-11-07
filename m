From: Duan Jiong <duanj.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: replace IS_ERR and PTR_ERR with PTR_ERR_OR_ZERO
Date: Thu, 07 Nov 2013 09:15:17 +0800
Message-ID: <527AE9A5.8080003@cn.fujitsu.com>
References: <1383724435-15380-1-git-send-email-duanj.fnst@cn.fujitsu.com> <527A7333.9090409@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <527A7333.9090409-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

=E4=BA=8E 2013=E5=B9=B411=E6=9C=8807=E6=97=A5 00:49, Stephen Warren =E5=
=86=99=E9=81=93:
> On 11/06/2013 12:53 AM, Duan Jiong wrote:
>> This patch fixes coccinelle error regarding usage of IS_ERR and
>> PTR_ERR instead of PTR_ERR_OR_ZERO.
>=20
>> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem=
=2Ec
>=20
>> @@ -199,10 +199,7 @@ int tegra_bo_dumb_create(struct drm_file *file,=
 struct drm_device *drm,
>> =20
>>  	bo =3D tegra_bo_create_with_handle(file, drm, args->size, 0,
>>  					 &args->handle);
>> -	if (IS_ERR(bo))
>> -		return PTR_ERR(bo);
>> -
>> -	return 0;
>> +	return PTR_ERR_OR_ZERO(bo);
>>  }
>=20
> I suppose that's fine, although I wonder if it'll cause churn should =
we
> ever need to add code to the tail end of the function.
>=20
> BTW, why were all the similar patches that had nothing to do with Teg=
ra
> sent to the linux-tegra@ mailing list? You also didn't CC the
> maintainers of drivers/gpu/drm/tegra/ on this patch. Plus this patch =
has
> nothing to do with the rtc-linux@ mailing list.

I'm sorry for that. i just get the maintainers and the mail lists by th=
e script
get_maintainer.pl.

> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>=20
