From: Manish Badarkhe <badarkhe.manish-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Input: gpio-keys - update to devm_* API
Date: Wed, 18 Sep 2013 00:41:11 +0530
Message-ID: <CAKDJKT5fvf=cCqU0ULs0o6NO10aDM73ewx=-sVG9Rzm-cKkECg@mail.gmail.com>
References: <1379188343-18904-1-git-send-email-badarkhe.manish@gmail.com>
	<20130917185259.GA6894@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130917185259.GA6894-WlK9ik9hQGAhIp7JRqBPierSzoNAToWh@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Dmitry,

On Wed, Sep 18, 2013 at 12:22 AM, Dmitry Torokhov
<dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Manish,
>
> On Sun, Sep 15, 2013 at 01:22:23AM +0530, Manish Badarkhe wrote:
>> Update the code to use devm_* API so that driver core will manage
>> resources.
>>
>
> And the benefit of this would be...?
>
> There are still resources that are managed in traditional way and I
> really dislike mixing the 2 styles. I can see applying patch that
> converts the driver to use devm_ for all its resources and gets rid of
> the remove() method altogether, but I am not sure how beneficial this
> kind of changes are for existing drivers.

IMO devm_ makes us to manage resources properly without much care about freeing
it ( as devm_handles freeing automatically). But, stiil  there are use
cases which makes
us to mix this devm_  with traditionally managed resources.
Not much sure about any other benefits.

Regards
Manish Badarkhe
