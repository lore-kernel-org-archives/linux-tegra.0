From: Arjun Gopalan <agopalan@nvidia.com>
Subject: Re: permission to move definition of struct rpmsg_channel_info
Date: Tue, 10 Sep 2013 12:18:37 -0700
Message-ID: <522F708D.3060903@nvidia.com>
References: <5220F099.1020002@nvidia.com> <CAK=WgbZ2JgtAonvdyeDZazYBGdKpPAieJtjzi7MM6nwqhVfs7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK=WgbZ2JgtAonvdyeDZazYBGdKpPAieJtjzi7MM6nwqhVfs7g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ohad Ben-Cohen <ohad@wizery.com>
Cc: Brian Swetland <swetland@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Paul Walmsley <pwalmsley@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 09/08/2013 05:27 AM, Ohad Ben-Cohen wrote:
> Hi Arjun,
>
> On Fri, Aug 30, 2013 at 9:20 PM, Arjun Gopalan <agopalan@nvidia.com> wrote:
>> Hi Ohad/Brian,
>>
>> I have been working on rpmsg and I need to be able to create static rpmsg channels. Channel information needs to be specified by other drivers and for this, the drivers need access to struct rpmsg_channel_info.
> I'm not convinced how useful it is for other Linux drivers to create
> static rpmsg channels?
>
> Usually these channels reflect the existence of services running on
> the remote processor, and their creation (or lack thereof) should be
> specified in the remote image. This way an rpmsg channel is published
> iff there is a matching remote service.
>
> The way we were planning to add static channels functionality (I
> should still have preliminary patches doing this somewhere but the
> entire work was put on hold since TI changed its focus) is by
> statically publishing them in the resource table, which is coupled
> with a specific remote image.
>
> Best,
> Ohad.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
Hi Ohad,

Thanks for your response. Implementing a name service facility in the 
remote processor may be an option for us too. But, it would be nice to 
be able to create static rpmsg channels.

You mentioned that your patches publish rpmsg channels in the resource 
table which is coupled to the firmware image. In our case, we may not 
have a dynamic firmware that is loaded. In other words, we may not be 
using the Linux firmware loading mechanism at all. In that case, how do 
you think your patches have to be modified ?

Would we probably need static resource tables ?

On similar lines, the remoteproc core also mandates a valid firmware for 
every remote processor, which again won't work for our case. I have a 
patch to enable firmware-less remote processors but it is not in perfect 
shape yet because I haven't integrated virtio and remoteproc as is done 
in drivers/remoteproc/remoteproc_virtio. This would again possibly 
require something like static resource tables.

Instead, currently, I have a separate driver that overlaps with some of 
the functionalities offered by drivers/remoteproc/remoteproc_virtio.c.

Please let me know what your thoughts are on this.
Thanks.


Regards,
Arjun
