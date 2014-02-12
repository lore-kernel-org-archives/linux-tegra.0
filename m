From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 0/6] ARM: firmware: improvements to Trusted Foundations
 support
Date: Wed, 12 Feb 2014 13:07:42 -0700
Message-ID: <52FBD48E.5070103@wwwdotorg.org>
References: <1391747706-1847-1-git-send-email-acourbot@nvidia.com> <20140212013846.GB7584@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140212013846.GB7584-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/11/2014 06:38 PM, Olof Johansson wrote:
> On Fri, Feb 07, 2014 at 01:35:00PM +0900, Alexandre Courbot wrote:
>> These (mostly minor) patches fix a few typos, improve points that
>> were agreed upon when the Trusted Foundation series was initially
>> submitted, and more importantly add support for a prepare_idle()
>> firmware operation that informs the firmware a CPU is doing idle.
>> Tegra's cpuidle driver is then also updated accordingly.
>>
>> These patches should be the last step before device trees for NVIDIA
>> SHIELD and Tegra Note 7 can be submitted.
>>
>> Changes since v1:
>> - Do not remove TF support from tegra_defconfig (will automatically be taken
>>   care of during next configuration update)
>> - Add a new prepare_idle() operation to firmware_ops that informs the firmware
>>   a CPU is going idle (vs. asking the firmware to do it itself as do_idle()
>>   does)
>> - Fix idle states names in TF implementation of prepare_idle to sound less
>>   Tegra-specific
> 
> 1-5:
> 
> Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> 
> Stephen asked if he should merge through Russell's tree or ours; since
> tegra is the only user I don't have a problem merging this (via tegra
> pull requests) but I'm giving Russell veto power. :)

Russell, I intend to apply this series to the Tegra tree on Fri US time,
unless I hear otherwise from you. Thanks.
