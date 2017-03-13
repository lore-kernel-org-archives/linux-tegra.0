From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] gpio: Add Tegra186 support
Date: Mon, 13 Mar 2017 21:52:04 +0530
Message-ID: <58C6C72C.4080408@nvidia.com>
References: <20170310162629.31455-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170310162629.31455-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Suresh Mangipudi <smangipudi-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Friday 10 March 2017 09:56 PM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Tegra186 has two GPIO controllers that are largely register compatible
> between one another but are completely different from the controller
> found on earlier generations.
>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v2:
> - add pin names to allow easy lookup using the chardev interface
> - distinguish AON and main GPIO controllers by label
> - use gpiochip_get_data() instead of container_of()
> - use C99 initializers
>

Overall it looks fine to me.
Only thing I did not like is the of_xlate manipulation where the gpio 
number is translated to another number for register access.
The reason is that it complicate in debugging when we instrument the 
callbacks for some gpios and this is very common in our debugging.

I still request here to use simple mapping instead of complicating.

Otherwise:
Acked-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
