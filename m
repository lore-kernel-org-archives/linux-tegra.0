From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 4/6] ARM: firmware: add prepare_idle() operation
Date: Thu, 13 Feb 2014 09:37:05 -0700
Message-ID: <52FCF4B1.5030208@wwwdotorg.org>
References: <1391747706-1847-1-git-send-email-acourbot@nvidia.com> <1391747706-1847-5-git-send-email-acourbot@nvidia.com> <52FCA5FC.80504@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52FCA5FC.80504-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/13/2014 04:01 AM, Tomasz Figa wrote:
> Hi Alexandre,
> 
> On 07.02.2014 05:35, Alexandre Courbot wrote:
>> Some firmwares do not put the CPU into idle mode themselves, but still
>> need to be informed that the CPU is about to enter idle mode before this
>> happens. Add a prepare_idle() operation to the firmware_ops structure to
>> handle such cases.
>>
>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   arch/arm/include/asm/firmware.h | 4 ++++
>>   1 file changed, 4 insertions(+)
> 
> I wonder if .do_idle() couldn't simply return an appropriate error code
> to let the upper layer know that it should proceed with normal CPU idle
> activation, while still letting the firmware know that the CPU is going
> to idle.

That seems to disagree with the naming of the operation, and the
semantics I assume it has, though. It seems clearer to add an explicit
separate op for this.
