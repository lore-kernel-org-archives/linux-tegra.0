From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v2 11/18] media: tegra-video: Add support for external
 sensor capture
Date: Tue, 7 Jul 2020 13:29:13 -0700
Message-ID: <c08ea38f-7629-1800-fb74-a2f75daf2eb0@nvidia.com>
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
 <1592358094-23459-12-git-send-email-skomatineni@nvidia.com>
 <50deca28-c198-703c-96e2-82c53f48cd65@xs4all.nl>
 <6ee18b4d-b63b-8053-1b7e-c3ec7c1d4956@nvidia.com>
 <6846e5bb-db1d-c2ff-c52c-70a2094c5b50@nvidia.com>
 <af11cb24-57b2-7326-ca29-e168dcbb8006@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <af11cb24-57b2-7326-ca29-e168dcbb8006-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 7/7/20 12:35 PM, Hans Verkuil wrote:
> On 07/07/2020 21:25, Sowjanya Komatineni wrote:
>> On 7/7/20 12:01 PM, Sowjanya Komatineni wrote:
>>>
>>> On 7/6/20 2:10 AM, Hans Verkuil wrote:
>>>>> +static void tegra_vi_graph_cleanup(struct tegra_vi *vi)
>>>>> +{
>>>>> +	struct tegra_vi_channel *chan;
>>>>> +
>>>>> +	list_for_each_entry(chan, &vi->vi_chans, list) {
>>>>> +		video_unregister_device(&chan->video);
>>>>> +		mutex_lock(&chan->video_lock);
>>>>> +		vb2_queue_release(&chan->queue);
>>>> No need for this since this is done in vb2_fop_release().
>>>>
>>>> In fact, vb2_queue_release should never be called by drivers. Just usi=
ng
>>>> vb2_fop_release or __vb2_fop_release is sufficient.
>>>>
>>>> The confusion is due to the fact that the name suggests that vb2_queue=
_release
>>>> has to be balanced with vb2_queue_init, but that's not the case. Perha=
ps
>>>> vb2_queue_stop or something like that might be a better name. I'll hav=
e to
>>>> think about this since I see that a lot of drivers do this wrong.
>>>>
>>>>> +		mutex_unlock(&chan->video_lock);
>>>>> +		v4l2_async_notifier_unregister(&chan->notifier);
>>>>> +		v4l2_async_notifier_cleanup(&chan->notifier);
>>>>> +	}
>>>>> +}
>>>>> +
>>> vb2_queue_release() here is called to stop streaming a head before medi=
a links are removed in case of when driver unbind happens while
>>> userspace application holds video device with active streaming in progr=
ess.
>>>
>>> Without vb2_queue_release() here streaming will be active during the dr=
iver unbind and by the time vb2_queue_release() happens from
>>> vb2_fop_release(), async notifiers gets unregistered and media links wi=
ll be removed which causes channel stop stream to crash as we can't
>>> retrieve sensor subdev=C2=A0 thru media entity pads to execute s_stream=
 on subdev.
>>>
>> I think we don't need async notifier unbind. Currently media links are r=
emoved during unbind so during notifier unregister all subdevs gets
>> unbind and links removed.
>>
>> media_device_unregister during video device release callback takes care =
of media entity unregister and removing links.
>>
>> So, will try by removing notifier unbind along with removing vb2_queue_r=
elease during cleanup.
>>
> I actually wonder if vb2_queue_release shouldn't be called from video_unr=
egister_device.
>
> I'll look into this tomorrow.
>
> Regards,
>
> 	Hans

Thanks Hans.

Tried without notifier unbind to remove media links and I still see=20
crash due to below diff reason now.

With userspace app holding video device node with active streaming in=20
progress when I do driver unbind, v4l2_device release callback=20
tegra_v4l2_dev_release() happens prior to vb2_fops_release() ->=20
vb2_queue_release().

All channels resources and channel memory is freed during v4l2_device=20
release callback.

Letting vb2_queue_release() to happen thru vb2_fops_release() causes=20
crash as stop streaming tries to retrieve subdev thru channel media pads=20
and channel memory is freed by that time.

So, doing vb2_queue_release() during driver unbind -> tegra_vi_exit() ->=20
tegra_vi_graph_cleanup(), stops subdev stream properly and then on=20
v4l2_device release channel memory gets freed and this works which is=20
the existing implementation in the patch.

I remember adding vb2_queue_release() during graph cleanup for TPG as=20
well for the same reason to allow driver unbind while holding video=20
device from user space so media pad can be accessible to stop stream=20
before channel cleanup.

Regards,

Sowjanya
