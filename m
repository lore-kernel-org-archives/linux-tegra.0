From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v7 6/9] media: tegra: Add Tegra210 Video input driver
Date: Wed, 15 Apr 2020 09:54:35 -0700
Message-ID: <a69a8b34-beea-3ad0-e08e-f7df8b9e7047@nvidia.com>
References: <1586919463-30542-1-git-send-email-skomatineni@nvidia.com>
 <1586919463-30542-7-git-send-email-skomatineni@nvidia.com>
 <4118112f-f865-5460-6319-d71271fd78d1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4118112f-f865-5460-6319-d71271fd78d1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 4/15/20 7:22 AM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 15.04.2020 05:57, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> +static int tegra_csi_remove(struct platform_device *pdev)
>> +{
>> +     struct tegra_csi *csi =3D platform_get_drvdata(pdev);
>> +     int err;
>> +
>> +     err =3D host1x_client_unregister(&csi->client);
>> +     if (err < 0) {
>> +             dev_err(csi->dev,
>> +                     "failed to unregister host1x client: %d\n", err);
>> +             return err;
>> +     }
>> +
>> +     pm_runtime_disable(csi->dev);
>> +     kfree(csi);
> IIRC, the driver removal is invoked on the unbinding. Hence, I'm not
> sure how moving away from the resource-managed API helps here. Could you
> please explain in a more details?
>
> Have you tried to test this driver under KASAN? I suspect that you just
> masked the problem, instead of fixing it.
Using devm_kzalloc for vi/csi structures based on prior feedback request=20
to switch to use kzalloc all over this driver.

Hi Hans,

video devices lifetime is till video device nodes are released. So, v4l2=20
device release callback does the release of tegra channel allocation=20
which hold video device.

Below are the 3 possible cases of unbind/unload,

1. during tegra-video module unload, if v4l2 device refcnt is not 0=20
which is the case when any of video device node handle is kept opened=20
then unloading module will not happen and module refcnt is also non-zero=20
and unloading tegra-video module reports module in use.

2. during tegra-video driver unbind, tegra-video driver removal will do=20
vi/csi clients exit ops which unregisters video device allocated memory=20
during release callback of v4l2 device. vi/csi structure allocation=20
remains same as vi/csi driver removal will not happen in this case.


3. during direct host1x client drivers vi/csi unbind, both=20
host1x_clients vi/csi gets unregistered, deletes host1x logical device=20
which executes tegra-video driver removal() -> vi/csi exit() before=20
vi/csi memory gets freed in vi/csi driver remove().

So, any active streaming will stop and video devices are unregistered=20
during direct client driver unbind prior to freeing vi/csi memory.

Also vi/csi driver remove does explicit free vi/csi as its allocated=20
with kzalloc. So not sure how using kzalloc is different to devm_kzalloc=20
for vi/csi structure in terms of when vi/csi memory gets freed?

Except for channel allocation which holds video device and as video=20
device life time is beyond tegra-video module unbind->vi exit(), looks=20
like we can use devm_kzalloc for vi/csi.


Can you please comment if you still think we need to use kzalloc rather=20
than devm_kzalloc for vi/csi structure allocation?

Thanks

Sowjanya
