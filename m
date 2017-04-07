From: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: Re: [PATCH 1/1] memory: tegra: fix fdc test bug
Date: Fri, 07 Apr 2017 22:54:19 +0100
Message-ID: <1bfab352ccd1581882d6e82b6eb72cb4@codethink.com>
References: <20170407172820.21292-1-ben.dooks@codethink.co.uk>
 <20170407174301.GA4386@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170407174301.GA4386-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 2017-04-07 18:43, Thierry Reding wrote:
> On Fri, Apr 07, 2017 at 06:28:20PM +0100, Ben Dooks wrote:
>> The fdc variable is a bool, taking the address of this will generally
>> produce true, thus skewing any users of the 
>> tegra_mc_set_latency_allowance
>> code.
>> 
>> Note, this does not seem to be producing a compiler warning. This was 
>> only
>> spotted as it meant a caller was seeing 3 times higher than expected
>> register results.
>> 
>> Signed-off-by: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
>> ---
>>  drivers/memory/tegra/mc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> What tree is this based on? I don't see this code anywhere in mainline.

Apologies, turns out this a vendor added function.

-- 
Ben
