From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v7 6/9] media: tegra: Add Tegra210 Video input driver
Date: Wed, 15 Apr 2020 10:47:50 -0700
Message-ID: <b1c78827-13ea-0c94-a575-97b5afc0ede1@nvidia.com>
References: <1586919463-30542-1-git-send-email-skomatineni@nvidia.com>
 <1586919463-30542-7-git-send-email-skomatineni@nvidia.com>
 <4118112f-f865-5460-6319-d71271fd78d1@gmail.com>
 <a69a8b34-beea-3ad0-e08e-f7df8b9e7047@nvidia.com>
 <6afa951e-d904-f3c0-053f-82a02fb18979@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6afa951e-d904-f3c0-053f-82a02fb18979-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 4/15/20 10:21 AM, Sowjanya Komatineni wrote:
>
> On 4/15/20 9:54 AM, Sowjanya Komatineni wrote:
>>
>> On 4/15/20 7:22 AM, Dmitry Osipenko wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> 15.04.2020 05:57, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> +static int tegra_csi_remove(struct platform_device *pdev)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_csi *csi =3D platform_get_drvda=
ta(pdev);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 int err;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 err =3D host1x_client_unregister(&csi->clien=
t);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (err < 0) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 dev_err(csi->dev,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "failed to unregister h=
ost1x client: %d\n",=20
>>>> err);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return err;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 pm_runtime_disable(csi->dev);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 kfree(csi);
>>> IIRC, the driver removal is invoked on the unbinding. Hence, I'm not
>>> sure how moving away from the resource-managed API helps here. Could=20
>>> you
>>> please explain in a more details?
>>>
>>> Have you tried to test this driver under KASAN? I suspect that you just
>>> masked the problem, instead of fixing it.
>> Using devm_kzalloc for vi/csi structures based on prior feedback=20
>> request to switch to use kzalloc all over this driver.
>>
>> Hi Hans,
>>
>> video devices lifetime is till video device nodes are released. So,=20
>> v4l2 device release callback does the release of tegra channel=20
>> allocation which hold video device.
>>
>> Below are the 3 possible cases of unbind/unload,
>>
>> 1. during tegra-video module unload, if v4l2 device refcnt is not 0=20
>> which is the case when any of video device node handle is kept opened=20
>> then unloading module will not happen and module refcnt is also=20
>> non-zero and unloading tegra-video module reports module in use.
>>
>> 2. during tegra-video driver unbind, tegra-video driver removal will=20
>> do vi/csi clients exit ops which unregisters video device allocated=20
>> memory during release callback of v4l2 device. vi/csi structure=20
>> allocation remains same as vi/csi driver removal will not happen in=20
>> this case.
>>
>>
>> 3. during direct host1x client drivers vi/csi unbind, both=20
>> host1x_clients vi/csi gets unregistered, deletes host1x logical=20
>> device which executes tegra-video driver removal() -> vi/csi exit()=20
>> before vi/csi memory gets freed in vi/csi driver remove().
>>
>> So, any active streaming will stop and video devices are unregistered=20
>> during direct client driver unbind prior to freeing vi/csi memory.
>>
>> Also vi/csi driver remove does explicit free vi/csi as its allocated=20
>> with kzalloc. So not sure how using kzalloc is different to=20
>> devm_kzalloc for vi/csi structure in terms of when vi/csi memory gets=20
>> freed?
>>
>> Except for channel allocation which holds video device and as video=20
>> device life time is beyond tegra-video module unbind->vi exit(),=20
>> looks like we can use devm_kzalloc for vi/csi.
>>
>>
>> Can you please comment if you still think we need to use kzalloc=20
>> rather than devm_kzalloc for vi/csi structure allocation?
>>
>> Thanks
>>
>> Sowjanya
>>
> One more case is when video device node is kept opened with v4l2-ctl=20
> sleep (rather than streaming), where it will keep device node open for=20
> specified time and if direct vi client driver unbind happens then vi=20
> driver remove() will free vi memory before v4l2 device release happens.
>
> But I don't see any crash or errors with this case.
>
> Also if we allow direct client driver unbind, then vi structure memory=20
> lifetime should also be till v4l2 device release happens.
>
> But we can free vi in v4l2 device release callback as in case when=20
> device node is not kept opened, video device release happens immediate=20
> and we cant free vi that early.

typo fix:

But we can't free vi structure memory allocation in v4l2 device release=20
callback as in case when device node is not kept opened, device release=20
happens immediate and we can't free vi structure memory that early.

>
> Hans/Thierry, Can you please comment on this case?
>
> Thanks
>
> Sowjanya
>
