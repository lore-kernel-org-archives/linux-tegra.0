From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [v2 3/3] ARM: tegra: Unify Device tree board files
Date: Wed, 13 Feb 2013 09:50:25 -0700
Message-ID: <511BC451.9050504@wwwdotorg.org>
References: <20130212.070456.532657136988541923.hdoyu@nvidia.com><201302121350.15683.arnd@arndb.de><511A6F6C.8090205@wwwdotorg.org> <20130213.081240.1605796167151164030.hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130213.081240.1605796167151164030.hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "marvin24-Mmb7MZpHnFY@public.gmane.org" <marvin24-Mmb7MZpHnFY@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/12/2013 11:12 PM, Hiroshi Doyu wrote:
> Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote @ Tue, 12 Feb 2013 17:35:56 +0100:
> 
>> However I'd like to avoid changing the body of those two functions at
>> all if possible, since I hope the PCIe driver rework will be merged in
>> 3.10, and that will allow the Harmony and TrimSlice init functions to be
>> removed entirely. I'd rather not have conflicts with the removal patch.
>>
>>> Since we are not going to add any other board specfic init functions, you
>>> can also unroll the loop and put everything into tegra_dt_init_late:
>>
>> That's not necessarily true. While we certainly don't plan to, I don't
>> think we can rule it out; after all, we don't have rfkill bindings and
>> yet other boards will need them.
> 
> Considering the above points,
> 
> - The Harmony and TrimSlice init functions will be removed entirely
>   so soon that we want to avoid those merge conflicts as much as
>   possible.
> - We may still need board specific init, especially for rfkill.
> - We want to build any combination of Tegra{20,30,114}, 2^3 - 1 == 7.
> 
> The patch for "tegra.c" would be as below.
> 
> Should I still keep the name, "tegra20_auxdata_lookup" to avoid
> any conflicts or "tegra_auxdata_lookup" would be ok for merge?

Yes, avoiding the rename of the auxdata table might be a good idea.

Aside from that, I think the patch you gave looks fine.
