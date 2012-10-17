From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] arm: mach-tegra: check wether we have debugfs enabled
 or not
Date: Wed, 17 Oct 2012 15:22:13 -0600
Message-ID: <507F2185.3070408@wwwdotorg.org>
References: <1350501196-5632-1-git-send-email-devendra.aaru@gmail.com> <20121017201244.GN21164@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121017201244.GN21164-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Devendra Naga <devendra.aaru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/17/2012 02:12 PM, Russell King - ARM Linux wrote:
> On Wed, Oct 17, 2012 at 03:13:16PM -0400, Devendra Naga wrote:
>> if debugfs is not enabled in kernel it returns -ENODEV, check it
>> with IS_ERR_OR_NULL along with the null return if it fails to
>> create a file in debugfs.
>>
>> Signed-off-by: Devendra Naga <devendra.aaru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  arch/arm/mach-tegra/powergate.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/mach-tegra/powergate.c b/arch/arm/mach-tegra/powergate.c
>> index de0662d..1809b91d 100644
>> --- a/arch/arm/mach-tegra/powergate.c
>> +++ b/arch/arm/mach-tegra/powergate.c
>> @@ -269,7 +269,7 @@ int __init tegra_powergate_debugfs_init(void)
>>  	if (powergate_name) {
>>  		d = debugfs_create_file("powergate", S_IRUGO, NULL, NULL,
>>  			&powergate_fops);
>> -		if (!d)
>> +		if (IS_ERR_OR_NULL(d))
>>  			return -ENOMEM;
> 
> So, you want to make this function hard-fail if a debugfs error occurs
> _or_ debugfs is not configured?  That doesn't seem to be a clever thing
> to do.

In practice, that quoted chunk of code is inside an #ifdef
CONFIG_DEBUG_FS, so according to the documentation for
debugfs_create_file(), the IS_ERR case of IS_ERR_OR_NULL cannot happen
here. So, the above change is a no-op, so there's not much point
applying it.
