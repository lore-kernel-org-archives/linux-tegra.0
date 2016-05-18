From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3] clk: tegra: Initialize UTMIPLL when enabling PLLU
Date: Wed, 18 May 2016 11:26:13 -0400
Message-ID: <ca1937f5-38df-1fe7-9f66-c3d643b68e0f@nvidia.com>
References: <1463432860-906-1-git-send-email-rklein@nvidia.com>
 <CAAVeFuLmjZ3vN0Q-7T=kEw_d4P1uS7mBmirpttXkPC+isKELYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAVeFuLmjZ3vN0Q-7T=kEw_d4P1uS7mBmirpttXkPC+isKELYg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Turguette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 5/18/2016 12:02 AM, Alexandre Courbot wrote:
> On Tue, May 17, 2016 at 6:07 AM, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> 
> ...
> 
>> generations. For instance, in clk-tegra124.c, it used to have:
>>
>> when the correct shift to use is present in the new version:
>>
>> which matches the Tegra124 TRM register definition.
> 
> Seems like the examples are missing?
> 


yep, I have left the '#' in in the defines and so it was treated as a
comment and left out. Thanks.

-rhyland

-- 
nvpublic
