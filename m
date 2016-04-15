From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2] ARM: tegra: add DT binding for Tegra186 GPIO
 controllers
Date: Fri, 15 Apr 2016 10:04:23 -0600
Message-ID: <57111107.8060309@wwwdotorg.org>
References: <1460483197-5130-1-git-send-email-swarren@wwwdotorg.org>
 <CACRpkdYmcEQBN5QwjLa-Wyorv-otPdJh5C1KgKwUjUBWXvnb_w@mail.gmail.com>
 <570FB459.8090802@wwwdotorg.org>
 <CACRpkdbazmBE6rMO0EKmK6qxqL7uaWNQmf=SNEDBJPCTVteFiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdbazmBE6rMO0EKmK6qxqL7uaWNQmf=SNEDBJPCTVteFiA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/15/2016 03:17 AM, Linus Walleij wrote:
> On Thu, Apr 14, 2016 at 5:16 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> On 04/14/2016 06:42 AM, Linus Walleij wrote:
>>> On Tue, Apr 12, 2016 at 7:46 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
>>> wrote:
>
>>> I suspect that the Tegra definition of a "port" is close to what other
>>> people
>>> call a "bank" like I try to define in this patch?
>>> http://marc.info/?l=linux-gpio&m=145941547420164&w=2
>>
>> There are similarities, but the concepts are quite different. In that
>> thread, the term "bank" actually refers to an instance of a standalone HW IP
>> block. Here, "port" is definitely something internal to a single HW block.
>
> OK I get it. I wonder if we can make that common terminology as well.
>
> GPIO bank := unique instance of a common IP block
> GPIO port := unique line range inside an IP block

I think this would be hard, and in some places potentially confusing.

Various HW documentation likely uses the terms bank and port, without 
regard to how those terms are used in documentation for other chips. I'd 
like the binding for any particular chip to use the same terminology as 
the HW documentation for that chip, even if it's inconsistent with other 
bindings (or at least contain an explicit terminology translation 
table). That's because the binding is intended as HW documentation.

Within the Linux code, we could certainly attempt to use consistent 
terminology. If so, I suggest we use terms that are quite unlikely to be 
used by any HW documentation, or could only realistically be used to 
mean the same thing. If we decided to use "GPIO bank" and "GPIO port" as 
you defined above, yet some HW documentation already used "GPIO bank" to 
mean a subset of GPIOs within a single IP block, and "GPIO port" to mean 
a single GPIO (both of which I think are quite likely/possible), then 
that's going to make matters worse not better.

Perhaps "HW module"m "IP block" or perhaps "device" would be a 
reasonable term for "GPIO bank" as you defined that above. Of course, 
bikeshedding:-)

I'm not sure of a reasonable term for "GPIO port" as you defined it.

...
> It's cool.
> Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> I assume you want to merge this through the Tegra tree, or
> should I apply it to the GPIO tree?

I'm happy either way. If through the Tegra tree, Thierry would be 
applying it so I'll let him make the call.

I suspect that both this patch and my earlier "ARM: tegra: fix naming in 
GPIO DT binding header" should be applied through the same tree for 
consistency.
