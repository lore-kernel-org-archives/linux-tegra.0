From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: USB for Tegra114 Dalmore
Date: Thu, 01 Aug 2013 16:37:46 +0400
Message-ID: <51FA569A.9080705@cogentembedded.com>
References: <1375292543-7896-1-git-send-email-ttynkkynen@nvidia.com> <1375292543-7896-3-git-send-email-ttynkkynen@nvidia.com> <51F9550F.3080503@cogentembedded.com> <51F9660C.6090604@iki.fi> <51F96B48.10209@cogentembedded.com> <51F98A78.9060309@wwwdotorg.org> <51F98D92.3010607@cogentembedded.com> <51F99DE4.7010503@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51F99DE4.7010503-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Tuomas Tynkkynen <tuomas.tynkkynen-X3B1VOXEql0@public.gmane.org>, Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hello.

On 01-08-2013 3:29, Stephen Warren wrote:

>>>>      Don't they cause numerous resource conflicts while device nodes
>>>> being
>>>> instantiated as the platform devices?
>>
>>> No; the driver knows that the HW is screwy and there's lots of
>>> register-range sharing going on, so it simply maps the registers, rather
>>> than reserving the physical address range and mapping it.
>>
>>     Yes, it's clear that the driver should take special measures, I was
>> asking about the platform device creation phase. What do you see in
>> /proc/iomem?

> The drivers don't request the memory region since doing so would cause
> conflicts. Hence, the regions don't show up in /proc/iomem.

    Regions should show up after the platform device registration. They just 
show up as subregions of those when you request them. That's why I asked for 
your /proc/iomem.

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
