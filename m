From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: Tegra board file deprecation schedule
Date: Sun, 29 Apr 2012 19:56:19 +0100
Message-ID: <20120429185619.GA32152@n2100.arm.linux.org.uk>
References: <4F9B0E7C.1060408@wwwdotorg.org> <6014194.Op4vnW6Cge@ax5200p> <20120428213456.GD27792@n2100.arm.linux.org.uk> <1388911.4olGsS8Z0g@ax5200p>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1388911.4olGsS8Z0g@ax5200p>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sun, Apr 29, 2012 at 08:11:56PM +0200, Marc Dietrich wrote:
> On Saturday 28 April 2012 22:34:56 Russell King - ARM Linux wrote:
> > clk_get() is preferred in drivers which have struct device's to get them.
> > And if you know the device name, then I see no problem with the aliasing
> > approach.
> 
> I'm just looking for a way to use clk_get if two devices, tegra-i2c and nvec 
> (or tegra-i2c-slave in the future) share the same clock. 

Easy if you know the device names for each.  You just have two clk_lookup
entries which point at the exact same struct clk, one for each device.
