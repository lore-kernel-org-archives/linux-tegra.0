From: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Tegra baseline test results for v3.10-rc5
Date: Wed, 31 Jul 2013 00:53:51 +0000 (UTC)
Message-ID: <alpine.DEB.2.02.1307310037530.22504@utopia.booyaka.com>
References: <alpine.DEB.2.02.1306111220490.22645@utopia.booyaka.com> <51B72D2A.6040909@arm.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51B72D2A.6040909-5wv7dgnIgG8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Austin <jonathan.austin-5wv7dgnIgG8@public.gmane.org>
Cc: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Jonathan,

I'm sorry it's taken me so long to respond -

On Tue, 11 Jun 2013, Jonathan Austin wrote:

> On 11/06/13 13:24, Paul Walmsley wrote:
> > 
> > Here are some basic Tegra test results for Linux v3.10-rc5.
> > Logs and other details at:
> > 
> >      http://www.pwsan.com/tegra/testlogs/test_v3.10-rc5/20130611044210/
> > 
> 
> These automated tests look pretty useful - is this some well known tool that's
> passed me by, or something you've written yourself? Something in between?

A little of both.  The OMAP version of this is built on modified versions 
of Minicom and dtach, along with some Perl and shell scripts.  An early, 
extremely ugly version has been released to a few people under the GPL.  
A wider release is planned, once it's cleaned up.  The code changes 
required by the recent DT boot changes and kernel message text changes 
have consumed a large amount of time here.

If there's interest in the serial interaction scripts, e.g., the scripts 
that do PM testing once the board is booted, such as

http://www.pwsan.com/omap/testlogs/test_v3.11-rc1/20130721020309/pm/37xxevm/

those can be released sooner.  Maybe folks can even contribute new test 
scenarios for use in the testbed?

> Particularly, does whatever you have handle boards on serial ports
> automagically, with a way to add different interfaces for resetting locked
> boards etc?

All the console captures and command interaction is from the board serial 
consoles.  The board power inputs are connected to Ethernet-controlled AC 
or DC relays, and are automatically controlled by the scripts.  


Thanks for the interest,

- Paul
