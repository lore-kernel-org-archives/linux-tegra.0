From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 3/6] ARM: tegra: make tegra_resume can work for Tegra114
Date: Fri, 31 May 2013 17:46:19 -0600
Message-ID: <51A9364B.4090002@wwwdotorg.org>
References: <1369046369-12489-1-git-send-email-josephl@nvidia.com> <1369046369-12489-4-git-send-email-josephl@nvidia.com> <201306010041.07230.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201306010041.07230.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/31/2013 04:41 PM, Arnd Bergmann wrote:
> On Monday 20 May 2013, Joseph Lo wrote:
>> +       cpu_to_csr_req r1, r0
>> +       mov32   r2, TEGRA_FLOW_CTRL_BASE
>> +       ldr     r1, [r2, r1]
> 
> This causes build errors now, since cpu_to_csr_req is not defined anywhere.

What build error are you seeing? I built next-20130531 earlier today
without any issue.

I do remember making a similar comment during review of this patch that
cpu_to_csr_req wasn't defined anywhere, but IIRC Joseph pointed me to
another patch in the series which had added it, or something like that.
