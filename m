From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V1] regulator: fixed: Support for open-drain gpio
Date: Thu, 9 Feb 2012 11:31:35 +0530
Message-ID: <4F33613F.2080805@nvidia.com>
References: <1328611596-13279-1-git-send-email-ldewangan@nvidia.com> <20120207114341.GJ3332@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120207114341.GJ3332-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: "grant-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 07 February 2012 05:13 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Tue, Feb 07, 2012 at 04:16:36PM +0530, Laxman Dewangan wrote:
>
>> To make the pin to high/low for enabling/disabling the switches,
>> the pins will have the pull-up connected and the high/low can be
>> set using following methods:
>> LOW: gpio_direction_output(gpio, 0) ... this drives the signal
>> 	and overrides the pullup.
>> HIGH: gpio_direction_input(gpio) ... this turns off the output,
>> 	so the pullup (or some other device) controls the signal.
> Thinking about this further this is potentially going to apply to any
> GPIO output - perhaps we should push the implementation down into
> gpiolib so we just specify a flag when requesting the GPIO and then
> gpiolib does the pull low/high Z thing for us.  That would be much less
> effort in individual drivers, we'd just need to be able to set the flag
> and could potentially directly use any hardware open drain output
> support (some GPIO controllers will do all this in hardware) if the
> driver API were extended.  Grant, does that sound reasonable?
>
If Grant agree on this then we can have following thing:
- we have already apis like gpio_request_one() and 
gpio_request_multiple() which take the flags.
- We need to add the flag GPIOF_OD in current list of flags for requester.
- In the gpio_request_xx(), just store this flag in gpio_desc for 
corresponding gpios.
- When client set direction_output() with val 1 then do 
direction_input(). So check will be in function direction_output()
- When client  call set_value(), again check for value ==1 and GPIO_OD 
and if it is there, call direction_input.

On client side change, call proper request function with proper flag 
(with GPIOF_OD if it is require).

Does it sound good?

> * Unknown Key
> * 0x6E30FDDD
