From: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Input: gpio-keys - update to devm_* API
Date: Tue, 17 Sep 2013 11:52:59 -0700
Message-ID: <20130917185259.GA6894@core.coreip.homeip.net>
References: <1379188343-18904-1-git-send-email-badarkhe.manish@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1379188343-18904-1-git-send-email-badarkhe.manish-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Manish Badarkhe <badarkhe.manish-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Manish,

On Sun, Sep 15, 2013 at 01:22:23AM +0530, Manish Badarkhe wrote:
> Update the code to use devm_* API so that driver core will manage
> resources.
> 

And the benefit of this would be...?

There are still resources that are managed in traditional way and I
really dislike mixing the 2 styles. I can see applying patch that
converts the driver to use devm_ for all its resources and gets rid of
the remove() method altogether, but I am not sure how beneficial this
kind of changes are for existing drivers.

Thanks.

-- 
Dmitry
