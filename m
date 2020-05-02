From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
Date: Sat, 2 May 2020 15:46:36 -0700
Message-ID: <b5f6a4e0-6e97-05ae-f034-b84fc5a1129a@nvidia.com>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <289d9c92-383f-3257-de7b-46179724285a@nvidia.com>
 <9aa64f21-7b23-7228-b5eb-d2ff092682ad@nvidia.com>
 <668cc4a0-2c81-0d87-b801-9fbf64e19137@nvidia.com>
 <bf3f654e-b8f8-d560-fc5e-03d73cb7eab0@nvidia.com>
 <525e481b-9137-6fdd-bbf9-3779a5704e6b@nvidia.com>
 <fe7ebad6-0368-b1f0-4f58-648baa5e3f79@nvidia.com>
 <4f095181-2338-3b71-316c-f8bbfc7865cc@nvidia.com>
 <50e872bb-913a-7b47-3264-af6b1cedb0e2@nvidia.com>
 <e17a8a49-be53-465d-f64c-3f4c77391d98@nvidia.com>
 <da5154b4-85f9-3e56-a440-f75debaec3a8@nvidia.com>
 <cbb047ae-97dc-8b9a-a5ba-8e2a5dab3771@nvidia.com>
 <6ae2d00d-7955-d12b-5b56-955ef72ece26@nvidia.com>
 <f9073b28-f1f1-636c-be53-764fb0a531a1@gmail.com>
 <1767e50f-efb7-5e89-22f6-0917821b660d@nvidia.com>
 <235a4cd4-4d4a-04b8-6c65-43a4dba48a0b@nvidia.com>
 <f8103170-7879-8597-3e3c-da9a3b6a40b3@nvidia.com>
 <5d847770-dad9-8f18-67b5-c1ba79084957@nvidia.com>
 <4abf30e0-fed9-ba39-ae38-350789bce99d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4abf30e0-fed9-ba39-ae38-350789bce99d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 5/2/20 1:48 PM, Dmitry Osipenko wrote:
> 02.05.2020 19:55, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Also stop stream ioctl request happens during suspend where both threads
>> will be stopped properly. done thread stop happens only after finishing
>> all outstanding buffers.
> Do you mean that V4L core takes care of stopping the streami on suspend
> and re-starting it on resume from suspend?
>
>> Stop stream request happens from streaming applications so even without
>> driver suspend/resume implementation currently, streaming will be
>> stopped prior to system=C2=A0 suspend where both threads will be stopped
>> properly (after finishing out standing buffers) and will be resumed by
>> application on system resume
> All userspace is frozen on suspend. System suspension is transparent for
> userspace applications. I'm not sure what you're meaning here.
>
>> Also tested suspending while streaming with this unconditional freeze, I
>> don't see any issue as application stops stream where v4l_streamoff gets
>> executed during suspend and on resume streaming starts where
>> v4l_streamon happens.
>>
>> So, I don't see any issue with existing implementation of unconditional
>> freeze.
> I don't understand why freezing is needed at all if V4L core takes care
> of stopping the stream on suspend, what is the point? If there is no
> real point, then let's make threads non-freezable and done with that.

video device fops unlocked_ioctl is set to video_ioctl2() in vi driver.

video device fops unlocked_ioctl gets executed with stream off cmd=20
during suspend and stream on cmd during resume which eventually calls=20
v4l_streamoff and v4l_streamon during system suspend/resume.

My understanding to have freezable threads is during system suspend user=20
space applications are frozen prior to kernel freeze and during suspend=20
when opened video character device node gets closed these ioctl gets=20
invoked and stream off during suspend and stream on during resume=20
happens. So probably we still need to use freezable threads to sync with=20
user space application when frozen before really entering suspend.

Will wait for Thierry/Hans comment to correct if my above understanding=20
is wrong and help clarify if we need freezable threads at all in this=20
case...

Note: I see other drivers using freezable threads for capture drivers.


Assuming we use freezable threads, I was saying we don't need=20
conditional try_to_freeze() like you pointed because even if finish=20
thread freeze happens prior to frame capture initiated by start thread,=20
vi hardware will still continue to update this single ongoing buffer and=20
will finish max within 200ms and actually there is no direct processing=20
of this done by finish thread itself except that it returns buffers back=20
when done and in this case it returns back when unfreeze/wake up happens.

So, I don't see any issue of unconditional try_to_freeze() even with=20
freezable threads.

Thanks

Sowjanya
