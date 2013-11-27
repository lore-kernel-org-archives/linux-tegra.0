From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: tegra: set SM2 voltage correct
Date: Wed, 27 Nov 2013 23:03:43 +0100
Message-ID: <da3ea685e652f3ce33ebbe660312ed01@agner.ch>
References: <cover.1385508112.git.stefan@agner.ch>
 <c9ceead9e3df77b5a33ad654db23c241cd624096.1385508112.git.stefan@agner.ch>
 <5296281C.1060403@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5296281C.1060403-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am 2013-11-27 18:13, schrieb Stephen Warren:
> On 11/26/2013 04:45 PM, Stefan Agner wrote:
>> Set the requested SM2 voltage to the correct value of 1.8V. The value
>> before used to work on TPS658623 since the driver applied a wrong
>> voltage table too. However, the TPS658643 used on newer devices uses
>> yet another voltage table and those broke that compatibility. The
>> regulator driver now has the correct voltage table for both regulator
>> versions and those the correct voltage can be used in this device
>> tree.
> 
> One thing you haven't called out explicitly here is that this series is
> an incompatible change to the DT, since the old buggy driver used to
> allow old buggy DT content to accidentally work.
> 
> I'm not too familiar with who's using mainline on the Colibri boards.
> Hopefully everyone doing that is using in-kernel DTs, so this
> incompatible change won't be any issue for anyone.
> 

I don't think there are a lot of users since Toradex ships the NVidia
downstream kernel. Two users for sure, Lucas and me.

> This patch needs to be rolled into patch 2/3 so that "git bisect" isn't
> broken.

Will do

 
> You mention there's yet another PMIC version used on later boards. Do we
> need a new DT for that specfic version of the Colibri board?

The newer device is the TPS658643, which uses a different voltage table,
but this change is already in the driver. Maybe I should reword that
commit a bit. I just tried to point out why the change is really needed
(since we have two regulators with different voltage tables). But there
is nothing beyond those two that... 

Because the DT now states the real, required voltage, a new device
(version) would need an appropriate driver change and things should
work.
