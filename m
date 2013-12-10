From: Michael Opdenacker <michael.opdenacker-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH][RESEND] clocksource: tegra: remove deprecated IRQF_DISABLED
Date: Tue, 10 Dec 2013 05:56:14 +0100
Message-ID: <52A69EEE.7080904@free-electrons.com>
References: <1381639360-6920-1-git-send-email-michael.opdenacker@free-electrons.com> <1386581745-4559-1-git-send-email-michael.opdenacker@free-electrons.com> <52A5F899.1070706@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52A5F899.1070706-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/09/2013 06:06 PM, Stephen Warren wrote:
> On 12/09/2013 02:35 AM, Michael Opdenacker wrote:
>> This patch proposes to remove the use of the IRQF_DISABLED flag
>>
>> It's a NOOP since 2.6.35 and it will be removed one day.
> I assume that the maintainers for drivers/clocksource/ will apply this.
> If not, let me know, and I can take it through the Tegra tree.
>
Yes, Daniel Lezcano told me he applied the 3 patches I sent (thanks!).

Thank you for your support!

Cheers,

Michael.

-- 
Michael Opdenacker, CEO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
+33 484 258 098
