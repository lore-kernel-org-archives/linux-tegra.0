From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Tegra board file deprecation schedule
Date: Sun, 29 Apr 2012 13:16:38 -0600
Message-ID: <4F9D9396.9070009@wwwdotorg.org>
References: <4F9B0E7C.1060408@wwwdotorg.org> <6014194.Op4vnW6Cge@ax5200p> <20120428213456.GD27792@n2100.arm.linux.org.uk> <1388911.4olGsS8Z0g@ax5200p>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1388911.4olGsS8Z0g@ax5200p>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/29/2012 12:11 PM, Marc Dietrich wrote:
> On Saturday 28 April 2012 22:34:56 Russell King - ARM Linux wrote:
>> On Sat, Apr 28, 2012 at 06:09:32PM +0200, Marc Dietrich wrote:
>>> Another (maybe a bit off-topic) thing that puzzels me is the how to assign
>>> the clock to the nvec.
>>
>> What's the nvec?
> 
> it is the embedded controller used on many first gen tegra2 boards 
> (drivers/staging/nvec). Do you remember commit 55dc6ee7 ?
> 
>>> The device needs the clock (tegra-i2c.2) but there is no sane way to get
>>> it. I was thinking to add an device name alias (nvec = tegra-i2c.2) to
>>> the board file so I can use clk_get(&pdev->dev, NULL) instead of
>>> clk_get_sys which seems to be unwanted.
>>
>> clk_get() is preferred in drivers which have struct device's to get them.
>> And if you know the device name, then I see no problem with the aliasing
>> approach.
> 
> I'm just looking for a way to use clk_get if two devices, tegra-i2c and nvec 
> (or tegra-i2c-slave in the future) share the same clock. 

Oh, you mean the I2C controller clock.

The correct approach here is to remove all the I2C logic from the NVEC
driver and add I2C slave support to the real I2C driver. Then, NVEC
becomes just a protocol driver for the slave transactions. Then, there
is no clock to deal with.
