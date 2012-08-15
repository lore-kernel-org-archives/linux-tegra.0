From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: defconfig updates
Date: Wed, 15 Aug 2012 14:16:05 -0600
Message-ID: <502C0385.6010203@wwwdotorg.org>
References: <1345052375-13374-1-git-send-email-swarren@wwwdotorg.org> <20120815201244.GF12870@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120815201244.GF12870-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/15/2012 02:12 PM, Thierry Reding wrote:
> On Wed, Aug 15, 2012 at 11:39:35AM -0600, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> 
>> Removed:
>> 
>> * MACH_HARMONY * MACH_PAZ00 * MACH_TRIMSLICE
>> 
>> These used to enable board support for individual boards. Now
>> that we only support device tree, these options have been
>> removed.
>> 
>> Added:
>> 
>> * TEGRA_PCI
>> 
>> This used to be selected by the board options above. Select this 
>> explicitly now that the board options have been removed.
>> 
>> * TEGRA_DEBUG_UART_AUTO_ODMDATA
>> 
>> This makes the kernel automatically pick a UART for earlyprintk.
>> It's likely to be a useful option for everyone.
>> 
>> * PWM * PWM_TEGRA
>> 
>> Enable the new PWM subsystem, and the Tegra driver within it.
>> 
>> * GPIO_PCA953X * GPIO_PCA953X_IRQ * MFD_MAX8907 *
>> REGULATOR_MAX8907 * RTC_DRV_MAX8907
>> 
>> Various drivers required for the Whistler board.
> 
> Just a nitpick: this list is missing GPIO_TPS65910.

It jut got moved in the file; it wasn't added nor removed (well,
perhaps it was both:-).
