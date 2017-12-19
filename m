From: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [PATCH 6/9] ARM: init: update secondary_data register
 documentation
Date: Tue, 19 Dec 2017 23:16:44 +0000
Message-ID: <20171219231644.GG10595@n2100.armlinux.org.uk>
References: <cover.1500510157.git.mirq-linux@rere.qmqm.pl>
 <a6e5e735ebae32a433e501188a86082efc8b0b52.1500510157.git.mirq-linux@rere.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <a6e5e735ebae32a433e501188a86082efc8b0b52.1500510157.git.mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 20, 2017 at 02:29:25AM +0200, Michał Mirosław wrote:
> Fix secondary_data pointer register and document other
> occurrences in SMP boot code.
> 
> Signed-off-by: Michał Mirosław <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>

It's probably worth referecing commit 34d926266500 ("[ARM] Fix SMP booting")
since we have it in our history for this.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
