From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v3 4/6] media: tegra: Add Tegra210 Video input driver
Date: Sun, 23 Feb 2020 20:45:23 -0800
Message-ID: <12a36c2a-593c-e555-d44e-e2e6c4c1a562@nvidia.com>
References: <1581704608-31219-1-git-send-email-skomatineni@nvidia.com>
 <1581704608-31219-5-git-send-email-skomatineni@nvidia.com>
 <b301c247-537d-d78e-b057-a3225b10de7e@xs4all.nl>
 <dc592f29-3109-d10c-7df7-ffdb2755ade0@xs4all.nl>
 <b3933aa1-0717-183d-f00c-2d5fd6836a18@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b3933aa1-0717-183d-f00c-2d5fd6836a18-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 2/20/20 11:11 AM, Sowjanya Komatineni wrote:
>
> On 2/20/20 5:33 AM, Hans Verkuil wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> (Replying to myself so I can explain this a bit more)
>>
>> On 2/20/20 1:44 PM, Hans Verkuil wrote:
>>>> +
>>>> +static int tegra_csi_tpg_channels_alloc(struct tegra_csi *csi)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 struct device_node *node =3D csi->dev->of_node;
>>>> +=C2=A0=C2=A0=C2=A0 unsigned int port_num;
>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_csi_channel *item;
>>>> +=C2=A0=C2=A0=C2=A0 unsigned int tpg_channels =3D csi->soc->csi_max_ch=
annels;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /* allocate CSI channel for each CSI x2 ports */
>>>> +=C2=A0=C2=A0=C2=A0 for (port_num =3D 0; port_num < tpg_channels; port=
_num++) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 it=
em =3D devm_kzalloc(csi->dev, sizeof(*item), GFP_KERNEL);
>>> Using devm_*alloc can be dangerous. If someone unbinds the driver, then
>>> all memory allocated with devm_ is immediately freed. But if an=20
>>> application
>>> still has a filehandle open, then when it closes it it might still=20
>>> reference
>>> this already-freed memory.
>>>
>>> I recommend that you avoid using devm_*alloc for media drivers.
>> A good test is to unbind & bind the driver:
>>
>> cd /sys/devices/platform/50000000.host1x/54080000.vi/driver
>> echo -n 54080000.vi >unbind
>> echo -n 54080000.vi >bind
>>
>> First just do this without the driver being used. That already
>> gives me 'list_del corruption' kernel messages (list debugging
>> is turned on in my kernel).

Will fix in v4 to use kzalloc and also proper release v4l2 to make sure=20
unbind/bind works properly.

BTW, tegra vi and csi are registered as clients to host1x video driver.

So, unbind and bind should be done with host1x video driver "tegra-video"

cd /sys/devices/platform/50000000.host1x/tegra-video/driver
echo -n tegra-video > unbind
echo -n tegra-video > bind

>>
>> Note that this first test is basically identical to a rmmod/modprobe
>> of the driver. But when I compiled the driver as a module it didn't
>> create any video device nodes! Nor did I see any errors in the kernel
>> log. I didn't pursue this, and perhaps I did something wrong, but it's
>> worth taking a look at.
>>
>> The next step would be to have a video node open with:
>>
>> v4l2-ctl --sleep 10
>>
>> then while it is sleeping unbind the driver and see what happens
>> when v4l2-ctl exits.
>>
>> Worst case is when you are streaming:
>>
>> v4l2-ctl --stream-mmap
>>
>> and then unbind.
>>
>> In general, the best way to get this to work correctly is:
>>
>> 1) don't use devm_*alloc
>> 2) set the release callback of struct v4l2_device and do all freeing=20
>> there.
>> 3) in the platform remove() callback you call media_device_unregister()
>> =C2=A0=C2=A0=C2=A0 and video_unregister_device().
> Reg 3, in current patch, media_device_unregister is called in=20
> host1x_video_remove
> video_unregister_device happens during host1x_video_remove ->=20
> host1x_device_exit -> tegra_vi_exit -> tegra_vi_channels_cleanup
>
>> It's worth getting this right in this early stage, rather than fixing it
>> in the future.
>>
>> Regards,
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Hans
