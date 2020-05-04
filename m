From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
Date: Mon, 4 May 2020 14:18:09 +0200
Message-ID: <eddb1de3-81c2-159b-b24b-2e30ba2ba948@xs4all.nl>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
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
 <b5f6a4e0-6e97-05ae-f034-b84fc5a1129a@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b5f6a4e0-6e97-05ae-f034-b84fc5a1129a-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/05/2020 00:46, Sowjanya Komatineni wrote:
> 
> On 5/2/20 1:48 PM, Dmitry Osipenko wrote:
>> 02.05.2020 19:55, Sowjanya Komatineni пишет:
>>> Also stop stream ioctl request happens during suspend where both threads
>>> will be stopped properly. done thread stop happens only after finishing
>>> all outstanding buffers.
>> Do you mean that V4L core takes care of stopping the streami on suspend
>> and re-starting it on resume from suspend?
>>
>>> Stop stream request happens from streaming applications so even without
>>> driver suspend/resume implementation currently, streaming will be
>>> stopped prior to system  suspend where both threads will be stopped
>>> properly (after finishing out standing buffers) and will be resumed by
>>> application on system resume
>> All userspace is frozen on suspend. System suspension is transparent for
>> userspace applications. I'm not sure what you're meaning here.
>>
>>> Also tested suspending while streaming with this unconditional freeze, I
>>> don't see any issue as application stops stream where v4l_streamoff gets
>>> executed during suspend and on resume streaming starts where
>>> v4l_streamon happens.
>>>
>>> So, I don't see any issue with existing implementation of unconditional
>>> freeze.
>> I don't understand why freezing is needed at all if V4L core takes care
>> of stopping the stream on suspend, what is the point? If there is no
>> real point, then let's make threads non-freezable and done with that.
> 
> video device fops unlocked_ioctl is set to video_ioctl2() in vi driver.
> 
> video device fops unlocked_ioctl gets executed with stream off cmd 
> during suspend and stream on cmd during resume which eventually calls 
> v4l_streamoff and v4l_streamon during system suspend/resume.

That's news to me. The 'only' thing that suspend/resume needs to do is to
stop the HW DMA on suspend and to restart the HW DMA (and typically reconfigure
the whole HW video pipeline) on resume. Userspace doesn't do anything special.

That's how e.g. a UVC webcam behaves when you close the lid of a laptop while
it is streaming and open it again later.

It can be hard to get this right, and I suspect many media drivers will fail
this test.

> 
> My understanding to have freezable threads is during system suspend user 
> space applications are frozen prior to kernel freeze and during suspend 
> when opened video character device node gets closed these ioctl gets 
> invoked and stream off during suspend and stream on during resume 
> happens. So probably we still need to use freezable threads to sync with 
> user space application when frozen before really entering suspend.
> 
> Will wait for Thierry/Hans comment to correct if my above understanding 
> is wrong and help clarify if we need freezable threads at all in this 
> case...
> 
> Note: I see other drivers using freezable threads for capture drivers.

Well, it's often a copy-and-paste without truly understanding what is
going on. You should not assume that the author knew what was happening.

To be honest, I'm not an expert on this either.

Looking at the tegra start/finish threads: they basically look at the
chan->capture and chan->done lists. Freezing the threads should not be
a problem as long as the actual suspend/resume doesn't mess with those
lists. If it does, then it may get tricky to prove that it is safe to
do suspend/resume (I think).

An alternative is to stop and restart those threads when suspending or
resuming. Then those threads do not need to be 'freezable' and it might
be easier to validate the code.

In any case, I do not want to postpone the merger of the upcoming v12 for
this. Changes can be done in later patches, if needed.

Regards,

	Hans

> 
> 
> Assuming we use freezable threads, I was saying we don't need 
> conditional try_to_freeze() like you pointed because even if finish 
> thread freeze happens prior to frame capture initiated by start thread, 
> vi hardware will still continue to update this single ongoing buffer and 
> will finish max within 200ms and actually there is no direct processing 
> of this done by finish thread itself except that it returns buffers back 
> when done and in this case it returns back when unfreeze/wake up happens.
> 
> So, I don't see any issue of unconditional try_to_freeze() even with 
> freezable threads.
> 
> Thanks
> 
> Sowjanya
> 
> 
