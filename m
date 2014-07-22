From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 5/8] of: Add Tegra124 EMC bindings
Date: Tue, 22 Jul 2014 11:34:11 -0600
Message-ID: <53CEA093.6060106@wwwdotorg.org>
References: <1405088313-20048-1-git-send-email-mperttunen@nvidia.com>	<1405088313-20048-6-git-send-email-mperttunen@nvidia.com>	<CAL1qeaGHfjQhLHvgzt85hmbuY4FOG5-k=f80=CNvzPDEgi9_6w@mail.gmail.com>	<53CD860B.7030800@wwwdotorg.org>	<CAL1qeaHtGQxCO3cGdeCRUYuk6mxei6z1B63-iZdBECEbFqGhHw@mail.gmail.com>	<53CE9514.1050903@wwwdotorg.org> <CAL1qeaEkL+mxb0S4JhQbXBjyNyKJndffTSjMaAFQD6ooDJPd+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL1qeaEkL+mxb0S4JhQbXBjyNyKJndffTSjMaAFQD6ooDJPd+Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/22/2014 11:22 AM, Andrew Bresticker wrote:
> On Tue, Jul 22, 2014 at 9:45 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>>
>> Does the bootloader adjust the DT that's passed to the kernel so that
>> only the relevant single set of EMC timings is contained in the DT?
> 
> No, the DT contains all possible EMC timings for that board.
> 
>> On a system where the boot ROM initializes RAM, and where the HW design
>> might have multiple SDRAM configuration, here's what usually happens:
>>
>> a) The BCT contains N sets of SDRAM configurations.
>>
>> b) The boot ROM reads the SDRAM strapping bits, and uses them to pick
>> the correct SDRAM configuration from the N sets in the BCT.
>>
>> c) The kernel DT has N sets of SDRAM configurations.
>>
>> d) The kernel reads the SDRAM strapping bits, and uses them to pick the
>> correct SDRAM configuration from the N sets in the DT.
>>
>> On the ChromeOS boards (so (a) and (b) above are irrelevant) where N is
>> too large to fit into APBDEV_PMC_STRAPPING_OPT_A_0[7:4], (c) and (d)
>> won't work. I assume the kernel DT therefore must be adjusted to only
>> contain the single SDRAM configuration that is relevant for the current HW?
>>
>> (isn't STRAPPING_OPT_A split into 2 2-bit fields; 2 bits for SDRAM index
>> and 2 bits for boot flash index, so max N is quite small?)
> 
> Right, there are normally only 2 SDRAM strapping bits available.
> ChromeOS gets around this by having 4 identical boot device entries in
> the BCT, so all possible values of STRAPPING_OPT_A[7:6] map to the
> same boot device.  This allows us to use all 4 strapping bits in
> coreboot to pick the SDRAM configuration.

OK, that explains how it works.

But that means that when the kernel reads the strapping options, it will
have to know if it uses just 2 bits (standard) or all 4 bits
(non-standard) to index into the DT's array of SDRAM configurations.
We'll need a DT property to represent that.
