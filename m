From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: don't open code of_device_get_match_data()
Date: Mon, 22 Feb 2016 14:48:00 +0530
Message-ID: <56CAD248.8060301@nvidia.com>
References: <1456063089-3403-1-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456063089-3403-1-git-send-email-wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Sunday 21 February 2016 07:27 PM, Wolfram Sang wrote:
> From: Wolfram Sang <wolfram-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
>
> This change will also make Coverity happy by avoiding a theoretical NULL
> pointer dereference; yet another reason is to use the above helper function
> to tighten the code and make it more readable.
>
> Signed-off-by: Wolfram Sang <wolfram-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
> ---
>
> Compile tested only; HW test would be much appreciated!
>


Tested on Jetson-TX1.

Acked-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


There is some more cleanups needed on this driver i.e. do not support 
non-DT, move the of_table to down etc. I like to post follow up post 
after this is applied.

Thanks,
Laxman
