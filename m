From: Segher Boessenkool <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [RFC 2/2] ARM:Tegra: Device Tree Support: Initialize audio card gpio's from the device tree.
Date: Mon, 30 May 2011 20:54:41 +0200
Message-ID: <8d2515b13c817cc956b185d043bcef00@kernel.crashing.org>
References: <20110527205444.21000.90209.stgit@riker> <20110527205721.21000.78599.stgit@riker> <20110528012427.GB5971@opensource.wolfsonmicro.com> <BANLkTinKLcYmStvBEGDcN84BapJXe5Y5bg@mail.gmail.com> <20110530033826.GE4130@opensource.wolfsonmicro.com> <20110530061155.GC23517@ponder.secretlab.ca> <4DE336A1.5040509@firmworks.com> <20110530070138.GA5036@opensource.wolfsonmicro.com>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110530070138.GA5036-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, "glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Olof Johansson <olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

>> I'm currently dealing with an SoC that has over a hundred GPIOs.
>> Whatever we choose, I think it should be able to handle an insane
>> number of GPIOs without getting any more cumbersome that is
>> necessary.
>
> This is *consumer* side GPIOs, not bindings for the device providing 
> the
> GPIOs.  If a single device needs to use hundreds of GPIOs I'd expect
> many of them will be block functions so you'd have a binding with an
> array for things like "databus" and "addrbus".

But please name them like "databus-gpio", so that it is obvious what it
is.  Also have to think about how this will work with multiple GPIO
controllers: do you require the GPIO controller node to be part of every
GPIO description, or do you do some "gpio-parent" scheme as well, how
does that interact with not having a single array of GPIOs?

Better write this down as a binding, before committing to it :-)


Segher
