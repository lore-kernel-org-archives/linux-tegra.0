From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: Re: [RFC PATCH V2 1/8] irqdomain: Ensure type settings match for an
 existing mapping
Date: Tue, 22 Dec 2015 13:31:08 +0200
Message-ID: <5679347C.6030405@ti.com>
References: <1450349309-8107-1-git-send-email-jonathanh@nvidia.com>
 <1450349309-8107-2-git-send-email-jonathanh@nvidia.com>
 <CACRpkdYPvMfqou7t9K_5=Ojx3U_sc8B2Zkxgeu=1JXxCUU_E2Q@mail.gmail.com>
 <5673DB87.6040106@nvidia.com>
 <CACRpkdbjRiW8gcZcifHLELjBukpsCKyTQ+NpP51+v3kYLDcPHA@mail.gmail.com>
 <CACRpkdasLeVyE7MXyJ=LQHSYxUDE77VttX_TdqMV6afgk_NqrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdasLeVyE7MXyJ=LQHSYxUDE77VttX_TdqMV6afgk_NqrQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/22/2015 12:00 PM, Linus Walleij wrote:
> On Tue, Dec 22, 2015 at 10:58 AM, Linus Walleij
> <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> On Fri, Dec 18, 2015 at 11:10 AM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>> On 17/12/15 13:16, Linus Walleij wrote:
>>>> On Thu, Dec 17, 2015 at 11:48 AM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>>>> +               } else {
>>>>> +                       virq = irq_domain_alloc_descs(-1, 1, hwirq,
>>>>> +                                                     of_node_to_nid(of_node));
>>>>
>>>> What is this all of a sudden? Not even mentioned in the
>>>> commit. Plus I bet ACPI need something else than OF nid
>>>> passed here.
>>>
>>> Do you mean the else part of all of the above?
>>
>> Yes
>>
>>> So in the current code, the else part calls irq_create_mapping() (...)
>>
>> No, not that... The fact that you all of a sudden have started
>> calling irq_domain_alloc_descs() which the function didn't do
>> before, totally changing the calling semantics for everyone in
>> the kernel, leading to the problem I then describe with this
>> potentially being called before the irqdomain for the irqchip
>> is initialized and descs getting "random" numbers.
> 
> I see I didn't go into those details in my first answer. Hm, I
> guess I got uncertain and deleted it because I remember
> writing it...
> 
> I am simply worries that starting to call irq_domain_alloc_descs()
> has unintended side effects, especially on platforms using
> legacy or simple irqdomains.
> 

I think, some misunderstanding here introduced by replacing
irq_create_mapping() call on subset of direct calls to
irq_domain_alloc_descs() and irq_domain_associate().

-- 
regards,
-grygorii
