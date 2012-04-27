From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Tegra board file deprecation schedule
Date: Fri, 27 Apr 2012 16:20:04 -0600
Message-ID: <4F9B1B94.2030909@wwwdotorg.org>
References: <4F9B0E7C.1060408@wwwdotorg.org>	<CAOesGMh3NY4cQERSQY-p0QsMtcCXyhkdGSGnnrckcz8-DPjbBw@mail.gmail.com>	<4F9B1568.9070704@wwwdotorg.org> <CAOMZO5Cnd9knDUuc4aZrPrtk5YKUwpr-oJhUnu=z94=9CfY1ug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5Cnd9knDUuc4aZrPrtk5YKUwpr-oJhUnu=z94=9CfY1ug-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/27/2012 04:00 PM, Fabio Estevam wrote:
> On Fri, Apr 27, 2012 at 6:53 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> 
>> The only one sticking point might be that the Harmony regulator
>> initialization needs to wait for the regulator driver to be probed, but
>> happen before the PCIe driver is registers. Perhaps we could hook up
>> some temporary bus notifiers to handle that. But since PCIe will likely
>> be fixed in 3.6, we could probably just wait for that on Harmony.
> 
> Does EPROBE_DEFER help in this case?

That's certainly the solution when everything is instantiated from
device tree, but I'm not sure it'll solve everything when doing the
regulator stuff from temporary code in the board file, which won't be
part of a driver probe.
