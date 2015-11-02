From: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [RFC 7/8] Start migrating XUSB away from MFD
Date: Mon, 02 Nov 2015 13:22:17 +0000
Message-ID: <56376389.8030806@collabora.co.uk>
References: <1446465323-9493-1-git-send-email-martyn.welch@collabora.co.uk> <1446465323-9493-8-git-send-email-martyn.welch@collabora.co.uk> <20151102124732.GW4058@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151102124732.GW4058@x1>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 02/11/15 12:47, Lee Jones wrote:
> On Mon, 02 Nov 2015, Martyn Welch wrote:
>
>> From: Martyn Welch <martyn-UcCTFicEjwugMbh0pXVFDA@public.gmane.org>
>>
>> This is my initial attempt to get xusb working without being a MFD on the
>> latest upstream kernel. It's still a bit hacky in places, but does seem to
>> get the USB2 up and working (USB3 device is recognised as a USB3 device
>> rather than enumberating as a USB2 device).
> After my 20 second look at the 2 patches of this set you sent me, I've
> concluded that it looks barking mad.  In patch 2 you're adding the
> XUSB MFD driver, then in this patch you're telling us that you're
> moving away from MFD despite adding more code to the subsystem.

Hi Lee,

Sorry, seems git send-email added you of it's own volition.

I've sent these patches to the mailing list for comment/help not for 
submission. As mentioned in the cover email, the first 5 patches are 
from an existing series that has been rejected. The later 3 patches show 
my modifications. I have not yet moved these files from the MFD 
directory, but will before submission (the series will be reworked so 
that the driver never goes into the MFD area).

> Besides, I'm never applying a patch that self confesses to be "hacky
> in places" into Mainline, ever.

As I mentioned before, I'm posting these patches for comment (hence why 
I've marked them as "RFC" not "PATCH").

Martyn
