From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] early init and DT platform devices allocation/registration
Date: Wed, 26 Jun 2013 14:44:37 +0200
Message-ID: <51CAE235.1000807@gmail.com>
References: <51C9AF96.3040107@wwwdotorg.org> <20130625.193628.2143557800560690024.hdoyu@nvidia.com> <CACxGe6t9ifg9VRfXKypuhie3pXVPneZqcBy+J1bFpUaUx32P7g@mail.gmail.com> <20130626.090030.1519009485651154440.hdoyu@nvidia.com> <CACxGe6te2RzFb6nkSZQFrzVX4fkQo4pyzLJ1D7Lf=440mE+jyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6te2RzFb6nkSZQFrzVX4fkQo4pyzLJ1D7Lf=440mE+jyg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org" <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, "Pawel.Moll-5wv7dgnIgG8@public.gmane.org" <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/26/13 12:03, Grant Likely wrote:
> On Wed, Jun 26, 2013 at 7:00 AM, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote @ Tue, 25 Jun 2013 19:52:33 +0200:
>>
>>>> Here's my workaround. I need to call of_detach_node() with OF_DYNAMIC
>>>> to avoid duplicated device registration.
>>>
>>> Gah! my eyes!
>>>
>>> Don't do that. It is incredibly problematic. Look at inhibiting
>>> duplicate device creation instead.
>>
>> I may not follow this thread correctly, but could anyone point out the
>> above "inhibiting duplicate device creation" if there's already such
>> solution?
>
> No, the solution doesn't exist yet, but it wouldn't be hard to
> implement. What you need to do is to add a struct device pointer to
> struct device_node, and set the pointer to the struct device when
> of_platform_device_create creates a device. (it would also need to be
> set for early_platform_device creation, but that's not something that
> should affect you). You would also add a check to
> of_platform_device_create to check if the device pointer is already
> set. If it is, then skip creation of the device.

Grant,

What about the other way round, i.e. check if there is a device with
.of_node pointed to the struct device_node currently at
of_platform_device_create?

That will avoid adding struct device to struct device_node which you
fought against for good reasons.

Also, I guess of_platform_device_create could be exported and used
by anyone who wants to create platform_devices early.

Sebastian
