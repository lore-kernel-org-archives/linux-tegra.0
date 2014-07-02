From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 0/3] Tegra USB probe order issue fix
Date: Wed, 02 Jul 2014 09:45:36 -0600
Message-ID: <53B42920.8080700@wwwdotorg.org>
References: <Pine.LNX.4.44L0.1407021001290.874-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44L0.1407021001290.874-100000@iolanthe.rowland.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>, Tuomas Tynkkynen <ttynkkynen@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, tuomas.tynkkynen@iki.fi
List-Id: linux-tegra@vger.kernel.org

On 07/02/2014 08:02 AM, Alan Stern wrote:
> On Wed, 2 Jul 2014, Tuomas Tynkkynen wrote:
> 
>> Hi all,
>>
>> This series fixes a probe order issue with the Tegra EHCI driver.
>> Basically, the register area of the 1st USB controller contains some
>> registers that are global to all of the controllers, but that are also
>> cleared when reset is asserted to the 1st controller. So if (say) the
>> 3rd controller would be the first one to finish probing successfully,
>> then the reset that happens during the 1st controller's probe would
>> result in broken USB. So the before doing anything with the USB HW,
>> we should reset the 1st controller once, and then never ever reset
>> it again.
> 
> This sounds very much like the sort of thing that ought to be described 
> in DT.  It is a hardware dependence, and DT exists for the purpose of 
> describing the hardware.

DT is more about describing the HW, not how SW has to use the HW.
probe() ordering is a SW issue, not a HW description. It's driver
knowledge that the HW resets have to run in a certain order, and if the
driver didn't actually reset the HW ever (but rather, re-programmed all
registers so reset was never needed), then order wouldn't be relevant

DT certainly doesn't have any mechanism for describing probe order or
anything like that, although you can fake it out by adding phandles
between nodes, and having SW wait for the driver for the referenced node
to probe first. That won't work here though, since there's no guarantee
that the USB1 node will actually be enabled (that USB port might not be
hooked up on the board, hence the DT node will be disabled), so we can't
rely on a driver for it ever appearing.
