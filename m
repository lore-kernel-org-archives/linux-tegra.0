From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: Tegra board file deprecation schedule
Date: Sat, 28 Apr 2012 22:34:56 +0100
Message-ID: <20120428213456.GD27792@n2100.arm.linux.org.uk>
References: <4F9B0E7C.1060408@wwwdotorg.org> <CAOesGMh3NY4cQERSQY-p0QsMtcCXyhkdGSGnnrckcz8-DPjbBw@mail.gmail.com> <6014194.Op4vnW6Cge@ax5200p>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <6014194.Op4vnW6Cge@ax5200p>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, Apr 28, 2012 at 06:09:32PM +0200, Marc Dietrich wrote:
> Another (maybe a bit off-topic) thing that puzzels me is the how to assign
> the clock to the nvec.

What's the nvec?

> The device needs the clock (tegra-i2c.2) but there is no sane way to get
> it. I was thinking to add an device name alias (nvec = tegra-i2c.2) to
> the board file so I can use clk_get(&pdev->dev, NULL) instead of 
> clk_get_sys which seems to be unwanted.

clk_get() is preferred in drivers which have struct device's to get them.
And if you know the device name, then I see no problem with the aliasing
approach.
