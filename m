From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
Date: Tue, 7 Apr 2020 12:05:57 -0700
Message-ID: <55ca95a0-41d9-a071-ab9d-08d26b3f8698@nvidia.com>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <40102767-ecdb-e958-66f4-45d11464069c@gmail.com>
 <b7b77258-6309-7ed2-489d-337cf273ba1e@nvidia.com>
 <6014fee9-ce97-7ced-f2ba-82176b8b36db@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6014fee9-ce97-7ced-f2ba-82176b8b36db-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 4/6/20 9:11 AM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 06.04.2020 18:41, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 4/5/20 2:11 PM, Dmitry Osipenko wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> 04.04.2020 04:25, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> ...
>>>> +static int tegra_vi_tpg_channels_alloc(struct tegra_vi *vi)
>>>> +{
>>>> +     struct tegra_vi_channel *chan, *tmp;
>>>> +     unsigned int port_num;
>>>> +     unsigned int nchannels =3D vi->soc->vi_max_channels;
>>>> +     int ret =3D 0;
>>>> +
>>>> +     for (port_num =3D 0; port_num < nchannels; port_num++) {
>>>> +             /*
>>>> +              * Do not use devm_kzalloc as memory is freed immediatel=
y
>>>> +              * when device instance is unbound but application
>>>> might still
>>>> +              * be holding the device node open. Channel memory
>>>> allocated
>>>> +              * with kzalloc is freed during video device release
>>>> callback.
>>>> +              */
>>>> +             chan =3D kzalloc(sizeof(*chan), GFP_KERNEL);
>>> Why anyone would want to unbind this driver in practice?
>>>
>>> I think it should make more sense to set suppress_bind_attrs=3Dtrue.
>>  From the previous feedback of patch series, we need to support
>> unbind/bind and looks like this driver should also support to built as a
>> module.
> If module unloading is also affected, then perhaps you should use
> get/put_device() to not allow freeing the resources until they're still
> in-use.
>
> I suppose that it should be up to the V4L core to keep the device alive
> while needed, rather than to put the burden to the individual drivers.

Hans/Thierry, Can you please comment on this?
