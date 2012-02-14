From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V1 2/3] Documentation: gpio: Add details of open-drain
 configuration
Date: Tue, 14 Feb 2012 14:46:45 +0530
Message-ID: <4F3A267D.5020407@nvidia.com>
References: <1329114588-15430-1-git-send-email-ldewangan@nvidia.com> <1329114588-15430-3-git-send-email-ldewangan@nvidia.com> <20120213211809.GI11077@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120213211809.GI11077-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: "linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org" <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "dunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org" <dunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 14 February 2012 02:48 AM, Grant Likely wrote:
> On Mon, Feb 13, 2012 at 11:59:47AM +0530, Laxman Dewangan wrote:
>> Adding details of open drain configuration of the gpio so that
>> client can set the pin as open drain at the time of gpio request.
>>
>> Signed-off-by: Laxman Dewangan<ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Linus mentioned that this should be part of pinctrl instead of the gpio API,
> but I think there is an argument for making it part of the gpio API,
> particularly since open-drain is pretty much a universal concept that all
> gpio controllers can support (unlike driver strength) and as I said above, it
> is already implicitly supported by gpiolib.

I am not sure about other soc but taking Tegra as example, the gpio 
controller is almost same for same series of soc. It does not very much 
about different version of the socs. The pins, number of pins. pin 
controls, pin is OD or not etc vary from variant of socs and so it is 
much more depends on the particular soc rather than  the major family.
Bringing pincontrol information in gpio driver will make the gpio driver 
complex which need to take care of every variant of chips.

>    The difference with this
> method is it would allow drivers like the gpio-i2c.c driver to set the
> flag at gpio request time and then be able to always use gpio_set_value()
> regardless of the pin mode.
>
> However, I'm not thrilled about adding things to the already-horrible sysfs
> abi.  Please drop that hunk entirely or put it into a separate patch so it
> doesn't block the core functionality.
>

I will split the change in two parts one for core driver and other for 
the sysfs interface if all changes are fine here.

> Have you though about support for lines that are pulled low instead of
> high?  Those aren't as common, but it is conceivable that some
> hardware would need it.
I think open drain pin should not be pulled low otherwise it will not be 
possible to make the pin as HIGH with the assumption that the OD pin 
should never be driven to HIGH

But if it is there in any case then it should be handle differently at  
client level without letting the gpio driver that it is open-drain.
