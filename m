From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: Tegra board file deprecation schedule
Date: Mon, 30 Apr 2012 18:51:56 +0200
Message-ID: <6157937.A8jHT3QHt6@ax5200p>
References: <4F9B0E7C.1060408@wwwdotorg.org> <2573129.rORKuOVVxu@fb07-iapwap2> <4F9EB68A.3080309@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F9EB68A.3080309-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Monday 30 April 2012 09:58:02 Stephen Warren wrote:
> On 04/30/2012 02:58 AM, Marc Dietrich wrote:
> > Am Sonntag, 29. April 2012, 13:16:38 schrieb Stephen Warren:
> ...
> 
> >> The correct approach here is to remove all the I2C logic from the NVEC
> >> driver and add I2C slave support to the real I2C driver. Then, NVEC
> >> becomes just a protocol driver for the slave transactions. Then, there
> >> is no clock to deal with.
> > 
> > you are absolutely right, but there is no i2c slave controller driver in
> > mainline yet and I don't want to submit the one nvidia already wrote [1].
> > Maybe you can ask around if someone is willing to do this.
> 
> Someone has been assigned to work on this, but other priorities are in
> the way. Unfortunately, I don't have any realistic ETA I can give right now.

oh, that's nice. The nvec driver is also far from perfect, so we have some 
more time to cleanup the rest.

Marc
