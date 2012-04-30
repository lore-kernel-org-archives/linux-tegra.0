From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: Re: Tegra board file deprecation schedule
Date: Mon, 30 Apr 2012 11:00:28 +0200
Message-ID: <15729187.JLj8pSFBeZ@fb07-iapwap2>
References: <4F9B0E7C.1060408@wwwdotorg.org> <6014194.Op4vnW6Cge@ax5200p> <4F9D94B3.4070903@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F9D94B3.4070903-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Sonntag, 29. April 2012, 13:21:23 schrieb Stephen Warren:
> On 04/28/2012 10:09 AM, Marc Dietrich wrote:
> ...
> 
> > Some other things regarding board removal also came into my mind. First,
> > is
> > the sdhci order problem solved? Maybe I missed it, but it would be nice if
> > we could give the internal emmc a device number of zero and the external
> > reader a device number one. Currently it is oposite around and AFAIK
> > device tree guaranties no special order unless you enforce it somehow.
> 
> I think we shouldn't consider there to be an SDHCI order problem.
> Relying on block devices to appear with a specific name is probably
> something we shouldn't do. The fact it happened with SDHCI is pretty
> unique; it doesn't for USB-attached devices, removable SDHCI devices, etc.
> 
> Instead, you can use partition or filesystem UUIDs to name devices. I
> boot with root=PARTUUID=xxxx these days, and hence never have to adjust
> my command-line depending on the SDHCI probe ordering differences, and
> it's work just fine for USB or other storage too.

Arrr, you are right again. I tend to ignore this unhandy UUID thing, but all 
current distros use it. So this not not an issue. Sorry for the noice.

Marc
