From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] early init and DT platform devices allocation/registration
Date: Wed, 26 Jun 2013 14:12:06 +0100
Message-ID: <CACxGe6u=BfnbwmS=7X5eYqKuSkmGdu9v-StAx+m7fLd+8C69pA@mail.gmail.com>
References: <51C9AF96.3040107@wwwdotorg.org> <20130625.193628.2143557800560690024.hdoyu@nvidia.com>
 <CACxGe6t9ifg9VRfXKypuhie3pXVPneZqcBy+J1bFpUaUx32P7g@mail.gmail.com>
 <20130626.090030.1519009485651154440.hdoyu@nvidia.com> <CACxGe6te2RzFb6nkSZQFrzVX4fkQo4pyzLJ1D7Lf=440mE+jyg@mail.gmail.com>
 <51CAE235.1000807@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51CAE235.1000807-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org" <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, "Pawel.Moll-5wv7dgnIgG8@public.gmane.org" <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jun 26, 2013 at 1:44 PM, Sebastian Hesselbarth
<sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 06/26/13 12:03, Grant Likely wrote:
>>
>> On Wed, Jun 26, 2013 at 7:00 AM, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>>
>>> Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote @ Tue, 25 Jun 2013
>>> 19:52:33 +0200:
>>>
>>>>> Here's my workaround. I need to call of_detach_node() with OF_DYNAMIC
>>>>> to avoid duplicated device registration.
>>>>
>>>>
>>>> Gah! my eyes!
>>>>
>>>> Don't do that. It is incredibly problematic. Look at inhibiting
>>>> duplicate device creation instead.
>>>
>>>
>>> I may not follow this thread correctly, but could anyone point out the
>>> above "inhibiting duplicate device creation" if there's already such
>>> solution?
>>
>>
>> No, the solution doesn't exist yet, but it wouldn't be hard to
>> implement. What you need to do is to add a struct device pointer to
>> struct device_node, and set the pointer to the struct device when
>> of_platform_device_create creates a device. (it would also need to be
>> set for early_platform_device creation, but that's not something that
>> should affect you). You would also add a check to
>> of_platform_device_create to check if the device pointer is already
>> set. If it is, then skip creation of the device.
>
>
> Grant,
>
> What about the other way round, i.e. check if there is a device with
> .of_node pointed to the struct device_node currently at
> of_platform_device_create?
>
> That will avoid adding struct device to struct device_node which you
> fought against for good reasons.

The main thing is that it means searching through the entire list of
platform devices every time a new platform device is created. That
seems unnecessarily expensive to me.

>
> Also, I guess of_platform_device_create could be exported and used
> by anyone who wants to create platform_devices early.

Yes, but in that case it is probably better for them to call
of_platform_populate early if of_platform_device_create is fixed to
support early calling. Then you'd just set up all the devices earlier
in init, allow drivers that support early probing to do so, and then
everything else uses the normal initcall path.

g.
