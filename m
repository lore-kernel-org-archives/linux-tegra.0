From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH V2] crypto: produce consistent hash for zero-length
 data
Date: Tue, 27 Aug 2013 10:05:28 -0600
Message-ID: <521CCE48.5060701@wwwdotorg.org>
References: <1377555170-6841-1-git-send-email-swarren@wwwdotorg.org> <20130827074835.GF8686@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130827074835.GF8686@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/27/2013 01:48 AM, Thierry Reding wrote:
> On Mon, Aug 26, 2013 at 04:12:50PM -0600, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> 
>> In real-world use-cases, hashing zero-length data likely never
>> happens. However, it is relevant when testing cbootimage with a
>> dummy zero-length bootloader binary, e.g.:
>> 
>> touch u-boot.bin cbootimage -t30 ../tamonten-ng/tegra30.img.cfg
>> tegra30-tec-ng.img
>> 
>> In this scenario, it's useful to create a consistent hash, so
>> that one can compare the resultant images before and after
>> applying patches, to check for regressions.
>> 
>> Hence, zero out the hash data so it has consistent content if it
>> isn't written to.
...
> Looks good:
> 
> Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks. I've pushed this out.
